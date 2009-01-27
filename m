From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:36 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20090127150236.92F207709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:34 +0000 (Tue, 27 Jan 2009)
New Revision: 25079

Log:
libxml2: stop continous rerun of post-extract target

Touch stamp file (seems to have been missed by r23656).

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2009-01-27 15:02:29 UTC (rev 25078)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2009-01-27 15:02:34 UTC (rev 25079)
@@ -25,6 +25,7 @@
 $(LIBXML2_HOOK_POST_EXTRACT):
 	rm -f $(LIBXML2_DIR)/win32/Makefile.msvc.rej
 	rm -f $(LIBXML2_DIR)/macos/src/XMLTestPrefix.h.rej
+	touch $@
 
 $(LIBXML2_HOOK_POST_INSTALL):
 	$(SED) "s,^prefix=.*,prefix=\'$(STAGING_DIR)/usr\',g" $(STAGING_DIR)/usr/bin/xml2-config
