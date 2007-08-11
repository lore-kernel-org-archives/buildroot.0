From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 16:03:06 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070811230306.D1DC0A5D44@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 16:03:04 -0700 (Sat, 11 Aug 2007)
New Revision: 19445

Log:
Use STAGING_DIR/usr/lib instead of STAGING_DIR/lib for expat

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-08-11 22:26:56 UTC (rev 19444)
+++ trunk/buildroot/package/expat/expat.mk	2007-08-11 23:03:04 UTC (rev 19445)
@@ -53,7 +53,7 @@
 	touch -c $@
 
 $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/lib/libexpat.la
 	touch -c $@
