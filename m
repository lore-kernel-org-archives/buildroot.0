From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 14:53:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/directfb
Message-ID: <20070811215318.C66EBA6132@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 14:53:18 -0700 (Sat, 11 Aug 2007)
New Revision: 19440

Log:
Use /usr/lib instead of /lib for directfb

Modified:
   trunk/buildroot/package/directfb/directfb.mk


Changeset:
Modified: trunk/buildroot/package/directfb/directfb.mk
===================================================================
--- trunk/buildroot/package/directfb/directfb.mk	2007-08-11 21:47:51 UTC (rev 19439)
+++ trunk/buildroot/package/directfb/directfb.mk	2007-08-11 21:53:18 UTC (rev 19440)
@@ -60,8 +60,8 @@
 	touch $(DIRECTFB_DIR)/.compiled
 
 $(STAGING_DIR)/usr/lib/libdirectfb.so: $(DIRECTFB_DIR)/.compiled
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(DIRECTFB_DIR) install
-	touch -c $(STAGING_DIR)/lib/libdirectfb.so
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(DIRECTFB_DIR) install
+	touch -c $@
 
 $(TARGET_DIR)/usr/lib/libdirectfb.so: $(STAGING_DIR)/usr/lib/libdirectfb.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libdirect* $(STAGING_DIR)/usr/lib/libfusion* $(TARGET_DIR)/usr/lib/
