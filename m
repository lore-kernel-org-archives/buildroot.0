From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 27 Feb 2015 07:47:09 +0200
Subject: [Buildroot] [PATCH] bdwgc: bump to version 7.4.2
Message-ID: <7011f19afdf57c5c52fea635aed911e6c77f7eb5.1425016029.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The code in gcconfig.h indicates that the list of supported architectures is
now a superset of BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS so we can drop
BR2_PACKAGE_BDWGC_ARCH_SUPPORTS.

Also, add a hash file.

Cc: Pedro Aguilar <paguilar@paguilar.org>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/bdwgc/Config.in  | 8 --------
 package/bdwgc/bdwgc.hash | 2 ++
 package/bdwgc/bdwgc.mk   | 4 +---
 package/guile/Config.in  | 1 -
 4 files changed, 3 insertions(+), 12 deletions(-)
 create mode 100644 package/bdwgc/bdwgc.hash

diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index ec83fa3a6d62..9aa7c7dff51a 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,13 +1,5 @@
-config BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
-	bool
-	default y
-	depends on BR2_arm || BR2_armeb || BR2_avr32 || BR2_i386 \
-		|| BR2_mips || BR2_mipsel || BR2_powerpc || BR2_sh \
-		|| BR2_sparc || BR2_x86_64
-
 config BR2_PACKAGE_BDWGC
 	bool "bdwgc"
-	depends on BR2_PACKAGE_BDWGC_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
diff --git a/package/bdwgc/bdwgc.hash b/package/bdwgc/bdwgc.hash
new file mode 100644
index 000000000000..44414e4efa70
--- /dev/null
+++ b/package/bdwgc/bdwgc.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	63320ad7c45460e4a40e03f5aa4c6893783f21a16416c3282b994f933312afa2	gc-7.4.2.tar.gz
diff --git a/package/bdwgc/bdwgc.mk b/package/bdwgc/bdwgc.mk
index b408947359ad..9cf015ed1b41 100644
--- a/package/bdwgc/bdwgc.mk
+++ b/package/bdwgc/bdwgc.mk
@@ -4,9 +4,7 @@
 #
 ################################################################################
 
-# When bumping the version number, check if the list of supported architectures
-# is still valid; see Config.log.
-BDWGC_VERSION = 7.2f
+BDWGC_VERSION = 7.4.2
 BDWGC_SOURCE = gc-$(BDWGC_VERSION).tar.gz
 BDWGC_SITE = http://www.hboehm.info/gc/gc_source
 BDWGC_INSTALL_STAGING = YES
diff --git a/package/guile/Config.in b/package/guile/Config.in
index 6859caff6125..d24f31844863 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_PACKAGE_BDWGC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_PACKAGE_LIBATOMIC_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # libunistring
 	select BR2_PACKAGE_LIBUNISTRING
-- 
2.1.4
