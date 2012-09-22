From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:55 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-xgi: bump version
Message-ID: <20120922194157.325AD9963C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8c647d14fd71fb526fce0382f9af69c150626851
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-xgi-cross-compile.patch     |   24 --------------------
 .../xdriver_xf86-video-xgi.mk                      |    4 +-
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
deleted file mode 100644
index fc7903c..0000000
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi-cross-compile.patch
+++ /dev/null
@@ -1,24 +0,0 @@
---- xdriver_xf86-video-xgi-1.5.1/configure.ac.orig	2009-09-07 08:03:18.000000000 +0300
-+++ xdriver_xf86-video-xgi-1.5.1/configure.ac	2010-02-03 23:58:40.507035914 +0200
-@@ -78,12 +78,18 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "x$DRI" = xauto; then
--        AC_CHECK_FILE([${sdkdir}/dri.h],
-+        if test "$cross_compiling" = "no" ; then
-+                AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--        AC_CHECK_FILE([${sdkdir}/sarea.h],
-+                AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--        AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+                AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+        else
-+                have_dri_h="yes"
-+                have_sarea_h="yes"
-+                have_dristruct_h="yes"
-+        fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
index 53510df..491f4e8 100644
--- a/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
+++ b/package/x11r7/xdriver_xf86-video-xgi/xdriver_xf86-video-xgi.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_XGI_VERSION = 1.5.1
+XDRIVER_XF86_VIDEO_XGI_VERSION = 1.6.0
 XDRIVER_XF86_VIDEO_XGI_SOURCE = xf86-video-xgi-$(XDRIVER_XF86_VIDEO_XGI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_XGI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_XGI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_XGI_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
+XDRIVER_XF86_VIDEO_XGI_CONF_OPT = --enable-dri
 
 $(eval $(autotools-package))
