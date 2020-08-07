class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_correct_user, only: [:edit, :update]

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end
  def index
    @users = User.all
    @book = Book.new
  end

  def edit
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user), notice: 'User was successfully updated'
  else
    render "edit"
    end
  end
  def follows
end

  def followers

  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end
  def ensure_correct_user
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end
end
