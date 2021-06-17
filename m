From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Thu, 17 Jun 2021 23:24:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/redis: security bump to v6.2.4
Message-ID: <20210617212459.11452-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
================================================================================
Redis 6.2.4 Released Tue July 1 12:00:00 IST 2021
================================================================================

Upgrade urgency: SECURITY, Contains fixes to security issues that affect
authenticated client connections. MODERATE otherwise.
Fix integer overflow in STRALGO LCS (CVE-2021-32625)

Read the whole release note on:
https://github.com/redis/redis/blob/6.2.4/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 06e6884d85..f5e5827dab 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  98ed7d532b5e9671f5df0825bb71f0f37483a16546364049384c63db8764512b  redis-6.2.3.tar.gz
+sha256  ba32c406a10fc2c09426e2be2787d74ff204eb3a2e496d87cff76a476b6ae16e  redis-6.2.4.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index cea2d3b237..4e16b346c1 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.2.3
+REDIS_VERSION = 6.2.4
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
