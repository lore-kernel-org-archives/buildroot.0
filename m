From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 20:01:00 +0200
Subject: [Buildroot] [PATCH 2/4] toolchain-external: update AArch64 Linaro
	toolchains
In-Reply-To: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365357662-25960-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the AArch64 Linaro toolchains 2013.02 and 2013.03, remove 2012.11
and 2012.12.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   16 ++++++++--------
 toolchain/toolchain-external/ext-tool.mk |   12 ++++++------
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 8dcbc6d..433df4b 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -675,8 +675,8 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
-	bool "Linaro AArch64 13.01"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
+	bool "Linaro AArch64 13.03"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -686,8 +686,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
-	bool "Linaro AArch64 12.12"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
+	bool "Linaro AArch64 13.02"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -697,8 +697,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
-	bool "Linaro AArch64 12.11"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
+	bool "Linaro AArch64 13.01"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -764,8 +764,8 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201103
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201109
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 6d9a706..d667b86 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -270,15 +270,15 @@ TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
 TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11),y)
-TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.11/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.11-1-20121127_linux.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12),y)
-TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.12/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.12-20121214_linux.tar.bz2
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.01/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.01-20130125_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.02/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.02-01-20130221_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03),y)
+TOOLCHAIN_EXTERNAL_SITE=https://releases.linaro.org/13.03/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.03-20130313_linux.tar.xz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.7.9.5
