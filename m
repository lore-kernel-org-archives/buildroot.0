From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 27 Jan 2007 15:11:17 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/jffs2
Message-ID: <20070127231117.8090148576@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-01-27 15:11:16 -0800 (Sat, 27 Jan 2007)
New Revision: 17563

Log:
- fix dependencies


Modified:
   trunk/buildroot/target/jffs2/Config.in


Changeset:
Modified: trunk/buildroot/target/jffs2/Config.in
===================================================================
--- trunk/buildroot/target/jffs2/Config.in	2007-01-27 22:47:08 UTC (rev 17562)
+++ trunk/buildroot/target/jffs2/Config.in	2007-01-27 23:11:16 UTC (rev 17563)
@@ -12,6 +12,7 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_PAGESIZE
 	hex "Page Size (0x0 = Use default 4 kB)"
+	depends on BR2_TARGET_ROOTFS_JFFS2
 	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
 	default 0x420
 	help
@@ -19,6 +20,7 @@
 
 config BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER
 	bool	"Do not use Cleanmarker"
+	depends on BR2_TARGET_ROOTFS_JFFS2
 	depends on !BR2_TARGET_ROOTFS_JFFS2_DEFAULT_PAGESIZE
 	default y
 	help
