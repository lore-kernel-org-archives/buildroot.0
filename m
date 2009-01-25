From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 25 Jan 2009 23:16:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/cups
Message-ID: <20090125231613.10AD376D28@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-25 23:16:11 +0000 (Sun, 25 Jan 2009)
New Revision: 25029

Log:
exec-profix fix for cups

Modified:
   trunk/buildroot/package/cups/cups.mk


Changeset:
Modified: trunk/buildroot/package/cups/cups.mk
===================================================================
--- trunk/buildroot/package/cups/cups.mk	2009-01-25 23:14:55 UTC (rev 25028)
+++ trunk/buildroot/package/cups/cups.mk	2009-01-25 23:16:11 UTC (rev 25029)
@@ -78,18 +78,10 @@
 		--host=$(GNU_TARGET_NAME) \
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
-		--includedir=/usr/include  \
-		--libdir=/usr/lib \
-		--exec-prefix=/ \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
-		--libexecdir=/usr/lib \
+		--exec-prefix=/usr \
 		--sysconfdir=/etc \
-		--with-config-file-path=/etc \
-		--datadir=/usr/share/misc \
 		--localstatedir=/var \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--with-config-file-path=/etc \
 		--disable-gnutls \
 		--disable-gssapi \
 		$(CUPS_CONF_OPT) \
