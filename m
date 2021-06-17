From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Thu, 17 Jun 2021 23:36:08 +0200
Subject: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security bump
 to v6.0.14
Message-ID: <20210617213608.30066-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
================================================================================
Redis 6.0.14 Released Tue July 1 12:00:00 IST 2021
================================================================================

Upgrade urgency: SECURITY, Contains fixes to security issues that affect
authenticated client connections. MODERATE otherwise.

Fix integer overflow in STRALGO LCS (CVE-2021-32625)

Read the full release notes on:
https://github.com/redis/redis/blob/6.0.14/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index d9f1281aaa..15b55eb501 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  3049763f4553ddd5a69552f41da3dd7dde9fbc524dbb15e517fee24cc73b790c  redis-6.0.13.tar.gz
+sha256  c3e60c928b183ca9fe8e878936a6f8ba99e0441b9b6e04d2412a750ea576c649  redis-6.0.14.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index b70692ac79..925279274c 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.13
+REDIS_VERSION = 6.0.14
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
