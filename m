From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 28 Nov 2006 02:01:46 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/x86/syslinux
Message-ID: <20061128100146.B0BCC48581@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-11-28 02:01:46 -0800 (Tue, 28 Nov 2006)
New Revision: 16702

Log:
- look at target variants when determining if syslinux is supported or not.
  Closes #637


Modified:
   trunk/buildroot/target/x86/syslinux/syslinux.mk


Changeset:
Modified: trunk/buildroot/target/x86/syslinux/syslinux.mk
===================================================================
--- trunk/buildroot/target/x86/syslinux/syslinux.mk	2006-11-28 08:49:17 UTC (rev 16701)
+++ trunk/buildroot/target/x86/syslinux/syslinux.mk	2006-11-28 10:01:46 UTC (rev 16702)
@@ -1,4 +1,21 @@
+SYSLINUX_SUPPORTED_ARCH=n
 ifeq ($(ARCH),i386)
+SYSLINUX_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i486)
+SYSLINUX_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i586)
+SYSLINUX_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),i686)
+SYSLINUX_SUPPORTED_ARCH=y
+endif
+ifeq ($(ARCH),x86_64)
+SYSLINUX_SUPPORTED_ARCH=y
+endif
+ifeq ($(SYSLINUX_SUPPORTED_ARCH),y)
+
 #############################################################
 #
 # syslinux to make target msdos/iso9660 filesystems bootable
