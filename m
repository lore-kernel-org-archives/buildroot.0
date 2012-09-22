From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 22 Sep 2012 20:45:54 +0200
Subject: [Buildroot] [git commit] xdriver_xf86-video-ati: version bump to
	6.14.1 and removed cross-compile patch
Message-ID: <20120922194144.B99389969B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8cc20e69850482faa8fc6be74b1a90c2b044c1ef
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: drop AUTORECONF]
Signed-off-by: Allan W. Nielsen <a@awn.dk>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../xdriver_xf86-video-ati-cross-compile.patch     |   27 --------------------
 .../xdriver_xf86-video-ati.mk                      |    3 +-
 2 files changed, 1 insertions(+), 29 deletions(-)

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
index 253a9c6..ea2d3c3 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_ATI_VERSION = 6.12.4
+XDRIVER_XF86_VIDEO_ATI_VERSION = 6.14.1
 XDRIVER_XF86_VIDEO_ATI_SOURCE = xf86-video-ati-$(XDRIVER_XF86_VIDEO_ATI_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_ATI_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_ATI_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = xserver_xorg-server libdrm xproto_fontsproto xproto_glproto xproto_randrproto xproto_videoproto xproto_xextproto xproto_xf86driproto xproto_xineramaproto xproto_xproto
 
 $(eval $(autotools-package))
