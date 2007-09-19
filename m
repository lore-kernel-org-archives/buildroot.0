From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 03:26:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgcrypt
Message-ID: <20070919102639.047D6A6881@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 03:26:39 -0700 (Wed, 19 Sep 2007)
New Revision: 19885

Log:
- remove duplicate includedir


Modified:
   trunk/buildroot/package/libgcrypt/libgcrypt.mk


Changeset:
Modified: trunk/buildroot/package/libgcrypt/libgcrypt.mk
===================================================================
--- trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 10:26:11 UTC (rev 19884)
+++ trunk/buildroot/package/libgcrypt/libgcrypt.mk	2007-09-19 10:26:39 UTC (rev 19885)
@@ -25,22 +25,23 @@
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
 		./configure \
-			--target=$(GNU_TARGET_NAME) \
-			--host=$(GNU_TARGET_NAME) \
-			--build=$(GNU_HOST_NAME) \
-			--prefix=/usr \
-			--exec-prefix=/usr \
-			--bindir=/usr/bin \
-			--sbindir=/usr/sbin \
-			--libdir=/lib \
-			--libexecdir=/$(LIBGCRYPT_DESTDIR) \
-			--sysconfdir=/etc \
-			--datadir=/usr/share \
-			--localstatedir=/var \
-			--includedir=/include \
-			--includedir=/usr/include \
-			--mandir=/usr/man \
-			--infodir=/usr/info \
+		--target=$(GNU_TARGET_NAME) \
+		--host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) \
+		--prefix=/usr \
+		--exec-prefix=/usr \
+		--bindir=/usr/bin \
+		--sbindir=/usr/sbin \
+		--libdir=/lib \
+		--libexecdir=/$(LIBGCRYPT_DESTDIR) \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/usr/include \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		--disable-optimization \
+		--with-capabilities \
 	)
 	touch $@
 
@@ -65,7 +66,6 @@
 libgcrypt-dirclean:
 	rm -rf $(LIBGCRYPT_DIR)
 
-.PHONY: libgcrypt
 #############################################################
 #
 # Toplevel Makefile options
