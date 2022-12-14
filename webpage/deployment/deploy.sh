#!/bin/bash
git clone https://github.com/we-race-here/The-Game.git /home/jenkins/the_game
cd /home/jenkins/the_game/webpage/
mkdir -p media

#sudo cp -rf ../nginx.conf  /etc/nginx/nginx.conf
#sudo cp -rf ../default.conf  /etc/nginx/sites-available/default
cp ../media -rf  /home/jenkins/the_game/webpage
pip install uwsgi

# Restart nginx
#sudo /etc/init.d/nginx start || sudo /etc/ init.d/nginx start

# Running Celery
#celery -A zp_result worker -l info &
#celery -A zp_result beat &
#nohup python manage.py zwift_bot &
#python manage.py whois_bot_start &
# Running Server
python manage.py runserver 0:8011
#uwsgi --socket mysite.sock --module webpage.wsgi --buffer-size=100000 --chmod-socket=666 --master --processes 4 --threads 2