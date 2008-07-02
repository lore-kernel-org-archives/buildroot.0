From: correa at uclibc.org <correa@uclibc.org>
Date: Wed,  2 Jul 2008 08:43:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel/atngw100
Message-ID: <20080702154400.365BD3C608@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: correa
Date: 2008-07-02 08:43:58 -0700 (Wed, 02 Jul 2008)
New Revision: 22610

Log:
Update avr32 defconfigs

Modified:
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-02 11:34:49 UTC (rev 22609)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-07-02 15:43:58 UTC (rev 22610)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Tue May  6 03:20:48 2008
+# Wed Jul  2 05:02:43 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -47,7 +47,10 @@
 #
 # Selection criteria
 #
-BR2_TARGET_ATMEL_ALL=y
+BR2_TARGET_ATMEL_NET=y
+# BR2_TARGET_ATMEL_LCD is not set
+# BR2_TARGET_ATMEL_FPDSP is not set
+# BR2_TARGET_ATMEL_MPB is not set
 
 #
 # Device Selection
@@ -83,10 +86,6 @@
 #
 BR2_TARGET_ATMEL_COPYTO=""
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
-
-#
-# It will be copied to $(BR2_AT91BOOTSTRAP_JUMP_ADDR)
-#
 # BR2_TARGET_VALKA is not set
 
 #
@@ -103,6 +102,7 @@
 #
 # Build options
 #
+BR2_PRIMARY_SITE=""
 BR2_WGET="wget --passive-ftp --retry-connrefused --waitretry=10"
 BR2_SVN_CO="svn co"
 BR2_SVN_UP="svn up"
@@ -195,8 +195,9 @@
 # BR2_KERNEL_HEADERS_2_6_22 is not set
 # BR2_KERNEL_HEADERS_2_6_23 is not set
 BR2_KERNEL_HEADERS_2_6_24=y
+# BR2_KERNEL_HEADERS_2_6_25 is not set
 # BR2_KERNEL_HEADERS_SNAP is not set
-BR2_DEFAULT_KERNEL_HEADERS="2.6.24"
+BR2_DEFAULT_KERNEL_HEADERS="2.6.24.7"
 
 #
 # uClibc Options
@@ -231,6 +232,8 @@
 # BR2_GCC_VERSION_4_1_2 is not set
 BR2_GCC_VERSION_4_2_1=y
 # BR2_GCC_VERSION_4_2_3 is not set
+# BR2_GCC_VERSION_4_2_4 is not set
+# BR2_GCC_VERSION_4_3_1 is not set
 BR2_GCC_SUPPORTS_SYSROOT=y
 # BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE is not set
 BR2_GCC_VERSION="4.2.1"
@@ -258,18 +261,14 @@
 # BR2_GDB_VERSION_6_5 is not set
 # BR2_GDB_VERSION_6_6 is not set
 # BR2_GDB_VERSION_6_7_1 is not set
+# BR2_GDB_VERSION_6_8 is not set
 # BR2_GDB_VERSION_SNAPSHOT is not set
 BR2_GDB_VERSION="6.4"
 
 #
-# elf2flt
+# Common Toolchain Options
 #
-# BR2_ELF2FLT is not set
 # BR2_MKLIBS is not set
-
-#
-# Common Toolchain Options
-#
 # BR2_PACKAGE_SSTRIP_TARGET is not set
 # BR2_PACKAGE_SSTRIP_HOST is not set
 # BR2_ENABLE_MULTILIB is not set
@@ -291,8 +290,9 @@
 # BR2_BUSYBOX_VERSION_1_8_X is not set
 # BR2_BUSYBOX_VERSION_1_9_X is not set
 BR2_BUSYBOX_VERSION_1_10_X=y
+# BR2_BUSYBOX_VERSION_1_11_X is not set
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.10.1"
+BR2_BUSYBOX_VERSION="1.10.4"
 BR2_PACKAGE_BUSYBOX_FULLINSTALL=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -327,7 +327,7 @@
 # BR2_PACKAGE_LIBTOOL is not set
 # BR2_PACKAGE_M4 is not set
 # BR2_PACKAGE_OPROFILE is not set
-# BR2_PACKAGE_PKGCONFIG is not set
+BR2_PACKAGE_PKGCONFIG=y
 # BR2_READLINE is not set
 # BR2_PACKAGE_PCRE is not set
 
@@ -368,6 +368,8 @@
 # BR2_PACKAGE_STARTUP_NOTIFICATION is not set
 BR2_PACKAGE_STRACE=y
 # BR2_PACKAGE_SUDO is not set
+BR2_DATABASE_SUPPORT=y
+# BR2_PACKAGE_MYSQL_CLIENT is not set
 BR2_NETWORK_SUPPORT=y
 
 #
@@ -397,6 +399,7 @@
 # BR2_PACKAGE_HASERL_VERSION_0_8_X is not set
 BR2_PACKAGE_HASERL_VERSION_0_9_X=y
 BR2_PACKAGE_HASERL_VERSION="0.9.23"
+# BR2_PACKAGE_IFPLUGD is not set
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
@@ -416,6 +419,7 @@
 BR2_PACKAGE_LRZSZ=y
 # BR2_PACKAGE_MDNSRESPONDER is not set
 BR2_PACKAGE_MICROCOM=y
+# BR2_PACKAGE_MIIDIAG is not set
 # BR2_PACKAGE_MROUTED is not set
 # BR2_PACKAGE_MUTT is not set
 BR2_PACKAGE_NBD=y
@@ -520,6 +524,7 @@
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
+# BR2_PACKAGE_I2C_TOOLS is not set
 # BR2_PACKAGE_INPUT_TOOLS is not set
 # BR2_PACKAGE_IOSTAT is not set
 # BR2_PACKAGE_LIBAIO is not set
@@ -570,6 +575,7 @@
 # BR2_PACKAGE_XFSPROGS is not set
 # BR2_AUDIO_SUPPORT is not set
 # BR2_GRAPHIC_SUPPORT is not set
+BR2_PACKAGE_LIBGLIB2=y
 BR2_COMPRESSOR_SUPPORT=y
 BR2_PACKAGE_LZO=y
 # BR2_PACKAGE_LZMA_TARGET is not set
@@ -581,10 +587,7 @@
 # BR2_PACKAGE_EXPAT is not set
 # BR2_PACKAGE_EZXML is not set
 # BR2_PACKAGE_LIBXML2 is not set
-
-#
-# libxslt	- disabled (requires pkgconfig)
-#
+# BR2_PACKAGE_LIBXSLT is not set
 # BR2_PACKAGE_XERCES is not set
 BR2_JAVA_SUPPORT=y
 # BR2_PACKAGE_CLASSPATH is not set
