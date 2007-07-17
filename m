From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Mon, 16 Jul 2007 17:22:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbmount
Message-ID: <20070717002217.3C4783007E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-07-16 17:22:16 -0700 (Mon, 16 Jul 2007)
New Revision: 19118

Log:
Do not use wildcard for patches.


Modified:
   trunk/buildroot/package/usbmount/usbmount.mk


Changeset:
Modified: trunk/buildroot/package/usbmount/usbmount.mk
===================================================================
--- trunk/buildroot/package/usbmount/usbmount.mk	2007-07-17 00:21:16 UTC (rev 19117)
+++ trunk/buildroot/package/usbmount/usbmount.mk	2007-07-17 00:22:16 UTC (rev 19118)
@@ -18,7 +18,7 @@
 
 $(USBMOUNT_DIR)/.unpacked: $(DL_DIR)/$(USBMOUNT_SOURCE)
 	$(USBMOUNT_CAT) $(DL_DIR)/$(USBMOUNT_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(USBMOUNT_DIR) package/usbmount usbmount-$(USBMOUNT_VERSION).patch
 	touch $@
 
 $(TARGET_DIR)/$(USBMOUNT_TARGET_BINARY): $(USBMOUNT_DIR)/.unpacked
