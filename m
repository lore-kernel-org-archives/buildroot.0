From: ulf at uclibc.org <ulf@uclibc.org>
Date: Tue,  8 Jan 2008 13:05:51 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/target/device: Arm Atmel
	Atmel/DataFlashBoot Atmel/at9 etc...
Message-ID: <20080108210551.8551E12C544@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ulf
Date: 2008-01-08 13:05:50 -0800 (Tue, 08 Jan 2008)
New Revision: 20828

Log:
Update ATMEL_MIRROR and bump at91bootstrap to v2.4

Modified:
   trunk/buildroot/target/device/Arm/integrator926_defconfig
   trunk/buildroot/target/device/Arm/integrator926_huge_defconfig
   trunk/buildroot/target/device/Atmel/Config.in.mirrors
   trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
   trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
   trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
   trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
   trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
   trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
   trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
   trunk/buildroot/target/device/Config.in.toolchain


Changeset:
Modified: trunk/buildroot/target/device/Arm/integrator926_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Arm/integrator926_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -120,7 +120,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 BR2_TOPDIR_PREFIX=""

Modified: trunk/buildroot/target/device/Arm/integrator926_huge_defconfig
===================================================================
--- trunk/buildroot/target/device/Arm/integrator926_huge_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Arm/integrator926_huge_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -96,7 +96,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 BR2_TOPDIR_PREFIX=""

Modified: trunk/buildroot/target/device/Atmel/Config.in.mirrors
===================================================================
--- trunk/buildroot/target/device/Atmel/Config.in.mirrors	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/Config.in.mirrors	2008-01-08 21:05:50 UTC (rev 20828)
@@ -2,7 +2,7 @@
 
 config BR2_ATMEL_MIRROR
 	string "Atmel AVR32/AT91 download site"
-	default "ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+	default "ftp://www.at91.com/pub/buildroot/"
 	help
 	  Unofficial site for AVR32/AT91 Buildroot patches, or your local mirror.
 	  Atmel does not currently support buildroot, but this site makes

Modified: trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/DataFlashBoot/DataflashBoot.mk	2008-01-08 21:05:50 UTC (rev 20828)
@@ -7,7 +7,7 @@
 DATAFLASHBOOT_NAME:=DataflashBoot-$(DATAFLASHBOOT_VERSION)
 ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
 #"))
-DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)/Source
+DATAFLASHBOOT_SITE:=$(ATMEL_MIRROR)
 DATAFLASHBOOT_SOURCE:=$(DATAFLASHBOOT_NAME).tar.bz2
 DATAFLASHBOOT_DIR:=$(PROJECT_BUILD_DIR)/$(DATAFLASHBOOT_NAME)
 DATAFLASHBOOT_BINARY:=$(DATAFLASHBOOT_NAME).bin

Modified: trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91bootstrap/at91bootstrap.mk	2008-01-08 21:05:50 UTC (rev 20828)
@@ -3,13 +3,13 @@
 # at91bootstrap
 #
 #############################################################
