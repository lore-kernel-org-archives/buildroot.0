From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 25 Sep 2006 07:28:54 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20060925142854.F34B048659@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2006-09-25 07:28:54 -0700 (Mon, 25 Sep 2006)
New Revision: 16219

Log:
Set 0.9.28 floating point mode according to BR2_SOFT_FLOAT

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-09-25 13:37:13 UTC (rev 16218)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2006-09-25 14:28:54 UTC (rev 16219)
@@ -101,7 +101,9 @@
 endif
 	$(SED) 's,.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.config
 ifeq ($(BR2_SOFT_FLOAT),y)
-	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.config
+	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.config
+else
+	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' $(UCLIBC_DIR)/.config
 endif
 ifneq ($(BR2_PTHREADS_NONE),y)
 	$(SED) 's,# UCLIBC_HAS_THREADS is not set,UCLIBC_HAS_THREADS=y,g' $(UCLIBC_DIR)/.config
