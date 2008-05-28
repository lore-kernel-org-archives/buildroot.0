From: hamish at uclibc.org <hamish@uclibc.org>
Date: Tue, 27 May 2008 19:12:56 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libusb
Message-ID: <20080528021256.DF89E3C5EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-05-27 19:12:52 -0700 (Tue, 27 May 2008)
New Revision: 22097

Log:
Fix dependency on host-autoconf


Modified:
   trunk/buildroot/package/libusb/libusb.mk


Changeset:
Modified: trunk/buildroot/package/libusb/libusb.mk
===================================================================
--- trunk/buildroot/package/libusb/libusb.mk	2008-05-28 01:21:45 UTC (rev 22096)
+++ trunk/buildroot/package/libusb/libusb.mk	2008-05-28 02:12:52 UTC (rev 22097)
@@ -23,8 +23,8 @@
 
 libusb-source: $(DL_DIR)/$(LIBUSB_SOURCE) $(LIBUSB_PATCH)
 
-libusb-unpacked: host-automake host-autoconf $(LIBUSB_DIR)/.unpacked
-$(LIBUSB_DIR)/.unpacked: $(DL_DIR)/$(LIBUSB_SOURCE)
+libusb-unpacked: $(LIBUSB_DIR)/.unpacked
+$(LIBUSB_DIR)/.unpacked: host-autoconf $(DL_DIR)/$(LIBUSB_SOURCE)
 	$(LIBUSB_CAT) $(DL_DIR)/$(LIBUSB_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(LIBUSB_PATCH_FILE),)
 	(cd $(LIBUSB_DIR) && $(LIBUSB_CAT) $(LIBUSB_PATCH) | patch -p1)
