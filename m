From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 03:59:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/x86/i386
Message-ID: <20061213115953.5DDE448583@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 03:59:53 -0800 (Wed, 13 Dec 2006)
New Revision: 16888

Log:
use the correct depmod for linux26


Modified:
   trunk/buildroot/target/device/x86/i386/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/x86/i386/linux26.mk
===================================================================
--- trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-13 11:57:14 UTC (rev 16887)
+++ trunk/buildroot/target/device/x86/i386/linux26.mk	2006-12-13 11:59:53 UTC (rev 16888)
@@ -94,7 +94,7 @@
 	rm -rf $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)
 	rm -f $(TARGET_DIR)/sbin/cardmgr
 	$(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) \
-		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod \
+		DEPMOD=$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 \
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
 	touch -c $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/modules.dep
