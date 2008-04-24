From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 07:04:23 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20080424140423.8D52C3C89E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 07:04:23 -0700 (Thu, 24 Apr 2008)
New Revision: 21841

Log:
revert commit 21832

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2008-04-24 13:26:25 UTC (rev 21840)
+++ trunk/buildroot/package/expat/expat.mk	2008-04-24 14:04:23 UTC (rev 21841)
@@ -35,16 +35,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/bin \
-		--sbindir=/sbin \
-		--libdir=/lib \
-		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/man \
-		--infodir=/info \
 		--enable-shared \
 	)
 	touch $@
@@ -54,7 +46,7 @@
 	touch -c $@
 
 $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
+	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/lib/libexpat.la
 	touch -c $@
