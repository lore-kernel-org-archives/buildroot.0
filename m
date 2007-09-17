From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon, 17 Sep 2007 06:17:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/project
Message-ID: <20070917131713.7ADBB30071@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-17 06:17:13 -0700 (Mon, 17 Sep 2007)
New Revision: 19873

Log:
Move VENDOR dbg to correct Makefile

Modified:
   trunk/buildroot/project/Makefile.in
   trunk/buildroot/project/project.mk


Changeset:
Modified: trunk/buildroot/project/Makefile.in
===================================================================
--- trunk/buildroot/project/Makefile.in	2007-09-17 13:12:38 UTC (rev 19872)
+++ trunk/buildroot/project/Makefile.in	2007-09-17 13:17:13 UTC (rev 19873)
@@ -72,12 +72,3 @@
 #"))
 VENDOR_PATCH_DIR:=$(strip $(subst ",,$(BR2_VENDOR_PATCH_DIR)))
 #"))
-
-vendor-dbg:
-	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
-	@echo VENDOR_SUFFIX=$(BR2_VENDOR_SUFFIX)
-	@echo VENDOR_BINUTILS_RELEASE=$(BR2_VENDOR_BINUTILS_RELEASE)
-	@echo VENDOR_GCC_RELEASE=$(BR2_VENDOR_GCC_RELEASE)
-	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
-	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
-	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)

Modified: trunk/buildroot/project/project.mk
===================================================================
--- trunk/buildroot/project/project.mk	2007-09-17 13:12:38 UTC (rev 19872)
+++ trunk/buildroot/project/project.mk	2007-09-17 13:17:13 UTC (rev 19873)
@@ -39,3 +39,13 @@
 
 getconfig: $(CONFIG)/conf
 	-cp $(LOCAL)/$(PROJECT)/$(PROJECT).config .config 
+
+vendor-dbg:
+	@echo VENDOR_SITE=$(BR2_VENDOR_SITE)
+	@echo VENDOR_SUFFIX=$(BR2_VENDOR_SUFFIX)
+	@echo VENDOR_BINUTILS_RELEASE=$(BR2_VENDOR_BINUTILS_RELEASE)
+	@echo VENDOR_GCC_RELEASE=$(BR2_VENDOR_GCC_RELEASE)
+	@echo VENDOR_UCLIBC_RELEASE=$(BR2_VENDOR_UCLIBC_RELEASE)
+	@echo VENDOR_GDB_RELEASE=$(BR2_VENDOR_GDB_RELEASE)
+	@echo VENDOR_PATCH_DIR=$(BR2_VENDOR_PATCH_DIR)
+
