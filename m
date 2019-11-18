From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Nov 2019 21:20:28 +0100
Subject: [Buildroot] [git commit] package/redis: bump to 5.0.6
Message-ID: <20191118201632.AC4228F1E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=43683d2d9bf2cf3117033d25bd9b2c7d0328e4ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The release notes at
https://raw.githubusercontent.com/antirez/redis/5.0/00-RELEASENOTES
say:

==
Upgrade urgency CRITICAL: Only in case of exposed instances to untrusted users.

This Redis release, 5.0.6, is a bugfix and enhancement release. The most
important bugfix is a corruption related to the HyperLogLog. A malformed
HyperLogLog string could cause an invalid access to the memory. At a first
glance the vulnerability appears to be not exploitable but just a DoS. The
way to trigger the issue is complex, we'll not provide any information about
how to do that for the users safety.
==

Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/redis/redis.hash | 2 +-
 package/redis/redis.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/redis/redis.hash b/package/redis/redis.hash
index 391b227ed1..aca1109d30 100644
--- a/package/redis/redis.hash
+++ b/package/redis/redis.hash
@@ -1,5 +1,5 @@
 # From https://github.com/antirez/redis-hashes/blob/master/README
-sha256 2139009799d21d8ff94fc40b7f36ac46699b9e1254086299f8d3b223ca54a375  redis-5.0.5.tar.gz
+sha256 6624841267e142c5d5d5be292d705f8fb6070677687c5aad1645421a936d22b3  redis-5.0.6.tar.gz
 
 # Locally calculated
 sha256 cbf420a3672475a6e2765e3c0984c1f81efe0212afb94a3c998ee63bfd661063  COPYING
diff --git a/package/redis/redis.mk b/package/redis/redis.mk
index a321eb9347..4ed90a749e 100644
--- a/package/redis/redis.mk
+++ b/package/redis/redis.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-REDIS_VERSION = 5.0.5
+REDIS_VERSION = 5.0.6
 REDIS_SITE = http://download.redis.io/releases
 REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
 REDIS_LICENSE_FILES = COPYING
