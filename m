From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri,  4 Jul 2008 21:30:07 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/tslib
Message-ID: <20080705043007.EB0CE3C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-04 21:30:05 -0700 (Fri, 04 Jul 2008)
New Revision: 22641

Log:
Ensure tslib uses config.* from buildroot

Modified:
   trunk/buildroot/package/tslib/tslib.mk


Changeset:
Modified: trunk/buildroot/package/tslib/tslib.mk
===================================================================
--- trunk/buildroot/package/tslib/tslib.mk	2008-07-04 22:29:50 UTC (rev 22640)
+++ trunk/buildroot/package/tslib/tslib.mk	2008-07-05 04:30:05 UTC (rev 22641)
@@ -20,8 +20,9 @@
 	touch $(TSLIB_DIR)/.patched
 
 $(TSLIB_DIR)/.configured: $(TSLIB_DIR)/.patched
-	(cd $(TSLIB_DIR); rm -rf config.cache; \
-	./autogen.sh; \
+	(cd $(TSLIB_DIR); rm -rf config.cache; ./autogen.sh)
+	$(CONFIG_UPDATE) $(TSLIB_DIR)
+	(cd $(TSLIB_DIR) && \
 	$(TARGET_CONFIGURE_OPTS) \
 	CFLAGS="$(TARGET_CFLAGS) " \
 	./configure \
