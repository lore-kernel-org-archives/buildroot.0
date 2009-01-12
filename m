From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 20:58:55 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/target
Message-ID: <20090112205855.D227C76724@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 20:58:54 +0000 (Mon, 12 Jan 2009)
New Revision: 24806

Log:
buildroot: mark ia64, m68k, nios2, sparc and sparc64 as broken

No sense in showing the architecture options when they cannot even build
the toolchain.

Modified:
   trunk/buildroot/target/Config.in.arch


Changeset:
Modified: trunk/buildroot/target/Config.in.arch
===================================================================
--- trunk/buildroot/target/Config.in.arch	2009-01-12 20:16:16 UTC (rev 24805)
+++ trunk/buildroot/target/Config.in.arch	2009-01-12 20:58:54 UTC (rev 24806)
@@ -13,21 +13,23 @@
 config BR2_avr32
 	bool "avr32"
 	select BR2_SOFT_FLOAT
-
 config BR2_cris
 	bool "cris"
 config BR2_ia64
 	bool "ia64"
+	depends on BROKEN # uclibc linker errors
 config BR2_i386
 	bool "i386"
 config BR2_m68k
 	bool "m68k"
+	depends on BROKEN # ice in uclibc / inet_ntoa_r
 config BR2_mips
 	bool "mips"
 config BR2_mipsel
 	bool "mipsel"
 config BR2_nios2
 	bool "nios2"
+	depends on BROKEN # no kernel headers
 config BR2_powerpc
 	bool "powerpc"
 config BR2_sh
@@ -36,8 +38,10 @@
 	bool "superh64"
 config BR2_sparc
 	bool "sparc"
+	depends on BROKEN # uclibc linker errors
 config BR2_sparc64
 	bool "sparc64"
+	depends on BROKEN # uclibc libm linker errors
 config BR2_x86_64
 	bool "x86_64"
 endchoice
