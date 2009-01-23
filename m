From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 23 Jan 2009 17:50:35 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/sawman
Message-ID: <20090123175035.9F473769CC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-23 17:50:34 +0000 (Fri, 23 Jan 2009)
New Revision: 24984

Log:
Use default configure options to allow sawman build to complete with ccache

Modified:
   trunk/buildroot/package/sawman/sawman.mk


Changeset:
Modified: trunk/buildroot/package/sawman/sawman.mk
===================================================================
--- trunk/buildroot/package/sawman/sawman.mk	2009-01-23 17:49:07 UTC (rev 24983)
+++ trunk/buildroot/package/sawman/sawman.mk	2009-01-23 17:50:34 UTC (rev 24984)
@@ -8,11 +8,11 @@
 SAWMAN_SITE:=http://www.directfb.org/downloads/Extras
 SAWMAN_INSTALL_STAGING = YES
 SAWMAN_INSTALL_TARGET = YES
-SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
+# SAWMAN_CONF_ENV = LDFLAGS="-L$(STAGING_DIR)/usr/lib -Wl,--rpath-link -Wl,$(STAGING_DIR)/usr/lib"
 ifeq ($(BR2_ENABLE_DEBUG),y)
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
 else
-SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install-strip
+SAWMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 endif
 SAWMAN_DEPENDENCIES = directfb
 
