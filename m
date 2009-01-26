From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 26 Jan 2009 20:17:08 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090126201708.B4FD677458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-26 20:17:06 +0000 (Mon, 26 Jan 2009)
New Revision: 25065

Log:
Replace BUILDROOT_KERNEL_CONFIG_METHOD environment variable with BUILDROOT_USE_XWINDOWS

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 19:42:47 UTC (rev 25064)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-01-26 20:17:06 UTC (rev 25065)
@@ -110,8 +110,8 @@
 endif
 
 # Override config method with shell variable
-ifneq ($(BUILDROOT_KERNEL_CONFIG_METHOD),)
-KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BUILDROOT_KERNEL_CONFIG_METHOD)))
+ifneq ($(BUILDROOT_USE_XWINDOWS),)
+KERNEL_CONFIG_METHOD:=xconfig
 #"))
 else
 KERNEL_CONFIG_METHOD:=$(strip $(subst ",,$(BR2_KERNEL_CONFIG_METHOD)))
