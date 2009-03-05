From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 19:25:13 +0000 (UTC)
Subject: [Buildroot] svn commit: [25557] trunk/buildroot/package/xerces
Message-ID: <20090305192513.DEA76775EA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 19:25:13 +0000 (Thu, 05 Mar 2009)
New Revision: 25557

Log:
xerces: needs C++ support in toolchain

Modified:
   trunk/buildroot/package/xerces/Config.in


Changeset:
Modified: trunk/buildroot/package/xerces/Config.in
===================================================================
--- trunk/buildroot/package/xerces/Config.in	2009-03-05 19:07:01 UTC (rev 25556)
+++ trunk/buildroot/package/xerces/Config.in	2009-03-05 19:25:13 UTC (rev 25557)
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_XERCES
 	bool "xerces-c++"
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_LIBICONV
 	help
 	  Xerces-C++ is a validating XML parser written in portable C++.
 
 	  http://xml.apache.org/xerces-c/
+
+comment "xerces-c++ requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
