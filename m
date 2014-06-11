From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 12 Jun 2014 00:16:27 +0200
Subject: [Buildroot] [PATCH v2 1/1] xserver_xorg-server: Depends on
	host-xfont_font-util
Message-ID: <1402524987-24727-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes build error:
>>> xserver_xorg-server 1.15.1 Autoreconfiguring
configure.ac:51: error: must install font-util 1.1 or later before running autoconf/autogen

Tested with minimal defconfig

BR2_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_XORG7=y
BR2_PACKAGE_XSERVER_XORG_SERVER=y
BR2_PACKAGE_XSERVER_XORG_SERVER_MODULAR=y

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: - depend on host-xfont_font-util instead of xfont_font-util (Thomas)
    - provide reduced defconfig for testing

 package/x11r7/xserver_xorg-server/xserver_xorg-server.mk |    1 +
 1 file changed, 1 insertion(+)

diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 9a998a2..050dee6 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -54,6 +54,7 @@ XSERVER_XORG_SERVER_DEPENDENCIES = 	\
 	xkeyboard-config		\
 	pixman 				\
 	mcookie 			\
+	host-xfont_font-util		\
 	host-pkgconf
 
 XSERVER_XORG_SERVER_CONF_OPT = --disable-config-hal \
-- 
1.7.10.4
