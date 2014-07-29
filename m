From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Jul 2014 23:34:15 +0200
Subject: [Buildroot] [PATCH 1/2] xserver_xorg-server: Add support for DRI3
In-Reply-To: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406669656-15300-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406669656-15300-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 9188411..22f56a4 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -170,8 +170,12 @@ ifeq ($(BR2_PACKAGE_XPROTO_DRI2PROTO),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += xproto_dri2proto
 XSERVER_XORG_SERVER_CONF_OPT += --enable-dri2
 endif
+ifeq ($(BR2_PACKAGE_XPROTO_DRI3PROTO),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += xlib_libxshmfence xproto_dri3proto
+XSERVER_XORG_SERVER_CONF_OPT += --enable-dri3
+endif
 else
-XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2
+XSERVER_XORG_SERVER_CONF_OPT += --disable-dri2 --disable-dri3
 endif
 
 ifeq ($(BR2_PACKAGE_XLIB_LIBXSCRNSAVER),y)
-- 
1.7.10.4
