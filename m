From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed,  4 Mar 2009 13:22:45 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package: dm dmraid
Message-ID: <20090304132245.86B747626E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-04 13:22:44 +0000 (Wed, 04 Mar 2009)
New Revision: 25523

Log:
package: dm (and in turn dmraid) needs largefile support

Modified:
   trunk/buildroot/package/dm/Config.in
   trunk/buildroot/package/dmraid/Config.in


Changeset:
Modified: trunk/buildroot/package/dm/Config.in
===================================================================
--- trunk/buildroot/package/dm/Config.in	2009-03-04 13:22:38 UTC (rev 25522)
+++ trunk/buildroot/package/dm/Config.in	2009-03-04 13:22:44 UTC (rev 25523)
@@ -1,5 +1,9 @@
 config BR2_PACKAGE_DM
 	bool "dm"
+	depends on BR2_LARGEFILE
 	help
 	  The Device-mapper is a new component of the linux kernel that
 	  supports logical volume management. It is required by LVM2 and EVMS.
+
+comment "dm requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE

Modified: trunk/buildroot/package/dmraid/Config.in
===================================================================
--- trunk/buildroot/package/dmraid/Config.in	2009-03-04 13:22:38 UTC (rev 25522)
+++ trunk/buildroot/package/dmraid/Config.in	2009-03-04 13:22:44 UTC (rev 25523)
@@ -3,6 +3,7 @@
 
 config BR2_PACKAGE_DMRAID
 	bool "dmraid"
+	depends on BR2_LARGEFILE
 	select BR2_PACKAGE_DM
 	help
 	  dmraid discovers, activates, deactivates and displays properties
@@ -10,3 +11,6 @@
 
 	  dmraid uses the Linux device-mapper to create devices with
 	  respective mappings for the ATARAID sets discovered.
+
+comment "dmraid requires a toolchain with LARGEFILE support"
+	depends on !BR2_LARGEFILE
