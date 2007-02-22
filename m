From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 22 Feb 2007 00:53:20 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070222085320.242BC4859B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-22 00:53:20 -0800 (Thu, 22 Feb 2007)
New Revision: 17950

Log:
0.9.28.2 support

Modified:
   trunk/buildroot/toolchain/uClibc/Config.in
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/Config.in
===================================================================
--- trunk/buildroot/toolchain/uClibc/Config.in	2007-02-21 23:46:45 UTC (rev 17949)
+++ trunk/buildroot/toolchain/uClibc/Config.in	2007-02-22 08:53:20 UTC (rev 17950)
@@ -14,8 +14,12 @@
 		bool "uClibc 0.9.28"
 
 	config BR2_UCLIBC_VERSION_0_9_28_1
+		depends BR2_DEPRECATED
 		bool "uClibc 0.9.28.1"
 
+	config BR2_UCLIBC_VERSION_0_9_28_2
+		bool "uClibc 0.9.28.2"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-21 23:46:45 UTC (rev 17949)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-22 08:53:20 UTC (rev 17950)
@@ -17,6 +17,9 @@
 UCLIBC_CONFIG_FILE=toolchain/uClibc/uClibc-0.9.29.config
 endif
 else
+ifeq ($(BR2_UCLIBC_VERSION_0_9_28_2),y)
+UCLIBC_VER:=0.9.28.2
+endif
 ifeq ($(BR2_UCLIBC_VERSION_0_9_28_1),y)
 UCLIBC_VER:=0.9.28.1
 endif
