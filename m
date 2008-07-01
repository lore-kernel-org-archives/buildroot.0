From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  1 Jul 2008 05:04:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080701120419.9D11CF800F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-01 05:04:18 -0700 (Tue, 01 Jul 2008)
New Revision: 22586

Log:
Makefile.autotools.in: also remove man pages from /usr/share/man


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-07-01 11:46:50 UTC (rev 22585)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-07-01 12:04:18 UTC (rev 22586)
@@ -238,7 +238,7 @@
 $(BUILD_DIR)/%/.stamp_target_installed:
 	$(call MESSAGE,"Installing to target")
 	$($(PKG)_MAKE_ENV) $(MAKE) $($(PKG)_INSTALL_TARGET_OPT) -C $(@D)/$($(PKG)_SUBDIR)
-	$(if $(BR2_HAVE_MANPAGES),,for d in man; do \
+	$(if $(BR2_HAVE_MANPAGES),,for d in man share/man; do \
 		rm -rf $(TARGET_DIR)/$$d $(TARGET_DIR)/usr/$$d; \
 	done)
 	$(if $(BR2_HAVE_INFOPAGES),,for d in info share/info; do \
