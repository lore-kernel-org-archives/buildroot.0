From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  5 Mar 2014 23:23:36 +0100
Subject: [Buildroot] [PATCH 2/6] toolchain-external: add publicly available
	musl toolchains
In-Reply-To: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1394058220-5863-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1394058220-5863-3-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit adds nine toolchains based on the musl C library that are
publicly available from the musl-cross project. Note that toolchains
prior to version 0.9.15 cannot be used in Buildroot because they don't
have sysroot support.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/toolchain-external/Config.in             | 148 +++++++++++++++++++++
 toolchain/toolchain-external/toolchain-external.mk |  27 ++++
 2 files changed, 175 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 7ad46c3..063df14 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -842,6 +842,145 @@ config BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_09
 	  Toolchain for the AArch64 architecture, from
 	  http://www.linaro.org/engineering/armv8/
 
+config BR2_TOOLCHAIN_EXTERNAL_ARM_MUSL_CROSS
+	bool "Musl ARM toolchain"
+	depends on BR2_arm
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  ARM toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included. The
+	  toolchain is built for ARMv4t, soft-float.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_X86_MUSL_CROSS
+	bool "Musl x86 toolchain"
+	# The toolchain is built for i486, so we exclude i386
+	depends on BR2_i386 && !BR2_x86_i386
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  x86 toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included. The
+	  toolchain is built for i486.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_MICROBLAZE_MUSL_CROSS
+	bool "Musl Microblaze toolchain"
+	depends on BR2_microblaze
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  Microblaze toolchain based on the Musl C library, provided
+	  by the musl-cross project. It uses gcc 4.8.2, binutils 2.24
+	  and musl 0.9.15. It does not have a cross debugger
+	  included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_MIPS_MUSL_CROSS
+	bool "Musl MIPS hard-float toolchain"
+	depends on BR2_mips && !BR2_SOFT_FLOAT
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  MIPS toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_MIPS_SF_MUSL_CROSS
+	bool "Musl MIPS soft-float toolchain"
+	depends on BR2_mips && BR2_SOFT_FLOAT
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  MIPS toolchain based on the Musl C library, provided by the
+	  musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_MIPSEL_MUSL_CROSS
+	bool "Musl MIPSel hard-float toolchain"
+	depends on BR2_mipsel && !BR2_SOFT_FLOAT
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  MIPSel toolchain based on the Musl C library, provided by
+	  the musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_MIPSEL_SF_MUSL_CROSS
+	bool "Musl MIPSel soft-float toolchain"
+	depends on BR2_mipsel && BR2_SOFT_FLOAT
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  MIPSel toolchain based on the Musl C library, provided by
+	  the musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_POWERPC_MUSL_CROSS
+	bool "Musl PowerPC toolchain"
+	depends on BR2_powerpc
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  PowerPC toolchain based on the Musl C library, provided by
+	  the musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
+config BR2_TOOLCHAIN_EXTERNAL_X86_64_MUSL_CROSS
+	bool "Musl x86-64 toolchain"
+	depends on BR2_x86_64
+	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
+	select BR2_TOOLCHAIN_EXTERNAL_MUSL
+	select BR2_INSTALL_LIBSTDCPP
+	select BR2_HOSTARCH_NEEDS_IA32_LIBS
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
+	help
+	  x86-64 toolchain based on the Musl C library, provided by
+	  the musl-cross project. It uses gcc 4.8.2, binutils 2.24 and
+	  musl 0.9.15. It does not have a cross debugger included.
+
+	  http://musl.codu.org/
+
 config BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 	bool "Custom toolchain"
 	help
@@ -927,6 +1066,15 @@ config BR2_TOOLCHAIN_EXTERNAL_PREFIX
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2012R2 && BR2_BINFMT_FDPIC
 	default "bfin-uclinux"		 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FLAT
 	default "bfin-linux-uclibc"	 if BR2_TOOLCHAIN_EXTERNAL_BLACKFIN_UCLINUX_2013R1 && BR2_BINFMT_FDPIC
+	default "arm-linux-musleabi"	 if BR2_TOOLCHAIN_EXTERNAL_ARM_MUSL_CROSS
+	default "i486-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_X86_MUSL_CROSS
+	default "microblaze-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MICROBLAZE_MUSL_CROSS
+	default "mips-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MIPS_MUSL_CROSS
+	default "mips-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MIPS_SF_MUSL_CROSS
+	default "mipsel-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MIPSEL_MUSL_CROSS
+	default "mipsel-sf-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_MIPSEL_SF_MUSL_CROSS
+	default "powerpc-linux-musl-gcc" if BR2_TOOLCHAIN_EXTERNAL_POWERPC_MUSL_CROSS
+	default "x86_64-linux-musl"	 if BR2_TOOLCHAIN_EXTERNAL_X86_64_MUSL_CROSS
 	default BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX \
 					 if BR2_TOOLCHAIN_EXTERNAL_CUSTOM
 
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 1b1053d..de3575c 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -352,6 +352,33 @@ TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.10-1_linux.tar
 else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_LINARO_AARCH64_13_11),y)
 TOOLCHAIN_EXTERNAL_SITE = http://releases.linaro.org/13.11/components/toolchain/binaries/
 TOOLCHAIN_EXTERNAL_SOURCE = gcc-linaro-aarch64-linux-gnu-4.8-2013.11_linux.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_ARM_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-arm-linux-musleabi-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_X86_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-i486-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MICROBLAZE_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-microblaze-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MIPS_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MIPS_SF_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mips-sf-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MIPSEL_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_MIPSEL_SF_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-mipsel-sf-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_POWERPC_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-powerpc-linux-musl-0.9.15.tar.xz
+else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_X86_64_MUSL_CROSS),y)
+TOOLCHAIN_EXTERNAL_SITE = https://googledrive.com/host/0BwnS5DMB0YQ6bDhPZkpOYVFhbk0/musl-0.9.15/
+TOOLCHAIN_EXTERNAL_SOURCE = crossx86-x86_64-linux-musl-0.9.15.tar.xz
 else
 # Custom toolchain
 TOOLCHAIN_EXTERNAL_SITE = $(dir $(call qstrip,$(BR2_TOOLCHAIN_EXTERNAL_URL)))
-- 
1.8.3.2
