From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  1 Aug 2015 18:07:15 +0200
Subject: [Buildroot] [PATCH v2 2/2] package/x11r7/xserver_xorg-server: Fix
	glamor dependency
In-Reply-To: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
References: <1438445235-4662-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1438445235-4662-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

X.org xserver depends on libepoxy for glamor support, which depends on
EGL support. Mesa3d is not the only possible EGL provider therefore
change the dependency check.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: rebased

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 79d663c..8f4b3f8 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -195,7 +195,7 @@ endif
 ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-dri3
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
+ifeq ($(BR2_PACKAGE_LIBEPOXY),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += libepoxy
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-glamor
 endif
-- 
2.1.4
