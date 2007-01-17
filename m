From: aldot at uclibc.org <aldot@uclibc.org>
Date: Wed, 17 Jan 2007 04:28:24 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package
Message-ID: <20070117122824.7288948563@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-17 04:28:23 -0800 (Wed, 17 Jan 2007)
New Revision: 17339

Log:
- wrap external sysklogd in !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS


Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2007-01-17 12:27:27 UTC (rev 17338)
+++ trunk/buildroot/package/Config.in	2007-01-17 12:28:23 UTC (rev 17339)
@@ -136,8 +136,8 @@
 source "package/sqlite/Config.in"
 source "package/strace/Config.in"
 source "package/sudo/Config.in"
+if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/sysklogd/Config.in"
-if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 # busybox has init and the runit stuff
 source "package/sysvinit/Config.in"
 endif
