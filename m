From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sun, 30 Sep 2007 05:43:00 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/uClibc
Message-ID: <20070930124300.2FBAA3004D@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-30 05:42:59 -0700 (Sun, 30 Sep 2007)
New Revision: 20140

Log:
- propagate mips ISA down to uClibc


Modified:
   trunk/buildroot/toolchain/uClibc/uclibc.mk


Changeset:
Modified: trunk/buildroot/toolchain/uClibc/uclibc.mk
===================================================================
--- trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-30 12:42:11 UTC (rev 20139)
+++ trunk/buildroot/toolchain/uClibc/uclibc.mk	2007-09-30 12:42:59 UTC (rev 20140)
@@ -150,9 +150,16 @@
 endif
 ifeq ($(UCLIBC_TARGET_ARCH),mips)
 	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(UCLIBC_DIR)/.oldconfig
+	$(SED) '/CONFIG_MIPS_ISA_.*/d' $(UCLIBC_DIR)/.oldconfig
 	(/bin/echo "# CONFIG_MIPS_O32_ABI is not set"; \
 	 /bin/echo "# CONFIG_MIPS_N32_ABI is not set"; \
 	 /bin/echo "# CONFIG_MIPS_N64_ABI is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_1 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_2 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_3 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_4 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32 is not set"; \
+	 /bin/echo "# CONFIG_MIPS_ISA_MIPS64 is not set"; \
 	) >> $(UCLIBC_DIR)/.oldconfig
 ifeq ($(BR2_MIPS_OABI),y)
 	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
@@ -163,7 +170,28 @@
 ifeq ($(BR2_MIPS_ABI64),y)
 	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_mips_1),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_1\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
+ifeq ($(BR2_mips_2),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_2\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_mips_3),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_3\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_mips_4),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_4\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_mips_32),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_mips_32r2),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+ifeq ($(BR2_mips_64),y)
+	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
+endif
+endif
 ifeq ($(UCLIBC_TARGET_ARCH),sh)
 	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
 	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
