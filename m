From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  7 Apr 2013 20:01:02 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain-external: remove older Microblaze
	toolchain
In-Reply-To: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1365357662-25960-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1365357662-25960-5-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Our older Microblaze toolchain is no longer available: git.xilinx.com
has moved to Github, and Github doesn't allow to download such huge
binary blobs directly.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in   |   22 ----------------------
 toolchain/toolchain-external/ext-tool.mk |    6 ------
 2 files changed, 28 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 4e75d85..e09a122 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -643,16 +643,6 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
 	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
 	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
 
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
-	bool "Xilinx Little Endian Microblaze GNU Tools"
-	depends on BR2_microblazeel
-	depends on BR2_HOSTARCH = "x86_64"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://wiki.xilinx.com/mb-gnu-tools
-
 config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	bool "Xilinx Big Endian Microblaze GNU Tools"
 	depends on BR2_microblaze
@@ -665,16 +655,6 @@ config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
 	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
 	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
 
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	bool "Xilinx Big Endian Microblaze GNU Tools"
-	depends on BR2_microblazebe
-	depends on BR2_HOSTARCH = "x86_64"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://wiki.xilinx.com/mb-gnu-tools
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_03
 	bool "Linaro AArch64 13.03"
 	depends on BR2_aarch64
@@ -768,9 +748,7 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_02
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01
 	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
-	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
 	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
-	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201109
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201203
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201209
diff --git a/toolchain/toolchain-external/ext-tool.mk b/toolchain/toolchain-external/ext-tool.mk
index d667b86..890d7d8 100644
--- a/toolchain/toolchain-external/ext-tool.mk
+++ b/toolchain/toolchain-external/ext-tool.mk
@@ -261,15 +261,9 @@ TOOLCHAIN_EXTERNAL_SOURCE   = $(TOOLCHAIN_EXTERNAL_SOURCE_1) $(TOOLCHAIN_EXTERNA
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0_le.git;a=blob;h=d7b493c5dbcc24ba9cc3be2e4c14d6d9701e6805;hb=00163583b771bb4e937632765dd0c5516b3e31c4;f=
-TOOLCHAIN_EXTERNAL_SOURCE=microblazeel-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3),y)
 TOOLCHAIN_EXTERNAL_SITE=http://sources.buildroot.net/
 TOOLCHAIN_EXTERNAL_SOURCE=lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE=http://git.xilinx.com/?p=xldk/microblaze_v2.0.git;a=blob;h=71e031ae990e063a5718f90d30cf97ad85e2f565;hb=569081301f0f1d8d3b24335a364e8ff1774190d4;f=
-TOOLCHAIN_EXTERNAL_SOURCE=microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_01),y)
 TOOLCHAIN_EXTERNAL_SITE=http://releases.linaro.org/13.01/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE=gcc-linaro-aarch64-linux-gnu-4.7-2013.01-20130125_linux.tar.xz
-- 
1.7.9.5
