From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Mar 2009 15:48:08 +0000 (UTC)
Subject: [Buildroot] svn commit: [25678]
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20090316154808.4CE5D7643C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-16 15:48:07 +0000 (Mon, 16 Mar 2009)
New Revision: 25678

Log:
xserver-xorg: dbus is optional

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:47:58 UTC (rev 25677)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/Config.in	2009-03-16 15:48:07 UTC (rev 25678)
@@ -10,7 +10,6 @@
 	select BR2_PACKAGE_XPROTO_GLPROTO
 	select BR2_PACKAGE_XPROTO_KBPROTO
 	select BR2_PACKAGE_XPROTO_RANDRPROTO
-	select BR2_PACKAGE_DBUS
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_XFONT_FONT_ALIAS if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS
 	select BR2_PACKAGE_XFONT_FONT_MISC_MISC if !BR2_PACKAGE_XSERVER_XORG_SERVER_BUILTIN_FONTS

Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:47:58 UTC (rev 25677)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2009-03-16 15:48:07 UTC (rev 25678)
@@ -24,7 +24,7 @@
 									xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto \
 									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
 									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
-									pixman dbus mcookie
+									pixman mcookie
 
 XSERVER_XORG_SERVER_CONF_OPT = --enable-freetype --disable-config-hal \
 		--disable-xnest --disable-xephyr --disable-xvfb \
@@ -67,4 +67,9 @@
 XSERVER_XORG_SERVER_CONF_OPT += --enable-tslib LDFLAGS="-lts"
 endif
 
+ifeq ($(BR2_PACKAGE_DBUS),y)
+XSERVER_XORG_SERVER_DEPENDENCIES += dbus
+XSERVER_XORG_SERVER_CONF_OPT += --enable-config-dbus
+endif
+
 $(eval $(call AUTOTARGETS,package/x11r7,xserver_xorg-server))
