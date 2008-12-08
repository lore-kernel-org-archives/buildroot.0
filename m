From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 05:41:53 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/udev
Message-ID: <20081208134153.7C8263C6DD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 05:41:53 -0800 (Mon, 08 Dec 2008)
New Revision: 24318

Log:
package/udev: fix dependency for scsi_id

According to udev.mk, the scsi_id package depends on the libvolume_id
library, so add this dependency to Config.mk

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>

Modified:
   trunk/buildroot/package/udev/Config.in


Changeset:
Modified: trunk/buildroot/package/udev/Config.in
===================================================================
--- trunk/buildroot/package/udev/Config.in	2008-12-08 13:12:42 UTC (rev 24317)
+++ trunk/buildroot/package/udev/Config.in	2008-12-08 13:41:53 UTC (rev 24318)
@@ -23,7 +23,7 @@
 
 config BR2_PACKAGE_UDEV_SCSI_ID
 	bool "udev-scsi_id"
-	depends on BR2_PACKAGE_UDEV
+	depends on BR2_PACKAGE_UDEV_VOLUME_ID
 	help
 	  Build and install SCSI disk identification library.
 
