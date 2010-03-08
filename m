From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-glide to 1.0.3 Mark
 as BROKEN since glide library is missing.
Message-ID: <20100308133627.CB5DF776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c5963a34327f15a1cc559472e4a53cadaa0baae
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-glide/Config.in   |    3 ++-
 .../xdriver_xf86-video-glide.mk                    |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-glide/Config.in b/package/x11r7/xdriver_xf86-video-glide/Config.in
index d372c5f..cbba50c 100644
--- a/package/x11r7/xdriver_xf86-video-glide/Config.in
+++ b/package/x11r7/xdriver_xf86-video-glide/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_GLIDE
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_VIDEOPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BROKEN # needs glide library from http://glide.sourceforge.net/
 	help
-	  xf86-video-glide 1.0.1
+	  xf86-video-glide 1.0.3
 	  video driver for glide device
diff --git a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
index fc23e59..897a532 100644
--- a/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
+++ b/package/x11r7/xdriver_xf86-video-glide/xdriver_xf86-video-glide.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.1
+XDRIVER_XF86_VIDEO_GLIDE_VERSION = 1.0.3
 XDRIVER_XF86_VIDEO_GLIDE_SOURCE = xf86-video-glide-$(XDRIVER_XF86_VIDEO_GLIDE_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_GLIDE_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_GLIDE_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_GLIDE_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_GLIDE_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_videoproto xproto_xproto
 XDRIVER_XF86_VIDEO_GLIDE_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
