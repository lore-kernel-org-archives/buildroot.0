From: ulf at uclibc.org <ulf@uclibc.org>
Date: Fri, 14 Mar 2008 22:07:27 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080315050727.5176E12011B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-14 22:07:26 -0700 (Fri, 14 Mar 2008)
New Revision: 21330

Log:
Use correct Linux version for depmod

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-13 20:12:08 UTC (rev 21329)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-03-15 05:07:26 UTC (rev 21330)
@@ -347,7 +347,7 @@
 		INSTALL_MOD_PATH=$(TARGET_DIR) modules_install
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/build
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION)/source
-	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX_HEADERS_VERSION)
+	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION)	#$(LINUX_HEADERS_VERSION)
 	touch -c $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
