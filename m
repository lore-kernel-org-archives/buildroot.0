From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 22 Feb 2009 10:38:11 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090222103811.7197A7669C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-22 10:38:10 +0000 (Sun, 22 Feb 2009)
New Revision: 25411

Log:
linux-advanced: don't error out on non writable /tftpboot

Odd that we have 2x the same target right after eachother, but this is
Makefile.in.advanced ofcourse ;)

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-22 10:38:04 UTC (rev 25410)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-22 10:38:10 UTC (rev 25411)
@@ -459,7 +459,7 @@
 /tftpboot/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
 	-mkdir -p /tftpboot
 	-cp -dpf $(LINUX26_KERNEL) $@
-	touch $@
+	-touch $@
 
 ifneq ($(LINUX_COPYTO),/tftpboot)
 $(LINUX_COPYTO)/$(LINUX26_KERNEL_NAME): $(LINUX26_KERNEL)
