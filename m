From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Apr 2008 03:30:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080401103032.CDAE73C518@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-04-01 03:30:32 -0700 (Tue, 01 Apr 2008)
New Revision: 21608

Log:
Makefile.autotools.in: Do uninstall in staging/target dirs on -clean


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-04-01 10:00:00 UTC (rev 21607)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-04-01 10:30:32 UTC (rev 21608)
@@ -234,6 +234,8 @@
 
 $(BUILD_DIR)/%/.stamp_cleaned:
 	$(call MESSAGE,"Cleaning up")
+	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_STAGING_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_UNINSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	-$($(PKG)_MAKE_ENV) $(MAKE)  $($(PKG)_CLEAN_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 
 $(BUILD_DIR)/%/.stamp_uninstalled:
