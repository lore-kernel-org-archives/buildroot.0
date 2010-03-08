From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-wsfb to 0.3.0
Message-ID: <20100308133639.2E2CC776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=cd3f5088422da0386eb0f274723d2822c0dc215a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also mark this driver as broken. It fails to compile since it
needs some headers from OpenBSD/NetBSD. We actually don't care
about this driver.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-wsfb/Config.in    |    3 ++-
 .../xdriver_xf86-video-wsfb.mk                     |    3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-wsfb/Config.in b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
index 4dd39bd..328fea1 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/Config.in
+++ b/package/x11r7/xdriver_xf86-video-wsfb/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_WSFB
 	select BR2_PACKAGE_XPROTO_RENDERPROTO
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
+	depends on BROKEN # Fails to build. Actually this is OpenBSD/NetBSD stuff.
 	help
-	  xf86-video-wsfb 0.2.1
+	  xf86-video-wsfb 0.3.0
 	  WSFB based chips video driver
diff --git a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
index 7f829c1..2c30a09 100644
--- a/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
+++ b/package/x11r7/xdriver_xf86-video-wsfb/xdriver_xf86-video-wsfb.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.2.1
+XDRIVER_XF86_VIDEO_WSFB_VERSION = 0.3.0
 XDRIVER_XF86_VIDEO_WSFB_SOURCE = xf86-video-wsfb-$(XDRIVER_XF86_VIDEO_WSFB_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_WSFB_SITE = http://xorg.freedesktop.org/releases/individual/driver
 XDRIVER_XF86_VIDEO_WSFB_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_WSFB_LIBTOOL_PATCH = NO
 XDRIVER_XF86_VIDEO_WSFB_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_WSFB_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
