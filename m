From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Feb 2014 18:27:24 +0100
Subject: [Buildroot] [PATCH 05/10] toolchain/external: add choice to select
	'AT_LEAST_XXX' header version
In-Reply-To: <cover.1392571021.git.yann.morin.1998@free.fr>
References: <cover.1392571021.git.yann.morin.1998@free.fr>
Message-ID: <c5ba824bdc6dd9631a39cf3755a9ffecdf44deab.1392571021.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Select the appropriate BR2_TOOLCHAIN_HEADERS_AT_LEAST_XXX options for the
external, pre-defined toolchains.

Also annotate those toolchain with older-than-3.0 headers.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Arnout Vandecappelle <arnout@mind.be>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
---
 toolchain/toolchain-external/Config.in | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 3dd1c10..ab72d9c 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -17,6 +17,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_11
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2013.11 (based on gcc 4.8), Linaro GDB 2013.10 (based on
@@ -39,6 +40,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_10
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2013.10 (based on gcc 4.8), Linaro GDB 2013.10 (based on
@@ -61,6 +63,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_09
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_1
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2013.09 (based on gcc 4.8), Linaro GDB 2013.05 (based on
@@ -87,6 +90,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201311
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
@@ -113,6 +117,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
@@ -139,6 +144,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
@@ -172,6 +178,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago 2011.09 toolchain, with gcc 4.5.3,
 	  binutils 2.20.1, glibc 2.12, gdb 7.2.
@@ -195,6 +202,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.31
 	help
 	  Texas Instruments Arago ARMv5 2011.09 toolchain, with gcc
 	  4.5.3, binutils 2.20.1, glibc 2.12, gdb 7.2.
@@ -211,6 +219,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_11
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.8.1, binutils 2.23.52, glibc
@@ -279,6 +288,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201305
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_8
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52, glibc
@@ -347,6 +357,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
@@ -418,6 +429,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII201305
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  Sourcery CodeBench toolchain for the Nios-II architecture,
 	  from Mentor Graphics. It uses gcc 4.7.3, binutils 2.23.52,
@@ -432,6 +444,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.38
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
@@ -463,6 +476,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.35
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
@@ -494,6 +508,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
@@ -516,6 +531,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
@@ -539,6 +555,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.38
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
@@ -565,6 +582,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.38
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
@@ -584,6 +602,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	# kernel headers: 2.6.35
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
@@ -601,6 +620,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
@@ -626,6 +646,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
@@ -652,6 +673,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_0
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
@@ -681,6 +703,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -698,6 +721,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -715,6 +739,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -728,6 +753,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
@@ -741,6 +767,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# kernel headers: 2.6.37
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
@@ -754,6 +781,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
@@ -767,6 +795,7 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	depends on BR2_DEPRECATED_SINCE_2014_02
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	# kernel headers: 2.6.37
 	help
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
@@ -780,6 +809,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_11
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -793,6 +823,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_10
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -806,6 +837,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
-- 
1.8.1.2
