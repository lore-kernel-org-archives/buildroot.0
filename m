From: vanokuten at uclibc.org <vanokuten@uclibc.org>
Date: Thu, 15 Nov 2007 07:44:16 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20071115154416.B3B83A6846@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: vanokuten
Date: 2007-11-15 07:44:15 -0800 (Thu, 15 Nov 2007)
New Revision: 20428

Log:
update uClibc config for nios2

Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-11-15 10:16:55 UTC (rev 20427)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-11-15 15:44:15 UTC (rev 20428)
@@ -192,6 +192,12 @@
 	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 endif
+ifeq ($(UCLIBC_TARGET_ARCH),nios2)
+	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "UCLIBC_FORMAT_FLAT=y" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
+	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
+endif
 ifeq ($(UCLIBC_TARGET_ARCH),sh)
 	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
