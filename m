From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 10 Dec 2012 10:41:35 +0100
Subject: [Buildroot] [git commit] toolchain-external: Linaro toolchains are
	available for Cortex-A{5, 15}
Message-ID: <20121210094146.A9B769A033@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=16dcf2d668953a33c148baebd43afdb1df34cae5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in |   10 +++++-----
 1 files changed, 5 insertions(+), 5 deletions(-)

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
