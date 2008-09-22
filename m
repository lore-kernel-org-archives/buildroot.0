From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 22 Sep 2008 05:04:05 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080922120405.BE2FE3C64D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-22 05:04:05 -0700 (Mon, 22 Sep 2008)
New Revision: 23454

Log:
target/linux/advanced: don't hardcode date suffix

Use ROOTFS_SUFFIX instead of hardcoding -$(DATE).

Reported by Lars Lockenvitz.

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-09-22 11:54:17 UTC (rev 23453)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-09-22 12:04:05 UTC (rev 23454)
@@ -162,7 +162,7 @@
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
-LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)-$(DATE)$(KERNEL_EXT)
+LINUX26_KERNEL_NAME:=$(BOARD_NAME)-linux-$(LINUX26_VERSION)$(ROOTFS_SUFFIX)$(KERNEL_EXT)
 
 
 ifeq ($(BOARD_NAME),)
