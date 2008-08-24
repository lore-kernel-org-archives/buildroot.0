From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 24 Aug 2008 00:48:15 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libxml2
Message-ID: <20080824074815.74A533C2A9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-24 00:48:15 -0700 (Sun, 24 Aug 2008)
New Revision: 23192

Log:
libxml2: enable ipv6 support if enabled in buildroot

Modified:
   trunk/buildroot/package/libxml2/libxml2.mk


Changeset:
Modified: trunk/buildroot/package/libxml2/libxml2.mk
===================================================================
--- trunk/buildroot/package/libxml2/libxml2.mk	2008-08-24 00:02:18 UTC (rev 23191)
+++ trunk/buildroot/package/libxml2/libxml2.mk	2008-08-24 07:48:15 UTC (rev 23192)
@@ -17,7 +17,7 @@
 endif
 
 LIBXML2_CONF_OPT = --with-gnu-ld --enable-shared \
-		--enable-static --enable-ipv6=no \
+		--enable-static $(DISABLE_IPV6) \
 		--without-debugging --without-python \
 		--without-threads $(DISABLE_NLS)
 
