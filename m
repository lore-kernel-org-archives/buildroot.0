From: Axel Lin <axel.lin@ingics.com>
Date: Sun, 22 Dec 2013 22:15:37 +0800
Subject: [Buildroot] [PATCH] redis: bump to version 2.6.17
Message-ID: <1387721737.8692.0.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes since 2.6.16:
* [FIX] redis-cli: fix big keys search when the key no longer exist.
* [FIX] Allow AUTH / PING when disconnected from slave with serve-stale-data on.
* [FIX] redis-benchmark: update help for new __rand_int__ form.
* [FIX] Fix broken rdbWriteRaw() return value check in rdb.c (harmless).
* [FIX] Log to what master a slave is going to connect to.
* [FIX] Only run the fast active expire cycle if master & enabled.
* [FIX] Fixed a replication bug involving 32 bit instances and big datasets
        hard to compress that resulted into more than 2GB of RDB file sent.

Signed-off-by: Axel Lin <axel.lin@ingics.com>
---
 package/redis/redis.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 6974a35..c41469e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 2.6.16
+REDIS_VERSION = 2.6.17
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3c (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
1.8.1.2
