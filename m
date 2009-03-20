From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Mar 2009 21:59:38 +0000 (UTC)
Subject: [Buildroot] svn commit: [25774] trunk/buildroot/target/device/AMD
Message-ID: <20090320215938.554E77656C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-20 21:59:37 +0000 (Fri, 20 Mar 2009)
New Revision: 25774

Log:
target/device: wrap AMD preset in BR2_TARGET_AMD menuconfig

Modified:
   trunk/buildroot/target/device/AMD/Config.in


Changeset:
Modified: trunk/buildroot/target/device/AMD/Config.in
===================================================================
--- trunk/buildroot/target/device/AMD/Config.in	2009-03-20 14:04:00 UTC (rev 25773)
+++ trunk/buildroot/target/device/AMD/Config.in	2009-03-20 21:59:37 UTC (rev 25774)
@@ -1,3 +1,8 @@
+menuconfig BR2_TARGET_AMD
+	bool "AMD Specific Device Support"
+
+if BR2_TARGET_AMD
+
 comment "AMD Specific Device Support"
 	depends on BR2_mipsel || BR2_mips
 
@@ -17,3 +22,4 @@
 comment "Package support"
 	depends on BR2_TARGET_AMD_ALCHEMY
 
+endif
