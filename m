From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 13 Jun 2008 01:45:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080613084536.0BA573C804@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-13 01:45:35 -0700 (Fri, 13 Jun 2008)
New Revision: 22312

Log:
libusb: depend on actual host-libtool binary

We need to depend on the actual host-libtool binary instead of the phony
host-libtool as libusb otherwise will get recompiled every time.


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-06-13 05:53:25 UTC (rev 22311)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-06-13 08:45:35 UTC (rev 22312)
@@ -24,7 +24,7 @@
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
 libusb-unpacked: $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) host-libtool $(DL_DIR)/$(LIBUSB_SOURCE)
+$(LIBUSB_DIR)/.unpacked: $(AUTOCONF) $(AUTOMAKE) $(STAGING_DIR)/$(LIBTOOL_TARGET_BINARY) $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
