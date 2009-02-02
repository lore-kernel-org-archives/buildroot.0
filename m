From: ulf at uclibc.org <ulf@uclibc.org>
Date: Mon,  2 Feb 2009 07:24:49 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libeXosip2
Message-ID: <20090202072449.30556764CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-02-02 07:24:48 +0000 (Mon, 02 Feb 2009)
New Revision: 25218

Log:
Define OSIP_CFLAGS and OSIP_LIBS for libeXosip2

Modified:
   trunk/buildroot/package/libeXosip2/libeXosip2.mk


Changeset:
Modified: trunk/buildroot/package/libeXosip2/libeXosip2.mk
===================================================================
--- trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:22:19 UTC (rev 25217)
+++ trunk/buildroot/package/libeXosip2/libeXosip2.mk	2009-02-02 07:24:48 UTC (rev 25218)
@@ -22,32 +22,19 @@
 	(cd $(LIBEXOSIP2_DIR); rm -rf config.cache; \
 		$(TARGET_CONFIGURE_OPTS) \
 		$(TARGET_CONFIGURE_ARGS) \
+		OSIP_CFLAGS="$(TARGET_CFLAGS)" \
+		OSIP_LIBS="-L$(STAGING_DIR)/usr/lib -losip2 -losipparser2" \
 		./configure \
 		--target=$(GNU_TARGET_NAME) \
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--exec-prefix=/usr \
-		--libexecdir=/usr/lib \
-		--sysconfdir=/etc \
-		--datadir=/usr/share \
-		--localstatedir=/var \
-		--libdir=/usr/lib \
-		--includedir=$(STAGING_DIR)/usr/include \
-		--oldincludedir=/usr/include \
 		--enable-shared \
 		--enable-static \
 		$(DISABLE_NLS) \
 	)
 	touch $@
 
-#		--with-gnu-ld \
-#		--libexecdir=$(STAGING_DIR)/usr/lib \
-#		--libdir=$(STAGING_DIR)/usr/lib \
-#		--libdir=/usr/lib \
-#		--libexecdir=/usr/lib \
-
-
 $(LIBEXOSIP2_DIR)/.compiled: $(LIBEXOSIP2_DIR)/.configured
 	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(LIBEXOSIP2_DIR)
 	touch $@
