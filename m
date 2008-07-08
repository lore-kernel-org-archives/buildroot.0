From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Date: Tue, 08 Jul 2008 22:10:37 +0200
Subject: [Buildroot] atngw100-base_defconfig does not use "sysroot"
Message-ID: <4873C9BD.3030005@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Any reason why atngw100-base does not use sysroot for the toolchain?
Anyone minds that I change so that all Atmel AVR defconfigs
use the same toolchain configuration?


Index: target/device/Atmel/atngw100-base/atngw100-base_defconfig
===================================================================
- --- target/device/Atmel/atngw100-base/atngw100-base_defconfig
(revision 22692)
+++ target/device/Atmel/atngw100-base/atngw100-base_defconfig
(arbetskopia)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
- -# Fri Jul  4 12:05:11 2008
+# Tue Jul  8 21:25:13 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -164,9 +164,9 @@
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_1_2 is not set
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_1 is not set
 BR2_TOOLCHAIN_ATMEL_AVR32_4_2_2=y
- -# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
 # BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3 is not set
 # BR2_TOOLCHAIN_UNKNOWNVENDOR is not set
+# BR2_TOOLCHAIN_ATMEL_AVR32_4_2_3_ENABLE is not set
 BR2_TOOLCHAIN_ATMEL_AVR32=y
 BR2_VENDOR_SITE="$(BR2_ATMEL_MIRROR)"
 BR2_VENDOR_SUFFIX="-avr32"
@@ -244,7 +244,7 @@
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.2"
- -# BR2_TOOLCHAIN_SYSROOT is not set
+BR2_TOOLCHAIN_SYSROOT=y
 # BR2_GCC_USE_SJLJ_EXCEPTIONS is not set
 BR2_EXTRA_GCC_CONFIG_OPTIONS=""
 BR2_GCC_CROSS_CXX=y
@@ -362,12 +362,12 @@
 # BR2_PACKAGE_POPT is not set
 # BR2_PACKAGE_PORTAGE is not set
 # BR2_PACKAGE_SCREEN is not set
- -# BR2_PACKAGE_SQLITE is not set
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 # BR2_PACKAGE_STRACE is not set
 # BR2_PACKAGE_SUDO is not set
 BR2_DATABASE_SUPPORT=y
 # BR2_PACKAGE_MYSQL_CLIENT is not set
+# BR2_PACKAGE_SQLITE is not set
 BR2_NETWORK_SUPPORT=y

 #

BR
Ulf Samuelsson
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)
Comment: Using GnuPG with SUSE - http://enigmail.mozdev.org

iD8DBQFIc8m9AyRRH5cXxqwRAr9eAJ9T8oDV6YVeKJRFTBXMZ7NLEF75wQCfUcDg
x2ySmRHD54wwhe+iGz3iLL8=
=raCU
-----END PGP SIGNATURE-----
