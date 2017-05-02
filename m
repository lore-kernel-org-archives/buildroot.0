From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 2 May 2017 22:26:32 +0200
Subject: [Buildroot] [git commit] package/x*/Config.in: fix ordering of
	statements
Message-ID: <20170502203020.AEE097FE01@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a139295ce96f9deb8fa9c502ebd00000b9c216d5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The check-package script when ran gives warnings on ordering issues
on all of these Config files.  This patch cleans up all warnings
related to the ordering in the Config files for packages starting with
the letter x in the package directory.

The appropriate ordering is: type, default, depends on, select, help
See http://nightly.buildroot.org/#_config_files for more information.

Signed-off-by: Adam Duskett <Adamduskett@outlook.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/x11r7/xapp_luit/Config.in                | 2 +-
 package/x11r7/xapp_xconsole/Config.in            | 2 +-
 package/x11r7/xapp_xdriinfo/Config.in            | 2 +-
 package/x11r7/xapp_xedit/Config.in               | 2 +-
 package/x11r7/xapp_xf86dga/Config.in             | 2 +-
 package/x11r7/xapp_xfs/Config.in                 | 2 +-
 package/x11r7/xcb-util-cursor/Config.in          | 2 +-
 package/x11r7/xcb-util-renderutil/Config.in      | 2 +-
 package/x11r7/xdriver_xf86-video-geode/Config.in | 2 +-
 package/xenomai/Config.in                        | 2 +-
 package/xorriso/Config.in                        | 2 +-
 package/xterm/Config.in                          | 4 ++--
 package/xvisor/Config.in                         | 2 +-
 13 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/package/x11r7/xapp_luit/Config.in b/package/x11r7/xapp_luit/Config.in
index 3e314de..69da570 100644
--- a/package/x11r7/xapp_luit/Config.in
+++ b/package/x11r7/xapp_luit/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XAPP_LUIT
 	bool "luit"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBFONTENC
-	depends on BR2_USE_MMU # fork()
 	help
 	  Locale and ISO 2022 support for Unicode terminals
diff --git a/package/x11r7/xapp_xconsole/Config.in b/package/x11r7/xapp_xconsole/Config.in
index 1aaa118..7baf4ff 100644
--- a/package/x11r7/xapp_xconsole/Config.in
+++ b/package/x11r7/xapp_xconsole/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_XAPP_XCONSOLE
 	bool "xconsole"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXAW
 	select BR2_PACKAGE_XLIB_LIBXT
 	select BR2_PACKAGE_XPROTO_XPROTO
 	select BR2_PACKAGE_XLIB_LIBXMU
-	depends on BR2_USE_MMU # fork()
 	help
 	  xconsole - monitor system console messages with X
diff --git a/package/x11r7/xapp_xdriinfo/Config.in b/package/x11r7/xapp_xdriinfo/Config.in
index 36dc577..2b204d9 100644
--- a/package/x11r7/xapp_xdriinfo/Config.in
+++ b/package/x11r7/xapp_xdriinfo/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XAPP_XDRIINFO
 	bool "xdriinfo"
+	depends on BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XPROTO_GLPROTO
-	depends on BR2_PACKAGE_HAS_LIBGL
 	help
 	  query configuration information of DRI drivers
 
diff --git a/package/x11r7/xapp_xedit/Config.in b/package/x11r7/xapp_xedit/Config.in
index feaea74..876d541 100644
--- a/package/x11r7/xapp_xedit/Config.in
+++ b/package/x11r7/xapp_xedit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_XAPP_XEDIT
 	bool "xedit"
-	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  simple text editor for X
diff --git a/package/x11r7/xapp_xf86dga/Config.in b/package/x11r7/xapp_xf86dga/Config.in
index 8a13bd4..5d81203 100644
--- a/package/x11r7/xapp_xf86dga/Config.in
+++ b/package/x11r7/xapp_xf86dga/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XAPP_XF86DGA
 	bool "xf86dga"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXXF86DGA
-	depends on BR2_USE_MMU # fork()
 	help
 	  test program for the XFree86-DGA extension
diff --git a/package/x11r7/xapp_xfs/Config.in b/package/x11r7/xapp_xfs/Config.in
index 8b72445..0a5d711 100644
--- a/package/x11r7/xapp_xfs/Config.in
+++ b/package/x11r7/xapp_xfs/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_XAPP_XFS
 	bool "xfs"
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_XLIB_LIBFS
 	select BR2_PACKAGE_XLIB_LIBXFONT
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	depends on BR2_USE_MMU # fork()
 	help
 	  X font server
