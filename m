From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 24 Nov 2017 23:01:41 +0100
Subject: [Buildroot] [git commit] arch/arm: armv8 is really armv8a
Message-ID: <20171201205337.0A1A77FF6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=003b1f3c74689986f9f6e7f8ce96b4e422c94a93
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For armv8, there are different profiles: A, M and R, like there is for
armv7.

So, rename our internal symbol to mirror what we do for armv7.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 arch/Config.in.arm                                         | 14 +++++++-------
 package/pkg-cmake.mk                                       |  2 +-
 .../toolchain-external-codesourcery-arm/Config.in          |  2 +-
 .../toolchain-external-linaro-arm/Config.in                |  2 +-
 .../toolchain-external-linaro-armeb/Config.in              |  2 +-
 5 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index c2b7931..d110d52 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -59,7 +59,7 @@ config BR2_ARM_CPU_ARMV7A
 config BR2_ARM_CPU_ARMV7M
 	bool
 
-config BR2_ARM_CPU_ARMV8
+config BR2_ARM_CPU_ARMV8A
 	bool
 
 choice
@@ -249,7 +249,7 @@ config BR2_cortex_a53
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-	select BR2_ARM_CPU_ARMV8
+	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57
 	bool "cortex-A57"
@@ -257,7 +257,7 @@ config BR2_cortex_a57
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-	select BR2_ARM_CPU_ARMV8
+	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57_a53
 	bool "cortex-A57/A53 big.LITTLE"
@@ -265,7 +265,7 @@ config BR2_cortex_a57_a53
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-	select BR2_ARM_CPU_ARMV8
+	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a72
@@ -274,7 +274,7 @@ config BR2_cortex_a72
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-	select BR2_ARM_CPU_ARMV8
+	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a72_a53
@@ -283,7 +283,7 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_HAS_NEON if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
-	select BR2_ARM_CPU_ARMV8
+	select BR2_ARM_CPU_ARMV8A
 	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 endchoice
@@ -570,7 +570,7 @@ config BR2_GCC_TARGET_CPU
 	# armv7m
 	default "cortex-m3"	if BR2_cortex_m3
 	default "cortex-m4"	if BR2_cortex_m4
-	# armv8
+	# armv8a
 	default "cortex-a53"	if BR2_cortex_a53
 	default "cortex-a57"	if BR2_cortex_a57
 	default "cortex-a57.cortex-a53"	if BR2_cortex_a57_a53
diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
index db78d89..6739704 100644
--- a/package/pkg-cmake.mk
+++ b/package/pkg-cmake.mk
@@ -224,7 +224,7 @@ else ifeq ($(BR2_ARM_CPU_ARMV6),y)
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv6
 else ifeq ($(BR2_ARM_CPU_ARMV7A),y)
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv7
-else ifeq ($(BR2_ARM_CPU_ARMV8),y)
+else ifeq ($(BR2_ARM_CPU_ARMV8A),y)
 CMAKE_SYSTEM_PROCESSOR_ARM_VARIANT = armv8
 endif
 
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index 60d86c3..bdbe2ac 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -5,7 +5,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
-	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
+	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
index 9e0bcad..d665b99 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARM
 	bool "Linaro ARM 2017.08"
 	depends on BR2_arm
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
+	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
diff --git a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
index 52fa450..3c45a61 100644
--- a/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-linaro-armeb/Config.in
@@ -8,7 +8,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_ARMEB
 	bool "Linaro armeb 2017.08"
 	depends on BR2_armeb
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8
+	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABIHF
 	depends on !BR2_STATIC_LIBS
