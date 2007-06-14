From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 14 Jun 2007 06:09:09 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package/busybox
Message-ID: <20070614130909.D2C8548088@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-06-14 06:09:06 -0700 (Thu, 14 Jun 2007)
New Revision: 18822

Log:
busybox 1.6.0 patches

Added:
   trunk/buildroot/package/busybox/busybox-1.6.0-echo.patch
   trunk/buildroot/package/busybox/busybox-1.6.0-hushdep.patch


Changeset:
Added: trunk/buildroot/package/busybox/busybox-1.6.0-echo.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.6.0-echo.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.6.0-echo.patch	2007-06-14 13:09:06 UTC (rev 18822)
@@ -0,0 +1,11 @@
+--- busybox-1.6.0/coreutils/echo.c	Fri Jun  1 13:48:34 2007
++++ busybox-1.6.0-echo/coreutils/echo.c	Wed Jun  6 09:49:18 2007
+@@ -33,7 +33,7 @@
+ 		eflag = '\\',
+ 		nflag = 1,  /* 1 -- print '\n' */
+ 	};
+-	++argv;
++	arg = ++argv;
+ #else
+ 	const char *p;
+ 	char nflag = 1;

Added: trunk/buildroot/package/busybox/busybox-1.6.0-hushdep.patch
===================================================================
--- trunk/buildroot/package/busybox/busybox-1.6.0-hushdep.patch	                        (rev 0)
+++ trunk/buildroot/package/busybox/busybox-1.6.0-hushdep.patch	2007-06-14 13:09:06 UTC (rev 18822)
@@ -0,0 +1,32 @@
+--- busybox-1.6.0/shell/Config.in	Fri Jun  1 13:48:33 2007
++++ busybox-1.6.0-hushdep/shell/Config.in	Sun Jun 10 01:02:47 2007
+@@ -179,6 +179,7 @@
+ config HUSH_HELP
+ 	bool "help builtin"
+ 	default n
++	depends on HUSH
+ 	help
+ 	  Enable help builtin in hush. Code size + ~1 kbyte.
+ 
+@@ -206,18 +207,21 @@
+ config HUSH_TICK
+ 	bool "Process substitution"
+ 	default n
++	depends on HUSH
+ 	help
+ 	  Enable process substitution `command` and $(command) in hush.
+ 
+ config HUSH_IF
+ 	bool "Support if/then/elif/else/fi"
+ 	default n
++	depends on HUSH
+ 	help
+ 	  Enable if/then/elif/else/fi in hush.
+ 
+ config HUSH_LOOPS
+ 	bool "Support for, while and until loops"
+ 	default n
++	depends on HUSH
+ 	help
+ 	  Enable for, while and until loops in hush.
+ 
