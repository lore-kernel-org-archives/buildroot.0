From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu,  5 Mar 2009 15:35:38 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20090305153538.8B0CD7626F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-05 15:35:37 +0000 (Thu, 05 Mar 2009)
New Revision: 25549

Log:
qtopia4: remove invalid PTHREADS_NATIVE dependency

Modified:
   trunk/buildroot/package/qtopia4/Config.in


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2009-03-05 15:30:57 UTC (rev 25548)
+++ trunk/buildroot/package/qtopia4/Config.in	2009-03-05 15:35:37 UTC (rev 25549)
@@ -1,14 +1,13 @@
 config BR2_PACKAGE_QTOPIA4
 	bool "qtopia4"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_PTHREADS_NATIVE
 	help
 	  Qtopia core 4.
 
 	  http://www.trolltech.com/
 
-comment "qtopia4 requires a toolchain with C++ and NPTL support enabled"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_PTHREADS_NATIVE
+comment "qtopia4 requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
 
 if BR2_PACKAGE_QTOPIA4
 