-AT91BOOTSTRAP_VERSION:=2.3
-AT91BOOTSTRAP_PATCH_LEVEL:=4
-AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION).$(AT91BOOTSTRAP_PATCH_LEVEL)
+AT91BOOTSTRAP_VERSION:=2.4
+AT91BOOTSTRAP_PATCH_LEVEL:=
+AT91BOOTSTRAP_PATCHED_VERSION:=$(AT91BOOTSTRAP_VERSION)$(AT91BOOTSTRAP_PATCH_LEVEL)
 AT91BOOTSTRAP_NAME:=at91bootstrap-$(AT91BOOTSTRAP_VERSION)
 ATMEL_MIRROR:=$(strip $(subst ",, $(BR2_ATMEL_MIRROR)))
 #"))
-AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)/Source
+AT91BOOTSTRAP_SITE:=$(ATMEL_MIRROR)
 AT91BOOTSTRAP_SOURCE:=$(AT91BOOTSTRAP_NAME).tar.bz2
 AT91BOOTSTRAP_DIR:=$(PROJECT_BUILD_DIR)/$(AT91BOOTSTRAP_NAME)
 AT91BOOTSTRAP:=$(strip $(subst ",, $(BR2_AT91BOOTSTRAP)))
@@ -42,7 +42,7 @@
 $(AT91BOOTSTRAP_DIR)/.unpacked: $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE)
 	mkdir -p $(PROJECT_BUILD_DIR)
 	$(AT91BOOTSTRAP_ZCAT) $(DL_DIR)/$(AT91BOOTSTRAP_SOURCE) | tar -C $(PROJECT_BUILD_DIR) $(TAR_OPTIONS) -
-	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap\*.patch
+	toolchain/patch-kernel.sh $(AT91BOOTSTRAP_DIR) target/device/Atmel/at91bootstrap/ at91bootstrap-$(AT91BOOTSTRAP_VERSION)\*.patch
 	touch $@
 
 $(AT91BOOTSTRAP_DIR)/.configured: $(AT91BOOTSTRAP_DIR)/.unpacked .config

Modified: trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91rm9200df/at91rm9200df_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -136,7 +136,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91sam9260dfc/at91sam9260dfc_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov  2 13:35:52 2007
+# Fri Jan  4 12:49:39 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -143,11 +143,14 @@
 # Mirrors and Download locations
 #
 BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set
@@ -293,11 +296,11 @@
 BR2_PACKAGE_BUSYBOX=y
 # BR2_BUSYBOX_VERSION_1_2_2_1 is not set
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
-# BR2_BUSYBOX_VERSION_1_7_0 is not set
-# BR2_BUSYBOX_VERSION_1_7_1 is not set
-BR2_BUSYBOX_VERSION_1_7_2=y
+# BR2_BUSYBOX_VERSION_1_7_X is not set
+# BR2_BUSYBOX_VERSION_1_8_X is not set
+BR2_BUSYBOX_VERSION_1_9_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.7.2"
+BR2_BUSYBOX_VERSION="1.9.0"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
 # BR2_PACKAGE_BUSYBOX_HIDE_OTHERS is not set
@@ -364,6 +367,10 @@
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
 # BR2_PACKAGE_LIBXML2 is not set
+
+#
+# libxslt	- disabled (requires pkgconfig)
+#
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
@@ -389,7 +396,10 @@
 #
 # Networking applications
 #
-# BR2_PACKAGE_ARGUS is not set
+
+#
+# argus		- disabled (requires libpcap)
+#
 # BR2_PACKAGE_AVAHI is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
@@ -404,12 +414,17 @@
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
-# BR2_PACKAGE_IPSEC_TOOLS is not set
+
+#
+# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
+#
 # BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
@@ -467,15 +482,22 @@
 # BR2_PACKAGE_TINYHTTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
-# BR2_PACKAGE_VPNC is not set
+
+#
+# vpnc		- disabled (requires libgcrypt and libgpg_error)
+#
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WGET is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
 BR2_BLOCKDEV_SUPPORT=y
-# BR2_PACKAGE_DBUS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HDPARM is not set
@@ -519,6 +541,7 @@
 BR2_PACKAGE_MTD_MTD_DEBUG=y
 BR2_PACKAGE_MTD_DOCFDISK=y
 BR2_PACKAGE_MTD_DOC_LOADBIOS=y
+# BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
@@ -532,7 +555,10 @@
 # BR2_PACKAGE_XFSPROGS is not set
 BR2_AUDIO_SUPPORT=y
 # BR2_PACKAGE_ALSA_LIB is not set
-# BR2_PACKAGE_ASTERISK is not set
+
+#
+# asterisk	- disabled (required openssl and mpg123)
+#
 # BR2_PACKAGE_AUMIX is not set
 # BR2_PACKAGE_LIBMAD is not set
 # BR2_PACKAGE_LIBOGG is not set
@@ -543,6 +569,7 @@
 #
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_SPEEX is not set
 BR2_GRAPHIC_SUPPORT=y
 
 #
@@ -566,6 +593,7 @@
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_SDL_TTF is not set
 # BR2_PACKAGE_TIFF is not set
 
 #
@@ -592,7 +620,10 @@
 #
 # X libraries and helper libraries
 #
-# BR2_PACKAGE_ATK is not set
+
+#
+# atk		- disabled (requires libglib2)
+#
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
@@ -611,6 +642,10 @@
 #
 
 #
+# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
+#
+
+#
 # Video libraries/codecs and applications
 #
 # BR2_PACKAGE_MPLAYER is not set
@@ -622,11 +657,17 @@
 BR2_PACKAGE_ZLIB=y
 # BR2_PACKAGE_ZLIB_TARGET_HEADERS is not set
 BR2_SCRIPTING_SUPPORT=y
+
+#
+# lua		- disabled (requires readline and ncurses)
+#
 # BR2_PACKAGE_MICROPERL is not set
 # BR2_PACKAGE_PYTHON is not set
 # BR2_PACKAGE_RUBY is not set
 # BR2_PACKAGE_TCL is not set
 # BR2_PACKAGE_PHP is not set
+BR2_GAMES=y
+# BR2_PACKAGE_DOOM is not set
 
 #
 # Target filesystem options

Modified: trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91sam9260pf/at91sam9260pf_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -68,7 +68,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 BR2_TOPDIR_PREFIX=""

Modified: trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91sam9261ek/at91sam9261ek_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -150,7 +150,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set

Modified: trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/at91sam9263ek/at91sam9263ek_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -1,6 +1,6 @@
 #
 # Automatically generated make config: don't edit
-# Fri Nov  2 13:40:33 2007
+# Tue Jan  8 09:03:00 2008
 #
 BR2_HAVE_DOT_CONFIG=y
 BR2_VERSION="0.10.0-svn"
@@ -39,8 +39,8 @@
 # BR2_xscale is not set
 # BR2_iwmmxt is not set
 BR2_ARM_TYPE="GENERIC_ARM"
-BR2_ARM_OABI=y
-# BR2_ARM_EABI is not set
+# BR2_ARM_OABI is not set
+BR2_ARM_EABI=y
 BR2_ARCH="arm"
 BR2_ENDIAN="LITTLE"
 
@@ -51,8 +51,8 @@
 #
 # Project Options
 #
-BR2_PROJECT="at91sam9261ek"
-BR2_HOSTNAME="AT91SAM9261EK"
+BR2_PROJECT="at91sam9263ek"
+BR2_HOSTNAME="AT91SAM9263EK"
 BR2_BANNER="Welcome to the Erik's uClibc development environment running on an AT91SAM9261EK"
 
 #
@@ -84,8 +84,6 @@
 # BR2_TARGET_AT91SAM9262EK is not set
 BR2_TARGET_AT91SAM9263EK=y
 # BR2_TARGET_AT91SAM9XEEK is not set
-# BR2_TARGET_AT91SAM9261EK_SPIMODE0 is not set
-# BR2_TARGET_AT91SAM9261EK_SPIMODE3 is not set
 BR2_BOARD_NAME="at91sam9263ek"
 # BR2_TARGET_AT91_ADVANCED_INFO is not set
 
@@ -100,7 +98,7 @@
 BR2_TARGET_ATMEL_COPYTO="/tftpboot"
 BR2_BOARD_PATH="target/device/Atmel/$(BR2_BOARD_NAME)"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_SERVERIP="10.175.196.220"
+BR2_TARGET_UBOOT_SERVERIP="10.175.196.221"
 BR2_TARGET_UBOOT_IPADDR="10.175.196.18"
 BR2_TARGET_UBOOT_GATEWAY="10.175.196.1"
 BR2_TARGET_UBOOT_NETMASK="255.255.255.0"
@@ -145,11 +143,14 @@
 # Mirrors and Download locations
 #
 BR2_SOURCEFORGE_MIRROR="easynews"
+BR2_KERNEL_MIRROR="http://www.kernel.org/pub/"
+BR2_GNU_MIRROR="http://ftp.gnu.org/pub/gnu"
+BR2_DEBIAN_MIRROR="http://ftp.debian.org"
 
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set
@@ -295,11 +296,11 @@
 BR2_PACKAGE_BUSYBOX=y
 # BR2_BUSYBOX_VERSION_1_2_2_1 is not set
 # BR2_BUSYBOX_VERSION_1_6_1 is not set
-# BR2_BUSYBOX_VERSION_1_7_0 is not set
-# BR2_BUSYBOX_VERSION_1_7_1 is not set
-BR2_BUSYBOX_VERSION_1_7_2=y
+# BR2_BUSYBOX_VERSION_1_7_X is not set
+# BR2_BUSYBOX_VERSION_1_8_X is not set
+BR2_BUSYBOX_VERSION_1_9_X=y
 # BR2_PACKAGE_BUSYBOX_SNAPSHOT is not set
-BR2_BUSYBOX_VERSION="1.7.2"
+BR2_BUSYBOX_VERSION="1.9.0"
 BR2_PACKAGE_BUSYBOX_INSTALL_SYMLINKS=y
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-1.6.0.config"
 BR2_PACKAGE_BUSYBOX_HIDE_OTHERS=y
@@ -357,6 +358,10 @@
 # BR2_PACKAGE_LIBLOCKFILE is not set
 # BR2_PACKAGE_LIBSYSFS is not set
 # BR2_PACKAGE_LIBXML2 is not set
+
+#
+# libxslt	- disabled (requires pkgconfig)
+#
 # BR2_PACKAGE_LOCKFILE_PROGS is not set
 # BR2_PACKAGE_LSOF is not set
 # BR2_PACKAGE_LTP-TESTSUITE is not set
@@ -371,7 +376,10 @@
 #
 # Networking applications
 #
-# BR2_PACKAGE_ARGUS is not set
+
+#
+# argus		- disabled (requires libpcap)
+#
 # BR2_PACKAGE_AVAHI is not set
 # BR2_PACKAGE_BOA is not set
 # BR2_PACKAGE_BIND is not set
@@ -385,12 +393,17 @@
 # BR2_PACKAGE_IRDA_UTILS is not set
 # BR2_PACKAGE_IPERF is not set
 # BR2_PACKAGE_IPROUTE2 is not set
-# BR2_PACKAGE_IPSEC_TOOLS is not set
+
+#
+# ipsec-tools	- disabled (requires openssl, flex and the flex library (libfl.a) )
+#
 # BR2_PACKAGE_IPTABLES is not set
 # BR2_PACKAGE_KISMET is not set
 # BR2_PACKAGE_L2TP is not set
 # BR2_PACKAGE_LIBCGI is not set
 # BR2_PACKAGE_LIBCGICC is not set
+# BR2_PACKAGE_LIBEXOSIP2 is not set
+# BR2_PACKAGE_LIBOSIP2 is not set
 # BR2_PACKAGE_LIBPCAP is not set
 # BR2_PACKAGE_LINKS is not set
 # BR2_PACKAGE_LRZSZ is not set
@@ -439,14 +452,21 @@
 # BR2_PACKAGE_TFTPD is not set
 # BR2_PACKAGE_TN5250 is not set
 # BR2_PACKAGE_TTCP is not set
-# BR2_PACKAGE_VPNC is not set
+
+#
+# vpnc		- disabled (requires libgcrypt and libgpg_error)
+#
 # BR2_PACKAGE_VTUN is not set
 # BR2_PACKAGE_WIRELESS_TOOLS is not set
 BR2_BLOCKDEV_SUPPORT=y
-# BR2_PACKAGE_DBUS is not set
+
+#
+# dbus not available (need expat or libxml2)
+#
 # BR2_PACKAGE_DM is not set
 # BR2_PACKAGE_DMRAID is not set
 # BR2_PACKAGE_E2FSPROGS is not set
+# BR2_PACKAGE_LIBFUSE is not set
 # BR2_PACKAGE_GADGETFS_TEST is not set
 # BR2_PACKAGE_HAL is not set
 # BR2_PACKAGE_HWDATA is not set
@@ -460,6 +480,7 @@
 # BR2_PACKAGE_MEMTESTER is not set
 # BR2_PACKAGE_MKDOSFS is not set
 # BR2_PACKAGE_MTD is not set
+# BR2_PACKAGE_NTFS-3G is not set
 # BR2_PACKAGE_PCIUTILS is not set
 # BR2_PACKAGE_PCMCIA is not set
 # BR2_PACKAGE_RAIDTOOLS is not set
@@ -471,7 +492,10 @@
 # BR2_PACKAGE_XFSPROGS is not set
 BR2_AUDIO_SUPPORT=y
 # BR2_PACKAGE_ALSA_LIB is not set
-# BR2_PACKAGE_ASTERISK is not set
+
+#
+# asterisk	- disabled (required openssl and mpg123)
+#
 # BR2_PACKAGE_AUMIX is not set
 # BR2_PACKAGE_LIBMAD is not set
 # BR2_PACKAGE_LIBOGG is not set
@@ -482,6 +506,7 @@
 #
 # BR2_PACKAGE_MADPLAY is not set
 # BR2_PACKAGE_MPG123 is not set
+# BR2_PACKAGE_SPEEX is not set
 BR2_GRAPHIC_SUPPORT=y
 
 #
@@ -505,6 +530,7 @@
 # BR2_PACKAGE_LIBPNG is not set
 # BR2_PACKAGE_LIBUNGIF is not set
 # BR2_PACKAGE_SDL is not set
+# BR2_PACKAGE_SDL_TTF is not set
 # BR2_PACKAGE_TIFF is not set
 
 #
@@ -531,7 +557,10 @@
 #
 # X libraries and helper libraries
 #
-# BR2_PACKAGE_ATK is not set
+
+#
+# atk		- disabled (requires libglib2)
+#
 # BR2_PACKAGE_PANGO is not set
 # BR2_PACKAGE_LIBDRM is not set
 # BR2_PACKAGE_LIBGLIB12 is not set
@@ -550,6 +579,10 @@
 #
 
 #
+# dillo		- disabled (requires jpeg,libglib12,libgtk12,zlib,libpng and Xorg(7))
+#
+
+#
 # Video libraries/codecs and applications
 #
 # BR2_PACKAGE_MPLAYER is not set
@@ -559,11 +592,17 @@
 # BR2_PACKAGE_LZMA_HOST is not set
 # BR2_PACKAGE_ZLIB is not set
 BR2_SCRIPTING_SUPPORT=y
+
+#
+# lua		- disabled (requires readline and ncurses)
+#
 # BR2_PACKAGE_MICROPERL is not set
 # BR2_PACKAGE_PYTHON is not set
 # BR2_PACKAGE_RUBY is not set
 # BR2_PACKAGE_TCL is not set
 # BR2_PACKAGE_PHP is not set
+BR2_GAMES=y
+# BR2_PACKAGE_DOOM is not set
 
 #
 # Target filesystem options

Modified: trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/atngw100/atngw100_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -96,7 +96,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set

Modified: trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig
===================================================================
--- trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/atstk1002/atstk1002_defconfig	2008-01-08 21:05:50 UTC (rev 20828)
@@ -96,7 +96,7 @@
 #
 # Atmel Mirrors
 #
-BR2_ATMEL_MIRROR="ftp://at91dist:distrib at 81.80.104.162/AT91_Third_Party_Design_Flow/Linux_Host/"
+BR2_ATMEL_MIRROR="ftp://www.at91.com/pub/buildroot"
 BR2_AT91_PATCH_MIRROR="http://maxim.org.za/AT91RM9200/2.6/"
 BR2_STAGING_DIR="$(BUILD_DIR)/staging_dir"
 # BR2_FPU_SUFFIX is not set

Modified: trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk
===================================================================
--- trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Atmel/u-boot/u-boot.mk	2008-01-08 21:05:50 UTC (rev 20828)
@@ -16,7 +16,7 @@
 #UBOOT_SOURCE:=u-boot-1.1.5-atmel.tar.bz2
 #UBOOT_SITE:=http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/u-boot
 UBOOT_SITE:=$(ATMEL_MIRROR)/Source
-UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)/Source
+UBOOT_PATCH_SITE:=$(ATMEL_MIRROR)
 UBOOT_CAT:=$(BZCAT)
 UBOOT_PATCH_SOURCE:=u-boot-1.2.0-atmel-patch.tar.bz2
 

Modified: trunk/buildroot/target/device/Config.in.toolchain
===================================================================
--- trunk/buildroot/target/device/Config.in.toolchain	2008-01-08 21:03:12 UTC (rev 20827)
+++ trunk/buildroot/target/device/Config.in.toolchain	2008-01-08 21:05:50 UTC (rev 20828)
@@ -44,7 +44,7 @@
 if BR2_TOOLCHAIN_ATMEL_AVR32
 config BR2_VENDOR_SITE
 	string
-	default "$(BR2_ATMEL_MIRROR)/Source" if BR2_TOOLCHAIN_ATMEL_AVR32
+	default "$(BR2_ATMEL_MIRROR)" if BR2_TOOLCHAIN_ATMEL_AVR32
 
 config BR2_VENDOR_SUFFIX
 	string
