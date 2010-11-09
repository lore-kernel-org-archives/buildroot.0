From: Darcy Watkins <dwatkins@tranzeo.com>
Date: Tue, 09 Nov 2010 07:48:12 -0800
Subject: [Buildroot] Buildroot Patches I Use [1] - Cross Target Fix
Message-ID: <1289317692.30565.107.camel@tr-pentomino>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch makes sure that if you only want to build as far as the
"cross" target, that the base dependencies, etc are covered.  This could
be considered for 2010.11 if you think appropriate.


Signed-off by: Darcy Watkins <dwatkins@tranzeo.com>

Index: buildroot-2010.11_powerpc/Makefile
===================================================================
--- buildroot-2010.11_powerpc.orig/Makefile
+++ buildroot-2010.11_powerpc/Makefile
@@ -593,7 +593,7 @@ configured: dirs kernel-headers uclibc-c
 
 prepatch:	gcc-patched binutils-patched gdb-patched uclibc-patched
 
-cross: $(BASE_TARGETS)
+cross: dependencies dirs $(BASE_TARGETS)
 
 help:
 	@echo 'Cleaning:'
