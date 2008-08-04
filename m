From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:36 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190736.573463C89F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:36 -0700 (Mon, 04 Aug 2008)
New Revision: 23023

Log:
package: more BR2_PACKAGE_BUSYBOX_HIDE_OTHERS annotations

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-04 19:07:33 UTC (rev 23022)
+++ trunk/buildroot/package/Config.in	2008-08-04 19:07:36 UTC (rev 23023)
@@ -4,13 +4,11 @@
 
 comment "The minimum needed to build a uClibc development system"
 
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/bash/Config.in"
 source "package/bzip2/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/coreutils/Config.in"
-endif
 source "package/diffutils/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/findutils/Config.in"
 endif
 source "package/flex/Config.in"
@@ -106,8 +104,6 @@
 endif
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/psmisc/Config.in"
-endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/rpm/Config.in"
 endif
 source "package/screen/Config.in"
@@ -118,14 +114,8 @@
 source "package/sysklogd/Config.in"
 # busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
-endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/tinylogin/Config.in"
-endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/util-linux/Config.in"
-endif
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/which/Config.in"
 endif
 
