From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 15 Feb 2008 06:06:41 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080215140641.8EE26120110@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-02-15 06:06:39 -0800 (Fri, 15 Feb 2008)
New Revision: 21029

Log:
libusb: install into target with cp instead of install to preserve symlinks


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-02-15 07:19:03 UTC (rev 21028)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-02-15 14:06:39 UTC (rev 21029)
@@ -56,8 +56,7 @@
 	$(MAKE) -C $(LIBUSB_DIR) DESTDIR=$(STAGING_DIR) install
 
 $(TARGET_DIR)/$(LIBUSB_BINARY): $(STAGING_DIR)/lib/libusb.so
-	$(INSTALL) -D $(LIBUSB_DIR)/.libs/libusb*.so* $(STAGING_DIR)/usr/lib/
-	$(INSTALL) -D $(LIBUSB_DIR)/.libs/libusb*.so* $(TARGET_DIR)/usr/lib/
+	cp -dpf $(STAGING_DIR)/usr/lib/libusb*.so* $(TARGET_DIR)/usr/lib/
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libusb*.so*
 
 libusb: uclibc $(TARGET_DIR)/$(LIBUSB_BINARY)
