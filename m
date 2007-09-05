From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 23:48:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070905064839.E37E5A681F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 23:48:38 -0700 (Tue, 04 Sep 2007)
New Revision: 19786

Log:
Add unpacking + patching of linux source tree to simplify creating a new patch

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-09-05 03:40:47 UTC (rev 19785)
+++ trunk/buildroot/target/linux/Makefile.in	2007-09-05 06:48:38 UTC (rev 19786)
@@ -209,6 +209,8 @@
 
 linux26-source: $(DL_DIR)/$(LINUX26_SOURCE)
 
+linux26-patched: $(LINUX26_DIR)/.patched
+
 # This has been renamed so we do _NOT_ by default run this on 'make clean'
 linux26clean:
 	rm -f $(LINUX26_KERNEL) $(LINUX26_DIR)/.configured
