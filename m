From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  1 Sep 2008 08:33:18 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/iperf
Message-ID: <20080901153318.7F4883C786@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-09-01 08:33:17 -0700 (Mon, 01 Sep 2008)
New Revision: 23298

Log:
iperf: don't silently enable C++ support in toolchain

Modified:
   trunk/buildroot/package/iperf/Config.in


Changeset:
Modified: trunk/buildroot/package/iperf/Config.in
===================================================================
--- trunk/buildroot/package/iperf/Config.in	2008-09-01 15:33:15 UTC (rev 23297)
+++ trunk/buildroot/package/iperf/Config.in	2008-09-01 15:33:17 UTC (rev 23298)
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_IPERF
 	bool "iperf"
-	select BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  Internet Protocol bandwidth measuring tool for measuring
 	  TCP/UDP performance.
 
 	  http://dast.nlanr.net/projects/iperf/
+
+comment "iperf requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP
