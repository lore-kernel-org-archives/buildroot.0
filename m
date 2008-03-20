From: ulf at uclibc.org <ulf@uclibc.org>
Date: Thu, 20 Mar 2008 15:07:49 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Soekris
Message-ID: <20080320220749.8E9AC3C342@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-03-20 15:07:49 -0700 (Thu, 20 Mar 2008)
New Revision: 21420

Log:
Do not include Soekris, unless i386 arch

Modified:
   trunk/buildroot/target/device/Soekris/Config.in
   trunk/buildroot/target/device/Soekris/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/Soekris/Config.in
===================================================================
--- trunk/buildroot/target/device/Soekris/Config.in	2008-03-20 22:06:10 UTC (rev 21419)
+++ trunk/buildroot/target/device/Soekris/Config.in	2008-03-20 22:07:49 UTC (rev 21420)
@@ -1,6 +1,11 @@
+menuconfig BR2_TARGET_SOEKRIS
+	bool "Soekris device support"
+	depends BR2_i386
+	default n
+
+if BR2_TARGET_SOEKRIS
 config BR2_TARGET_SOEKRIS_NET4521
 	bool "Soekris net4521"
-	depends BR2_i386
 	default n
 	select BR2_PACKAGE_LINUX
 	help
@@ -17,3 +22,4 @@
 comment "Package support"
 	depends on BR2_TARGET_SOEKRIS_NET4521 || BR2_TARGET_SOEKRIS_NET4801
 
+endif

Modified: trunk/buildroot/target/device/Soekris/Makefile.in
===================================================================
--- trunk/buildroot/target/device/Soekris/Makefile.in	2008-03-20 22:06:10 UTC (rev 21419)
+++ trunk/buildroot/target/device/Soekris/Makefile.in	2008-03-20 22:07:49 UTC (rev 21420)
@@ -1,4 +1,6 @@
 # Override the default uClibc configuration
+ifeq ($(strip $(BR2_TARGET_SOEKRIS)),y)
+
 ifeq ($(strip $(BR2_TARGET_SOEKRIS_NET4521)),y)
 UCLIBC_CONFIG_FILE:=target/device/Soekris/net4521/uClibc.config
 BR2_PACKAGE_BUSYBOX_CONFIG:=target/device/Soekris/net4521/busybox.config
@@ -24,3 +26,4 @@
 endif
 
 endif
+endif
