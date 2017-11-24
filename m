From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 22:16:19 +0100
Subject: [Buildroot] [git commit branch/next] toolchain/external: hide
 versions too old for the current arch
Message-ID: <20171124211341.880D5801D9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=881cc8f1c41e681155afeac42f9e849d199f77bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Hide the toolchains if the arch requires a gcc version more recent
than the one they provide.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../toolchain-external/toolchain-external-codescape-img-mips/Config.in  | 1 +
 .../toolchain-external/toolchain-external-codescape-mti-mips/Config.in  | 1 +
 .../toolchain-external-codesourcery-aarch64/Config.in                   | 1 +
 .../toolchain-external/toolchain-external-codesourcery-amd64/Config.in  | 1 +
 .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 ++
 .../toolchain-external/toolchain-external-codesourcery-mips/Config.in   | 2 ++
 .../toolchain-external/toolchain-external-codesourcery-niosII/Config.in | 1 +
 .../toolchain-external/toolchain-external-linaro-aarch64/Config.in      | 1 +
 toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in    | 2 ++
 toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in  | 2 ++
 toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in  | 1 +
 11 files changed, 15 insertions(+)

diff --git a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
index e29c4dc..8b2eab0 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_IMG_MIPS
 	bool "Codescape IMG GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R6 || (BR2_MIPS_CPU_MIPS64R6 && !BR2_MIPS_SOFT_FLOAT)
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
index efe6f85..db191fd 100644
--- a/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESCAPE_MTI_MIPS
 	bool "Codescape MTI GNU Linux Toolchain 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_MIPS_CPU_MIPS32R2 || (BR2_MIPS_CPU_MIPS64R2 && !BR2_MIPS_SOFT_FLOAT) || \
 		BR2_MIPS_CPU_MIPS32R5 || (BR2_MIPS_CPU_MIPS64R5 && !BR2_MIPS_SOFT_FLOAT)
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
index 66a032e..24cbcff 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-aarch64/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
 	bool "CodeSourcery AArch64 2014.11"
 	depends on BR2_aarch64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 	# a57/a53 and a72/a53 appeared in gcc-6 or were broken before
 	depends on !BR2_cortex_a57_a53 && !BR2_cortex_a72_a53
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
index 101e227..50c5a20 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	bool "Sourcery CodeBench AMD64 2016.11"
 	depends on BR2_x86_64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_x86_jaguar || BR2_x86_steamroller
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index e1a7891..b91daa5 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	bool "Sourcery CodeBench ARM 2014.05"
 	depends on BR2_arm
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	# a15/a7 appeared in gcc-4.9, a17/a7 in gcc-5, a57/a53 and a72/a53
 	# in gcc-6, or they each were broken earlier than that.
 	depends on !BR2_cortex_a15_a7 && !BR2_cortex_a17_a7
@@ -35,5 +36,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 
 comment "Sourcery CodeBench toolchains available for the EABI ABI"
 	depends on BR2_arm
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 	depends on !BR2_ARM_EABI
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
index 6a13ae6..734f0e4 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config.in
@@ -2,6 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	bool "Sourcery CodeBench MIPS 2016.05"
 	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	depends on BR2_MIPS_CPU_MIPS32R2 || BR2_MIPS_CPU_MIPS64R2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	# Unsupported MIPS cores
 	depends on !BR2_mips_interaptiv
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -89,5 +90,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS
 	      Select BR2_SOFT_FLOAT
 
 comment "Sourcery CodeBench toolchains are only available for MIPS/MIPS64 o32 and n64"
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 	depends on BR2_MIPS_NABI32
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
index 341bc2a..7563995 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
 	bool "Sourcery CodeBench Nios-II 2017.05"
 	depends on BR2_nios2
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
index 5f66f56..0a9e60a 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 2017.08"
 	depends on BR2_aarch64
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index fd4e03b..9e0bcad 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -1,11 +1,13 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_arm
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2017.08"
 	depends on BR2_arm
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index 5fb7eb5..52fa450 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -1,11 +1,13 @@
 comment "Linaro toolchains available for Cortex-A + EABIhf"
 	depends on BR2_armeb
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
 
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2017.08"
 	depends on BR2_armeb
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
index f438ea7..8e4344a 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
@@ -1,6 +1,7 @@
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC 2016.09 toolchain"
 	depends on BR2_arc
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
 	select BR2_INSTALL_LIBSTDCPP
