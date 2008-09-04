From: hamish at uclibc.org <hamish@uclibc.org>
Date: Wed,  3 Sep 2008 18:05:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080904010517.E9C743C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: hamish
Date: 2008-09-03 18:05:17 -0700 (Wed, 03 Sep 2008)
New Revision: 23312

Log:
In the uninstall and clean targets, remove the built/installed stamp files
so that those actions will do something if executed again.


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-09-03 21:54:46 UTC (rev 23311)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-09-04 01:05:17 UTC (rev 23312)
@@ -250,13 +250,18 @@
 $(BUILD_DIR)/%/.stamp_cleaned:
 	$(call MESSAGE,"Cleaning up")
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	rm -f $(@D)/.stamp_staging_installed
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	rm -f $(@D)/.stamp_target_installed
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	rm -f $(@D)/.stamp_built
 
 $(BUILD_DIR)/%/.stamp_uninstalled:
 	$(call MESSAGE,"Uninstalling")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	rm -f $(@D)/.stamp_staging_installed
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	rm -f $(@D)/.stamp_target_installed
 
 $(BUILD_DIR)/%/.stamp_dircleaned:
 	rm -Rf $(@D)
