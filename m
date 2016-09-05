From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 14:18:31 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: glamor
	depends on libgl
Message-ID: <20160905121831.12790-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/1f6/1f6131c25738577afd8e097d126e8166cbcfcdd8/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 85d7e98..51c3efc 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -214,7 +214,7 @@ endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
-ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
+ifeq ($(BR2_PACKAGE_HAS_LIBGL)$(BR2_PACKAGE_LIBEPOXY),yy)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
 endif
-- 
2.9.3
