From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Dec 2012 00:23:26 +0100
Subject: [Buildroot] [PATCH 7/9] toolchain-external: add support for 'Linaro
	AArch64 12.12'
In-Reply-To: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
References: <cover.1356045729.git.thomas.petazzoni@free-electrons.com>
Message-ID: <a7c2435ea5ec2e025b937940bc4d53733e0b8138.1356045729.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   10 ++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 13 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 956a140..aa2f28f 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -605,6 +605,15 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
+	bool "Linaro AArch64 12.12"
+	depends on BR2_aarch64
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
 	bool "Linaro AArch64 12.11"
 	depends on BR2_aarch64
@@ -681,6 +690,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-none-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_ARM201203
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 81aee56..5720cd2 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -262,6 +262,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7+bzr115029-20121015+bz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.11/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.11-1-20121127_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12),y)
+TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.12/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.12-20121214_linux.tar.bz2
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.7.9.5
