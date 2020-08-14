From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 14 Aug 2020 23:00:07 +0200
Subject: [Buildroot] [git commit] package/redis: bump to version 6.0.6
Message-ID: <20200814205347.B6C7D860AD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=605a0e02abf7fdde9e5b6a3fd7ec08d507e2298f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

From the release notes:

================================================================================
Redis 6.0.6     Released Mon Jul 20 09:31:30 IDT 2020
================================================================================

Upgrade urgency MODERATE: several bugs with moderate impact are fixed here.

The most important issues are listed here:

* Fix crash when enabling CLIENT TRACKING with prefix
* EXEC always fails with EXECABORT and multi-state is cleared
* RESTORE ABSTTL won't store expired keys into the db
* redis-cli better handling of non-pritable key names
* TLS: Ignore client cert when tls-auth-clients off
* Tracking: fix invalidation message on flush
* Notify systemd on Sentinel startup
* Fix crash on a misuse of STRALGO
* Few fixes in module API
* Fix a few rare leaks (STRALGO error misuse, Sentinel)
* Fix a possible invalid access in defrag of scripts (unlikely to cause real harm)

New features:

* LPOS command to search in a list
* Use user+pass for MIGRATE in redis-cli and redis-benchmark in cluster mode
* redis-cli support TLS for --pipe, --rdb and --replica options
* TLS: Session caching configuration support
================================================================================

Also, the reference hashes repo has moved to redis/redis-hashes
probably because the original maintainer has stepped down, see
http://antirez.com/news/133

Finally, the copyright year in the COPYING file has been updated,
and so does its sha256 checksum.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis/redis.hash | 6 +++---
 package/redis/redis.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 97e8d451e6..840019415d 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
-# From https://github.com/antirez/redis-hashes/blob/master/README
-sha256  42cf86a114d2a451b898fcda96acd4d01062a7dbaaad2801d9164a36f898f596  redis-6.0.5.tar.gz
+# From https://github.com/redis/redis-hashes/blob/master/README
+sha256  12ad49b163af5ef39466e8d2f7d212a58172116e5b441eebecb4e6ca22363d94  redis-6.0.6.tar.gz
 
 # Locally calculated
-sha256  cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
+sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 192e6fa9f8..33c764a0d5 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.5
+REDIS_VERSION = 6.0.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
