From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 01:51:26 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080701085126.29950F8007@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 01:51:25 -0700 (Tue, 01 Jul 2008)
New Revision: 22579

Log:
xserver: disable xephyr/xnest/xvfb servers

Disable development xephyr/xnest/xvfb servers (saves ~3MB).


Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-07-01 01:57:36 UTC (rev 22578)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-07-01 08:51:25 UTC (rev 22579)
@@ -36,10 +36,13 @@
 									xproto_resourceproto xproto_trapproto xproto_videoproto xproto_xcmiscproto \
 									xproto_xextproto xproto_xf86bigfontproto xproto_xf86dgaproto xproto_xf86driproto \
 									xproto_xf86miscproto xproto_xf86rushproto xproto_xf86vidmodeproto xproto_xproto \
-									pixman dbus $(XSERVER_XORG_MESA_DEPS) mcookie 
+									pixman dbus $(XSERVER_XORG_MESA_DEPS) mcookie
 
-XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE) --enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
-								--disable-config-hal $(XSERVER_XORG_MESA_DIR) CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1" 
+XSERVER_XORG_SERVER_CONF_OPT = $(XSERVER_XORG_ENABLE_KDRIVE)
+		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
+		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
+		--disable-xnest --disable-xephyr --disable-xvfb \
+		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
 XSERVER_XORG_SERVER_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
