From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 12 Aug 2007 07:13:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/expat
Message-ID: <20070812141339.8C10DA6595@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-12 07:13:39 -0700 (Sun, 12 Aug 2007)
New Revision: 19462

Log:
expat has --prefix=usr, so remove /usr from other switches

Modified:
   trunk/buildroot/package/expat/expat.mk


Changeset:
Modified: trunk/buildroot/package/expat/expat.mk
===================================================================
--- trunk/buildroot/package/expat/expat.mk	2007-08-12 14:11:02 UTC (rev 19461)
+++ trunk/buildroot/package/expat/expat.mk	2007-08-12 14:13:39 UTC (rev 19462)
@@ -34,16 +34,16 @@
 		--build=$(GNU_HOST_NAME) \
 		--prefix=/usr \
 		--exec-prefix=/usr \
-		--bindir=/usr/bin \
-		--sbindir=/usr/sbin \
+		--bindir=/bin \
+		--sbindir=/sbin \
 		--libdir=/lib \
-		--libexecdir=/usr/lib \
+		--libexecdir=/lib \
 		--sysconfdir=/etc \
-		--datadir=/usr/share \
+		--datadir=/share \
 		--localstatedir=/var \
-		--includedir=/usr/include \
-		--mandir=/usr/man \
-		--infodir=/usr/info \
+		--includedir=/include \
+		--mandir=/man \
+		--infodir=/info \
 		--enable-shared \
 	);
 	touch $@
