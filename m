From: Titouan Christophe <titouanchristophe@gmail.com>
Date: Mon, 17 May 2021 15:38:33 +0200
Subject: [Buildroot] [PATCH for 2021.02.x 1/1] package/redis: security bump
 to v6.0.13
Message-ID: <20210517133833.177855-1-titouanchristophe@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From the release notes:
================================================================================
Redis 6.0.13 Released Mon May 3 19:00:00 IST 2021
================================================================================

Upgrade urgency: SECURITY, Contains fixes to security issues that affect
authenticated client connections. LOW otherwise.

See https://github.com/redis/redis/blob/6.0.13/00-RELEASENOTES

Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 9b87b49fb1..d9f1281aaa 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/redis/redis-hashes/blob/master/README
-sha256  f16ad973d19f80f121e53794d5eb48a997e2c6a85b5be41bb3b66750cc17bf6b  redis-6.0.12.tar.gz
+sha256  3049763f4553ddd5a69552f41da3dd7dde9fbc524dbb15e517fee24cc73b790c  redis-6.0.13.tar.gz
 
 # Locally calculated
 sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index c851e589c4..b70692ac79 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 6.0.12
+REDIS_VERSION = 6.0.13
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
-- 
2.25.3
