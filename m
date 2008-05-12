From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 12 May 2008 14:15:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080512211532.C5E663C5E4@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-05-12 14:15:32 -0700 (Mon, 12 May 2008)
New Revision: 21975

Log:
Make linux kernel extension visible also when defined in board directory

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-05-12 18:56:11 UTC (rev 21974)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-05-12 21:15:32 UTC (rev 21975)
@@ -122,37 +122,43 @@
 
 # -----------------------------------------------------------------------------
 # Has to be set by the target/device
-ifeq ($(LINUX26_BINLOC),)
 
 # --------------
 # VMLINUX
 ifeq ($(LINUX26_FORMAT),vmlinux)
+ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=$(LINUX26_FORMAT)
+endif
 KERNEL_EXT:=
 endif
 
 # --------------
 # UIMAGE
 ifeq ($(LINUX26_FORMAT),uImage)
+ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
+endif
 KERNEL_EXT:=.gz
 endif
 
 # --------------
 # ZIMAGE
 ifeq ($(LINUX26_FORMAT),zImage)
+ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/$(LINUX26_FORMAT)
+endif
 KERNEL_EXT:=.z
 endif
 
 # --------------
 # BZIMAGE
 ifeq ($(LINUX26_FORMAT),bzImage)
+ifeq ($(LINUX26_BINLOC),)
 LINUX26_BINLOC:=arch/$(KERNEL_ARCH)/boot/bzImage
+endif
 KERNEL_EXT:=.bz
 endif
 
-endif
 
 # -----------------------------------------------------------------------------
 # File name for the Linux kernel binary
