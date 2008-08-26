From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 26 Aug 2008 15:37:20 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/atk
Message-ID: <20080826223720.B77253C6C1@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-26 15:37:20 -0700 (Tue, 26 Aug 2008)
New Revision: 23226

Log:
atk: select libglib2

Modified:
   trunk/buildroot/package/atk/Config.in


Changeset:
Modified: trunk/buildroot/package/atk/Config.in
===================================================================
--- trunk/buildroot/package/atk/Config.in	2008-08-26 21:05:10 UTC (rev 23225)
+++ trunk/buildroot/package/atk/Config.in	2008-08-26 22:37:20 UTC (rev 23226)
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_ATK
 	bool "atk"
 	select BR2_PACKAGE_PKGCONFIG
-	depends on BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  The ATK accessibility toolkit, needed to build GTK+-2.x.
-
-comment "atk		- disabled (requires libglib2)"
-	depends on !BR2_PACKAGE_LIBGLIB2
