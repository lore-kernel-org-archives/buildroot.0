From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 29 Nov 2007 05:00:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/vpnc
Message-ID: <20071129130055.5AF6130048@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-11-29 05:00:53 -0800 (Thu, 29 Nov 2007)
New Revision: 20580

Log:
Make vpnc depend on packets, instead of selecting them

Modified:
   trunk/buildroot/package/vpnc/Config.in


Changeset:
Modified: trunk/buildroot/package/vpnc/Config.in
===================================================================
--- trunk/buildroot/package/vpnc/Config.in	2007-11-29 09:43:36 UTC (rev 20579)
+++ trunk/buildroot/package/vpnc/Config.in	2007-11-29 13:00:53 UTC (rev 20580)
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_VPNC
 	bool "vpnc"
-	select BR2_PACKAGE_LIBGCRYPT
-	select BR2_PACKAGE_LIBGPG_ERROR
+	depends BR2_PACKAGE_LIBGCRYPT
+	depends BR2_PACKAGE_LIBGPG_ERROR
 	default n
 	help
 	  Client for Cisco VPN concentrator
@@ -12,3 +12,5 @@
 
 	  http://www.unix-ag.uni-kl.de/~massar/vpnc
 
+comment "vpnc		- disabled (requires libgcrypt and libgpg_error)"
+	depends !BR2_PACKAGE_LIBGCRYPT || !BR2_PACKAGE_LIBGPG_ERROR
