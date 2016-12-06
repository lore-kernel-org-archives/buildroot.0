From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 6 Dec 2016 21:38:24 +0100
Subject: [Buildroot] [git commit] toolchain-external: disallow sourcery
	codebench ARM toolchain for ARMv8 cores
Message-ID: <20161206204147.0623781E3E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=36e2a2c0009e0e7d978101fd66680ebb7d4fcea2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This toolchain uses GCC 4.8.x, which doesn't support the ARMv8 cores.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../toolchain-external/toolchain-external-codesourcery-arm/Config.in    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
index 3cdfc86..6331873 100644
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-codesourcery-arm/Config.in
@@ -4,7 +4,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_ARM_EABI
 	# Unsupported ARM cores
-	depends on !BR2_cortex_a12 && !BR2_cortex_a17
+	depends on !BR2_cortex_a12 && !BR2_cortex_a17 && !BR2_ARM_CPU_ARMV8
 	depends on !BR2_STATIC_LIBS
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
