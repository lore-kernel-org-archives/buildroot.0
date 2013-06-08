From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  8 Jun 2013 11:14:16 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: bump Linaro AArch64
	toolchains to 2013.04 and 2013.05
In-Reply-To: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1370682862-7285-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1370682862-7285-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   | 18 ++++++++++--------
 toolchain/toolchain-external/ext-tool.mk | 14 +++++++-------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6a58e0f..f87b6ac 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -658,30 +658,32 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
-	bool "Linaro AArch64 13.03"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
+	bool "Linaro AArch64 13.05"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
-	bool "Linaro AArch64 13.02"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
+	bool "Linaro AArch64 13.04"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	help
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
-	bool "Linaro AArch64 13.01"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
+	bool "Linaro AArch64 13.03"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -747,9 +749,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 93aec83..0f8ede0 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -272,15 +272,15 @@ TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01),y)
-TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.01/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.01-20130125_linux.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.02/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.02-01-20130221_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03),y)
-TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.03/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.03-20130313_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.04/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.04-20130415_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.05/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.8-2013.05_linux.tar.xz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.8.1.2
