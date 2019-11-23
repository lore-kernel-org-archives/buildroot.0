From: Titouan Christophe <titouan.christophe@railnova.eu>
Date: Sat, 23 Nov 2019 21:01:42 +0100
Subject: [Buildroot] [PATCH 1/1] package/redis: bump to version 5.0.7
Message-ID: <20191123200142.29254-1-titouan.christophe@railnova.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes announced upstream:

Upgrade urgency HIGH: many issues fixed, some may have an impact.
Redis 5.0.7 fixes a number of bugs, none is very critical, however
there are a few that may have an impact. It's a good idea to upgrade.
There are fixes in the area of replication from modules commands and
callbacks, AOF fsync (non critical issue), memory leaks (very rare and small),
streams beahvior (non critical), and a potential crash in commands
processing multiple keys at the same time that is there for years, and happens
very rarely, but is not impossible to trigger.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index aca1109d30..ac68e62814 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 6624841267e142c5d5d5be292d705f8fb6070677687c5aad1645421a936d22b3  redis-5.0.6.tar.gz
+sha256 61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b  redis-5.0.7.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 4ed90a749e..1729afe165 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.6
+REDIS_VERSION = 5.0.7
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.21.0
