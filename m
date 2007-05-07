From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Sun,  6 May 2007 20:59:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbutils
Message-ID: <20070507035935.6899C480A3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-05-06 20:59:35 -0700 (Sun, 06 May 2007)
New Revision: 18573

Log:
Target binary was incorrect and do a better job of cleaning up.


Modified:
   trunk/buildroot/package/usbutils/usbutils.mk


Changeset:
Modified: trunk/buildroot/package/usbutils/usbutils.mk
===================================================================
--- trunk/buildroot/package/usbutils/usbutils.mk	2007-05-07 03:59:04 UTC (rev 18572)
+++ trunk/buildroot/package/usbutils/usbutils.mk	2007-05-07 03:59:35 UTC (rev 18573)
@@ -9,7 +9,7 @@
 USBUTILS_DIR:=$(BUILD_DIR)/usbutils-$(USBUTILS_VER)
 USBUTILS_CAT:=$(ZCAT)
 USBUTILS_BINARY:=lsusb
-USBUTILS_TARGET_BINARY:=usr/bin/lsusb
+USBUTILS_TARGET_BINARY:=usr/sbin/lsusb
 
 $(DL_DIR)/$(USBUTILS_SOURCE):
 	$(WGET) -P $(DL_DIR) $(USBUTILS_SITE)/$(USBUTILS_SOURCE)
@@ -46,6 +46,8 @@
 
 usbutils-clean:
 	rm -f $(TARGET_DIR)/$(USBUTILS_TARGET_BINARY)
+	rm -f $(TARGET_DIR)/usr/share/usb.ids
+	rmdir --ignore-fail-on-non-empty $(TARGET_DIR)/usr/share
 	-$(MAKE) -C $(USBUTILS_DIR) clean
 
 usbutils-dirclean:
