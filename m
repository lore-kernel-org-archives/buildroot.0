From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:35 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190835.AB35E3C8FE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:35 -0700 (Mon, 04 Aug 2008)
New Revision: 23038

Log:
Makefile.autotools.in: fix patch dir for version specific subdir

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:26 UTC (rev 23037)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-08-04 19:08:35 UTC (rev 23038)
@@ -174,7 +174,7 @@
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch $($(PKG)_NAME)\*.patch.$(ARCH) || exit 1; \
-	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
+	    if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
 	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
