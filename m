From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  5 Mar 2012 21:00:05 +0100
Subject: [Buildroot] [PATCH 12/16] external-toolchain: details on selecting
	the multilib variants
In-Reply-To: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
References: <cover.1330977548.git.thomas.petazzoni@free-electrons.com>
Message-ID: <c5c1064e494a4524622d366ea20c230afc575692.1330977548.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Each multilib variant need to be selected using a special combination
of flags, requiring specific choices of the Buildroot options. This
commit documents those configuration choices to make it easier to use
the various multilib variants.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |  123 ++++++++++++++++++++++++++++++++
 1 files changed, 123 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6fb9ef6..d3b591d 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -14,8 +14,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	  2.13 and gdb 7.2.50, kernel headers 3.0.1. It has support
 	  for the following variants:
             - ARMv5TE, little endian, soft-float, glibc
+              Select ARM926T, ARM10T, XScale or another ARMv5 core
+              Select BR2_SOFT_FLOAT
             - ARMv4T, little endian, soft-float, glibc
+              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+              Select BR2_SOFT_FLOAT
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	bool "Sourcery CodeBench ARM 2011.03"
@@ -28,8 +35,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	  2.13 and gdb 7.2.50, kernel headers 2.6.38. It has support
 	  for the following variants:
             - ARMv5TE, little endian, soft-float, glibc
+              Select ARM926T, ARM10T, XScale or another ARMv5 core
+              Select BR2_SOFT_FLOAT
             - ARMv4T, little endian, soft-float, glibc
+              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+              Select BR2_SOFT_FLOAT
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	bool "Sourcery CodeBench ARM 2010.09"
@@ -42,8 +56,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201009
 	  2.11 and gdb 7.2.50, kernel headers 2.6.35.2. It has support
 	  for the following variants:
             - ARMv5TE, little endian, soft-float, glibc
+	      Select ARM926T, ARM10T, XScale or another ARMv5 core
+              Select BR2_SOFT_FLOAT
             - ARMv4T, little endian, soft-float, glibc
+              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+              Select BR2_SOFT_FLOAT
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	bool "Sourcery CodeBench ARM 2010q1"
@@ -56,8 +77,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2010Q1
 	  2.11, gdb 7.0.50 and kernel headers 2.6.32. It has support
 	  for the following variants:
              - ARMv5T, little endian, soft-float, glibc
+               Select ARM926T, ARM10T, XScale or another ARMv5 core
+               Select BR2_SOFT_FLOAT
              - ARMv4T, little endian, soft-float, glibc
+               Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+               Select BR2_SOFT_FLOAT
              - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+               Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+               Select BR2_SOFT_FLOAT
+               Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	bool "Sourcery CodeBench ARM 2009q3"
@@ -70,8 +98,15 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM2009Q3
 	  2.10 and gdb 6.8 and kernel headers 2.6.30. It has support
 	  for the following variants:
             - ARMv5T, little endian, soft-float, glibc
+              Select ARM926T, ARM10T, XScale or another ARMv5 core
+              Select BR2_SOFT_FLOAT
             - ARMv4T, little endian, soft-float, glibc
+              Select ARM720T, ARM920T, ARM922T or another ARMv4 core
+              Select BR2_SOFT_FLOAT
             - ARMv7-A, Thumb 2, little endian, soft-float, glibc
+              Select Cortex-A8, Cortex-A9 or another ARMv7-A core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mthumb
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	bool "Sourcery CodeBench MIPS 2011.03"
@@ -84,17 +119,43 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201103
 	  2.13, uClibc 0.9.30 and gdb 7.2.50, kernel headers
 	  2.6.38. It has support for the following variants:
             - MIPS32 O32 big endian glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
             - MIPS32 O32 little endian glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL
             - MIPS32 big endian soft float glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
             - MIPS32 little endian soft float glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL
             - MIPS32 big endian microMIPS glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mips16
             - MIPS32 little endian microMIPS glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
             - MIPS32 big endian soft float microMIPS glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mips16
             - MIPS32 little endian soft float microMIPS glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
             - MIPS32 big endian uclibc
+              Not usable in Buildroot yet.
             - MIPS32 little endian uclibc
+              Not usable in Buildroot yet.
             - MIPS32 big endian soft float uclibc
+              Not usable in Buildroot yet.
             - MIPS32 little endian soft float uclibc
+              Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	bool "Sourcery CodeBench MIPS 4.4"
@@ -107,17 +168,43 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS44
 	  2.11, uClibc 0.9.30 and gdb 7.0, kernel headers 2.6.32. It
 	  has support for the following variants:
             - MIPS32 O32 big endian glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
             - MIPS32 O32 little endian glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL
             - MIPS32 big endian soft float glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
             - MIPS32 little endian soft float glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL
             - MIPS32 big endian microMIPS glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mips16
             - MIPS32 little endian microMIPS glibc
