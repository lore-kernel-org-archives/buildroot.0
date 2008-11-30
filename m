From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 30 Nov 2008 01:51:58 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/kernel-headers
Message-ID: <20081130095158.3B7A23C632@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-11-30 01:51:57 -0800 (Sun, 30 Nov 2008)
New Revision: 24193

Log:
kernel-headers: also show 2.6.26 if deprecated is enabled, but recent isn't

Modified:
   trunk/buildroot/toolchain/kernel-headers/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/Config.in
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-29 23:14:37 UTC (rev 24192)
+++ trunk/buildroot/toolchain/kernel-headers/Config.in	2008-11-30 09:51:57 UTC (rev 24193)
@@ -61,7 +61,7 @@
 		bool "Linux 2.6.25.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_26
-		depends on BR2_RECENT
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "Linux 2.6.26.x kernel headers"
 
 	config BR2_KERNEL_HEADERS_2_6_27
