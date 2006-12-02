From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat,  2 Dec 2006 11:36:30 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20061202193630.369DC4863D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2006-12-02 11:36:29 -0800 (Sat, 02 Dec 2006)
New Revision: 16769

Log:
- provide default config for busybox for a generic i386 target.


Modified:
   trunk/buildroot/package/busybox/Config.in


Changeset:
Modified: trunk/buildroot/package/busybox/Config.in
===================================================================
--- trunk/buildroot/package/busybox/Config.in	2006-12-02 19:34:17 UTC (rev 16768)
+++ trunk/buildroot/package/busybox/Config.in	2006-12-02 19:36:29 UTC (rev 16769)
@@ -34,7 +34,8 @@
 config BR2_PACKAGE_BUSYBOX_CONFIG
 	string "BusyBox configuration file to use?"
 	depends BR2_PACKAGE_BUSYBOX
-	default "package/busybox/busybox.config"
+	default "package/busybox/busybox.config" if !BR2_i386
+	default "target/device/x86/i386/busybox.config" if BR2_i386
 	help
 	  Some people may wish to use their own modified BusyBox configuration
 	  file, and will specify their config file location with this option.
