From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Wed, 10 Dec 2008 16:33:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20081211003330.E50163C7CE@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-10 16:33:30 -0800 (Wed, 10 Dec 2008)
New Revision: 24365

Log:
package/boa: hide if BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-10 23:54:18 UTC (rev 24364)
+++ trunk/buildroot/package/Config.in	2008-12-11 00:33:30 UTC (rev 24365)
@@ -128,7 +128,9 @@
 source "package/argus/Config.in"
 source "package/avahi/Config.in"
 source "package/axel/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/boa/Config.in"
+endif
 source "package/bind/Config.in"
 source "package/bridge-utils/Config.in"
 source "package/curl/Config.in"
