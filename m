From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sat, 20 Dec 2008 21:45:59 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20081220214559.B12E476CEB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-12-20 21:45:59 +0000 (Sat, 20 Dec 2008)
New Revision: 24467

Log:
Use correct linux version when applying latest minor patch

Modified:
   trunk/buildroot/target/linux/Config.in.advanced


Changeset:
Modified: trunk/buildroot/target/linux/Config.in.advanced
===================================================================
--- trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 21:45:05 UTC (rev 24466)
+++ trunk/buildroot/target/linux/Config.in.advanced	2008-12-20 21:45:59 UTC (rev 24467)
@@ -412,7 +412,7 @@
 	default "2.6.21.7" if BR2_LINUX_2_6_21_7
 	default "2.6.22.1" if BR2_LINUX_2_6_22_1
 	default "2.6.22.10" if BR2_LINUX_2_6_22_10
-	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE
+	default "$(BR2_KERNEL_CURRENT_VERSION)"if BR2_LINUX_2_6_STABLE || BR2_KERNEL_ADD_LATEST_MINORPATCH
 	default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX26_CUSTOM
 
 menu "Linux Kernel Configuration"
