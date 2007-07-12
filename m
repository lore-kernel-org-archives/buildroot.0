From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 12 Jul 2007 08:32:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070712153204.985C9A685A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-07-12 08:32:04 -0700 (Thu, 12 Jul 2007)
New Revision: 19074

Log:
Add comment on when to use BUILD_DIR vs PROJECT_BUILD_DIR

Modified:
   trunk/buildroot/package/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-07-12 15:28:58 UTC (rev 19073)
+++ trunk/buildroot/package/Makefile.in	2007-07-12 15:32:04 UTC (rev 19074)
@@ -68,8 +68,11 @@
 DL_DIR:=$(BASE_DIR)/dl
 endif
 #PATCH_DIR=$(BASE_DIR)/sources/patches
+
+# All non-configurable packages should be built in BUILD_DIR
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
+# All configurable packages (like Busybox,Linux etc) should be built in PROJECT_BUILD_DIR
 PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
 BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
 TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
