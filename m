From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 16:30:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070812233006.4837AA683B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 16:30:06 -0700 (Sun, 12 Aug 2007)
New Revision: 19474

Log:
fix DirectFB *.la path's

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-08-12 23:28:48 UTC (rev 19473)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-08-12 23:30:06 UTC (rev 19474)
@@ -73,6 +73,18 @@
 
 $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libdirectfb.la
+	$(SED) "s,/lib/libfusion.la,$(STAGING_DIR)/usr/lib/libfusion.la,g" \
+		$(STAGING_DIR)/usr/lib/libdirectfb.la
+	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
+		$(STAGING_DIR)/usr/lib/libdirectfb.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libdirect.la
+	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
+		$(STAGING_DIR)/usr/lib/libfusion.la
+	$(SED) "s,/lib/libdirect.la,$(STAGING_DIR)/usr/lib/libdirect.la,g" \
+		$(STAGING_DIR)/usr/lib/libfusion.la
 	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
