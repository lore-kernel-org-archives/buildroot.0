From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 20 Mar 2007 10:58:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070320175836.B39D84859F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-03-20 10:58:36 -0700 (Tue, 20 Mar 2007)
New Revision: 18184

Log:
- put staging_dir/usr/bin into the target path, so X-stuff can find freetype-config.
  Closes #1233


Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-03-20 17:50:23 UTC (rev 18183)
+++ trunk/buildroot/package/Makefile.in	2007-03-20 17:58:36 UTC (rev 18184)
@@ -59,7 +59,7 @@
 TOOL_BUILD_DIR=$(BASE_DIR)/$(TOPDIR_PREFIX)toolchain_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
 # Quotes are needed for spaces et al in path components.
-TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(PATH)"
+TARGET_PATH="$(STAGING_DIR)/bin:$(TOOL_BUILD_DIR)/bin:$(STAGING_DIR)/usr/bin:$(PATH)"
 IMAGE:=$(BASE_DIR)/rootfs.$(ARCH)$(ARCH_FPU_SUFFIX)
 REAL_GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)$(GNU_TARGET_SUFFIX)
 GNU_TARGET_NAME=$(OPTIMIZE_FOR_CPU)-linux
