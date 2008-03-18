From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 04:34:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/AMD/DBAu1500
Message-ID: <20080318113445.B81AF12CFAD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 04:34:43 -0700 (Tue, 18 Mar 2008)
New Revision: 21384

Log:
Use BOARD_PATH instead of ALCHEMY_DBAU1500_PATH

Modified:
   trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
   trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk


Changeset:
Modified: trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2008-03-18 09:36:16 UTC (rev 21383)
+++ trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2008-03-18 11:34:43 UTC (rev 21384)
@@ -1,10 +1,10 @@
-ALCHEMY_DBAU1500_PATH=target/device/AMD/DBAu1500
-
-BR2_PACKAGE_BUSYBOX_CONFIG=$(ALCHEMY_DBAU1500_PATH)/busybox.config
+# ALCHEMY_DBAU1500_PATH=target/device/AMD/DBAu1500
+BOARD_PATH:=target/device/AMD/DBAu1500
+BR2_PACKAGE_BUSYBOX_CONFIG=$(BOARD_PATH)/busybox.config
 UCLIBC_CONFIG_FILE=$(TOOL_BUILD_DIR)/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(ALCHEMY_DBAU1500_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(ALCHEMY_DBAU1500_PATH)/device_table.txt
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
+TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 
 TARGETS+=linux
 

Modified: trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-18 09:36:16 UTC (rev 21383)
+++ trunk/buildroot/target/device/AMD/DBAu1500/linux26.mk	2008-03-18 11:34:43 UTC (rev 21384)
@@ -20,7 +20,8 @@
 LINUX26_BINLOC=$(LINUX26_FORMAT)
 
 # Linux kernel configuration file
-LINUX26_KCONFIG=$(ALCHEMY_DBAU1500_PATH)/linux26.config
+#LINUX26_KCONFIG=$(ALCHEMY_DBAU1500_PATH)/linux26.config
+LINUX26_KCONFIG=$(BOARD_PATH)/linux26.config
 
 # File name for the Linux kernel binary
 LINUX26_KERNEL=linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH).srec
