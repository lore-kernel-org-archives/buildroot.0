From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 19 Sep 2007 03:26:12 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgpg-error
Message-ID: <20070919102612.55F80A67FF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-19 03:26:11 -0700 (Wed, 19 Sep 2007)
New Revision: 19884

Log:
- fix includedir


Modified:
   trunk/buildroot/package/libgpg-error/libgpg-error.mk


Changeset:
Modified: trunk/buildroot/package/libgpg-error/libgpg-error.mk
===================================================================
--- trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-09-19 09:20:04 UTC (rev 19883)
+++ trunk/buildroot/package/libgpg-error/libgpg-error.mk	2007-09-19 10:26:11 UTC (rev 19884)
@@ -25,21 +25,22 @@
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
-			--libexecdir=/$(LIBGPG_ERROR_DESTDIR) \
-			--sysconfdir=/etc \
-			--datadir=/usr/share \
-			--localstatedir=/var \
-			--includedir=/include \
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
+		--libexecdir=/$(LIBGPG_ERROR_DESTDIR) \
+		--sysconfdir=/etc \
+		--datadir=/usr/share \
+		--localstatedir=/var \
+		--includedir=/usr/include \
+		--mandir=/usr/man \
+		--infodir=/usr/info \
+		$(DISABLE_NLS) \
 	)
 	touch $(LIBGPG_ERROR_DIR)/.configured
 
@@ -64,7 +65,6 @@
 libgpg-error-dirclean:
 	rm -rf $(LIBGPG_ERROR_DIR)
 
-.PHONY: libgpg-error
 #############################################################
 #
 # Toplevel Makefile options
