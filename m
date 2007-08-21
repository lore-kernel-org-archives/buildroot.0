From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 21 Aug 2007 10:14:57 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot: package project
Message-ID: <20070821171457.D8483A5D41@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-21 10:14:56 -0700 (Tue, 21 Aug 2007)
New Revision: 19623

Log:
- move the PROJECT variable setting to a more sensible place


Modified:
   trunk/buildroot/package/Makefile.in
   trunk/buildroot/project/Makefile.in


Changeset:
Modified: trunk/buildroot/package/Makefile.in
===================================================================
--- trunk/buildroot/package/Makefile.in	2007-08-21 17:00:18 UTC (rev 19622)
+++ trunk/buildroot/package/Makefile.in	2007-08-21 17:14:56 UTC (rev 19623)
@@ -95,12 +95,6 @@
 # All non-configurable packages should be built in BUILD_DIR
 BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)
 
-# All configurable packages (like Busybox,Linux etc) should be built in PROJECT_BUILD_DIR
-PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
-BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
-TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
-
-
 GNU_TARGET_SUFFIX:=-$(strip $(subst ",, $(BR2_GNU_TARGET_SUFFIX)))
 #"))
 

Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-08-21 17:00:18 UTC (rev 19622)
+++ trunk/buildroot/project/Makefile.in	2007-08-21 17:14:56 UTC (rev 19623)
@@ -4,3 +4,9 @@
 #"))
 BANNER:=$(strip $(subst ",,$(BR2_BANNER)))
 #"))
+
+# All configurable packages (like Busybox,Linux etc) should be built
+# in PROJECT_BUILD_DIR
+PROJECT_BUILD_DIR:=$(BASE_DIR)/$(TOPDIR_PREFIX)project_build_$(ARCH)$(ARCH_FPU_SUFFIX)$(TOPDIR_SUFFIX)/$(PROJECT)
+BINARIES_DIR:=$(BASE_DIR)/binaries/$(PROJECT)
+TARGET_DIR:=$(PROJECT_BUILD_DIR)/root
