From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 23 Aug 2008 06:08:34 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080823130834.C7AF9F8016@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-23 06:08:34 -0700 (Sat, 23 Aug 2008)
New Revision: 23185

Log:
libxml2: cleanup configure args

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-08-23 13:08:31 UTC (rev 23184)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-08-23 13:08:34 UTC (rev 23185)
@@ -15,14 +15,7 @@
 LIBXML2_CONF_ENV = CC="$(TARGET_CC) $(TARGET_CFLAGS) -DNO_LARGEFILE_SOURCE"
 endif
 
-LIBXML2_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
-		--build=$(GNU_HOST_NAME) --prefix=/usr \
-		--exec-prefix=/usr --bindir=/usr/bin \
-		--sbindir=/usr/sbin --libexecdir=/usr/lib \
-		--sysconfdir=/etc --datadir=/usr/share \
-		--localstatedir=/var --mandir=/usr/man \
-		--infodir=/usr/info --includedir=/usr/include \
-		--with-gnu-ld --enable-shared \
+LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
 		--enable-static --enable-ipv6=no \
 		--without-debugging --without-python \
 		--without-threads $(DISABLE_NLS)
