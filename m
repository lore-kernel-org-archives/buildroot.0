From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 10:36:05 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061202183605.98ECB485FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 10:36:04 -0800 (Sat, 02 Dec 2006)
New Revision: 16761

Log:
- adjust busybox-source dependencies


Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2006-12-02 18:34:32 UTC (rev 16760)
+++ trunk/buildroot/package/busybox/busybox.mk	2006-12-02 18:36:04 UTC (rev 16761)
@@ -23,7 +23,7 @@
 $(DL_DIR)/$(BUSYBOX_SOURCE):
 	 $(WGET) -P $(DL_DIR) $(BUSYBOX_SITE)/$(BUSYBOX_SOURCE)
 
-busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) dirs host-sed
+busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE) $(BUSYBOX_CONFIG_FILE) dependencies
 
 $(BUSYBOX_DIR)/.unpacked: $(DL_DIR)/$(BUSYBOX_SOURCE)
 	$(BUSYBOX_UNZIP) $(DL_DIR)/$(BUSYBOX_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
