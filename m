From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 30 Oct 2007 13:05:25 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20071030200525.50954A45D3@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-10-30 13:05:25 -0700 (Tue, 30 Oct 2007)
New Revision: 20334

Log:
Use logical OR instead of AND, Thanks Hamish

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-10-30 19:54:39 UTC (rev 20333)
+++ trunk/buildroot/package/Config.in	2007-10-30 20:05:25 UTC (rev 20334)
@@ -156,7 +156,7 @@
 source "package/links/Config.in"
 source "package/lrzsz/Config.in"
 source "package/mdnsresponder/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS && !BR2_PACKAGE_BUSYBOX_SNAPSHOT
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS || !BR2_PACKAGE_BUSYBOX_SNAPSHOT
 source "package/microcom/Config.in"
 endif
 source "package/mrouted/Config.in"
