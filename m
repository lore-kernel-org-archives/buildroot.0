From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Thu, 30 Oct 2008 07:22:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081030142212.138543C72F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-10-30 07:22:11 -0700 (Thu, 30 Oct 2008)
New Revision: 23860

Log:
linux: make touch also create the dependency file when installing modules

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:02:47 UTC (rev 23859)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-10-30 14:22:11 UTC (rev 23860)
@@ -401,7 +401,7 @@
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/build
 	rm -f $(TARGET_DIR)/lib/modules/$(LINUX26_VERSION_PROBED)/source
 	$(STAGING_DIR)/bin/$(GNU_TARGET_NAME)-depmod26 -b $(TARGET_DIR) $(LINUX26_VERSION_PROBED)
-	touch -c $@
+	touch $@
 
 linux26-menuconfig: $(LINUX26_DIR)/.patched host-sed
 	[ -f $(LINUX26_DIR)/.config ] || cp $(LINUX26_KCONFIG) $(LINUX26_DIR)/.config
