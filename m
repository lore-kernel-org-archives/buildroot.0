From: aldot at uclibc.org <aldot@uclibc.org>
Date: Tue, 26 Jun 2007 09:35:08 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/mdadm
Message-ID: <20070626163508.6F15CA4623@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-06-26 09:35:07 -0700 (Tue, 26 Jun 2007)
New Revision: 18944

Log:
- apply the patches


Modified:
   trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch
   trunk/buildroot/package/mdadm/mdadm.mk


Changeset:
Modified: trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch
===================================================================
--- trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch	2007-06-26 16:34:45 UTC (rev 18943)
+++ trunk/buildroot/package/mdadm/mdadm-2.6.1-001.uclibc-and-ftw-fixup.patch	2007-06-26 16:35:07 UTC (rev 18944)
@@ -10,15 +10,4 @@
  # include <features.h>
  # ifndef  __UCLIBC_HAS_FTW__
  #  undef HAVE_FTW
-diff -rdup mdadm-2.6.1.orig/util.c mdadm-2.6.1/util.c
---- mdadm-2.6.1.orig/util.c	2006-12-19 03:35:27.000000000 +0100
-+++ mdadm-2.6.1/util.c	2007-04-16 21:05:56.000000000 +0200
-@@ -468,7 +468,7 @@ int nftw(const char *path, int (*han)(co
- 	return ftw(path, add_dev_1, nopenfd);
- }
- #else
--int add_dev(const char *name, const struct stat *stb, int flag, struct FTW *s)
-+int add_dev_1(const char *name, const struct stat *stb, int flag, struct FTW *s)
- {
- 	return 0;
- }
+

Modified: trunk/buildroot/package/mdadm/mdadm.mk
===================================================================
--- trunk/buildroot/package/mdadm/mdadm.mk	2007-06-26 16:34:45 UTC (rev 18943)
+++ trunk/buildroot/package/mdadm/mdadm.mk	2007-06-26 16:35:07 UTC (rev 18944)
@@ -30,7 +30,8 @@
 	  toolchain/patch-kernel.sh $(MDADM_DIR) $(MDADM_DIR)/debian/patches \*patch ; \
 	fi
 endif
-	toolchain/patch-kernel.sh $(MDADM_DIR) package/mdadm mdadm-$(MDADM_VERSION)\*.patch
+	#toolchain/patch-kernel.sh $(MDADM_DIR) package/mdadm mdadm-$(MDADM_VERSION)\*.patch
+	toolchain/patch-kernel.sh $(MDADM_DIR) package/mdadm mdadm-\*.patch
 	touch $@
 
 $(MDADM_DIR)/$(MDADM_BINARY): $(MDADM_DIR)/.unpacked
