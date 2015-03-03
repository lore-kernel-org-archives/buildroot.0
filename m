From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 11:10:27 -0300
Subject: [Buildroot] [PATCH 1/3] toolchain/external: remove xilinx
	microblaze v2/14.3 toolchains
Message-ID: <1425391829-16539-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These have been deprecated since 2014.02

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-external/Config.in             | 60 ----------------------
 toolchain/toolchain-external/toolchain-external.mk | 12 -----
 2 files changed, 72 deletions(-)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 6ab483a..4321e43 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -804,62 +804,6 @@ config BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2
 	  Toolchain for the Blackfin architecture, from
 	  http://blackfin.uclinux.org.
 
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
-	bool "Xilinx Little Endian Microblaze GNU Tools 14.3"
-	depends on BR2_microblazeel
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
-	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
-
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
-	bool "Xilinx Little Endian Microblaze GNU Tools v2"
-	depends on BR2_microblazeel
-	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	# kernel headers: 2.6.37
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://wiki.xilinx.com/mb-gnu-tools
-
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
-	bool "Xilinx Big Endian Microblaze GNU Tools"
-	depends on BR2_microblazebe
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_3
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://git.xilinx.com/?p=microblaze-gnu.git;a=tree;f=binaries. It
-	  uses gcc 4.6.2, binutils 2.21.53, glibc 2.14 and gdb 7.4.50.
-
-config BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
-	bool "Xilinx Big Endian Microblaze GNU Tools"
-	depends on BR2_microblazebe
-	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_DEPRECATED_SINCE_2014_02
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	# kernel headers: 2.6.37
-	help
-	  Toolchain for the Microblaze architecture, from
-	  http://wiki.xilinx.com/mb-gnu-tools
-
 config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	bool "Linaro AArch64 14.09"
 	depends on BR2_aarch64
@@ -968,10 +912,6 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "arm-arago-linux-gnueabi" if BR2_TOOLCHAIN_EXTERNAL_ARAGO_ARMV5TE_201109
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64
 	default "aarch64-linux-gnu"      if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AARCH64
-	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3
-	default "microblazeel-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2
-	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3
-	default "microblaze-unknown-linux-gnu" if BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201311
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201405
 	default "mips-linux-gnu"         if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_MIPS201411
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index ab73f9a..f9b8517 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -340,18 +340,6 @@ else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2014R1),y)
 TOOLCHAIN_EXTERNAL_SITE = http://downloads.sourceforge.net/project/adi-toolchain/2014R1/2014R1-RC2/i386/
 TOOLCHAIN_EXTERNAL_SOURCE = blackfin-toolchain-2014R1-RC2.i386.tar.bz2
 TOOLCHAIN_EXTERNAL_EXTRA_DOWNLOADS = blackfin-toolchain-uclibc-full-2014R1-RC2.i386.tar.bz2
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE = microblazeel-unknown-linux-gnu.tgz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_14_3),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE = lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEBE_V2),y)
-TOOLCHAIN_EXTERNAL_SITE = http://sources.buildroot.net/
-TOOLCHAIN_EXTERNAL_SOURCE = microblaze-unknown-linux-gnu.tgz
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/14.09/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-- 
2.0.5
