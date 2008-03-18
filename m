From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 04:38:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/jp/q5
Message-ID: <20080318113836.9300412CFB7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 04:38:36 -0700 (Tue, 18 Mar 2008)
New Revision: 21385

Log:
Use BOARD_PATH instead of JP_Q5_PATH

Modified:
   trunk/buildroot/target/device/jp/q5/Makefile.in
   trunk/buildroot/target/device/jp/q5/linux.mk


Changeset:
Modified: trunk/buildroot/target/device/jp/q5/Makefile.in
===================================================================
--- trunk/buildroot/target/device/jp/q5/Makefile.in	2008-03-18 11:34:43 UTC (rev 21384)
+++ trunk/buildroot/target/device/jp/q5/Makefile.in	2008-03-18 11:38:36 UTC (rev 21385)
@@ -1,9 +1,10 @@
-JP_Q5_PATH=target/device/jp/q5
+#JP_Q5_PATH=target/device/jp/q5
+BOARD_PATH=target/device/jp/q5
 
-BR2_PACKAGE_BUSYBOX_CONFIG=$(JP_Q5_PATH)/busybox.config
-UCLIBC_CONFIG_FILE=$(JP_Q5_PATH)/uClibc.config.$(ARCH)
+BR2_PACKAGE_BUSYBOX_CONFIG=$(BOARD_PATH)/busybox.config
+UCLIBC_CONFIG_FILE=$(BOARD_PATH)/uClibc.config.$(ARCH)
 
-TARGET_SKELETON=$(JP_Q5_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(JP_Q5_PATH)/device_table.txt
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
+TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 
 TARGETS+=linux

Modified: trunk/buildroot/target/device/jp/q5/linux.mk
===================================================================
--- trunk/buildroot/target/device/jp/q5/linux.mk	2008-03-18 11:34:43 UTC (rev 21384)
+++ trunk/buildroot/target/device/jp/q5/linux.mk	2008-03-18 11:38:36 UTC (rev 21385)
@@ -32,7 +32,7 @@
 
 
 # Linux kernel configuration file
-LINUX_KCONFIG=$(JP_Q5_PATH)/linux.config
+LINUX_KCONFIG=$(BOARD_PATH)/linux.config
 
 # kernel patches
 LINUX_PATCH_DIR=target/device/jp/q5/kernel-patches-$(DOWNLOAD_LINUX_VERSION)/
