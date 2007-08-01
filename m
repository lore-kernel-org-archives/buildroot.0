From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 02:06:04 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
Message-ID: <20070801090604.DC3E5A60E7@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 02:06:04 -0700 (Wed, 01 Aug 2007)
New Revision: 19384

Log:
Don't allow std sources for AVR32

Modified:
   trunk/buildroot/target/device/Toolchain.in


Changeset:
Modified: trunk/buildroot/target/device/Toolchain.in
===================================================================
--- trunk/buildroot/target/device/Toolchain.in	2007-08-01 08:58:14 UTC (rev 19383)
+++ trunk/buildroot/target/device/Toolchain.in	2007-08-01 09:06:04 UTC (rev 19384)
@@ -10,6 +10,7 @@
 config BR2_TOOLCHAIN_NORMAL
 	bool
 	prompt "Use default sources for toolchain"
+	depends on !BR2_avr32
 	help
 	  Download vanilla binutils, gcc, uclibc and gdb from their 
 	  main download locations, and apply patches from the
