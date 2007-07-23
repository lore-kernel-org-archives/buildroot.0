From: aldot at uclibc.org <aldot@uclibc.org>
Date: Mon, 23 Jul 2007 07:43:41 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070723144341.7D65FA4606@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-07-23 07:43:40 -0700 (Mon, 23 Jul 2007)
New Revision: 19233

Log:
- revert a part that was introduced with the PROJECT changes.
  fixes unability to build a kernel (failed to find rule .patched)


Modified:
   trunk/buildroot/target/linux/Makefile.in


Changeset:
Modified: trunk/buildroot/target/linux/Makefile.in
===================================================================
--- trunk/buildroot/target/linux/Makefile.in	2007-07-23 14:05:02 UTC (rev 19232)
+++ trunk/buildroot/target/linux/Makefile.in	2007-07-23 14:43:40 UTC (rev 19233)
@@ -58,7 +58,7 @@
 LINUX26_KERNEL=$(BINARIES_DIR)/linux-kernel-$(LINUX26_VERSION)-$(KERNEL_ARCH)
 
 # Version of Linux AFTER patches
-LINUX26_DIR=$(PROJECT_BUILD_DIR)/linux-$(LINUX26_VERSION)
+LINUX26_DIR=$(BUILD_DIR)/linux-$(LINUX26_VERSION)
 
 # for packages that need it
 LINUX_VERSION:=$(LINUX_VERSION)
@@ -89,10 +89,10 @@
 
 $(LINUX26_DIR)/.unpacked: $(DL_DIR)/$(LINUX26_SOURCE)
 	rm -rf $(LINUX26_DIR)
-	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
+	$(LINUX26_BZCAT) $(DL_DIR)/$(LINUX26_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
 ifneq ($(DOWNLOAD_LINUX26_VERSION),$(LINUX26_VERSION))
 	# Rename the dir from the downloaded version to the AFTER patch version
-	mv -f $(PROJECT_BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
+	mv -f $(BUILD_DIR)/linux-$(DOWNLOAD_LINUX26_VERSION) $(LINUX26_DIR)
 endif
 	touch $@
 
