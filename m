From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 6 Jan 2013 21:37:23 +0100
Subject: [Buildroot] [git commit] toolchain-external: use
	BR2_HOSTARCH_NEEDS_IA32_LIBS where needed
Message-ID: <20130106204312.9A7949A631@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2d16ba916254291ddbcbe9995fa1b40e66e71c45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All supported pre-built external toolchains are built for x86 Linux,
so we add the BR2_HOSTARCH_NEEDS_IA32_LIBS select.

[Peter: microblaze toolchains are 64bit]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |   25 +++++++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 0da88ef..2e79052 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -11,6 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_12
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2012.12 (based on gcc 4.7), Linaro GDB 2012.12 (based on
@@ -29,6 +30,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2012.11 (based on gcc 4.7), Linaro GDB 2012.10 (based on
@@ -47,6 +49,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2012.10 (based on gcc 4.7), Linaro GDB 2012.10 (based on
@@ -68,6 +71,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
@@ -91,6 +95,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.6.1, binutils 2.21.53, glibc
@@ -114,6 +119,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51, glibc
@@ -183,6 +189,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53, glibc
@@ -252,6 +259,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the ARM architecture, from
 	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51, glibc
@@ -275,6 +283,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the MIPS architecture, from
 	  Mentor Graphics. It uses gcc 4.5.2, binutils 2.21.53, glibc
@@ -344,6 +353,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201103
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20.51,
@@ -373,6 +383,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_POWERPC201009
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the PowerPC architecture,
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
@@ -402,6 +413,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201209
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.7.2, binutils 2.23.51,
@@ -422,6 +434,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201203
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.6.3, binutils 2.21.53,
@@ -443,6 +456,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH201103
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
@@ -468,6 +482,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201103
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.2, binutils 2.20,
@@ -486,6 +501,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_SH2A_201009
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the SuperH architecture,
 	  from Mentor Graphics. It uses gcc 4.5.1, binutils 2.20,
@@ -500,6 +516,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
@@ -522,6 +539,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201203
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.3,
@@ -545,6 +563,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201109
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Sourcery CodeBench toolchain for the x86/x86_64
 	  architectures, from Mentor Graphics. It uses gcc 4.6.1,
@@ -573,6 +592,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R1
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -589,6 +609,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2011R1
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -605,6 +626,7 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2010RC1
 	select BR2_USE_WCHAR
 	select BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
@@ -635,6 +657,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -645,6 +668,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
@@ -655,6 +679,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
