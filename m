From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Tue, 30 Sep 2008 00:32:52 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/package/x11r7/xserver_xorg-server
Message-ID: <20080930073252.674343C666@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-09-30 00:32:52 -0700 (Tue, 30 Sep 2008)
New Revision: 23562

Log:
xserver_xorg-server: fix missing backslash on end of CONF_OPT

This patch adds a missing backslash on a line in the middle of the list of
XSERVER_XORG_SERVER_CONF_OPT.

Reported-by: Sebastian Matuschka <Sebastian.Matuschka@gcd-solutions.de>



Modified:
   trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk


Changeset:
Modified: trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
===================================================================
--- trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-09-30 07:29:35 UTC (rev 23561)
+++ trunk/buildroot/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk	2008-09-30 07:32:52 UTC (rev 23562)
@@ -48,7 +48,7 @@
 		--enable-freetype $(XSERVER_XORG_ENABLE_MODULAR) \
 		--disable-config-hal $(XSERVER_XORG_MESA_DIR) \
 		--disable-xnest --disable-xephyr --disable-xvfb \
-		$(XSERVER_XORG_NULL_CURSOR)
+		$(XSERVER_XORG_NULL_CURSOR) \
 		CFLAGS="-I$(STAGING_DIR)/usr/include/pixman-1"
 
 XSERVER_XORG_SERVER_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
