From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 17 Mar 2009 13:48:36 +0000 (UTC)
Subject: [Buildroot] svn commit: [25705] trunk/buildroot/package
Message-ID: <20090317134836.41A3B76419@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-17 13:48:35 +0000 (Tue, 17 Mar 2009)
New Revision: 25705

Log:
Makefile.autotools.in: use TARGET_PATH for compile step

This ensures that the correct build tools are found rather than the host
versions (glib-genmarshal, ..)

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2009-03-17 13:48:29 UTC (rev 25704)
+++ trunk/buildroot/package/Makefile.autotools.in	2009-03-17 13:48:35 UTC (rev 25705)
@@ -259,7 +259,7 @@
 # Build
 $(BUILD_DIR)/%/.stamp_built:
 	$(call MESSAGE,"Building")
-	$($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
+	PATH=$(TARGET_PATH) $($(PKG)_MAKE_ENV) $($(PKG)_MAKE) $($(PKG)_MAKE_OPT) -C $(@D)/$($(PKG)_SUBDIR)
 	$(Q)touch $@
 
 # Install to staging dir
