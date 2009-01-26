From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:14:18 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libcgicc
Message-ID: <20090126191418.D7004768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 19:14:18 +0000 (Mon, 26 Jan 2009)
New Revision: 25059

Log:
libcgicc: depend on toolchain config, don't use select

select should only be used for package (library) dependencies.

Modified:
   trunk/buildroot/package/libcgicc/Config.in


Changeset:
Modified: trunk/buildroot/package/libcgicc/Config.in
===================================================================
--- trunk/buildroot/package/libcgicc/Config.in	2009-01-26 19:10:41 UTC (rev 25058)
+++ trunk/buildroot/package/libcgicc/Config.in	2009-01-26 19:14:18 UTC (rev 25059)
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_LIBCGICC
 	bool "libcgicc"
-	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  GNU cgicc is a C++ class library that greatly simplifies
 	  the creation of CGI applications for the World Wide Web.
 
 	  http://www.cgicc.com
+
+comment "libcgicc requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
