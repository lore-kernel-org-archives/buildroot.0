From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Mon, 8 Mar 2010 14:29:48 +0100
Subject: [Buildroot] [git commit master] Bump xf86-video-vesa to 2.2.1
Message-ID: <20100308133638.35E80776E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b798945cf5383cc77694d969c34d10641af04a6a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also fix building as the patch was correct, but autoreconf
had to be done for it to take effect.

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---
 package/x11r7/xdriver_xf86-video-vesa/Config.in    |    2 +-
 .../xdriver_xf86-video-vesa.mk                     |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-video-vesa/Config.in b/package/x11r7/xdriver_xf86-video-vesa/Config.in
index 6b73316..b75cc5c 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/Config.in
+++ b/package/x11r7/xdriver_xf86-video-vesa/Config.in
@@ -7,5 +7,5 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_VESA
 	select BR2_PACKAGE_XPROTO_XEXTPROTO
 	select BR2_PACKAGE_XPROTO_XPROTO
 	help
-	  xf86-video-vesa 1.3.0
+	  xf86-video-vesa 2.2.1
 	  Generic VESA video driver
diff --git a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
index 6c67269..212e698 100644
--- a/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
+++ b/package/x11r7/xdriver_xf86-video-vesa/xdriver_xf86-video-vesa.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-XDRIVER_XF86_VIDEO_VESA_VERSION = 2.0.0
+XDRIVER_XF86_VIDEO_VESA_VERSION = 2.2.1
 XDRIVER_XF86_VIDEO_VESA_SOURCE = xf86-video-vesa-$(XDRIVER_XF86_VIDEO_VESA_VERSION).tar.bz2
 XDRIVER_XF86_VIDEO_VESA_SITE = http://xorg.freedesktop.org/releases/individual/driver
-XDRIVER_XF86_VIDEO_VESA_AUTORECONF = NO
+XDRIVER_XF86_VIDEO_VESA_AUTORECONF = YES
 XDRIVER_XF86_VIDEO_VESA_DEPENDENCIES = xserver_xorg-server xproto_fontsproto xproto_randrproto xproto_renderproto xproto_xextproto xproto_xproto
 XDRIVER_XF86_VIDEO_VESA_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 
-- 
1.6.3.3
