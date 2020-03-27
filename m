From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 27 Mar 2020 23:27:04 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/redis: security
 bump to v5.0.8
Message-ID: <20200327221648.A854A886C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9f655e7c3b761b2b73d792bd94f3035a4095bd36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

From the release notes:
https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES

================================================================================
Redis 5.0.8     Released Thu Mar 12 16:05:41 CET 2020
================================================================================

Upgrade urgency HIGH: This release fixes security issues.

[FIX] revisit CVE-2015-8080 vulnerability

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit caed3878a6a3c0bd04d28d89b7ad781adf8d8666)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index ac68e62814..ee15b75e08 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 61db74eabf6801f057fd24b590232f2f337d422280fd19486eca03be87d3a82b  redis-5.0.7.tar.gz
+sha256 f3c7eac42f433326a8d981b50dba0169fdfaf46abb23fcda2f933a7552ee4ed7  redis-5.0.8.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 1729afe165..5f6c83f84b 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.7
+REDIS_VERSION = 5.0.8
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
