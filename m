From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 10 Dec 2012 10:35:07 +0100
Subject: [Buildroot] [PATCH] toolchain-external: Linaro toolchains are
	available for Cortex-A{5, 15}
Message-ID: <1355132107-5550-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in |   10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4fe605d..456407e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -6,7 +6,7 @@ choice
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 	bool "Linaro 2012.11"
 	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
+	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -23,7 +23,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_11
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 	bool "Linaro 2012.10"
 	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
+	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -40,7 +40,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_10
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 	bool "Linaro 2012.09"
 	depends on BR2_arm
-	depends on BR2_cortex_a8 || BR2_cortex_a9
+	depends on BR2_cortex_a5 || BR2_cortex_a8 || BR2_cortex_a9 || BR2_cortex_a15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -54,9 +54,9 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_2012_09
 
 	  To use this toolchain, you must disable soft float usage.
 
-comment "Linaro toolchains available for Cortex-A{8,9}"
+comment "Linaro toolchains available for Cortex-A{5,8,9,15}"
 	depends on BR2_arm
-	depends on !BR2_cortex_a8 && !BR2_cortex_a9
+	depends on !BR2_cortex_a5 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15
 
 config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	bool "Sourcery CodeBench ARM 2012.03"
-- 
1.7.9.5
