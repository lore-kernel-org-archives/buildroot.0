From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 15 Apr 2021 08:52:45 +0200
Subject: [Buildroot] [PATCH 4/5] package/x11r7/xserver_xorg-server: remove
 optional support for tslib
In-Reply-To: <20210415065246.276882-1-bernd.kuhls@t-online.de>
References: <20210415065246.276882-1-bernd.kuhls@t-online.de>
Message-ID: <20210415065246.276882-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream removed support for tslib:
https://cgit.freedesktop.org/xorg/xserver/commit/configure.ac?h=server-1.20-branch&id=5c7ed785e3bdb9f0fbf8fbfdc93b5fdd2b2c7dbf

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 8bd92b7ab6..0ac34a63b5 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -106,11 +106,6 @@ XSERVER_XORG_SERVER_CONF_OPTS += --disable-dri --disable-glx
 endif
 
 # Optional packages
-ifeq ($(BR2_PACKAGE_TSLIB),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += tslib
-XSERVER_XORG_SERVER_CONF_OPTS += --enable-tslib LDFLAGS="-lts"
-endif
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPTS += --enable-config-udev
-- 
2.29.2
