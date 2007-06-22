From: aldot at uclibc.org <aldot@uclibc.org>
Date: Fri, 22 Jun 2007 10:49:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/mips
Message-ID: <20070622174915.2557C4864D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-22 10:49:14 -0700 (Fri, 22 Jun 2007)
New Revision: 18896

Log:
- LINUX26_BINLOC is always defined in target/device/mips/Makefile.in, even for non-mips
  Thanks to Julien Letessier for spotting my omission


Modified:
   trunk/buildroot/target/device/mips/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/mips/Makefile.in
===================================================================
--- trunk/buildroot/target/device/mips/Makefile.in	2007-06-22 17:39:21 UTC (rev 18895)
+++ trunk/buildroot/target/device/mips/Makefile.in	2007-06-22 17:49:14 UTC (rev 18896)
@@ -1,3 +1,4 @@
+ifneq ($(findstring y,$(BR2_mips)$(BR2_mipsel)),)
 BR2_BOARD_PATH:=target/device/mips
 
 ifeq ($(strip $(BR2_PACKAGE_LINUX_KCONFIG)),)
@@ -20,3 +21,4 @@
 # mips32 has the vmlinux in the toplevel kernel build-tree.
 LINUX26_BINLOC=$(LINUX26_FORMAT)
 endif
+endif
