From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 23 Mar 2009 21:46:33 +0000 (UTC)
Subject: [Buildroot] svn commit: [25799] trunk/buildroot/package/pkgconfig
Message-ID: <20090323214633.374B676A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-23 21:46:32 +0000 (Mon, 23 Mar 2009)
New Revision: 25799

Log:
pkgconfig: really use make install for BR2_ENABLE_DEBUG

Modified:
   trunk/buildroot/package/pkgconfig/pkgconfig.mk


Changeset:
Modified: trunk/buildroot/package/pkgconfig/pkgconfig.mk
===================================================================
--- trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-23 21:45:52 UTC (rev 25798)
+++ trunk/buildroot/package/pkgconfig/pkgconfig.mk	2009-03-23 21:46:32 UTC (rev 25799)
@@ -8,7 +8,7 @@
 PKG_CONFIG_SITE = http://pkgconfig.freedesktop.org/releases/
 
 ifeq ($(BR2_ENABLE_DEBUG),y) # install-exec doesn't install aclocal stuff
-PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-exec
+PKG_CONFIG_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 endif
 
 PKG_CONFIG_DEPENDENCIES = uclibc libglib2
