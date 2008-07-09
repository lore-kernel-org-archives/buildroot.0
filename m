From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  9 Jul 2008 04:43:58 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20080709114358.A468C3C681@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-09 04:43:57 -0700 (Wed, 09 Jul 2008)
New Revision: 22700

Log:
linux: add knob to force a rebuild of the kernel

Makes development easier. Thanks to Brian Beattie for this handy idea.

1df013316b in Bernhards tree.

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2008-07-09 09:50:33 UTC (rev 22699)
+++ trunk/buildroot/target/linux/Makefile.in	2008-07-09 11:43:57 UTC (rev 22700)
@@ -233,6 +233,10 @@
 linux26-update:
 	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
 
+# force rebuild
+linux26-force:
+	touch $(LINUX26_DIR)/.configured
+
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
