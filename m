From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Mar 2014 23:15:13 +0100
Subject: [Buildroot] [git commit] xdriver_xf86-video-openchrome: Bump
	version to 0.3.3
Message-ID: <20140329222158.7B14C9C42C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a01f33826c806695a2130c0a9e47dff1b3eedb01
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- fixed upstream URL
- removed unnecessary patch:
  xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 --------------------
 .../xdriver_xf86-video-openchrome.mk               |    7 +----
 2 files changed, 2 insertions(+), 26 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
deleted file mode 100644
index e259398..0000000
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch
+++ /dev/null
@@ -1,21 +0,0 @@
---- a/configure.ac	2008-04-09 15:42:55.000000000 -0400
-+++ b/configure.ac	2008-06-23 09:39:06.000000000 -0400
-@@ -87,12 +87,18 @@ if test x$XSERVER_LIBPCIACCESS = xyes; t
- fi
- 
- if test "$DRI" != no; then
-+	if test "$cross_compiling" = "no" ; then
-         AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
-         AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
-         AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
-+	else
-+		have_dri_h="yes"
-+		have_sarea_h="yes"
-+		have_dristruct_h="yes"
-+	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
index dda18fc..345beb1 100644
--- a/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
+++ b/package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.2.906
+XDRIVER_XF86_VIDEO_OPENCHROME_VERSION = 0.3.3
 XDRIVER_XF86_VIDEO_OPENCHROME_SOURCE = xf86-video-openchrome-$(XDRIVER_XF86_VIDEO_OPENCHROME_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://www.openchrome.org/releases
+XDRIVER_XF86_VIDEO_OPENCHROME_SITE = http://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE = MIT
 XDRIVER_XF86_VIDEO_OPENCHROME_LICENSE_FILES = COPYING
 
@@ -24,7 +24,4 @@ XDRIVER_XF86_VIDEO_OPENCHROME_DEPENDENCIES = \
 	xproto_xf86driproto \
 	xproto_xproto
 
-
-XDRIVER_XF86_VIDEO_OPENCHROME_AUTORECONF = YES
-
 $(eval $(autotools-package))
