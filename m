From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 11 Jan 2009 20:12:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libraw1394
Message-ID: <20090111201211.C48F376736@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-11 20:12:11 +0000 (Sun, 11 Jan 2009)
New Revision: 24755

Log:
Use correct goal for libraw1394.so

Modified:
   trunk/buildroot/package/libraw1394/libraw1394.mk


Changeset:
Modified: trunk/buildroot/package/libraw1394/libraw1394.mk
===================================================================
--- trunk/buildroot/package/libraw1394/libraw1394.mk	2009-01-11 20:10:57 UTC (rev 24754)
+++ trunk/buildroot/package/libraw1394/libraw1394.mk	2009-01-11 20:12:11 UTC (rev 24755)
@@ -46,7 +46,7 @@
 $(STAGING_DIR)/usr/lib/libraw1394.so: $(LIBRAW1394_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBRAW1394_DIR)/src install
 
-$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/lib/libraw1394.so
+$(TARGET_DIR)/usr/lib/libraw1394.so: $(STAGING_DIR)/usr/lib/libraw1394.so
 	cp -dpf $(STAGING_DIR)/usr/lib/libraw1394.so* $(TARGET_DIR)/usr/lib/
 
 libraw1394: uclibc $(TARGET_DIR)/usr/lib/libraw1394.so
