From: aldot at uclibc.org <aldot@uclibc.org>
Date: Thu, 24 Aug 2006 12:48:31 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20060824194831.5666E48A56@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-24 12:48:31 -0700 (Thu, 24 Aug 2006)
New Revision: 15983

Log:
- make sure that the prerequisites of 'make busybox-menuconfig' are met


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-08-24 19:47:34 UTC (rev 15982)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-08-24 19:48:31 UTC (rev 15983)
@@ -25,7 +25,7 @@
 
 busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
 
-$(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
+$(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUILD_DIR) host-sed
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 	# if we have external syslogd, force busybox to use it
