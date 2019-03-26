From: Ed Blake <ed.blake@sondrel.com>
Date: Tue, 26 Mar 2019 12:30:46 +0000
Subject: [Buildroot] [PATCH v2 3/4] toolchain-external: enable OpenMP for
 supporting toolchains
In-Reply-To: <20190326123032.9905-1-ed.blake@sondrel.com>
References: <20190326123032.9905-1-ed.blake@sondrel.com>
Message-ID: <20190326123032.9905-4-ed.blake@sondrel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Enable OpenMP support in the following external toolchains:

toolchain-external-arm-aarch64-be
toolchain-external-arm-aarch64
toolchain-external-arm-arm
toolchain-external-codescape-img-mips
toolchain-external-codescape-mti-mips
toolchain-external-codesourcery-amd64
toolchain-external-codesourcery-mips
toolchain-external-linaro-aarch64-be
toolchain-external-linaro-aarch64
toolchain-external-linaro-arm
toolchain-external-linaro-armeb

Signed-off-by: Ed Blake <ed.blake@sondrel.com>
---
 .../toolchain-external-arm-aarch64-be/Config.in                  | 1 +
 .../toolchain-external/toolchain-external-arm-aarch64/Config.in  | 1 +
 .../toolchain-external/toolchain-external-arm-arm/Config.in      | 1 +
 .../toolchain-external-codescape-img-mips/Config.in              | 1 +
 .../toolchain-external-codescape-mti-mips/Config.in              | 1 +
 .../toolchain-external-codesourcery-amd64/Config.in              | 1 +
 .../toolchain-external-codesourcery-mips/Config.in               | 1 +
 .../toolchain-external-linaro-aarch64-be/Config.in               | 1 +
 .../toolchain-external-linaro-aarch64/Config.in                  | 1 +
 .../toolchain-external/toolchain-external-linaro-arm/Config.in   | 1 +
 .../toolchain-external/toolchain-external-linaro-armeb/Config.in | 1 +
 11 files changed, 11 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index d992be0190..76157730ec 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Arm toolchain for the AArch64 Big Endian architecture.
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index fbb5e025e8..3d4a9b62a4 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Arm toolchain for the AArch64 architecture.
 
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 0449737889..886b2a0aa3 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -17,6 +17,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Arm toolchain for the ARM architecture. It uses GCC 8.2.1,
 	  GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates code that
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index be6e56a2cb..2341d08832 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -9,6 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Codescape IMG GNU Linux Toolchain 2018.09 for the MIPS
 	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index 15d6284766..c58c55119a 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Codescape MTI GNU Linux Toolchain 2018.09 for the MIPS
 	  architecture, from MIPS Tech LLC. It uses gcc 6.3.0,
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
index 9187333b95..c8ec970a4f 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -8,6 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 734f0e4c7c..1a3bdc9393 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -11,6 +11,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
index 9e7d2a6233..bac90374cf 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_BE
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Toolchain for the AArch64 Big Endian architecture, from
 	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index aabf2cffe8..824eb76c72 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -10,6 +10,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index e880d5dbbd..beb38609c3 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -17,6 +17,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	select BR2_TOOLCHAIN_HAS_FORTRAN
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
 	  Linaro toolchain for the ARM architecture. It uses Linaro
 	  GCC 2018.05 (based on gcc 7.3.1), Linaro GDB 2018.05 (based on
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index ebc6edefb5..aa21e44860 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -13,6 +13,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_TOOLCHAIN_HAS_OPENMP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_10
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-- 
2.17.1
