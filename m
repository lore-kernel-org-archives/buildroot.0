From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Mon, 22 Jun 2015 08:38:18 +0200
Subject: [Buildroot] [PATCH 1/1] package: indentation cleanup
Message-ID: <1434955098-3172-1-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/libvips/Config.in                      | 4 ++--
 package/openjpeg/Config.in                     | 2 +-
 package/openvmtools/Config.in                  | 2 +-
 package/qt-webkit-kiosk/Config.in              | 6 +++---
 package/qt/qt.mk                               | 2 +-
 package/setools/Config.in                      | 2 +-
 package/uclibc/Config.in                       | 6 +++---
 7 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/package/libvips/Config.in b/package/libvips/Config.in
index ad7a103..87ada51 100644
--- a/package/libvips/Config.in
+++ b/package/libvips/Config.in
@@ -17,6 +17,6 @@ config BR2_PACKAGE_LIBVIPS
 	  http://www.vips.ecs.soton.ac.uk/
 
 comment "libvips needs a toolchain w/ wchar, threads, C++"
-        depends on BR2_USE_MMU
-        depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/openjpeg/Config.in b/package/openjpeg/Config.in
index 005d298..738999f 100644
--- a/package/openjpeg/Config.in
+++ b/package/openjpeg/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_OPENJPEG
 	  The OpenJPEG library is an open-source JPEG 2000 codec
 	  written in C.
 
-          http://www.openjpeg.org
+	  http://www.openjpeg.org
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index ebad876..8e22eff 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -48,4 +48,4 @@ comment "openvmtools needs a toolchain w/ wchar, threads, RPC, locale"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		   !BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
+		!BR2_TOOLCHAIN_HAS_NATIVE_RPC || !BR2_ENABLE_LOCALE
diff --git a/package/qt-webkit-kiosk/Config.in b/package/qt-webkit-kiosk/Config.in
index 075258e..51383f0 100644
--- a/package/qt-webkit-kiosk/Config.in
+++ b/package/qt-webkit-kiosk/Config.in
@@ -16,8 +16,8 @@ config BR2_PACKAGE_QT_WEBKIT_KIOSK
 if BR2_PACKAGE_QT_WEBKIT_KIOSK
 
 config BR2_PACKAGE_QT_WEBKIT_KIOSK_SOUNDS
-        bool "Install browser sound files"
-        help
-          Deploy browser sound files on target
+	bool "Install browser sound files"
+	help
+	  Deploy browser sound files on target
 
 endif
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a7bbe5f..c8e9665 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -227,7 +227,7 @@ endif
 
 ifeq ($(BR2_PACKAGE_QT_X11),y)
 QT_DEPENDENCIES += fontconfig xlib_libXi xlib_libX11 xlib_libXrender \
-                xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
+	xlib_libXcursor xlib_libXrandr xlib_libXext xlib_libXv
 # Using pkg-config avoids us some logic to redefine and sed again mkspecs files
 # to add X11 include path and link options
 QT_CFLAGS += $(shell $(PKG_CONFIG_HOST_BINARY) --cflags x11)
diff --git a/package/setools/Config.in b/package/setools/Config.in
index 57397a5..46518a8 100644
--- a/package/setools/Config.in
+++ b/package/setools/Config.in
@@ -18,7 +18,7 @@ config BR2_PACKAGE_SETOOLS
 	     checks on an SELinux policy.
 	   * sediff - semantic policy difference tool for SELinux.
 	   * secmds - command-line tools to analyze and search SELinux
-             policy.
+	     policy.
 
 comment "setools needs a toolchain w/ threads, C++, dynamic library"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS \
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index f69cc25..2616f5b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -8,13 +8,13 @@ config BR2_PACKAGE_UCLIBC
 comment "uClibc Options"
 
 config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS
-       bool
+	bool
 
 config BR2_UCLIBC_VERSION_SUPPORTS_LINUXTHREADS_OLD
-       bool
+	bool
 
 config BR2_UCLIBC_VERSION_SUPPORTS_NPTL
-       bool
+	bool
 
 choice
 	prompt "uClibc C library Version"
-- 
1.9.1