+              Select a MIPS generic core
+              Disable BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
             - MIPS32 big endian soft float microMIPS glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -mips16
             - MIPS32 little endian soft float microMIPS glibc
+              Select a MIPS generic core
+              Select BR2_SOFT_FLOAT
+              Set BR2_TARGET_OPTIMIZATION to -EL -mips16
             - MIPS32 big endian uclibc
+              Not usable in Buildroot yet.
             - MIPS32 little endian uclibc
+              Not usable in Buildroot yet.
             - MIPS32 big endian soft float uclibc
+              Not usable in Buildroot yet.
             - MIPS32 little endian soft float uclibc
+              Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	bool "Sourcery CodeBench PowerPC 2011.03"
@@ -130,12 +217,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	  glibc 2.13, gdb 7.2.50 and kernel headers 2.6.38. It has
 	  support for the following variants:
             - 603 glibc, 32 bits
+	      Select a generic PowerPC core
+	      Disable BR2_SOFT_FLOAT
             - 603 soft float glibc, 32 bits
+	      Select a generic PowerPC core
+	      Enable BR2_SOFT_FLOAT
             - e600 altivec glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te600
             - e500v1 glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500v1
             - e500v2 glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500v2
             - e500mc glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500mc
             - 970 glibc hard-float, 64 bits
+              Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	bool "Sourcery CodeBench PowerPC 2010.09"
@@ -148,12 +244,21 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	  glibc 2.11, gdb 7.2.50 and kernel headers 2.6.35.2. It has
 	  support for the following variants:
             - 603 glibc, 32 bits
+	      Select a generic PowerPC core
+	      Disable BR2_SOFT_FLOAT
             - 603 soft float glibc, 32 bits
+	      Select a generic PowerPC core
+	      Enable BR2_SOFT_FLOAT
             - e600 altivec glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te600
             - e500v1 glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500v1
             - e500v2 glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500v2
             - e500mc glibc, 32 bits
+              Set BR2_TARGET_OPTIMIZATION to -te500mc
             - 970 glibc hard-float, 64 bits
+              Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	bool "Sourcery CodeBench SH 2011.03"
@@ -166,9 +271,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	  glibc 2.13, uClibc 0.9.30, gdb 7.2.50 and kernel headers
 	  2.6.38. It has support for the following variants:
             - SH4A, glibc, little endian
+              Default.
             - SH4A, glibc, big endian
+              Add -mb to BR2_TARGET_OPTIMIZATION
             - SH4A, uClibc, little endian
+              Not usable in Buildroot yet.
             - SH4A, uClibc, big endian
+              Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	bool "Sourcery CodeBench SH 2010.09"
@@ -181,9 +290,13 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201009
 	  glibc 2.11, uClibc 0.9.30, gdb 7.2.50 and kernel headers
 	  2.6.35.2. It has support for the following variants:
             - SH4A, glibc, little endian
+              Default.
             - SH4A, glibc, big endian
+              Add -mb to BR2_TARGET_OPTIMIZATION
             - SH4A, uClibc, little endian
+              Not usable in Buildroot yet.
             - SH4A, uClibc, big endian
+              Not usable in Buildroot yet.
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	bool "Sourcery CodeBench SH 2011.03"
@@ -230,9 +343,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	  binutils 2.21.53, glibc 2.13, gdb 7.2.50 and kernel headers
 	  3.0.1. It has support for the following variants:
 	    - Intel Pentium 4, glibc, 32 bits
+              Default, nothing special to do.
             - Intel Atom, glibc, 32 bits
+              Select an Atom core
             - Intel Xeon, glibc, 64 bits
+              Set BR2_TARGET_OPTIMIZATION to -m64
             - Intel Core 2, glibc, 64 bits
+              Select a Core 2 core
+              Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	bool "Sourcery CodeBench x86/x86_64 2010.09"
@@ -245,9 +363,14 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201009
 	  binutils 2.20, glibc 2.11, gdb 7.2.50 and kernel headers
 	  2.6.35.2. It has support for the following variants:
 	    - Intel Pentium 4, glibc, 32 bits
+              Default, nothing special to do.
             - Intel Atom, glibc, 32 bits
+              Select an Atom core
             - Intel Xeon, glibc, 64 bits
+              Set BR2_TARGET_OPTIMIZATION to -m64
             - Intel Core 2, glibc, 64 bits
+              Select a Core 2 core
+              Set BR2_TARGET_OPTIMIZATION to -m64
 
 config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	bool "Blackfin.uclinux.org 2011R1-RC4"
-- 
1.7.4.1
