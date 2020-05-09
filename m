From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat,  9 May 2020 18:50:35 +0200
Subject: [Buildroot] [PATCH 0/4] package/redis: bump to Redis 6
Message-ID: <20200509165039.10363-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This series bumps Redis to the new major version 6.

Redis 6 introduces new data types and commands, support for clients ACL, TLS 
connections, client-side caching, threaded I/O, and many other improvements.
See the full announcement on: http://antirez.com/news/132
See the changelog:
    https://raw.githubusercontent.com/antirez/redis/6.0/00-RELEASENOTES


In addition to the version bump, this series also adds a runtime test for
Redis, and enables support for TLS and Systemd integration.


Titouan Christophe (4):
  package/redis: bump to version 6.0.1
  support/testing: add runtime test for Redis
  package/redis: add optional support for TLS connections
  package/redis: add optional support for systemd

 .gitlab-ci.yml                                |  1 +
 DEVELOPERS                                    |  1 +
 ...ake-struct-user-anonymous-for-uclibc.patch | 30 +++++++++++++++++++
 package/redis/Config.in                       | 15 ++++++----
 package/redis/redis.hash                      |  4 +--
 package/redis/redis.mk                        | 11 ++++++-
 package/redis/redis.service                   | 10 ++++---
 support/testing/tests/package/test_redis.py   | 24 +++++++++++++++
 8 files changed, 83 insertions(+), 13 deletions(-)
 create mode 100644 package/redis/0004-make-struct-user-anonymous-for-uclibc.patch
 create mode 100644 support/testing/tests/package/test_redis.py

-- 
2.25.3
