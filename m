From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  2 Sep 2013 18:06:40 +0200
Subject: [Buildroot] [PATCHv2 14/14] toolchain: update Linaro AArch64
	external toolchains
In-Reply-To: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1378138000-12739-15-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   | 14 +++++++-------
 toolchain/toolchain-external/ext-tool.mk | 12 ++++++------
 2 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 9c5d93c..36587b5 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -717,8 +717,8 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06
-	bool "Linaro AArch64 13.06"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08
+	bool "Linaro AArch64 13.08"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -729,8 +729,8 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
-	bool "Linaro AArch64 13.05"
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07
+	bool "Linaro AArch64 13.07"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
@@ -741,7 +741,7 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
-config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06
 	bool "Linaro AArch64 13.04"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
@@ -811,9 +811,9 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201305
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV7A_201109
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05
-	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 56b836a..a96ca06 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -301,15 +301,15 @@ TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
 TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_04),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.04/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.7-2013.04-20130415_linux.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_05),y)
-TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.05/components/toolchain/binaries/
-TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.05_linux.tar.xz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_06),y)
 TOOLCHAIN_EXTERNAL_SITE = https://releases.linaro.org/13.06/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.06_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_07),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.07/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.07-1_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_08),y)
+TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.08/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.08_linux.tar.xz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.8.1.2
