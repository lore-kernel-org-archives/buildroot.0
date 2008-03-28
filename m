From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 28 Mar 2008 03:39:55 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080328103955.945723C370@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-03-28 03:39:55 -0700 (Fri, 28 Mar 2008)
New Revision: 21534

Log:
AUTOTARGETS: support arch specific *.patch.$(ARCH) patches


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-03-28 10:39:48 UTC (rev 21533)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-03-28 10:39:55 UTC (rev 21534)
@@ -155,8 +155,8 @@
 	$(if $($(PKG)_PATCH),toolchain/patch-kernel.sh $(@D) $(DL_DIR) $($(PKG)_PATCH))
 	$(Q)( \
 	if test -d $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME); then \
-	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch)"; then \
-	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch || exit 1; \
+	  if test "$(wildcard $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER)*.patch*)"; then \
+	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $(NAMEVER)\*.patch $(NAMEVER)\*.patch.$(ARCH) || exit 1; \
 	  else \
 	    toolchain/patch-kernel.sh $(@D) $($(PKG)_DIR_PREFIX)/$($(PKG)_NAME) $($(PKG)_NAME)\*.patch || exit 1; \
 	    if test -d package/$($(PKG)_DIR_PREFIX)/$($(PKG)_NAME)/$(NAMEVER); then \
