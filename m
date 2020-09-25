From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 25 Sep 2020 15:37:27 +0200
Subject: [Buildroot] [git commit branch/2020.08.x] package/redis: security
 bump to 6.0.8
Message-ID: <20200925140149.A037A8DF79@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=78fb1ab18e4df9e1f314505646bf911f67835266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.08.x

From the release notes
See: https://github.com/redis/redis/blob/6.0.8/00-RELEASENOTES

================================================================================
Redis 6.0.7     Released Fri Aug 28 11:05:09 IDT 2020
================================================================================

Upgrade urgency MODERATE: several bugs with moderate impact are fixed,
Specifically the first two listed below which cause protocol errors for clients.

================================================================================
Redis 6.0.8     Released Wed Sep 09 23:34:17 IDT 2020
================================================================================

Upgrade urgency HIGH: Anyone who's using Redis 6.0.7 with Sentinel or
CONFIG REWRITE command is affected and should upgrade ASAP, see #7760.

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 882a8550bc83bfc33535c4a4c6b5d84187b70667)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 840019415d..d686d59847 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  12ad49b163af5ef39466e8d2f7d212a58172116e5b441eebecb4e6ca22363d94  redis-6.0.6.tar.gz
+sha256  04fa1fddc39bd1aecb6739dd5dd73858a3515b427acd1e2947a66dadce868d68  redis-6.0.8.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index 33c764a0d5..c567d3200d 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.6
+REDIS_VERSION = 6.0.8
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
