From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:52 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190752.0A96D3C8BD@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:51 -0700 (Mon, 04 Aug 2008)
New Revision: 23028

Log:
package: add package managers sub menu

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-04 19:07:48 UTC (rev 23027)
+++ trunk/buildroot/package/Config.in	2008-08-04 19:07:51 UTC (rev 23028)
@@ -73,7 +73,6 @@
 source "package/file/Config.in"
 source "package/gamin/Config.in"
 source "package/icu/Config.in"
-source "package/ipkg/Config.in"
 source "package/kexec/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/less/Config.in"
@@ -98,13 +97,11 @@
 endif
 source "package/ng-spice-rework/Config.in"
 source "package/popt/Config.in"
-source "package/portage/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/procps/Config.in"
 endif
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
-source "package/rpm/Config.in"
 endif
 source "package/screen/Config.in"
 source "package/startup-notification/Config.in"
@@ -436,6 +433,20 @@
 source "package/zlib/Config.in"
 endif
 
+menuconfig BR2_PACKAGEMGRS_SUPPORT
+	bool "Package managers"
+	default y
+	help
+	  Support for package managers like rpm, portage, ipkg, ..
+
+if BR2_PACKAGEMGRS_SUPPORT
+source "package/ipkg/Config.in"
+source "package/portage/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
+source "package/rpm/Config.in"
+endif
+endif
+
 menuconfig BR2_SCRIPTING_SUPPORT
 	bool "Interpreter languages / Scripting"
 	default y
