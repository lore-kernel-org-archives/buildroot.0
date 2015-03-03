From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue,  3 Mar 2015 12:52:27 -0300
Subject: [Buildroot] [PATCH v2 4/8] toolchain/external: remove xilinx
	microblaze v2/14.3 toolchains
In-Reply-To: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
References: <1425397951-30603-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1425397951-30603-4-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

These have been deprecated since 2014.02

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 toolchain/toolchain-external/Config.in             | 60 ----------------------
 .../toolchain-external/toolchain-external.hash     |  6 ---
 toolchain/toolchain-external/toolchain-external.mk | 12 -----
 3 files changed, 78 deletions(-)

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
diff --git a/toolchain/toolchain-external/toolchain-external.hash b/toolchain/toolchain-external/toolchain-external.hash
index 7f211db..1f4de78 100644
--- a/toolchain/toolchain-external/toolchain-external.hash
+++ b/toolchain/toolchain-external/toolchain-external.hash
@@ -50,9 +50,3 @@ sha256 254af7d02eb3bcc8345c78e131700bc995d65b68232caaed21150a5fd1456070  arago-2
 sha256 0cffac0caea0eb3c8bdddfa14be011ce366680f40aeddbefc7cf23cb6d4f1891  gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 4bc9d86390f8fa67a693ba4768ba5b12faaf7dd37c706c05ccd9321e765226e4  gcc-linaro-armeb-linux-gnueabihf-4.9-2014.09_linux.tar.xz
 sha256 3954f496ab01de67241109e82abfaa9b7625fdab4f05e79e7902e9814a07b832  gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz
-
-# Xilinx microblaze toolchains (hosted on Buildroot because no longer available upstream)
-sha256 3e1c7c53fadfd3346ab60386c573f07f0617ab119546ec8cb93bc20c23cff2b3  lin32-microblazeel-unknown-linux-gnu_14.3_early.tar.xz
-sha256 b72f7be654a75bb643372f3909de7b8739f0f56bdf8bea98fea41dcecefe6b6b  microblazeel-unknown-linux-gnu.tgz
-sha256 ed2fea022f2def257ca6db09911b73c7102aaa1792d2da2d81371a763e5c2eff  lin32-microblaze-unknown-linux-gnu_14.3_early.tar.xz
-sha256 53ee0b1ad50e651eb14d0b53044b90e7bf7e3cb341ee57fe575bc4c4e142ea37  microblaze-unknown-linux-gnu.tgz
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
