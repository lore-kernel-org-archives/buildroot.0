From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 18 Mar 2008 04:43:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Sharp/LNode80
Message-ID: <20080318114301.0051212CFBD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-18 04:43:00 -0700 (Tue, 18 Mar 2008)
New Revision: 21387

Log:
Use BOARD_PATH instead of SHARP_LNODE80_PATH

Modified:
   trunk/buildroot/target/device/Sharp/LNode80/Makefile.in
   trunk/buildroot/target/device/Sharp/LNode80/linux.mk


Changeset:
Modified: trunk/buildroot/target/device/Sharp/LNode80/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/Makefile.in	2008-03-18 11:41:03 UTC (rev 21386)
+++ trunk/buildroot/target/device/Sharp/LNode80/Makefile.in	2008-03-18 11:43:00 UTC (rev 21387)
@@ -1,6 +1,7 @@
-SHARP_LNODE80_PATH=target/device/Sharp/LNode80
+# SHARP_LNODE80_PATH=target/device/Sharp/LNode80
+BOARD_PATH=target/device/Sharp/LNode80
 
-TARGET_SKELETON=$(SHARP_LNODE80_PATH)/target_skeleton
-TARGET_DEVICE_TABLE=$(SHARP_LNODE80_PATH)/device_table.txt
+TARGET_SKELETON=$(BOARD_PATH)/target_skeleton
+TARGET_DEVICE_TABLE=$(BOARD_PATH)/device_table.txt
 
 TARGETS+=linux

Modified: trunk/buildroot/target/device/Sharp/LNode80/linux.mk
===================================================================
--- trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2008-03-18 11:41:03 UTC (rev 21386)
+++ trunk/buildroot/target/device/Sharp/LNode80/linux.mk	2008-03-18 11:43:00 UTC (rev 21387)
@@ -32,7 +32,7 @@
 
 
 # Linux kernel configuration file
-LINUX_KCONFIG=$(SHARP_LNODE80_PATH)/linux.config
+LINUX_KCONFIG=$(BOARD_PATH)/linux.config
 
 # kernel patches
 LINUX_PATCH_DIR=target/device/Sharp/LNode80/kernel-patches/
