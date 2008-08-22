From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 22 Aug 2008 07:24:51 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080822142451.9BA653C360@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-22 07:24:51 -0700 (Fri, 22 Aug 2008)
New Revision: 23180

Log:
package: don't hide xorg/tinyx selection

Hiding xorg/tinyx selections until the user unselects "none" seems quite
unintuitive.

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-22 14:01:56 UTC (rev 23179)
+++ trunk/buildroot/package/Config.in	2008-08-22 14:24:51 UTC (rev 23180)
@@ -353,10 +353,8 @@
 	default y
 config BR2_PACKAGE_XSERVER_xorg
 	bool "modular xorg"
-	depends on !BR2_PACKAGE_XSERVER_none
 config BR2_PACKAGE_XSERVER_tinyx
 	bool "tinyx"
-	depends on !BR2_PACKAGE_XSERVER_none
 endmenu
 
 config BR2_X11_PREFIX
