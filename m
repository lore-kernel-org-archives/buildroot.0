From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 15:02:23 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
Message-ID: <20090127150223.19A377709E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-27 15:02:22 +0000 (Tue, 27 Jan 2009)
New Revision: 25076

Log:
icu: needs C++ support in toolchain

Modified:
   trunk/buildroot/package/icu/Config.in


Changeset:
Modified: trunk/buildroot/package/icu/Config.in
===================================================================
--- trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:13 UTC (rev 25075)
+++ trunk/buildroot/package/icu/Config.in	2009-01-27 15:02:22 UTC (rev 25076)
@@ -1,4 +1,8 @@
 config BR2_PACKAGE_ICU
 	bool "icu"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  International Components for Unicode.
+
+comment "icu requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
