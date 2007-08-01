From: ulf at uclibc.org <ulf@uclibc.org>
Date: Wed,  1 Aug 2007 12:15:14 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
Message-ID: <20070801191514.0E763A604A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-01 12:15:14 -0700 (Wed, 01 Aug 2007)
New Revision: 19393

Log:
F77 is not supported on AVR32

Modified:
   trunk/buildroot/toolchain/gcc/Config.in


Changeset:
Modified: trunk/buildroot/toolchain/gcc/Config.in
===================================================================
--- trunk/buildroot/toolchain/gcc/Config.in	2007-08-01 19:13:18 UTC (rev 19392)
+++ trunk/buildroot/toolchain/gcc/Config.in	2007-08-01 19:15:14 UTC (rev 19393)
@@ -155,6 +155,7 @@
 config BR2_GCC_CROSS_FORTRAN
 	bool "Fortran cross-compiler support"
 	default n
+	depends on !BR2_avr32
 	help
 	  Build a Fortran cross-compiler
 
