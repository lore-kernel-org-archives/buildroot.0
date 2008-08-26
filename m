From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 12:22:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/pixman
Message-ID: <20080826192247.46A093C84E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 12:22:46 -0700 (Tue, 26 Aug 2008)
New Revision: 23211

Log:
pixman: cleanup staging + target install

- install-data installs a subset of install / install-strip, so just drop it
- use install-strip for target

Modified:
   trunk/buildroot/package/pixman/pixman.mk


Changeset:
Modified: trunk/buildroot/package/pixman/pixman.mk
===================================================================
--- trunk/buildroot/package/pixman/pixman.mk	2008-08-26 16:27:25 UTC (rev 23210)
+++ trunk/buildroot/package/pixman/pixman.mk	2008-08-26 19:22:46 UTC (rev 23211)
@@ -8,7 +8,7 @@
 PIXMAN_SITE = http://cairographics.org/releases/
 PIXMAN_AUTORECONF = NO
 PIXMAN_INSTALL_STAGING = YES
-PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install install-data
-PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install install-data
+PIXMAN_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install
+PIXMAN_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install-strip
 
 $(eval $(call AUTOTARGETS,package,pixman))
