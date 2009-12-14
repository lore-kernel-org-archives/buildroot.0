From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Dec 2009 00:19:17 +0100
Subject: [Buildroot] [git commit master] Remove external source toolchain
	options
Message-ID: <20091214232100.3808577796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=65e99014ce8a10a32762896f3bbf6826f870788f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 target/device/Config.in.toolchain |  219 -------------------------------------
 toolchain/Config.in               |   12 --
 2 files changed, 0 insertions(+), 231 deletions(-)
 delete mode 100644 target/device/Config.in.toolchain

diff --git a/target/device/Config.in.toolchain b/target/device/Config.in.toolchain
deleted file mode 100644
index b610d1d..0000000
--- a/target/device/Config.in.toolchain
+++ /dev/null
@@ -1,219 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_SOURCE
-choice
-	prompt "Source location:"
-	default BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2 if BR2_avr32
-	help
-	  Select whether to use the toolchain built by the buildroot
-	  system or an external pre-built toolchain.
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
-	bool "Use prepatched source for AVR32 gcc-4.1.2 toolchain"
-	depends on BR2_avr32
-	depends on BR2_DEPRECATED
-	select BR2_EXT_GCC_VERSION_4_1_2
-	select BR2_EXT_BINUTILS_VERSION_2_17
-	select BR2_EXT_UCLIBC_VERSION_0_9_29
-	select BR2_TOOLCHAIN_ATMEL_AVR32
-	help
-	  The gcc-4.1.2 toolchain for the AVR32
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
-	bool "Use prepatched source for AVR32 gcc-4.2.1 toolchain"
-	depends on BR2_avr32
-	depends on BR2_DEPRECATED
-	select BR2_EXT_GCC_VERSION_4_2_1
-	select BR2_EXT_BINUTILS_VERSION_2_17
-	select BR2_EXT_UCLIBC_VERSION_0_9_29
-	select BR2_TOOLCHAIN_ATMEL_AVR32
-	select BR2_GCC_SUPPORTS_SYSROOT
-	help
-	  The gcc-4.2.1 toolchain for the AVR32
-	  * gcc-4.2.1
-	  * binutils-2.17
-	  * uClibc-0.9.29
-	  * gdb-6.4
-	  This will not be able to build qtopia
-	  due to internal errors.
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
-	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
-	depends on BR2_avr32
-	depends on BR2_DEPRECATED
-	select BR2_EXT_GCC_VERSION_4_2_2
-	select BR2_EXT_BINUTILS_VERSION_2_17
-	select BR2_EXT_UCLIBC_VERSION_0_9_29
-	select BR2_TOOLCHAIN_ATMEL_AVR32
-	select BR2_GCC_SUPPORTS_SYSROOT
-	help
-	  The gcc-4.2.2 toolchain for the AVR32
-	  * gcc-4.2.2
-	  * binutils-2.17
-	  * uClibc-0.9.29
-	  * gdb-6.7.1
-	  It is generated from buildroot-avr32-v2.2.0-rc4
-	  in http://www.atmel.no/buildroot
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
-	bool "Use prepatched source for AVR32 gcc-4.2.2 toolchain"
-	depends on BR2_avr32
-	select BR2_EXT_GCC_VERSION_4_2_2
-	select BR2_EXT_BINUTILS_VERSION_2_18
-	select BR2_EXT_UCLIBC_VERSION_0_9_30
-	select BR2_TOOLCHAIN_ATMEL_AVR32
-	select BR2_GCC_SUPPORTS_SYSROOT
-	help
-	  The gcc-4.2.2 toolchain for the AVR32
-	  * gcc-4.2.2
-	  * binutils-2.18
-	  * uClibc-0.9.29/30
-	  * gdb-6.7.1
-	  It is generated from buildroot-avr32-v2.3.0-rc1
-	  in http://www.atmel.no/buildroot
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
-	bool "Use prepatched source for AVR32 gcc-4.2.3 toolchain"
-	depends on BR2_avr32
-	depends on BR2_DEPRECATED
-	depends on BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
-	select BR2_EXT_GCC_VERSION_4_2_3
-	select BR2_EXT_BINUTILS_VERSION_2_17
-	select BR2_EXT_UCLIBC_VERSION_0_9_29
-	select BR2_EXT_UCLIBC_VERSION_0_9_30
-	select BR2_TOOLCHAIN_ATMEL_AVR32
-	help
-	  The gcc-4.2.3 toolchain for the AVR32
-	  * gcc-4.2.3
-	  * binutils-2.17
-	  * uClibc-0.9.29
-	  * gdb-6.7.1
-	  It is generated from buildroot-avr32-v2.2.0-rc4
-	  in http://www.atmel.no/buildroot
-
-config BR2_TOOLCHAIN_UNKNOWNVENDOR
-	bool "Use prepatched source from unknown vendor"
-	depends on !BR2_avr32
-
-endchoice
-
-config BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE
-	bool
-
-config BR2_TOOLCHAIN_ATMEL_AVR32
-	bool
-
-if BR2_TOOLCHAIN_ATMEL_AVR32
-config BR2_VENDOR_SITE
-	string
-	default "$(BR2_ATMEL_MIRROR)" if BR2_TOOLCHAIN_ATMEL_AVR32
-
-config BR2_VENDOR_SUFFIX
-	string
-	default "-avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
-
-config BR2_VENDOR_BINUTILS_RELEASE
-	string
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
-	default "-1.0.1" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
-
-config BR2_VENDOR_GCC_RELEASE
-	string
-	default "-2.0" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
-	default "-1.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
-
-config BR2_VENDOR_UCLIBC_RELEASE
-	string
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2
-	default "-2.1.3" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2_REV_2
-	default "-2.1.5" if BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3
-
-config BR2_VENDOR_GDB_RELEASE
-	string
-	default "-2.1.3" if BR2_GDB_VERSION_6_4
-	default "-2.1.3" if BR2_GDB_VERSION_6_4
-	default "-2.1.5" if BR2_GDB_VERSION_6_7_1
-
-config BR2_VENDOR_PATCH_DIR
-	string
-	default "Atmel/avr32" if BR2_TOOLCHAIN_ATMEL_AVR32
-endif
-if BR2_TOOLCHAIN_UNKNOWNVENDOR
-config BR2_VENDOR_SITE
-	string "vendor site"
-	default "http://vendor.com/somewhere/"
-
-config BR2_VENDOR_SUFFIX
-	string "vendor suffix"
-	default ""
-
-config BR2_VENDOR_BINUTILS_RELEASE
-	string "binutils suffix"
-	default ""
-
-config BR2_VENDOR_GCC_RELEASE
-	string "gcc suffix"
-	default ""
-
-config BR2_VENDOR_UCLIBC_RELEASE
-	string "uClibc suffix"
-	default ""
-
-config BR2_VENDOR_GDB_RELEASE
-	string "gdb suffix"
-	default ""
-
-config BR2_VENDOR_PATCH_DIR
-	string "local accumulated patchdir"
-	default "$(VENDOR)/$(ARCH)/"
-endif
-
-
-endif
-
-
-config	BR2_EXT_GCC_VERSION_4_1_2
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_GCC_VERSION_4_2_1
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_GCC_VERSION_4_2_2
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_GCC_VERSION_4_2_3
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_BINUTILS_VERSION_2_17
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_BINUTILS_VERSION_2_18
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_UCLIBC_VERSION_0_9_28_3
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_UCLIBC_VERSION_0_9_29
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_UCLIBC_VERSION_0_9_30
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
-
-config	BR2_EXT_UCLIBC_VERSION_0_9_30_1
-	bool
-	default !BR2_TOOLCHAIN_EXTERNAL_SOURCE
diff --git a/toolchain/Config.in b/toolchain/Config.in
index d66ce1d..ee34e03 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,8 +1,6 @@
 menu "Toolchain"
 choice
 	prompt "Toolchain type"
-	default BR2_TOOLCHAIN_BUILDROOT if !BR2_avr32
-	default BR2_TOOLCHAIN_EXTERNAL_SOURCE if BR2_avr32
 	help
 	  Select whether to use the toolchain provided by buildroot
 	  or an external toolchain.
@@ -12,22 +10,12 @@ choice
 
 config BR2_TOOLCHAIN_BUILDROOT
 	bool "Buildroot toolchain"
-	depends on !BR2_avr32
 
 config BR2_TOOLCHAIN_EXTERNAL
 	bool "External binary toolchain"
 
-config BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	bool "External source toolchain"
 endchoice
 
-config BR2_TOOLCHAIN_SOURCE
-	bool
-	default y if BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_EXTERNAL_SOURCE
-	default n if BR2_TOOLCHAIN_EXTERNAL
-
-source "target/device/Config.in.toolchain"
-
 source "toolchain/Config.in.1"
 source "toolchain/external-toolchain/Config.in"
 
-- 
1.6.3.3
