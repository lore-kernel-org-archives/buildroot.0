From: ulf at uclibc.org <ulf@uclibc.org>
Date: Sun, 19 Aug 2007 23:23:01 -0700 (PDT)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0
Message-ID: <20070820062301.E3852A459C@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2007-08-19 23:23:00 -0700 (Sun, 19 Aug 2007)
New Revision: 19586

Log:
install uClibc libraries correctly

Added:
   trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-001-libext.patch


Changeset:
Added: trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-001-libext.patch
===================================================================
--- trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-001-libext.patch	                        (rev 0)
+++ trunk/buildroot/target/device/Atmel/toolchain/avr32/uClibc-0.9.28.3-avr32-2.0/uClibc-0.9.28.3-001-libext.patch	2007-08-20 06:23:00 UTC (rev 19586)
@@ -0,0 +1,13 @@
+diff -urN uClibc-0.9.28.3-0rig/Makefile uClibc-0.9.28.3/Makefile
+--- uClibc-0.9.28.3-0rig/Makefile	2007-07-29 08:20:33.000000000 +0200
++++ uClibc-0.9.28.3/Makefile	2007-08-20 07:02:53.000000000 +0200
+@@ -157,7 +157,8 @@
+ install_dev:
+ 	$(INSTALL) -d $(PREFIX)$(DEVEL_PREFIX)lib
+ 	$(INSTALL) -d $(PREFIX)$(DEVEL_PREFIX)include
+-	-$(INSTALL) -m 644 lib/*.[ao] $(PREFIX)$(DEVEL_PREFIX)lib/
++	-$(INSTALL) -m 644 lib/*.a $(PREFIX)$(DEVEL_PREFIX)lib/
++	-$(INSTALL) -m 644 lib/*.so* $(PREFIX)$(DEVEL_PREFIX)lib/
+ 	if [ "$(KERNEL_SOURCE)" = "$(DEVEL_PREFIX)" ] ; then \
+ 		extra_exclude="--exclude include/linux --exclude include/asm'*'" ; \
+ 	else \
