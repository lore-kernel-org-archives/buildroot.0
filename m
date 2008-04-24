From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu, 24 Apr 2008 06:15:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20080424131530.9388D3C832@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-04-24 06:15:30 -0700 (Thu, 24 Apr 2008)
New Revision: 21832

Log:
more options for expat, move install to /usr

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2008-04-24 13:14:25 UTC (rev 21831)
+++ trunk/buildroot/package/expat/expat.mk	2008-04-24 13:15:30 UTC (rev 21832)
@@ -35,8 +35,16 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
+		--bindir=/bin \
+		--sbindir=/sbin \
+		--libdir=/lib \
+		--libexecdir=/lib \
 		--sysconfdir=/etc \
+		--datadir=/share \
 		--localstatedir=/var \
+		--includedir=/include \
+		--mandir=/man \
+		--infodir=/info \
 		--enable-shared \
 	)
 	touch $@
@@ -46,7 +54,7 @@
 	touch -c $@
 
 $(STAGING_DIR)/$(EXPAT_TARGET_BINARY): $(EXPAT_DIR)/$(EXPAT_BINARY)
-	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(EXPAT_DIR) install
+	$(MAKE) DESTDIR=$(STAGING_DIR)/usr -C $(EXPAT_DIR) install
 	$(SED) "s,^libdir=.*,libdir=\'$(STAGING_DIR)/usr/lib\',g" \
 		$(STAGING_DIR)/usr/lib/libexpat.la
 	touch -c $@
