From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Jul 2016 15:07:22 +0200
Subject: [Buildroot] [git commit] memcached: bump to version 1.4.28
Message-ID: <20160702130841.3578E7FED3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=321ee11c1a9914eab108ce619c6aadc11281b2a5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removes the 64-bit atomic intrinsics constraint previously introduced.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/memcached/Config.in      | 2 --
 package/memcached/memcached.hash | 6 +++---
 package/memcached/memcached.mk   | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/memcached/Config.in b/package/memcached/Config.in
index 901ecf2..e011d08 100644
--- a/package/memcached/Config.in
+++ b/package/memcached/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_MEMCACHED
 	bool "memcached"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_TOOLCHAIN_HAS_SYNC_8
 	select BR2_PACKAGE_LIBEVENT
 	help
 	  Memcached is an in-memory key-value store for small chunks
@@ -14,4 +13,3 @@ config BR2_PACKAGE_MEMCACHED
 comment "memcached needs a toolchain w/ threads"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_SYNC_8
diff --git a/package/memcached/memcached.hash b/package/memcached/memcached.hash
index 99ee9ac..e774a61 100644
--- a/package/memcached/memcached.hash
+++ b/package/memcached/memcached.hash
@@ -1,4 +1,4 @@
-# From http://www.memcached.org/files/memcached-1.4.27.tar.gz.sha1
-sha1	b5869038dc5f2dce24f3a62806eadfd64d58662e	memcached-1.4.27.tar.gz
+# From http://www.memcached.org/files/memcached-1.4.28.tar.gz.sha1
+sha1	c27662ca84933f5ebd837a86dde9378d05c1f200	memcached-1.4.28.tar.gz
 # Calculated based on the hash above
-sha256	96a90e7abec041a3c03258b6ce01ab21be16a9c594b7891a55567428392e8fe7	memcached-1.4.27.tar.gz
+sha256	ef847bba60301cc600f06a8c64bf91c6c3f65ca507462951f918963297bcb816	memcached-1.4.28.tar.gz
diff --git a/package/memcached/memcached.mk b/package/memcached/memcached.mk
index 37e52ad..6490271 100644
--- a/package/memcached/memcached.mk
+++ b/package/memcached/memcached.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MEMCACHED_VERSION = 1.4.27
+MEMCACHED_VERSION = 1.4.28
 MEMCACHED_SITE = http://www.memcached.org/files
 MEMCACHED_DEPENDENCIES = libevent
 MEMCACHED_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
