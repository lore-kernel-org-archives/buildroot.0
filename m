From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 11 Jun 2013 00:04:37 +0200
Subject: [Buildroot] [git commit] toolchain-external: use
	BR2_GCC_TARGET_ARCH for toolchain conditionals
Message-ID: <20130611100808.4B69E9AC6A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c5f87f72f5c300423469ad2dfad284b1481a70f8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Instead of a long list of the ARMv7-A Cortex-A, use a conditional
based on BR2_GCC_TARGET_ARCH to hide/show toolchains that are only
usable on ARMv7-A.

However, in the comment related to Linaro toolchains, we keep
mentioning Cortex-A{5,8,9,15} because that's what users see when they
select their architecture variant.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 2fc18cc..9798840 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,7 +6,7 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 	bool "Linaro 2013.05"
 	depends on BR2_arm
-	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -25,7 +25,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_05
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 	bool "Linaro 2013.04"
 	depends on BR2_arm
-	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -44,7 +44,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_04
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
 	bool "Linaro 2013.03"
 	depends on BR2_arm
-	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
@@ -62,7 +62,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2013_03
 
 comment "Linaro toolchains available for Cortex-A{5,8,9,15}"
 	depends on BR2_arm
-	depends on !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15
+	depends on BR2_GCC_TARGET_ARCH != "armv7-a"
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	bool "Sourcery CodeBench ARM 2013.05"
@@ -140,7 +140,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	bool "Arago ARMv7 2011.09"
 	depends on BR2_arm
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
+	depends on BR2_GCC_TARGET_ARCH = "armv7-a"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
