From: andersen at uclibc.org <andersen@uclibc.org>
Date: Fri, 17 Nov 2006 15:17:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/xorg
Message-ID: <20061117231703.722E548639@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-11-17 15:17:02 -0800 (Fri, 17 Nov 2006)
New Revision: 16573

Log:
fix deps so xorg can once again be selected


Modified:
   trunk/buildroot/package/xorg/Config.in


Changeset:
Modified: trunk/buildroot/package/xorg/Config.in
===================================================================
--- trunk/buildroot/package/xorg/Config.in	2006-11-17 22:58:29 UTC (rev 16572)
+++ trunk/buildroot/package/xorg/Config.in	2006-11-17 23:17:02 UTC (rev 16573)
@@ -2,8 +2,8 @@
 	bool "X.org X Window System"
 	default n
 	depends !BR2_PACKAGE_TINYX
-	depends BR2_PACKAGE_ZLIB
-	depends BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_LIBPNG
 	help
 	  The official X Window system and server.
 
