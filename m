From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 19:19:12 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: oprofile qte
	qtopia4
Message-ID: <20090126191912.6A750768D3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 19:19:10 +0000 (Mon, 26 Jan 2009)
New Revision: 25060

Log:
package/: depend on toolchain C++ config, don't use select

select should only be used for package (library) dependencies.

Modified:
   trunk/buildroot/package/oprofile/Config.in
   trunk/buildroot/package/qte/Config.in
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/oprofile/Config.in
===================================================================
--- trunk/buildroot/package/oprofile/Config.in	2009-01-26 19:14:18 UTC (rev 25059)
+++ trunk/buildroot/package/oprofile/Config.in	2009-01-26 19:19:10 UTC (rev 25060)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_OPROFILE
 	bool "oprofile"
 	select BR2_PACKAGE_POPT
-	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  OProfile is a system-wide profiler for Linux systems,
 	  capable of profiling all running code at low overhead.
@@ -17,3 +17,6 @@
 	  profiling. All code is profiled: hardware and software
 	  interrupt handlers, kernel modules, the kernel, shared
 	  libraries, and applications.
+
+comment "oprofile requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP

Modified: trunk/buildroot/package/qte/Config.in
===================================================================
--- trunk/buildroot/package/qte/Config.in	2009-01-26 19:14:18 UTC (rev 25059)
+++ trunk/buildroot/package/qte/Config.in	2009-01-26 19:19:10 UTC (rev 25060)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_QTE
 	bool "Qt/E"
 	depends on BR2_DEPRECATED
-	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PTHREADS_NATIVE
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBPNG
@@ -14,6 +14,10 @@
 	  Only tested with threading on, PACKAGE_JPEG, PACKAGE_LIBPNG,
 	  but remove those if you like.
 
+comment "Qt/E requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on BR2_DEPRECATED
+
 config BR2_PACKAGE_QTE_COMMERCIAL_USERNAME
 	string "Qt/E Commercial License Username"
 	default ""

Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-01-26 19:14:18 UTC (rev 25059)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-01-26 19:19:10 UTC (rev 25060)
@@ -1,12 +1,15 @@
 config BR2_PACKAGE_QTOPIA4
 	bool "qtopia4"
-	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PTHREADS_NATIVE
 	help
 	  Qtopia core 4.
 
 	  http://www.trolltech.com/
 
+comment "qtopia4 requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 if BR2_PACKAGE_QTOPIA4
 
 config BR2_PACKAGE_QTOPIA4_DEBUG
