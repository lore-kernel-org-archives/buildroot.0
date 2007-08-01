From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 04:52:16 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070801115216.012A8A4680@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 04:52:15 -0700 (Wed, 01 Aug 2007)
New Revision: 19387

Log:
Allow user configurable kernel name

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-01 10:19:51 UTC (rev 19386)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-01 11:52:15 UTC (rev 19387)
@@ -55,7 +55,9 @@
 endif
 
 # File name for the Linux kernel binary
+ifndef	LINUX26_KERNEL
 LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
+endif
 
 # Version of Linux AFTER patches
 LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
