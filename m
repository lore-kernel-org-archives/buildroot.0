From: Allan W. Nielsen <a@awn.dk>
Date: Wed,  6 Apr 2011 12:04:14 +0200
Subject: [Buildroot] [PATCH 60/63] xdriver_xf86-video-ati: version bump to
	6.14.1 and removed cross-compile patch
In-Reply-To: <1302084257-30775-1-git-send-email-a@awn.dk>
References: <1302084257-30775-1-git-send-email-a@awn.dk>
Message-ID: <1302084257-30775-61-git-send-email-a@awn.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Allan W. Nielsen <a@awn.dk>
---
 .../xdriver_xf86-video-ati-cross-compile.patch     |   27 --------------------
 .../xdriver_xf86-video-ati.mk                      |    2 +-
 2 files changed, 1 insertions(+), 28 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
deleted file mode 100644
index d276176..0000000
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati-cross-compile.patch
+++ /dev/null
@@ -1,27 +0,0 @@
---- a/configure.ac	2008-06-23 10:39:28.000000000 -0400
-+++ b/configure.ac	2008-06-23 10:40:46.000000000 -0400
-@@ -85,14 +85,20 @@ sdkdir=$(pkg-config --variable=sdkdir xo
- AC_HEADER_STDC
- 
- if test "$DRI" != no; then
--	AC_CHECK_FILE([${sdkdir}/dri.h],
-+ 	if test "$cross_compiling" = "no" ; then
-+		AC_CHECK_FILE([${sdkdir}/dri.h],
-                       [have_dri_h="yes"], [have_dri_h="no"])
--	AC_CHECK_FILE([${sdkdir}/sarea.h],
-+		AC_CHECK_FILE([${sdkdir}/sarea.h],
-                       [have_sarea_h="yes"], [have_sarea_h="no"])
--	AC_CHECK_FILE([${sdkdir}/dristruct.h],
-+		AC_CHECK_FILE([${sdkdir}/dristruct.h],
-                       [have_dristruct_h="yes"], [have_dristruct_h="no"])
--	AC_CHECK_FILE([${sdkdir}/damage.h],
-+		AC_CHECK_FILE([${sdkdir}/damage.h],
-                       [have_damage_h="yes"], [have_damage_h="no"])
-+ 	else
-+ 		have_dri_h="yes"
-+ 		have_sarea_h="yes"
-+ 		have_dristruct_h="yes"
-+ 	fi
- fi
- 
- AC_MSG_CHECKING([whether to include DRI support])
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index 8a5a1d0..1d5fb56 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
+XDRIVER_XF86_VIDEO_ATI_VERSION = 6.14.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
-- 
1.7.3.4
