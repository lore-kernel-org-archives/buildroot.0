From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun,  6 Jul 2008 22:08:40 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080707050840.31A783C5FA@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-07-06 22:08:39 -0700 (Sun, 06 Jul 2008)
New Revision: 22669

Log:
Makefile.autotools.in: revert broken r22659

Ulfs r22659 commit broke make source-check/external deps, so reverting it.

Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2008-07-06 17:00:49 UTC (rev 22668)
+++ trunk/buildroot/package/Makefile.autotools.in	2008-07-07 05:08:39 UTC (rev 22669)
@@ -132,7 +132,7 @@
 $(BUILD_DIR)/%/.stamp_downloaded:
 # support make source-check/external-deps
 ifeq ($(MAKELEVEL),1)
-	-$(Q)test -e $(DL_DIR)/$($(PKG)_SOURCE) || $(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
+	$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_SOURCE)
 	$(if $($(PKG)_PATCH),$(WGET) -P $(DL_DIR) $($(PKG)_SITE)/$($(PKG)_PATCH))
 else
 	$(call MESSAGE,"Downloading")
@@ -395,5 +395,3 @@
 endef
 
 # :mode=makefile:
-
-
