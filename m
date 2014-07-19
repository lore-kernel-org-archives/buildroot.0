From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 19 Jul 2014 15:56:27 +0200
Subject: [Buildroot] [PATCH 20/20 v3] package/xserver_xorg-server: needs
	libudev, not a udev daemon
In-Reply-To: <cover.1405777634.git.yann.morin.1998@free.fr>
References: <cover.1405777634.git.yann.morin.1998@free.fr>
Message-ID: <7964be0c75358121baa69301d23eb93d72a64db9.1405777634.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xserver_xorg-server is happy enough with just a libudev, and does
not require a udev daemon.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 779c46d..a83feec 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -123,8 +123,8 @@ XSERVER_XORG_SERVER_DEPENDENCIES += tslib
 XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-XSERVER_XORG_SERVER_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libudev
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
 # udev kms support depends on libdrm
 ifeq ($(BR2_PACKAGE_LIBDRM),y)
-- 
1.9.1
