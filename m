From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Remove obsolete xf86-video-impact
Message-ID: <20100308133629.09772776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=9049e94a9e8396a1a71b795cfaaed09dc8d60e47
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/Config.in                            |    1 -
 package/x11r7/xdriver_xf86-video-impact/Config.in  |   12 ------------
 .../xdriver_xf86-video-impact.mk                   |   14 --------------
 3 files changed, 0 insertions(+), 27 deletions(-)
 delete mode 100644 package/x11r7/xdriver_xf86-video-impact/Config.in
 delete mode 100644 package/x11r7/xdriver_xf86-video-impact/xdriver_xf86-video-impact.mk

diff --git a/package/x11r7/Config.in b/package/x11r7/Config.in
index 02bd4e1..46d2ab6 100644
--- a/package/x11r7/Config.in
+++ b/package/x11r7/Config.in
@@ -201,7 +201,6 @@ endmenu
 		source package/x11r7/xdriver_xf86-video-glint/Config.in
 		source package/x11r7/xdriver_xf86-video-i128/Config.in
 		source package/x11r7/xdriver_xf86-video-i740/Config.in
-		source package/x11r7/xdriver_xf86-video-impact/Config.in
 		source package/x11r7/xdriver_xf86-video-intel/Config.in
 		source package/x11r7/xdriver_xf86-video-mach64/Config.in
 		source package/x11r7/xdriver_xf86-video-mga/Config.in
diff --git a/package/x11r7/xdriver_xf86-video-impact/Config.in b/package/x11r7/xdriver_xf86-video-impact/Config.in
deleted file mode 100644
index 1547ffd..0000000
--- a/package/x11r7/xdriver_xf86-video-impact/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_XDRIVER_XF86_VIDEO_IMPACT
-	bool "xf86-video-impact"
-	select BR2_PACKAGE_XSERVER_XORG_SERVER
-	select BR2_PACKAGE_XPROTO_FONTSPROTO
-	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_XPROTO_RENDERPROTO
-	select BR2_PACKAGE_XPROTO_VIDEOPROTO
-	select BR2_PACKAGE_XPROTO_XEXTPROTO
-	select BR2_PACKAGE_XPROTO_XPROTO
-	help
-	  xf86-video-impact 0.2.0
-	  Impact video driver
diff --git a/package/x11r7/xdriver_xf86-video-impact/xdriver_xf86-video-impact.mk b/package/x11r7/xdriver_xf86-video-impact/xdriver_xf86-video-impact.mk
deleted file mode 100644
index fa42731..0000000
--- a/package/x11r7/xdriver_xf86-video-impact/xdriver_xf86-video-impact.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# xdriver_xf86-video-impact -- Impact video driver
-#
-################################################################################
-
-XDRIVER_XF86_VIDEO_IMPACT_VERSION = 0.2.0
-XDRIVER_XF86_VIDEO_IMPACT_SOURCE = xf86-video-impact-$(XDRIVER_XF86_VIDEO_IMPACT_VERSION).tar.bz2
-XDRIVER_XF86_VIDEO_IMPACT_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_IMPACT_AUTORECONF = NO
-XDRIVER_XF86_VIDEO_IMPACT_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xextproto xproto_xproto
-XDRIVER_XF86_VIDEO_IMPACT_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
-
-$(eval $(call AUTOTARGETS,package/x11r7,xdriver_xf86-video-impact))
-- 
1.6.3.3
