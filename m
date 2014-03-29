From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 29 Mar 2014 21:56:31 +0100
Subject: [Buildroot] [PATCH 27/91] xdriver_xf86-video-openchrome: Bump
	version to 0.3.3
In-Reply-To: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
References: <1396126655-25994-1-git-send-email-berndkuhls@hotmail.com>
Message-ID: <BLU0-SMTP1239F2DA058E6CBF23B5D57D9610@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- fixed upstream URL
- removed unnecessary patch:
  xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch

Signed-off-by: Bernd Kuhls <berndkuhls@hotmail.com>
---
 ...86-video-openchrome-0.2.904-cross-compile.patch |   21 --------------------
 .../xdriver_xf86-video-openchrome.mk               |    7 ++-----
 2 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-openchrome/xdriver_xf86-video-openchrome-0.2.904-cross-compile.patch

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
-- 
1.7.10.4
