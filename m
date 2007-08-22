From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 22 Aug 2007 09:44:43 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070822164443.C563BA4622@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-08-22 09:44:41 -0700 (Wed, 22 Aug 2007)
New Revision: 19656

Log:
- don't print the second time autoreconf would be run


Modified:
   trunk/buildroot/package/Makefile.autotools.in


Changeset:
Modified: trunk/buildroot/package/Makefile.autotools.in
===================================================================
--- trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:28:31 UTC (rev 19655)
+++ trunk/buildroot/package/Makefile.autotools.in	2007-08-22 16:44:41 UTC (rev 19656)
@@ -176,7 +176,6 @@
 $(BUILD_DIR)/%/.stamp_configured:
 	$(call MESSAGE,"Configuring")
 	$(Q)if test "$($(PKG)_AUTORECONF)" = "YES" ; then \
-		$(call MESSAGE,"Running autoreconf")
 		cd $(@D)/$($(PKG)_SUBDIR) && \
 		$(AUTORECONF) ; \
 	fi
