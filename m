From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 26 Aug 2008 06:45:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk2
Message-ID: <20080826134539.B2B273C7D5@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-26 06:45:39 -0700 (Tue, 26 Aug 2008)
New Revision: 23206

Log:
select CUPS if XORG/XORG7/TINYX.
This makes the behaviour the same as before for X users. 
Although is CUPS a necessary dependancy?

Daniel Laird





Modified:
   trunk/buildroot/package/libgtk2/Config.in


Changeset:
Modified: trunk/buildroot/package/libgtk2/Config.in
===================================================================
--- trunk/buildroot/package/libgtk2/Config.in	2008-08-26 13:03:05 UTC (rev 23205)
+++ trunk/buildroot/package/libgtk2/Config.in	2008-08-26 13:45:39 UTC (rev 23206)
@@ -2,6 +2,7 @@
 	bool "libgtk2"
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CUPS if BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7||BR2_PACKAGE_TINYX
 	select BR2_PACKAGE_JPEG
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBPNG
