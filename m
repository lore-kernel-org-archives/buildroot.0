From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 29 Jan 2007 08:44:44 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070129164444.EB84248598@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2007-01-29 08:44:43 -0800 (Mon, 29 Jan 2007)
New Revision: 17636

Log:
Really disable HAS_FPU when softfloat is enabled

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-29 15:45:04 UTC (rev 17635)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-01-29 16:44:43 UTC (rev 17636)
@@ -133,7 +133,7 @@
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
 	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
-		-e 's,.*HAS_FPU.*,HAS_FPU=y,g' \
+		-e 's,.*HAS_FPU.*,HAS_FPU=n,g' \
 		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
 		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
 		$(UCLIBC_DIR)/.config
