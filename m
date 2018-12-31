From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 31 Dec 2018 14:39:30 +0100
Subject: [Buildroot] [PATCH] webkitgtk: remove GTK in
 WEBKITGTK_ARCH_SUPPORTS* variable names
In-Reply-To: <20181231133932.29718-1-francois.perrad@gadz.org>
References: <20181231133932.29718-1-francois.perrad@gadz.org>
Message-ID: <20181231133932.29718-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

there are common for the GTK & WPE ports of WebKit

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/midori/Config.in       | 4 ++--
 package/webkitgtk/Config.in    | 8 ++++----
 package/webkitgtk/webkitgtk.mk | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index f0767c85f..460fc6fbf 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -1,5 +1,5 @@
 comment "midori needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PACKAGE_LIBGTK3 || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || !BR2_TOOLCHAIN_GCC_AT_LEAST_6 || \
 		!BR2_TOOLCHAIN_USES_GLIBC
@@ -12,7 +12,7 @@ config BR2_PACKAGE_MIDORI
 	depends on BR2_HOST_GCC_AT_LEAST_4_8 # webkitgtk -> icu
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6 # webkitgtk
 	depends on BR2_TOOLCHAIN_USES_GLIBC # webkitgtk
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	# GCR can only be used with the X11 backend
 	select BR2_PACKAGE_GCR if BR2_PACKAGE_LIBGTK3_X11
 	select BR2_PACKAGE_GRANITE
diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 8714677b6..3e5e8d7b6 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	bool
 	# ARM needs BLX, so v5t+, BE completely untested so disabled
 	default y if BR2_arm && !BR2_ARM_CPU_ARMV4
@@ -12,7 +12,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
 
-config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
+config BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT
 	bool
 	# ARM needs NEON for JIT.
 	default y if BR2_ARM_CPU_HAS_NEON
@@ -29,7 +29,7 @@ config BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT
 	default y if BR2_mipsel && BR2_MIPS_CPU_MIPS32R5
 
 comment "webkitgtk needs libgtk3 and a glibc toolchain w/ C++, gcc >= 6, host gcc >= 4.8"
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	depends on !BR2_PACKAGE_LIBGTK3 || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_USES_GLIBC || \
 		!BR2_HOST_GCC_AT_LEAST_4_8 || \
@@ -43,7 +43,7 @@ config BR2_PACKAGE_WEBKITGTK
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_PACKAGE_LIBGTK3
-	depends on BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_ENCHANT
diff --git a/package/webkitgtk/webkitgtk.mk b/package/webkitgtk/webkitgtk.mk
index 80daadd15..53d6236ca 100644
--- a/package/webkitgtk/webkitgtk.mk
+++ b/package/webkitgtk/webkitgtk.mk
@@ -27,7 +27,7 @@ WEBKITGTK_CONF_OPTS = \
 	-DUSE_LIBHYPHEN=OFF \
 	-DUSE_WOFF2=ON
 
-ifeq ($(BR2_PACKAGE_WEBKITGTK_ARCH_SUPPORTS_JIT),y)
+ifeq ($(BR2_PACKAGE_WEBKIT_ARCH_SUPPORTS_JIT),y)
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=ON
 else
 WEBKITGTK_CONF_OPTS += -DENABLE_JIT=OFF
-- 
2.17.1
