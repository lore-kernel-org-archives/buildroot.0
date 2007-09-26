From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed, 26 Sep 2007 16:21:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070926232143.D09F0A4D18@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-26 16:21:43 -0700 (Wed, 26 Sep 2007)
New Revision: 20050

Log:
Allow easy update of target linux config

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-26 23:20:49 UTC (rev 20049)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-26 23:21:43 UTC (rev 20050)
@@ -227,6 +227,9 @@
 
 linux26-config:	$(LINUX26_DIR)/.configured
 
+linux26-update:
+	cp -dpf $(LINUX26_DIR)/.config $(LINUX26_KCONFIG)
+
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
