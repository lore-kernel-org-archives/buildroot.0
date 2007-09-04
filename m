From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  4 Sep 2007 09:22:41 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1
Message-ID: <20070904162241.DD294A6AA9@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-09-04 09:22:41 -0700 (Tue, 04 Sep 2007)
New Revision: 19781

Log:
Add include file to define at91 lcd struct

Added:
   trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-006-lcd.patch


Changeset:
Added: trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-006-lcd.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-006-lcd.patch	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/linux/kernel-patches-2.6.22.1/linux-2.6.22.1-006-lcd.patch	2007-09-04 16:22:41 UTC (rev 19781)
@@ -0,0 +1,12 @@
+diff -urN linux-2.6.22.1-atmel-0rig/arch/arm/mach-at91/at91sam9261_devices.c linux-2.6.22.1-atmel/arch/arm/mach-at91/at91sam9261_devices.c
+--- linux-2.6.22.1-atmel-0rig/arch/arm/mach-at91/at91sam9261_devices.c	2007-07-10 20:56:30.000000000 +0200
++++ linux-2.6.22.1-atmel/arch/arm/mach-at91/at91sam9261_devices.c	2007-09-04 16:09:54.000000000 +0200
+@@ -20,7 +20,7 @@
+ #include <asm/arch/at91sam9261.h>
+ #include <asm/arch/at91sam9261_matrix.h>
+ #include <asm/arch/at91sam926x_mc.h>
+-
++#include <video/atmel_lcdc.h>
+ #include "generic.h"
+ 
+ 
