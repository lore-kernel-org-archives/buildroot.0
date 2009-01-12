From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 12 Jan 2009 14:11:41 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20090112141141.E4103766E4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-12 14:11:40 +0000 (Mon, 12 Jan 2009)
New Revision: 24795

Log:
toolchain/uclibc: propagate mips mips32r2 variant setting to uclibc

0.9.30 supports MIPS_ISA_MIPS32R2, so use it if mips32r2 variant is selected.

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-12 12:54:30 UTC (rev 24794)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2009-01-12 14:11:40 UTC (rev 24795)
@@ -185,6 +185,7 @@
 	 /bin/echo "# CONFIG_MIPS_ISA_3 is not set"; \
 	 /bin/echo "# CONFIG_MIPS_ISA_4 is not set"; \
 	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32R2 is not set"; \
 	 /bin/echo "# CONFIG_MIPS_ISA_MIPS64 is not set"; \
 	) >> $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_MIPS_OABI),y)
@@ -209,10 +210,10 @@
 	$(SED) 's/.*\(CONFIG_MIPS_ISA_4\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_mips_32),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\)[^R].*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_mips_32r2),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32R2\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_mips_64),y)
 	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
