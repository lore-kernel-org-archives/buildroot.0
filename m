From: d giddy <rickyrockrat@yahoo.com>
Date: Fri, 2 Feb 2007 12:55:05 -0800 (PST)
Subject: [Buildroot] mip32 uclibc broken - patch for uClibc-0.9.28 in 17728
Message-ID: <89354.81405.qm@web62001.mail.re1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mips32 for the au1200 doesn't have the correct
options.  If this patch is the correct direction, I
will test & confirm it works.

Thanks,
Doug

---
svn/buildroot/toolchain/uClibc/uClibc-0.9.28.config
2007-02-02 10:49:19.000000000 -0700
+++
buildroot-2007-02-02/toolchain/uClibc/uClibc-0.9.28.config
 2007-02-02 13:51:30.000000000 -0700
@@ -34,10 +34,7 @@
 # ARCH_BIG_ENDIAN is not set
 # ARCH_SUPPORTS_LITTLE_ENDIAN is not set
 # ARCH_SUPPORTS_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-ARCH_HAS_MMU=y
 UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
 DO_C99_MATH=y
 WARNINGS="-Wall"
 KERNEL_SOURCE="/usr/src/linux"
@@ -55,12 +52,6 @@
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
-# CONFIG_MIPS_ISA_1 is not set
-# CONFIG_MIPS_ISA_2 is not set
-# CONFIG_MIPS_ISA_3 is not set
-# CONFIG_MIPS_ISA_4 is not set
-# CONFIG_MIPS_ISA_MIPS32 is not set
-# CONFIG_MIPS_ISA_MIPS64 is not set

 #
 # General Library Settings
@@ -140,9 +131,7 @@
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
 UCLIBC_HAS_PRINTF_M_SPEC=y
 UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
 UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y

 #



 
____________________________________________________________________________________
Need a quick answer? Get one in minutes from people who know.
Ask your question on www.Answers.yahoo.com
