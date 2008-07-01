From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  1 Jul 2008 14:36:32 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20080701213632.363AB3C67C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-07-01 14:36:31 -0700 (Tue, 01 Jul 2008)
New Revision: 22600

Log:
Add gdb-6.8 support, courtesy Fathi Boudra

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-07-01 21:36:11 UTC (rev 22599)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-07-01 21:36:31 UTC (rev 22600)
@@ -52,6 +52,10 @@
 		bool "gdb 6.7.1"
 		depends on !BR2_avr32
 
+	config BR2_GDB_VERSION_6_8
+		bool "gdb 6.8"
+		depends on !BR2_avr32
+
 	config BR2_GDB_VERSION_SNAPSHOT
 		bool "gdb snapshot"
 		depends on !BR2_avr32 && !BR2_nios2
@@ -66,4 +70,5 @@
 	default "6.5"      if BR2_GDB_VERSION_6_5
 	default "6.6"      if BR2_GDB_VERSION_6_6
 	default "6.7.1"    if BR2_GDB_VERSION_6_7_1
+	default "6.8"      if BR2_GDB_VERSION_6_8
 	default "snapshot" if BR2_GDB_VERSION_SNAPSHOT
