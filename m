From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  4 Aug 2008 12:07:30 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20080804190730.9AC5D3C87E@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-08-04 12:07:29 -0700 (Mon, 04 Aug 2008)
New Revision: 23021

Log:
dash: hide if BR2_PACKAGE_BUSYBOX_HIDE_OTHERS

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-04 19:07:26 UTC (rev 23020)
+++ trunk/buildroot/package/Config.in	2008-08-04 19:07:29 UTC (rev 23021)
@@ -69,7 +69,9 @@
 endif
 source "package/cups/Config.in"
 source "package/customize/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/dash/Config.in"
+endif
 source "package/file/Config.in"
 source "package/gamin/Config.in"
 source "package/icu/Config.in"
