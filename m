From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 28 Oct 2019 14:08:38 +0100
Subject: [Buildroot] [PATCH 1/1]
 toolchain/toolchain-external/toolchain-external-codesourcery-arm: disable
 SSP
Message-ID: <20191028130838.23254-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain does not support -fstack-protector-strong:
SSP option -fstack-protector-strong not available in this toolchain, please select another SSP level

As there is no way to add a !BR2_SSP_STRONG dependency without creating a
Kconfig recursive dependency, just remove BR2_TOOLCHAIN_HAS_SSP

Fixes:
 - http://autobuild.buildroot.net/results/78dc6428ffaa529fdad8e9c8aaec49ded5f0209a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../toolchain-external-codesourcery-arm/Config.in                | 1 -
 1 file changed, 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index bdbe2acaea..f80e54ff06 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -8,7 +8,6 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8A
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-- 
2.23.0
