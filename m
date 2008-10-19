From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 19 Oct 2008 14:49:02 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20081019214902.BCED53C888@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-10-19 14:49:02 -0700 (Sun, 19 Oct 2008)
New Revision: 23729

Log:
x11r7/xserver: use install-strip for target install

Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-10-19 21:48:58 UTC (rev 23728)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-10-19 21:49:02 UTC (rev 23729)
@@ -52,7 +52,7 @@
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-XSERVER_XORG_SERVER_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+XSERVER_XORG_SERVER_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 # Optional packages
 ifeq ($(strip $(BR2_PACKAGE_TSLIB)),y)
