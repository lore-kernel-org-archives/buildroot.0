From: Waldemar Brodkorb <wbx@openadk.org>
Date: Wed, 28 Jun 2017 15:10:00 +0200
Subject: [Buildroot] [PATCH] lttng-tools: update to 2.9.5
Message-ID: <20170628131000.GA26783@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Latest release fixed dlmopen detection, so that
musl/uClibc-ng toolchains can be used.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/lttng-tools/Config.in        | 7 ++-----
 package/lttng-tools/lttng-tools.hash | 6 +++---
 package/lttng-tools/lttng-tools.mk   | 2 +-
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/lttng-tools/Config.in b/package/lttng-tools/Config.in
index 8888ef7..187e424 100644
--- a/package/lttng-tools/Config.in
+++ b/package/lttng-tools/Config.in
@@ -4,8 +4,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_STATIC_LIBS # uses dlfcn
-	# uclibc/musl don't implement dlmopen()/LM_ID_BASE
-	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBURCU
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_POPT
@@ -29,7 +27,6 @@ config BR2_PACKAGE_LTTNG_TOOLS
 
 	  http://lttng.org
 
-comment "lttng-tools needs a glibc toolchain w/ threads, dynamic library"
+comment "lttng-tools needs a toolchain w/ threads, dynamic library"
 	depends on BR2_PACKAGE_LIBURCU_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
-		!BR2_TOOLCHAIN_USES_GLIBC
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
diff --git a/package/lttng-tools/lttng-tools.hash b/package/lttng-tools/lttng-tools.hash
index 114bd0c..8a4c2eb 100644
--- a/package/lttng-tools/lttng-tools.hash
+++ b/package/lttng-tools/lttng-tools.hash
@@ -1,3 +1,3 @@
-# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.4.tar.bz2.{md5,sha1}
-md5 10f47abfa214b167580358388428770d  lttng-tools-2.9.4.tar.bz2
-sha1 ab1945fd36b30f445eb5c83f199b011d42525612  lttng-tools-2.9.4.tar.bz2
+# From http://lttng.org/files/lttng-tools/lttng-tools-2.9.5.tar.bz2.{md5,sha1}
+md5 051224eb991aee07f8721ff1877d0b96  lttng-tools-2.9.5.tar.bz2
+sha1 b988b237f34baa3916242dc9141aa61470e99dfd  lttng-tools-2.9.5.tar.bz2
diff --git a/package/lttng-tools/lttng-tools.mk b/package/lttng-tools/lttng-tools.mk
index 1714a42..776750c 100644
--- a/package/lttng-tools/lttng-tools.mk
+++ b/package/lttng-tools/lttng-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LTTNG_TOOLS_VERSION = 2.9.4
+LTTNG_TOOLS_VERSION = 2.9.5
 LTTNG_TOOLS_SITE = http://lttng.org/files/lttng-tools
 LTTNG_TOOLS_SOURCE = lttng-tools-$(LTTNG_TOOLS_VERSION).tar.bz2
 LTTNG_TOOLS_LICENSE = GPL-2.0+, LGPL-2.1+ (include/lttng/*, src/lib/lttng-ctl/*)
-- 
2.1.4
