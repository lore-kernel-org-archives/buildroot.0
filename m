From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue, 13 Jan 2009 18:45:19 +0000 (UTC)
Subject: [Buildroot] svn commit:
	trunk/buildroot/target/device/Atmel/at91sam9263ek
Message-ID: <20090113184519.738CF76C8E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2009-01-13 18:45:19 +0000 (Tue, 13 Jan 2009)
New Revision: 24822

Log:
Update at91sam9263ek BSP

Modified:
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.28.config
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig


Changeset:
Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.28.config
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.28.config	2009-01-13 18:44:32 UTC (rev 24821)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek-linux-2.6.28.config	2009-01-13 18:45:19 UTC (rev 24822)
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
 # Linux kernel version: 2.6.28
-# Mon Jan 12 01:30:24 2009
+# Tue Jan 13 19:35:23 2009
 #
 CONFIG_ARM=y
 CONFIG_SYS_SUPPORTS_APM_EMULATION=y

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-13 18:44:32 UTC (rev 24821)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2009-01-13 18:45:19 UTC (rev 24822)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Mon Jan 12 01:37:30 2009
+# Tue Jan 13 19:37:43 2009
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -16,7 +16,6 @@
 # BR2_mipsel is not set
 # BR2_nios2 is not set
 # BR2_powerpc is not set
-# BR2_s390 is not set
 # BR2_sh is not set
 # BR2_sh64 is not set
 # BR2_sparc is not set
@@ -252,7 +251,7 @@
 # BR2_UCLIBC_VERSION_0_9_29 is not set
 BR2_UCLIBC_VERSION_0_9_30=y
 # BR2_UCLIBC_VERSION_SNAPSHOT is not set
-BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.29.config"
+BR2_UCLIBC_CONFIG="toolchain/uClibc/uClibc-0.9.30.config"
 BR2_ENABLE_LOCALE=y
 # BR2_ENABLE_LOCALE_PREGENERATED is not set
 # BR2_PTHREADS_NONE is not set
@@ -462,6 +461,7 @@
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
 # BR2_PACKAGE_LIBCURL is not set
+# BR2_PACKAGE_LIBDNET is not set
 # BR2_PACKAGE_LIBEXOSIP2 is not set
 # BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
@@ -755,7 +755,7 @@
 BR2_PACKAGE_LIBUNGIF=y
 BR2_PACKAGE_LINUX_FUSION=y
 BR2_PACKAGE_LITE=y
-# BR2_PACKAGE_PIXMAN is not set
+BR2_PACKAGE_PIXMAN=y
 # BR2_PACKAGE_SAWMAN is not set
 BR2_PACKAGE_SDL=y
 
@@ -988,12 +988,11 @@
 BR2_TARGET_ROOTFS_JFFS2=y
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_1056 is not set
 # BR2_TARGET_ROOTFS_JFFS2_DATAFLASH_528 is not set
+BR2_TARGET_ROOTFS_JFFS2_NANDFLASH_2K_128K=y
 # BR2_TARGET_ROOTFS_JFFS2_FLASH_128 is not set
 # BR2_TARGET_ROOTFS_JFFS2_FLASH_64 is not set
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM=y
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_PAGESIZE=0x1000
-BR2_TARGET_ROOTFS_JFFS2_CUSTOM_EBSIZE=0x20000
-BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x1000
+# BR2_TARGET_ROOTFS_JFFS2_CUSTOM is not set
+BR2_TARGET_ROOTFS_JFFS2_PAGESIZE=0x800
 BR2_TARGET_ROOTFS_JFFS2_EBSIZE=0x20000
 BR2_TARGET_ROOTFS_JFFS2_NOCLEANMARKER=y
 # BR2_JFFS2_TARGET_SREC is not set
