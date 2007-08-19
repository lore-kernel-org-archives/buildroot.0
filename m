From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 15:28:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070819222854.B6600A5D3A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 15:28:51 -0700 (Sun, 19 Aug 2007)
New Revision: 19577

Log:
Fix bad parameter list for patching linux kernel

Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-08-19 22:01:27 UTC (rev 19576)
+++ trunk/buildroot/target/linux/Makefile.in	2007-08-19 22:28:51 UTC (rev 19577)
@@ -107,7 +107,7 @@
 	touch $@
 
 $(LINUX26_DIR)/.patched: $(LINUX26_DIR)/.unpacked
-	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR)
+	toolchain/patch-kernel.sh $(LINUX26_DIR) $(LINUX26_PATCH_DIR) \*.patch
 	touch $@
 endif # ($(LINUX26_VERSION),$(LINUX_HEADERS_VERSION))
 
