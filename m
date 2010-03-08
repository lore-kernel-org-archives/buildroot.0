From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-sunffb to 1.2.1
Message-ID: <20100308133635.B094B776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=6b53c5aa38e2392cd9700e83c80c51122b076fc1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-sunffb/Config.in  |    2 +-
 .../xdriver_xf86-video-sunffb-1.2.0.patch          |   24 --------------------
 .../xdriver_xf86-video-sunffb.mk                   |    4 +-
 3 files changed, 3 insertions(+), 27 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.2.0.patch

diff --git a/package/x11r7/xdriver_xf86-video-sunffb/Config.in b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
index c5e5e2d..6ac3dbc 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-sunffb/Config.in
@@ -9,5 +9,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_SUNFFB
 	select BR2_PACKAGE_XPROTO_XF86DRIPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-sunffb 1.1.0
+	  xf86-video-sunffb 1.2.1
 	  SUNFFB video driver
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.2.0.patch b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.2.0.patch
deleted file mode 100644
index 36db305..0000000
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb-1.2.0.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xf86-video-sunffb-1.2.0/configure.ac.orig	2007-06-10 21:01:18.000000000 +0200
-+++ xf86-video-sunffb-1.2.0/configure.ac	2007-06-10 21:01:34.000000000 +0200
-@@ -72,13 +72,20 @@
- # Checks for header files.
- AC_HEADER_STDC
- 
--if test "$DRI" != no; then
-+if test "x$DRI" != xno; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+		AC_CHECK_HEADER
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
index 845152e..8c05b55 100644
--- a/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
+++ b/package/x11r7/xdriver_xf86-video-sunffb/xdriver_xf86-video-sunffb.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.0
+XDRIVER_XF86_VIDEO_SUNFFB_VERSION = 1.2.1
 XDRIVER_XF86_VIDEO_SUNFFB_SOURCE = xf86-video-sunffb-$(XDRIVER_XF86_VIDEO_SUNFFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_SUNFFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = YES
+XDRIVER_XF86_VIDEO_SUNFFB_AUTORECONF = NO
 XDRIVER_XF86_VIDEO_SUNFFB_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xf86driproto xproto_xproto
 XDRIVER_XF86_VIDEO_SUNFFB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
