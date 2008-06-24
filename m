From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 24 Jun 2008 06:26:45 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080624132645.DE0223C5FB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-24 06:26:45 -0700 (Tue, 24 Jun 2008)
New Revision: 22488

Log:
Makefile.autotools.in: also support source/source-check


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-06-24 09:55:37 UTC (rev 22487)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-06-24 13:26:45 UTC (rev 22488)
@@ -130,8 +130,8 @@
 
 # Retrieve and unpack the archive
 $(BUILD_DIR)/%/.stamp_downloaded:
-# support make external-deps
-ifeq ($(strip $(WGET)),$(TOPDIR)toolchain/wget-show-external-deps.sh)
+# support make source/source-check/external-deps
+ifneq ($(filter source,$(MAKECMDGOALS)),)
 	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 else
 	$(call MESSAGE,"Downloading")
