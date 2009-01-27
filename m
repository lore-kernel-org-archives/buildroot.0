From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:10:09 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/webkit
Message-ID: <20090127151010.080DA7709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:10:08 +0000 (Tue, 27 Jan 2009)
New Revision: 25081

Log:
webkit: depend on C++ + wchar support in toolkit, as icu needs it

Modified:
   trunk/buildroot/package/webkit/Config.in


Changeset:
Modified: trunk/buildroot/package/webkit/Config.in
===================================================================
--- trunk/buildroot/package/webkit/Config.in	2009-01-27 15:02:40 UTC (rev 25080)
+++ trunk/buildroot/package/webkit/Config.in	2009-01-27 15:10:08 UTC (rev 25081)
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_WEBKIT
 	bool "webkit"
+	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_ICU
 	select BR2_PACKAGE_CURL
@@ -11,3 +13,5 @@
 
 		http://webkit.org/
 
+comment "webkit requires a toolchain with C++ support and WCHAR enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
