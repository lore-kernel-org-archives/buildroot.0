From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Mar 2009 08:28:05 +0000 (UTC)
Subject: [Buildroot] svn commit: [25805] trunk/buildroot/target/linux
Message-ID: <20090324082805.8543476A00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-24 08:28:04 +0000 (Tue, 24 Mar 2009)
New Revision: 25805

Log:
target/linux: default to bzImage for i386/x86_64

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2009-03-23 21:48:50 UTC (rev 25804)
+++ trunk/buildroot/target/linux/Config.in.advanced	2009-03-24 08:28:04 UTC (rev 25805)
@@ -433,6 +433,8 @@
 choice
 	prompt "kernel binary format"
 	depends on BR2_PACKAGE_LINUX
+	default BR2_LINUX_BIN_BZIMAGE if BR2_i386
+	default BR2_LINUX_BIN_BZIMAGE if BR2_x86_64
 	default BR2_LINUX_BIN_UIMAGE
 	help
 	  Select the specific Linux binary type you want to use
