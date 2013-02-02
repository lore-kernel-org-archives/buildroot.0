From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  2 Feb 2013 14:46:23 +0100
Subject: [Buildroot] [PATCH 4/4] toolchain-external: remove support for
	AArch64 Linaro 2012.10 toolchain
In-Reply-To: <1359812783-22866-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1359812783-22866-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1359812783-22866-4-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   12 ------------
 toolchain/toolchain-external/ext-tool.mk |    3 ---
 2 files changed, 15 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index bd9a6e1..dc2d12e 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -684,17 +684,6 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
-	bool "Linaro AArch64 12.10"
-	depends on BR2_aarch64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	help
-	  Toolchain for the AArch64 architecture, from
-	  http://www.linaro.org/engineering/armv8/
-
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	bool "Custom toolchain"
 	help
@@ -751,7 +740,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 712dcab..00379a2 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -256,9 +256,6 @@ TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10),y)
-TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.10/components/toolchain/gcc-linaro/aarch64/rc3/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7+bzr115029-20121015+bzr2506_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.11/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.11-1-20121127_linux.tar.bz2
-- 
1.7.9.5
