From: aduskett at gmail.com <aduskett@gmail.com>
Date: Sat,  3 Aug 2019 21:16:23 -0400
Subject: [Buildroot] [PATCH 00/13] Support for Django channels
Message-ID: <20190804011631.86261-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

I was honestly surprised that django-channels hadn't been added yet, as it
provides websocket support (umong other things) to Django.

I took the liberty of adding all of the packages that could turn buildroot into
a fully funtional django server with full websocket support.

Major packages in this series are:
 - Daphne: The official Django websocket server.
 - Channels: Brings Websocket/long-poll HTTP, async and task offloading support
   to Django. It's quite handy!

  - Channel-redis: Uses redis as a message broker backend for websocket
    handling. Also quite handy.

I added the django-enumfields package because my personal project uses it.


Adam Duskett (9):
  package/python-django-enumfields: new package
  package/python-sqlparse: new package
  package/python-hiredis: new package
  package/python-daphne: new package
  package/python-asgiref: new package
  package/python-aioredis: new package
  package/python-channels: new package
  package/python-channels-redis: new package

 DEVELOPERS                                    |  8 ++++++
 package/Config.in                             |  8 ++++++
 package/python-aioredis/Config.in             | 13 +++++++++
 package/python-aioredis/python-aioredis.hash  |  5 ++++
 package/python-aioredis/python-aioredis.mk    | 14 ++++++++++
 package/python-asgiref/Config.in              | 14 ++++++++++
 package/python-asgiref/python-asgiref.hash    |  5 ++++
 package/python-asgiref/python-asgiref.mk      | 14 ++++++++++
 package/python-channels-redis/Config.in       | 17 ++++++++++++
 .../python-channels-redis.hash                |  5 ++++
 .../python-channels-redis.mk                  | 15 +++++++++++
 package/python-channels/Config.in             | 14 ++++++++++
 package/python-channels/python-channels.hash  |  5 ++++
 package/python-channels/python-channels.mk    | 14 ++++++++++
 ...001-remove-pytest-runner-requirement.patch | 27 +++++++++++++++++++
 package/python-daphne/Config.in               | 13 +++++++++
 package/python-daphne/python-daphne.hash      |  5 ++++
 package/python-daphne/python-daphne.mk        | 14 ++++++++++
 package/python-django-enumfields/Config.in    |  6 +++++
 .../python-django-enumfields.hash             |  5 ++++
 .../python-django-enumfields.mk               | 14 ++++++++++
 package/python-hiredis/Config.in              |  7 +++++
 package/python-hiredis/python-hiredis.hash    |  6 +++++
 package/python-hiredis/python-hiredis.mk      | 14 ++++++++++
 package/python-sqlparse/Config.in             |  8 ++++++
 package/python-sqlparse/python-sqlparse.hash  |  5 ++++
 package/python-sqlparse/python-sqlparse.mk    | 14 ++++++++++
 38 files changed, 314 insertions(+), 24 deletions(-)
 create mode 100644 package/python-aioredis/Config.in
 create mode 100644 package/python-aioredis/python-aioredis.hash
 create mode 100644 package/python-aioredis/python-aioredis.mk
 create mode 100644 package/python-asgiref/Config.in
 create mode 100644 package/python-asgiref/python-asgiref.hash
 create mode 100644 package/python-asgiref/python-asgiref.mk
 create mode 100644 package/python-channels-redis/Config.in
 create mode 100644 package/python-channels-redis/python-channels-redis.hash
 create mode 100644 package/python-channels-redis/python-channels-redis.mk
 create mode 100644 package/python-channels/Config.in
 create mode 100644 package/python-channels/python-channels.hash
 create mode 100644 package/python-channels/python-channels.mk
 create mode 100644 package/python-daphne/0001-remove-pytest-runner-requirement.patch
 create mode 100644 package/python-daphne/Config.in
 create mode 100644 package/python-daphne/python-daphne.hash
 create mode 100644 package/python-daphne/python-daphne.mk
 create mode 100644 package/python-django-enumfields/Config.in
 create mode 100644 package/python-django-enumfields/python-django-enumfields.hash
 create mode 100644 package/python-django-enumfields/python-django-enumfields.mk
 create mode 100644 package/python-hiredis/Config.in
 create mode 100644 package/python-hiredis/python-hiredis.hash
 create mode 100644 package/python-hiredis/python-hiredis.mk
 create mode 100644 package/python-sqlparse/Config.in
 create mode 100644 package/python-sqlparse/python-sqlparse.hash
 create mode 100644 package/python-sqlparse/python-sqlparse.mk

-- 
2.21.0
