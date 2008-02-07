From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu,  7 Feb 2008 02:59:01 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080207105901.5A0FB12C65B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2008-02-07 02:59:00 -0800 (Thu, 07 Feb 2008)
New Revision: 20953

Log:
updated gdb support for nios2, thanks Atle

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-02-07 07:06:49 UTC (rev 20952)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-02-07 10:59:00 UTC (rev 20953)
@@ -30,18 +30,19 @@
 
 	config BR2_GDB_VERSION_6_2_1
 		bool "gdb 6.2.1"
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 
 	config BR2_GDB_VERSION_6_3
 		bool "gdb 6.3"
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 
 	config BR2_GDB_VERSION_6_4
 		bool "gdb 6.4"
+		depends on !BR2_nios2
 
 	config BR2_GDB_VERSION_6_5
 		bool "gdb 6.5"
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 
 	config BR2_GDB_VERSION_6_6
 		bool "gdb 6.6"
@@ -49,7 +50,7 @@
 
 	config BR2_GDB_VERSION_SNAPSHOT
 		bool "gdb snapshot"
-		depends on !BR2_avr32
+		depends on !BR2_avr32 && !BR2_nios2
 
 endchoice
 
