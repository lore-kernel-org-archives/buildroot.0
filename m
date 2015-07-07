From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue,  7 Jul 2015 23:00:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/mplayer: Add additional X11
	dependencies
Message-ID: <1436302819-31625-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Proposed fix for https://bugs.busybox.net/show_bug.cgi?id=8206

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mplayer/mplayer.mk |    3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
index 3a61b8f..5a46aa3 100644
--- a/package/mplayer/mplayer.mk
+++ b/package/mplayer/mplayer.mk
@@ -220,7 +220,10 @@ MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBTHEORA),libtheora)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBPNG),libpng)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_JPEG),jpeg)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBX11),xlib_libX11)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXEXT),xlib_libXext)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXINERAMA),xlib_libXinerama)
 MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXV),xlib_libXv)
+MPLAYER_DEPENDENCIES += $(if $(BR2_PACKAGE_XLIB_LIBXXF86VM),xlib_libXxf86vm)
 
 # ARM optimizations
 ifeq ($(BR2_ARM_CPU_ARMV5),y)
-- 
1.7.10.4
