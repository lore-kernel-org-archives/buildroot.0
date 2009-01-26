From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:41:32 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090126194132.8BC84768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 19:41:32 +0000 (Mon, 26 Jan 2009)
New Revision: 25062

Log:
libcgicc: install to usr/lib

Modified:
   trunk/buildroot/package/libcgicc/libcgicc.mk


Changeset:
Modified: trunk/buildroot/package/libcgicc/libcgicc.mk
===================================================================
--- trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-26 19:37:54 UTC (rev 25061)
+++ trunk/buildroot/package/libcgicc/libcgicc.mk	2009-01-26 19:41:32 UTC (rev 25062)
@@ -30,16 +30,8 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libdir=/lib \
-		--libexecdir=/usr/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
 		--localstatedir=/var \
-		--includedir=/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
 	)
 	touch $@
 
@@ -47,12 +39,12 @@
 	$(MAKE) -C $(LIBCGICC_DIR)
 	touch $@
 
-$(STAGING_DIR)/lib/libcgicc.so: $(LIBCGICC_DIR)/.compiled
+$(STAGING_DIR)/usr/lib/libcgicc.so: $(LIBCGICC_DIR)/.compiled
 	$(MAKE) DESTDIR=$(STAGING_DIR) -C $(LIBCGICC_DIR) install
-	touch -c $(STAGING_DIR)/lib/libcgicc.so
+	touch -c $(STAGING_DIR)/usr/lib/libcgicc.so
 
-$(TARGET_DIR)/usr/lib/libcgicc.so: $(STAGING_DIR)/lib/libcgicc.so
-	cp -dpf $(STAGING_DIR)/lib/libcgicc.so* $(TARGET_DIR)/usr/lib/
+$(TARGET_DIR)/usr/lib/libcgicc.so: $(STAGING_DIR)/usr/lib/libcgicc.so
+	cp -dpf $(STAGING_DIR)/usr/lib/libcgicc.so* $(TARGET_DIR)/usr/lib/
 
 libcgicc: uclibc $(TARGET_DIR)/usr/lib/libcgicc.so
 
