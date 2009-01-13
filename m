From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 13 Jan 2009 15:09:19 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain: kernel-headers
	uClibc
Message-ID: <20090113150919.6046D76850@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-13 15:09:18 +0000 (Tue, 13 Jan 2009)
New Revision: 24814

Log:
toolchain: sh64 fixes

- arch/sh and arch/sh64 got merged in 2.6.25, so use arch/sh for sh64 as well
- use little endian for sh64, like for 32bit sh

sh64 still doesn't build, but gets further along now.

Modified:
   trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk
===================================================================
--- trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-13 10:37:48 UTC (rev 24813)
+++ trunk/buildroot/toolchain/kernel-headers/kernel-headers.mk	2009-01-13 15:09:18 UTC (rev 24814)
@@ -20,8 +20,7 @@
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
-	-e s/sh2.*/sh/ -e s/sh3.*/sh/ -e s/sh4.*/sh/ \
-	-e s/nios2.*/nios2nommu/")
+	-e s/sh.*/sh/ -e s/nios2.*/nios2nommu/")
 
 # assume old manually sanitized kernel-headers
 LINUX_HEADERS_IS_KERNEL=n

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-13 10:37:48 UTC (rev 24813)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-13 15:09:18 UTC (rev 24814)
@@ -72,8 +72,8 @@
 		-e 's/arm/LITTLE/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
-		-e 's/sh[234].*eb/BIG/' \
-		-e 's/sh[234]/LITTLE/' \
+		-e 's/sh.*eb/BIG/' \
+		-e 's/sh.*/LITTLE/' \
 		-e 's/sparc.*/BIG/' \
 ")
 
