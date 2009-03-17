From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:48:29 +0000 (UTC)
Subject: [Buildroot] svn commit: [25704] trunk/buildroot/package
Message-ID: <20090317134829.9030676419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:48:29 +0000 (Tue, 17 Mar 2009)
New Revision: 25704

Log:
package: add HOST_DIR to target path

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2009-03-17 13:48:15 UTC (rev 25703)
+++ trunk/buildroot/package/Makefile.in	2009-03-17 13:48:29 UTC (rev 25704)
@@ -117,7 +117,7 @@
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
+TARGET_PATH="$(TOOL_BUILD_DIR)/bin:$(HOST_DIR)/bin:$(HOST_DIR)/usr/bin:$(STAGING_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
 IMAGE:=$(BINARIES_DIR)/$(BR2_ROOTFS_PREFIX).$(ARCH)$(COND_ARCH_FPU_SUFFIX)$(ROOTFS_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
