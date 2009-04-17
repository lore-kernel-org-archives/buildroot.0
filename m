From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 17 Apr 2009 13:53:07 +0000 (UTC)
Subject: [Buildroot] svn commit: [26133] trunk/buildroot
Message-ID: <20090417135307.E578D77697@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-17 13:53:07 +0000 (Fri, 17 Apr 2009)
New Revision: 26133

Log:
Makefile: distclean: remove correct dirs

Remove toolchain build dir, and don't try to remove the non-existing include
dir. Also don't explicitly remove the kernel image located in binaries as
we're already removing that dir.

Modified:
   trunk/buildroot/Makefile


Changeset:
Modified: trunk/buildroot/Makefile
===================================================================
--- trunk/buildroot/Makefile	2009-04-17 13:52:51 UTC (rev 26132)
+++ trunk/buildroot/Makefile	2009-04-17 13:53:07 UTC (rev 26133)
@@ -402,9 +402,8 @@
 ifeq ($(DL_DIR),$(BASE_DIR)/dl)
 	rm -rf $(DL_DIR)
 endif
-	rm -rf $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR) \
-	$(LINUX_KERNEL) $(BASE_DIR)/include \
-		.config.cmd
+	rm -rf $(TOOL_BUILD_DIR) $(BUILD_DIR) $(PROJECT_BUILD_DIR) $(BINARIES_DIR) \
+	.config.cmd
 	$(MAKE) -C $(CONFIG) clean
 
 sourceball:
