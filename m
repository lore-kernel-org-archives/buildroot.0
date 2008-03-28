From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:40:28 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080328104028.7513E3C382@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:40:28 -0700 (Fri, 28 Mar 2008)
New Revision: 21536

Log:
AUTOTARGETS: also support non-version-dependent arch specific patches


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-03-28 10:40:08 UTC (rev 21535)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-03-28 10:40:28 UTC (rev 21536)
@@ -158,9 +158,9 @@
 	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch*)"; then \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1; \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch $($(PKG)_NAME)\*.patch.$(ARCH) || exit 1; \
 	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
-	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch || exit 1; \
+	      toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER) \*.patch \*.patch.$(ARCH) || exit 1; \
 	    fi; \
 	  fi; \
 	fi; \
