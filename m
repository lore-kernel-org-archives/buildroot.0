From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Tue, 20 Feb 2007 03:06:00 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070220110600.D4B2948627@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-02-20 03:06:00 -0800 (Tue, 20 Feb 2007)
New Revision: 17934

Log:
Really propagate BR2_SOFT_FLOAT setting to 0.9.28.1

Modified:
   trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config
===================================================================
--- trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2007-02-19 22:45:43 UTC (rev 17933)
+++ trunk/buildroot/toolchain/uClibc/uClibc-0.9.28.config	2007-02-20 11:06:00 UTC (rev 17934)
@@ -38,6 +38,7 @@
 ARCH_HAS_MMU=y
 UCLIBC_HAS_FLOATS=y
 UCLIBC_HAS_FPU=y
+HAS_FPU=y
 DO_C99_MATH=y
 WARNINGS="-Wall"
 KERNEL_SOURCE="/usr/src/linux"

Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-19 22:45:43 UTC (rev 17933)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-20 11:06:00 UTC (rev 17934)
@@ -142,7 +142,7 @@
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
-		-e 's,.*[^_]HAS_FPU.*,HAS_FPU=n,g' \
+		-e 's,^[^_]*HAS_FPU.*,HAS_FPU=n,g' \
 		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
 		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
 		$(UCLIBC_DIR)/.config
