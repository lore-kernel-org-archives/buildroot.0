From: sjhill at uclibc.org <sjhill@uclibc.org>
Date: Tue,  6 Feb 2007 10:11:59 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/usbmount
Message-ID: <20070206181159.61EA648633@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: sjhill
Date: 2007-02-06 10:11:59 -0800 (Tue, 06 Feb 2007)
New Revision: 17796

Log:
Satisfy dependency.


Modified:
   trunk/buildroot/package/usbmount/Config.in


Changeset:
Modified: trunk/buildroot/package/usbmount/Config.in
===================================================================
--- trunk/buildroot/package/usbmount/Config.in	2007-02-06 18:09:54 UTC (rev 17795)
+++ trunk/buildroot/package/usbmount/Config.in	2007-02-06 18:11:59 UTC (rev 17796)
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_USBMOUNT
 	bool "usbmount"
 	default n
+	select BR2_PACKAGE_UDEV_VOLUME_ID
 	help
 	  The usbmount package automatically mounts USB mass storage devices
 	  when they are plugged in, and unmounts them when they are removed.
