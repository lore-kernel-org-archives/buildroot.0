From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:08:13 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20080804190813.2204F3C8E3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:08:12 -0700 (Mon, 04 Aug 2008)
New Revision: 23034

Log:
vpnc: select libgcrypt / libgpg_error

Modified:
   trunk/buildroot/package/vpnc/Config.in


Changeset:
Modified: trunk/buildroot/package/vpnc/Config.in
===================================================================
--- trunk/buildroot/package/vpnc/Config.in	2008-08-04 19:08:09 UTC (rev 23033)
+++ trunk/buildroot/package/vpnc/Config.in	2008-08-04 19:08:12 UTC (rev 23034)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
-	depends on BR2_PACKAGE_LIBGCRYPT
-	depends on BR2_PACKAGE_LIBGPG_ERROR
+	select BR2_PACKAGE_LIBGCRYPT
+	select BR2_PACKAGE_LIBGPG_ERROR
 	help
 	  Client for Cisco VPN concentrator
 	  3000 Series VPN Concentrator
@@ -10,6 +10,3 @@
 	  Juniper/Netscreen
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
-
-comment "vpnc		- disabled (requires libgcrypt and libgpg_error)"
-	depends on !BR2_PACKAGE_LIBGCRYPT || !BR2_PACKAGE_LIBGPG_ERROR
