From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Feb 2009 23:15:48 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20090204231548.7E56476273@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-04 23:15:48 +0000 (Wed, 04 Feb 2009)
New Revision: 25239

Log:
linux/Makefile.in.advanced: don't depend on phony target for mkimage

Stops continous rebuilds.

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-04 23:15:42 UTC (rev 25238)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2009-02-04 23:15:48 UTC (rev 25239)
@@ -476,7 +476,7 @@
 	echo $(LINUX26_VERSION_PROBED) > $(PROJECT_BUILD_DIR)/.linux-version
 	echo LINUX_MODULES=`$(LINUX26_VERSION_PROBED)`
 
-$(LINUX26_MKIMAGE_DIR)/mkimage:	u-boot
+$(LINUX26_MKIMAGE_DIR)/mkimage:	$(U_BOOT_TOOLS)
 	mkdir -p $(LINUX26_MKIMAGE_DIR)
 	cp $(MKIMAGE) $(LINUX26_MKIMAGE_DIR)
 
