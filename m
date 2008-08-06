From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  6 Aug 2008 05:56:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20080806125632.6AA693C6B6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-06 05:56:31 -0700 (Wed, 06 Aug 2008)
New Revision: 23065

Log:
busybox: fix missing dependencies in unpacked and config rules

Aadds dependency to host-sed and $(PROJECT_BUILD_DIR) when running
make busybox-config and busybox-unpacked.

Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>

Modified:
   trunk/buildroot/package/busybox/busybox.mk


Changeset:
Modified: trunk/buildroot/package/busybox/busybox.mk
===================================================================
--- trunk/buildroot/package/busybox/busybox.mk	2008-08-06 10:04:22 UTC (rev 23064)
+++ trunk/buildroot/package/busybox/busybox.mk	2008-08-06 12:56:31 UTC (rev 23065)
@@ -127,9 +127,9 @@
 
 busybox-source: $(DL_DIR)/$(BUSYBOX_SOURCE)
 
-busybox-unpacked: $(BUSYBOX_DIR)/.unpacked
+busybox-unpacked: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.unpacked
 
-busybox-config: $(BUSYBOX_DIR)/.configured
+busybox-config: host-sed $(PROJECT_BUILD_DIR) $(BUSYBOX_DIR)/.configured
 
 busybox-menuconfig: host-sed $(PROJECT_BUILD_DIR) busybox-source $(BUSYBOX_DIR)/.configured
 	$(MAKE) __TARGET_ARCH=$(ARCH) -C $(BUSYBOX_DIR) menuconfig
