From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 29 Aug 2006 09:45:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20060829164547.770054863C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-08-29 09:45:47 -0700 (Tue, 29 Aug 2006)
New Revision: 16014

Log:
- repair deps.


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-08-29 16:41:55 UTC (rev 16013)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-08-29 16:45:47 UTC (rev 16014)
@@ -23,9 +23,9 @@
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE)
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) $(BUILD_DIR) host-sed
 
-$(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUILD_DIR) host-sed
+$(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifeq ($(BR2_PACKAGE_SYSKLOGD),y)
 	# if we have external syslogd, force busybox to use it
