From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 17 Sep 2008 14:36:21 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/lighttpd
Message-ID: <20080917213621.6F7473C6EF@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-17 14:36:21 -0700 (Wed, 17 Sep 2008)
New Revision: 23418

Log:
lighttpd: don't enable openssl support by default

Modified:
   trunk/buildroot/package/lighttpd/Config.in


Changeset:
Modified: trunk/buildroot/package/lighttpd/Config.in
===================================================================
--- trunk/buildroot/package/lighttpd/Config.in	2008-09-17 21:35:51 UTC (rev 23417)
+++ trunk/buildroot/package/lighttpd/Config.in	2008-09-17 21:36:21 UTC (rev 23418)
@@ -8,7 +8,7 @@
 	  Auth, Output-Compression, URL-Rewriting and many more) make
 	  lighttpd the perfect webserver-software for every server that
 	  is suffering load problems.
-		
+
 	  http://www.lighttpd.net/
 
 if BR2_PACKAGE_LIGHTTPD
@@ -16,7 +16,6 @@
 
 config BR2_PACKAGE_LIGHTTPD_OPENSSL
 	bool "lighttpd openssl support"
-	default y
 	depends on BR2_PACKAGE_LIGHTTPD
 	select BR2_PACKAGE_OPENSSL
 	help
