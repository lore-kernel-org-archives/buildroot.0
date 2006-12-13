From: andersen at uclibc.org <andersen@uclibc.org>
Date: Wed, 13 Dec 2006 03:53:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/AMD/DBAu1500
Message-ID: <20061213115339.38D3248579@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: andersen
Date: 2006-12-13 03:53:38 -0800 (Wed, 13 Dec 2006)
New Revision: 16886

Log:
endianness is handled elsewhere


Modified:
   trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in


Changeset:
Modified: trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in
===================================================================
--- trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2006-12-13 11:53:00 UTC (rev 16885)
+++ trunk/buildroot/target/device/AMD/DBAu1500/Makefile.in	2006-12-13 11:53:38 UTC (rev 16886)
@@ -8,7 +8,7 @@
 
 TARGETS+=linux
 
-uclibc_config_file_prep::
+$(UCLIBC_DIR)/.xprep::
 	cp toolchain/uClibc/uClibc-$(UCLIBC_VER).config $(UCLIBC_CONFIG_FILE)
 	/bin/echo "# CONFIG_MIPS_ISA_1 is not set" >> $(UCLIBC_CONFIG_FILE)
 	/bin/echo "# CONFIG_MIPS_ISA_2 is not set" >> $(UCLIBC_CONFIG_FILE)
@@ -16,18 +16,6 @@
 	/bin/echo "# CONFIG_MIPS_ISA_4 is not set" >> $(UCLIBC_CONFIG_FILE)
 	/bin/echo "CONFIG_MIPS_ISA_MIPS32=y" >> $(UCLIBC_CONFIG_FILE)
 	/bin/echo "# CONFIG_MIPS_ISA_MIPS64 is not set" >> $(UCLIBC_CONFIG_FILE)
-ifeq ($(strip $(BR2_mips)),y)
-	/bin/echo "# ARCH_LITTLE_ENDIAN is not set" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "ARCH_BIG_ENDIAN=y" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "# ARCH_WANTS_LITTLE_ENDIAN is not set" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "ARCH_WANTS_BIG_ENDIAN=y" >> $(UCLIBC_CONFIG_FILE)
-endif
-ifeq ($(strip $(BR2_mipsel)),y)
-	/bin/echo "ARCH_LITTLE_ENDIAN=y" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "# ARCH_BIG_ENDIAN is not set" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "ARCH_WANTS_LITTLE_ENDIAN=y" >> $(UCLIBC_CONFIG_FILE)
-	/bin/echo "# ARCH_WANTS_BIG_ENDIAN is not set" >> $(UCLIBC_CONFIG_FILE)
-endif
 	/bin/echo "CONFIG_MIPS_O32_ABI=y" >> $(UCLIBC_CONFIG_FILE)
 	/bin/echo "# CONFIG_MIPS_N32_ABI is not set" >> $(UCLIBC_CONFIG_FILE)
 	/bin/echo "# CONFIG_MIPS_N64_ABI is not set" >> $(UCLIBC_CONFIG_FILE)
