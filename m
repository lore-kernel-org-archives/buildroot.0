From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 12 Jul 2008 23:33:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080713063300.80B253C70D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-12 23:32:58 -0700 (Sat, 12 Jul 2008)
New Revision: 22821

Log:
linux-advanced: add linux26-force like in the simple linux makefile

Patch by Brian Beattie.

Modified:
   trunk/buildroot/target/linux/Makefile.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Makefile.in.advanced	2008-07-12 23:47:24 UTC (rev 22820)
+++ trunk/buildroot/target/linux/Makefile.in.advanced	2008-07-13 06:32:58 UTC (rev 22821)
@@ -454,6 +454,10 @@
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
+# force rebuild
+linux26-force:
+	touch $(LINUX26_DIR)/.configured
+
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
