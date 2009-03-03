From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue,  3 Mar 2009 09:41:16 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot: target/device
	toolchain/uClibc
Message-ID: <20090303094117.1EFC37719F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-03-03 09:41:15 +0000 (Tue, 03 Mar 2009)
New Revision: 25500

Log:
uclibc: add 0.9.30.1

Modified:
   trunk/buildroot/target/device/Config.in.toolchain
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2009-03-03 08:52:56 UTC (rev 25499)
+++ trunk/buildroot/target/device/Config.in.toolchain	2009-03-03 09:41:15 UTC (rev 25500)
@@ -214,3 +214,6 @@
 	bool
 	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
 
+config	BR2_EXT_UCLIBC_VERSION_0_9_30_1
+	bool
+	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE

Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2009-03-03 08:52:56 UTC (rev 25499)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2009-03-03 09:41:15 UTC (rev 25500)
@@ -5,7 +5,7 @@
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30
+	default BR2_UCLIBC_VERSION_0_9_30_1
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -15,14 +15,19 @@
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_28_3
 
 	config BR2_UCLIBC_VERSION_0_9_29
-		depends on BR2_DEPRECATED || BR2_RECENT
+		depends on BR2_DEPRECATED
 		bool "uClibc 0.9.29"
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_29
 
 	config BR2_UCLIBC_VERSION_0_9_30
+		depends on BR2_RECENT || BR2_DEPRECATED
 		bool "uClibc 0.9.30"
 		depends on BR2_EXT_UCLIBC_VERSION_0_9_30
 
+	config BR2_UCLIBC_VERSION_0_9_30_1
+		bool "uClibc 0.9.30.1"
+		depends on BR2_EXT_UCLIBC_VERSION_0_9_30_1
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -41,6 +46,7 @@
 	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28_3
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
+	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-03-03 08:52:56 UTC (rev 25499)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-03-03 09:41:15 UTC (rev 25500)
@@ -23,6 +23,9 @@
 UCLIBC_PATCH_DIR:=toolchain/uClibc/
 else
 # releases
+ifeq ($(BR2_UCLIBC_VERSION_0_9_30_1),y)
+UCLIBC_VER:=0.9.30.1
+endif
 ifeq ($(BR2_UCLIBC_VERSION_0_9_30),y)
 UCLIBC_VER:=0.9.30
 endif
