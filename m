From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 10 Feb 2007 13:24:03 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070210212403.06FDD4858B@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-02-10 13:24:02 -0800 (Sat, 10 Feb 2007)
New Revision: 17851

Log:
- fix propagation of BR2_SOFT_FLOAT down to uClibc


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-10 19:36:25 UTC (rev 17850)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-02-10 21:24:02 UTC (rev 17851)
@@ -141,7 +141,7 @@
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
-		-e 's,.*HAS_FPU.*,HAS_FPU=n,g' \
+		-e 's,.*[^_]HAS_FPU.*,HAS_FPU=n,g' \
 		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
 		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
 		$(UCLIBC_DIR)/.config
