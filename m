From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 18 Aug 2018 11:09:50 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xdriver_xf86-video-ati: fix
 glamor dependency
Message-ID: <20180818090950.17428-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Glamor support needs egl, fix dependency after
https://git.buildroot.net/buildroot/commit/?id=5b4bcbdafbe8e7b42d4e085a0524d70665cdbaf5

Fixes
http://autobuild.buildroot.net/results/6ac/6acd5ad820a47fc3442d3e3a5d8d72b396fb6e41/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
index d283f789f8..4f1b4da8bd 100644
--- a/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
+++ b/package/x11r7/xdriver_xf86-video-ati/xdriver_xf86-video-ati.mk
@@ -15,7 +15,7 @@ XDRIVER_XF86_VIDEO_ATI_DEPENDENCIES = \
 	xorgproto \
 	xserver_xorg-server
 
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBEGL)$(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yyy)
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --enable-glamor
 else
 XDRIVER_XF86_VIDEO_ATI_CONF_OPTS = --disable-glamor
-- 
2.18.0
