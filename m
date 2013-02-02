From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 2 Feb 2013 17:35:31 +0100
Subject: [Buildroot] [git commit] toolchain-external: add support for
	AArch64 Linaro 2013.01 toolchain
Message-ID: <20130202163912.8570F9A8FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7bf0e3538f6252ca9c4cd2f69a23ea23af4ebb7f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/toolchain-external/Config.in   |   12 ++++++++++++
 toolchain/toolchain-external/ext-tool.mk |    3 +++
 2 files changed, 15 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 28e9444..1021b62 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -651,6 +651,17 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	  Toolchain for the Microblaze architecture, from
 	  http://wiki.xilinx.com/mb-gnu-tools
 
+config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
+	bool "Linaro AArch64 13.01"
+	depends on BR2_aarch64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	help
+	  Toolchain for the AArch64 architecture, from
+	  http://www.linaro.org/engineering/armv8/
+
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
 	bool "Linaro AArch64 12.12"
 	depends on BR2_aarch64
@@ -743,6 +754,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_10
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_11
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12
+	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index 92bf235..8a41043 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -265,6 +265,9 @@ TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.11-1-20121127_li
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_12_12),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/12.12/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2012.12-20121214_linux.tar.bz2
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01),y)
+TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.01/components/toolchain/binaries/
+TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.01-20130125_linux.tar.xz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE=$(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
