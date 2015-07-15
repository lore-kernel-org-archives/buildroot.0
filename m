From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 15 Jul 2015 20:11:53 +0200
Subject: [Buildroot] [PATCH 14/15] package/x11r7/xdriver_xf86-video-ati:
	Depends on xlib_libXcomposite
In-Reply-To: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
References: <1436983914-7858-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1436983914-7858-14-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When xserver_xorg-server is built without composite support building this
package will fail:

radeon_dri2.c: In function 'radeon_dri2_copy_region2':
radeon_dri2.c:438:28: error: 'struct _Pixmap' has no member named 'screen_x'
  off_x = drawable->x - pPix->screen_x;
                            ^
radeon_dri2.c:439:28: error: 'struct _Pixmap' has no member named 'screen_y'
  off_y = drawable->y - pPix->screen_y;

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/Config.in                 |    1 +
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk |    1 +
 2 files changed, 2 insertions(+)

diff --git a/package/x11r7/xdriver_xf86-video-ati/Config.in b/package/x11r7/xdriver_xf86-video-ati/Config.in
index a555fa3..191c20f 100644
--- a/package/x11r7/xdriver_xf86-video-ati/Config.in
+++ b/package/x11r7/xdriver_xf86-video-ati/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XDRIVER_XF86_VIDEO_ATI
 	depends on BR2_PACKAGE_MESA3D
 	select BR2_PACKAGE_LIBDRM        if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	select BR2_PACKAGE_LIBDRM_RADEON if BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
+	select BR2_PACKAGE_XLIB_LIBXCOMPOSITE
 	select BR2_PACKAGE_XPROTO_FONTSPROTO
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index ce47e49..15807c2 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -11,6 +11,7 @@ XDRIVER_XF86_VIDEO_ATI_LICENSE = MIT
 XDRIVER_XF86_VIDEO_ATI_LICENSE_FILES = COPYING
 XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	libdrm \
+	xlib_libXcomposite \
 	xproto_fontsproto \
 	xproto_glproto \
 	xproto_randrproto \
-- 
1.7.10.4
