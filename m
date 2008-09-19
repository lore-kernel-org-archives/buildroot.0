From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 19 Sep 2008 07:43:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080919144351.2EBCC3C374@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-09-19 07:43:50 -0700 (Fri, 19 Sep 2008)
New Revision: 23438

Log:
Makefile.autotools.in: Get my $(Q)'s in the correct place

Minor fix for Makefile.autotools.in that deals with the packages
that use AUTOCONF to regenerate configure etc. 
(my mistake to start with)

Daniel Laird


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-19 13:37:14 UTC (rev 23437)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-19 14:43:50 UTC (rev 23438)
@@ -202,8 +202,8 @@
 	$(call MESSAGE,"Running autoreconf")
 	$(Q)cd $(@D)/$($(PKG)_SUBDIR) && $(AUTORECONF)
 # if the package uses libtool, patch it for cross-compiling in buildroot
-	if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
-	$(Q)for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
+	$(Q)if test "$($(PKG)_LIBTOOL_PATCH)" = "YES"; then \
+		for i in `find $(@D)/$($(PKG)_SUBDIR) -name ltmain.sh`; do \
 		toolchain/patch-kernel.sh $${i%/*} package buildroot-libtool.patch; \
 		done \
 	fi
