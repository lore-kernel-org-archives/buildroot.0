From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 29 Mar 2008 13:36:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/ARM
Message-ID: <20080329203625.26F843C4C0@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-29 13:36:24 -0700 (Sat, 29 Mar 2008)
New Revision: 21563

Log:
Remove duplication of default kernel patch dir setting

Modified:
   trunk/buildroot/target/device/ARM/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/ARM/Makefile.in
===================================================================
--- trunk/buildroot/target/device/ARM/Makefile.in	2008-03-29 17:59:27 UTC (rev 21562)
+++ trunk/buildroot/target/device/ARM/Makefile.in	2008-03-29 20:36:24 UTC (rev 21563)
@@ -29,12 +29,12 @@
 
 LINUX26_COPYTO:=/tftpboot
 
-LINUX26_PATCH_DIR:=target/device/ARM/kernel-patches
+#LINUX26_PATCH_DIR:=$(BOARD_PATH)/kernel-patches
 
 # The board specific Makefile.in can redefine BOARD_NAME's
 LINUX_BOARD_NAME:=$(BOARD_NAME)
 
-BR2_PACKAGE_BUSYBOX_CONFIG:=$(BR2_BOARD_PATH)/busybox.config
+BR2_PACKAGE_BUSYBOX_CONFIG:=$(BOARD_PATH)/busybox.config
 
 
 # Needs to be AFTER board specific Makefiles
