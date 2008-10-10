From: laird at uclibc.org <laird@uclibc.org>
Date: Fri, 10 Oct 2008 07:41:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20081010144118.CB0E13C933@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-10-10 07:41:18 -0700 (Fri, 10 Oct 2008)
New Revision: 23656

Log:
package/libxml2/libxml2.mk: Bounce version to 2.6.32

Bounce the version to 2.6.32.
And deal with the left over .rej files.

Daniel Laird


Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-10-10 13:50:38 UTC (rev 23655)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-10-10 14:41:18 UTC (rev 23656)
@@ -3,7 +3,7 @@
 # libxml2
 #
 #############################################################
-LIBXML2_VERSION = 2.6.31
+LIBXML2_VERSION = 2.6.32
 LIBXML2_SOURCE = libxml2-sources-$(LIBXML2_VERSION).tar.gz
 LIBXML2_SITE = ftp://xmlsoft.org/libxml2
 LIBXML2_INSTALL_STAGING = YES
@@ -23,6 +23,10 @@
 
 $(eval $(call AUTOTARGETS,package,libxml2))
 
+$(LIBXML2_HOOK_POST_EXTRACT):
+	rm -f $(LIBXML2_DIR)/win32/Makefile.msvc.rej
+	rm -f $(LIBXML2_DIR)/macos/src/XMLTestPrefix.h.rej
+
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
 	$(SED) "s,^exec_prefix=.*,exec_prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