diff --git a/package/x11r7/xcb-util-cursor/Config.in b/package/x11r7/xcb-util-cursor/Config.in
index ca30494..aa81615 100644
--- a/package/x11r7/xcb-util-cursor/Config.in
+++ b/package/x11r7/xcb-util-cursor/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XCB_UTIL_CURSOR
 	bool "xcb-util-cursor"
+	depends on BR2_PACKAGE_LIBXCB
 	select BR2_PACKAGE_XCB_UTIL
 	select BR2_PACKAGE_XCB_UTIL_IMAGE
 	select BR2_PACKAGE_XCB_UTIL_RENDERUTIL
-	depends on BR2_PACKAGE_LIBXCB
 	help
 	  The XCB util modules provides a number of libraries which
 	  sit on top of libxcb, the core X protocol library, and some
diff --git a/package/x11r7/xcb-util-renderutil/Config.in b/package/x11r7/xcb-util-renderutil/Config.in
index 53b2a8c..088bb18 100644
--- a/package/x11r7/xcb-util-renderutil/Config.in
+++ b/package/x11r7/xcb-util-renderutil/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_XCB_UTIL_RENDERUTIL
 	bool "xcb-util-renderutil"
-	select BR2_PACKAGE_XCB_UTIL
 	depends on BR2_PACKAGE_LIBXCB # xcb-util
+	select BR2_PACKAGE_XCB_UTIL
 	help
 	  The XCB util modules provides a number of libraries which
 	  sit on top of libxcb, the core X protocol library, and some
diff --git a/package/x11r7/xdriver_xf86-video-geode/Config.in b/package/x11r7/xdriver_xf86-video-geode/Config.in
index 0b45fb1..fe217b9 100644
--- a/package/x11r7/xdriver_xf86-video-geode/Config.in
+++ b/package/x11r7/xdriver_xf86-video-geode/Config.in
@@ -1,10 +1,10 @@
 config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GEODE
 	bool "xf86-video-geode"
+	depends on BR2_i386
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
-	depends on BR2_i386
 	help
 	  video driver for geode device
diff --git a/package/xenomai/Config.in b/package/xenomai/Config.in
index 4bbffb2..87a844d 100644
--- a/package/xenomai/Config.in
+++ b/package/xenomai/Config.in
@@ -98,10 +98,10 @@ config BR2_PACKAGE_XENOMAI_ENABLE_SMP
 
 config BR2_PACKAGE_XENOMAI_ENABLE_REGISTRY
 	bool "Enable registry"
-	select BR2_PACKAGE_LIBFUSE
 	depends on !BR2_STATIC_LIBS # libfuse
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libfuse
 	depends on BR2_USE_MMU # libfuse
+	select BR2_PACKAGE_LIBFUSE
 	help
 	  Xenomai APIs can export their internal state through a
 	  pseudo-filesystem, whose files may be read to obtain
diff --git a/package/xorriso/Config.in b/package/xorriso/Config.in
index f9bb10a..60b2642 100644
--- a/package/xorriso/Config.in
+++ b/package/xorriso/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XORRISO
 	bool "xorriso"
-	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	depends on BR2_USE_WCHAR
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  xorriso copies file objects from POSIX compliant
 	  filesystems into Rock Ridge enhanced ISO 9660 filesystems
diff --git a/package/xterm/Config.in b/package/xterm/Config.in
index f11aafa..f3bc450 100644
--- a/package/xterm/Config.in
+++ b/package/xterm/Config.in
@@ -1,11 +1,11 @@
 config BR2_PACKAGE_XTERM
 	bool "xterm"
-	select BR2_PACKAGE_NCURSES
-	select BR2_PACKAGE_XLIB_LIBXAW
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU # fork()
 	# ARC toolchain issue
 	depends on !BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+	select BR2_PACKAGE_NCURSES
+	select BR2_PACKAGE_XLIB_LIBXAW
 	help
 	  xterm terminal emulator
 
diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index 996d37a..1f8fd1f 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -32,12 +32,12 @@ endchoice
 
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	default "generic-v5" if BR2_ARM_CPU_ARMV5
 	default "generic-v6" if BR2_ARM_CPU_ARMV6
 	default "generic-v7" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_AARCH64
 	default "x86_64_generic" if BR2_x86_64
+	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
 	help
 	  Name of the Xvisor defconfig file to use, without the
 	  trailing -defconfig. The defconfig is located in
