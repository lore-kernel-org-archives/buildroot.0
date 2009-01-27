From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:30 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
Message-ID: <20090127150231.1A65F7709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:29 +0000 (Tue, 27 Jan 2009)
New Revision: 25078

Log:
icu: needs wchar support in toolchain as well

Modified:
   trunk/buildroot/package/icu/Config.in


Changeset:
Modified: trunk/buildroot/package/icu/Config.in
===================================================================
--- trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:25 UTC (rev 25077)
+++ trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:29 UTC (rev 25078)
@@ -1,10 +1,11 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_USE_WCHAR
 	help
 	  International Components for Unicode.
 
 	  http://icu-project.org/
 
-comment "icu requires a toolchain with C++ support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP
+comment "icu requires a toolchain with C++ support and WCHAR enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
