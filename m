From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon,  8 Dec 2008 00:54:14 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gdb
Message-ID: <20081208085414.3FAC73C6C6@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-08 00:54:14 -0800 (Mon, 08 Dec 2008)
New Revision: 24313

Log:
toolchain/gdb: 6.4 shouldn't be selectable for avr32

Modified:
   trunk/buildroot/toolchain/gdb/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gdb/Config.in
===================================================================
--- trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:46:52 UTC (rev 24312)
+++ trunk/buildroot/toolchain/gdb/Config.in	2008-12-08 08:54:14 UTC (rev 24313)
@@ -37,7 +37,7 @@
 
 	config BR2_GDB_VERSION_6_4
 		bool "gdb 6.4"
-		depends on !BR2_nios2
+		depends on !BR2_avr32 && !BR2_nios2
 		depends on BR2_DEPRECATED
 
 	config BR2_GDB_VERSION_6_5
