From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:19:11 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822161911.55876A6056@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:19:10 -0700 (Wed, 22 Aug 2007)
New Revision: 19653

Log:


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:08:38 UTC (rev 19652)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:19:10 UTC (rev 19653)
@@ -146,6 +146,7 @@
 $(BUILD_DIR)/%/.stamp_patched: NAMEVER = $($(PKG)_NAME)-$($(PKG)_VERSION)
 $(BUILD_DIR)/%/.stamp_patched:
 	$(call MESSAGE,"Patching")
+	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	(if test -d package/$($(PKG)_NAME) ; then \
 	  if test "$(wildcard package/$($(PKG)_NAME)/$(NAMEVER)*.patch)" ; then \
 	    toolchain/patch-kernel.sh $(@D) package/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1 ; \
