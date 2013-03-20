From: Jesper Baekdahl <jbb@gamblify.com>
Date: Wed, 20 Mar 2013 15:11:00 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-intel: bump revision to
	X11R7.7
Message-ID: <20130324225143.867729B1CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d7f87f81dea74ae1cd5b144b2060535bdbdd2246
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

---
 .../xdriver_xf86-video-intel-cross-compile.patch   |   11 -----------
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 2 files changed, 1 insertions(+), 12 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-cross-compile.patch
deleted file mode 100644
index 0b020ac..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-cross-compile.patch
+++ /dev/null
@@ -1,11 +0,0 @@
---- a/configure.ac.orig	2010-01-04 22:20:07.000000000 +0000
-+++ b/configure.ac	2010-02-19 12:12:50.000000000 +0000
-@@ -103,7 +103,7 @@
- CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
- CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $DRM_CFLAGS"
- AC_MSG_CHECKING([whether to include DRI support])
--if test x$DRI != xno; then
-+if test "$cross_compiling" = "no" -a test x$DRI != xno; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index b5bdf1a..3450ab8 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.13.0
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.19.0
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
