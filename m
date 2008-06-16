From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 16 Jun 2008 00:15:39 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/elf2flt
Message-ID: <20080616071539.E65EEF8018@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-06-16 00:15:33 -0700 (Mon, 16 Jun 2008)
New Revision: 22364

Log:
elf2flt: only allow it to be selected on supported archs


Modified:
   trunk/buildroot/toolchain/elf2flt/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/elf2flt/Config.in
===================================================================
--- trunk/buildroot/toolchain/elf2flt/Config.in	2008-06-16 07:12:19 UTC (rev 22363)
+++ trunk/buildroot/toolchain/elf2flt/Config.in	2008-06-16 07:15:33 UTC (rev 22364)
@@ -1,8 +1,6 @@
-comment "elf2flt"
-
 config BR2_ELF2FLT
 	bool "Enable elf2flt support?"
-	depends !BR2_alpha && !BR2_x86_64
+	depends on BR2_arm || BR2_sh || BR2_sparc
 	default n
 	help
 	  uCLinux uses a Binary Flat format commonly known as BFLT. It
