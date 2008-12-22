From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Dec 2008 22:10:30 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20081222221030.DF4EA7688F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-22 22:10:30 +0000 (Mon, 22 Dec 2008)
New Revision: 24511

Log:
x11r7/xserver_xorg: breaks with shared cache

The package overrides CFLAGS, so disable shared cache.

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-12-22 22:10:25 UTC (rev 24510)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-12-22 22:10:30 UTC (rev 24511)
@@ -9,6 +9,7 @@
 XSERVER_XORG_SERVER_SITE = http://xorg.freedesktop.org/releases/individual/xserver
 XSERVER_XORG_SERVER_AUTORECONF = NO
 XSERVER_XORG_SERVER_INSTALL_STAGING = YES
+XSERVER_XORG_SERVER_USE_CONFIG_CACHE = NO # overrides CFLAGS
 
 ifeq ($(BR2_PACKAGE_XSERVER_xorg),y)
 XSERVER_XORG_MESA_DEPS:=mesa3d
