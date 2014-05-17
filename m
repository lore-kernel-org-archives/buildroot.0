From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 17 May 2014 13:28:38 +0200
Subject: [Buildroot] [PATCH 1/1] package/x11r7/xserver_xorg-server: Udev kms
	support depends on libdrm
Message-ID: <1400326118-14543-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/18c/18c554d148fc00f85690c1638976dd6d0d7ff219/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 284d602..cae3ba0 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -127,6 +127,13 @@ endif
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += udev
 XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev
+# udev kms support depends on libdrm
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += libdrm
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-udev-kms
+else
+XSERVER_XORG_SERVER_CONF_OPT += --disable-config-udev-kms
+endif
 else
 ifeq ($(BR2_PACKAGE_DBUS),y)
 XSERVER_XORG_SERVER_DEPENDENCIES += dbus
-- 
1.7.10.4
