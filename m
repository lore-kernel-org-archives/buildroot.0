From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 21:34:54 +0200
Subject: [Buildroot] [git commit] xdriver_x86-driver-intel: bump version
Message-ID: <20120922194153.43B029967A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ddf6677fe76a46b05d3cb89fa6b4b9152fc52502
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...iver_xf86-video-intel-2.9.1-cross-compile.patch |   25 --------------------
 ...> xdriver_xf86-video-intel-cross-compile.patch} |    0
 .../xdriver_xf86-video-intel.mk                    |    2 +-
 .../xdriver_xf86-video-vesa-2.0.0.patch            |   13 ----------
 4 files changed, 1 insertions(+), 39 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
deleted file mode 100644
index 76a33eb..0000000
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.9.1-cross-compile.patch
+++ /dev/null
@@ -1,25 +0,0 @@
---- xdriver_xf86-video-intel-2.9.1/configure.ac.orig	2010-01-28 11:18:27.526329157 +0200
-+++ xdriver_xf86-video-intel-2.9.1/configure.ac	2010-01-28 11:21:38.065198735 +0200
-@@ -114,6 +114,7 @@ save_CFLAGS="$CFLAGS"
- CFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
- CPPFLAGS="$XORG_CFLAGS $DRI_CFLAGS $drm_cflags"
- AC_MSG_CHECKING([whether to include DRI support])
-+if test "$cross_compiling" = "no" ; then
- if test x$DRI != xno; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-@@ -132,6 +133,14 @@ if test x$DRI = xauto; then
-                 DRI="no"
-         fi
- fi
-+else
-+if test x$DRI != xno; then
-+	have_dri_h="yes"
-+	have_sarea_h="yes"
-+	have_dristruct_h="yes"
-+	DRI="yes"
-+fi
-+fi
- AC_MSG_RESULT([$DRI])
- CFLAGS="$save_CFLAGS $DEBUGFLAGS"
- 
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-cross-compile.patch
similarity index 100%
rename from package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-2.10.0-cross-compile.patch
rename to package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel-cross-compile.patch
diff --git a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
index acffd66..b5bdf1a 100644
--- a/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
+++ b/package/x11r7/xdriver_xf86-video-intel/xdriver_xf86-video-intel.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.10.0
+XDRIVER_XF86_VIDEO_INTEL_VERSION = 2.13.0
 XDRIVER_XF86_VIDEO_INTEL_SOURCE = xf86-video-intel-$(XDRIVER_XF86_VIDEO_INTEL_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_INTEL_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_INTEL_AUTORECONF = YES
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
deleted file mode 100644
index bf9ffe7..0000000
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa-2.0.0.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- xf86-video-vesa-2.0.0/configure.ac.orig	2007-06-11 13:10:35.000000000 +0200
-+++ xf86-video-vesa-2.0.0/configure.ac	2007-06-11 14:16:45.000000000 +0200
-@@ -56,8 +56,8 @@
- PKG_CHECK_MODULES(XORG, xorg-server >= 1.0.99.901 xproto fontsproto $REQUIRED_MODULES)
- sdkdir=$(pkg-config --variable=sdkdir xorg-server)
- 
--CFLAGS="$CFLAGS $XORG_CFLAGS "' -I$(top_srcdir)/src'
--INCLUDES="$XORG_INCS -I${sdkdir} "'-I$(top_srcdir)/src -I$(prefix)/include'
-+CFLAGS="$CFLAGS $XORG_CFLAGS "'-I$(top_srcdir)/src'
-+INCLUDES="$XORG_INCS "'-I$(top_srcdir)/src'
- AC_SUBST([CFLAGS])
- AC_SUBST([INCLUDES])
- 
