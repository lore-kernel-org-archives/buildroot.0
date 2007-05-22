From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 22 May 2007 00:40:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgtk12
Message-ID: <20070522074039.8C2DF48089@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-05-22 00:40:36 -0700 (Tue, 22 May 2007)
New Revision: 18664

Log:
Use select instead of depends for dependencies

Modified:
   trunk/buildroot/package/libgtk12/Config.in


Changeset:
Modified: trunk/buildroot/package/libgtk12/Config.in
===================================================================
--- trunk/buildroot/package/libgtk12/Config.in	2007-05-21 23:30:54 UTC (rev 18663)
+++ trunk/buildroot/package/libgtk12/Config.in	2007-05-22 07:40:36 UTC (rev 18664)
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_LIBGTK12
 	bool "libgtk12"
 	default n
-	depends BR2_PACKAGE_LIBGLIB12
-	depends BR2_PACKAGE_XORG
+	select BR2_PACKAGE_LIBGLIB12
+	select BR2_PACKAGE_XORG
 	help
 	  The GTK+ graphical user interface library
 
