From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 11 Aug 2007 11:25:19 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070811182519.2FD6FA5D3F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-11 11:25:17 -0700 (Sat, 11 Aug 2007)
New Revision: 19432

Log:
Use correct DEST_DIR for expat

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-08-11 17:03:04 UTC (rev 19431)
+++ trunk/buildroot/package/expat/expat.mk	2007-08-11 18:25:17 UTC (rev 19432)
@@ -53,7 +53,7 @@
 	touch -c $@
 
 $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/lib/libexpat.la
 	touch -c $@
