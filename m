From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 20 Sep 2007 02:35:33 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20070920093533.7DBDA3005A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-20 02:35:33 -0700 (Thu, 20 Sep 2007)
New Revision: 19905

Log:
- fix source location of libusb libs


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2007-09-20 09:25:57 UTC (rev 19904)
+++ trunk/buildroot/package/libusb/libusb.mk	2007-09-20 09:35:33 UTC (rev 19905)
@@ -51,9 +51,9 @@
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
-	mkdir -p $(TARGET_DIR)/usr/lib
-	cp -dpf $(STAGING_DIR)/lib/libusb* $(TARGET_DIR)/usr/lib
-	rm -f $(TARGET_DIR)/usr/lib/*.a $(TARGET_DIR)/usr/lib/*.la
+	$(INSTALL) -D $(LIBUSB_DIR)/.libs/libusb*.so* $(STAGING_DIR)/usr/lib/
+	$(INSTALL) -D $(LIBUSB_DIR)/.libs/libusb*.so* $(TARGET_DIR)/usr/lib/
+	$(STRIP) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
 libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
 
