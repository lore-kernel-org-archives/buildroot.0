From: aldot at uclibc.org <aldot@uclibc.org>
Date: Sat, 29 Sep 2007 09:38:59 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/target/linux
Message-ID: <20070929163859.CC0C63003F@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: aldot
Date: 2007-09-29 09:38:58 -0700 (Sat, 29 Sep 2007)
New Revision: 20116

Log:
- fixup after Ulf


Modified:
   trunk/buildroot/target/linux/Config.in


Changeset:
Modified: trunk/buildroot/target/linux/Config.in
===================================================================
--- trunk/buildroot/target/linux/Config.in	2007-09-29 15:01:17 UTC (rev 20115)
+++ trunk/buildroot/target/linux/Config.in	2007-09-29 16:38:58 UTC (rev 20116)
@@ -54,7 +54,7 @@
 	  make.
 endif
 
-if  BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG
+if BR2_PACKAGE_LINUX_EXPERIMENTAL_CONFIG
 
 choice
 	prompt "Linux Kernel Version"
@@ -67,193 +67,193 @@
 	bool "The latest snapshot for the stable Linux kernel"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.x-git#
+	  Linux 2.6.x-git#
 
 config BR2_LINUX_2_6_MM
 	bool "With latest -mm patch for the stable Linux kernel"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.x-rc#-mm#
+	  Linux 2.6.x-rc#-mm#
 
 config BR2_LINUX_2_6_STABLE
 	bool "The latest stable Linux kernel (2.6.22.1)"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.22.1
+	  Linux 2.6.22.1
 
 config BR2_LINUX_2_6_22_1
 	bool "Linux 2.6.22.1"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.22-rc1
+	  Linux 2.6.22-rc1
 
 config BR2_LINUX_2_6_22
 	bool "Linux 2.6.22"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.22
+	  Linux 2.6.22
 
 config BR2_LINUX_2_6_21_6
 	bool "Linux 2.6.21.6"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.21.6
+	  Linux 2.6.21.6
 
 config BR2_LINUX_2_6_21_1
 	bool "Linux 2.6.21.1"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.21.1
+	  Linux 2.6.21.1
 
 config BR2_LINUX_2_6_21
 	bool "Linux 2.6.21"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.21
+	  Linux 2.6.21
 
 config BR2_LINUX_2_6_20_4
 	bool "Linux 2.6.20.4"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.20.4
+	  Linux 2.6.20.4
 
 config BR2_LINUX_2_6_20
 	bool "Linux 2.6.20"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.20
+	  Linux 2.6.20
 
 config BR2_LINUX_2_6_19_2
 	bool "Linux 2.6.19.2"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.19.2
+	  Linux 2.6.19.2
 
 config BR2_LINUX_2_6_19
 	bool "Linux 2.6.19"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.19
+	  Linux 2.6.19
 
 config BR2_LINUX_2_6_18
 	bool "Linux 2.6.18"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.18
+	  Linux 2.6.18
 
 config BR2_LINUX_2_6_17
 	bool "Linux 2.6.17"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.17
+	  Linux 2.6.17
 
 config BR2_LINUX_2_6_16
 	bool "Linux 2.6.16"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.16
+	  Linux 2.6.16
 
 config BR2_LINUX_2_6_15
 	bool "Linux 2.6.15"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.15
+	  Linux 2.6.15
 
 config BR2_LINUX_2_6_23
 	bool "Linux 2.6.23"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.23
+	  Linux 2.6.23
 
 config BR2_LINUX_CUSTOM
 	bool "Linux <custom> version"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux <your selection>
+	  Linux <your selection>
 
 endchoice
 
 config BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION
-	string	"Linux Tarball version"
-	depends on	BR2_LINUX_CUSTOM
+	string "Linux Tarball version"
+	depends on BR2_LINUX_CUSTOM
 	default "linux-2.6.22"
 
 config BR2_CUSTOM_LINUX26_VERSION
-	string	"Linux Version"
-	depends on	BR2_LINUX_CUSTOM
+	string "Linux Version"
+	depends on BR2_LINUX_CUSTOM
 	default "linux-2.6.22-version"
 
 config BR2_CUSTOM_LINUX26_RC_PATCH
-	string	"RC patch (if needed)"
-	depends on	BR2_LINUX_CUSTOM
+	string "RC patch (if needed)"
+	depends on BR2_LINUX_CUSTOM
 	default "patch-2.6.22-rc6-mm1.bz2"
 
-menu	"Patches"
+menu "Patches"
 	depends on BR2_PACKAGE_LINUX
 
 config BR2_LINUX_BSP_PATCH
-	string	"Additional patch to apply (supply full path)"
+	string "Additional patch to apply (supply full path)"
 	default ""
 
 endmenu
 
 config BR2_DOWNLOAD_LINUX26_VERSION
-	string	#"Selected Tarball:"
-	default "2.6.15"				if BR2_LINUX_2_6_15
-	default "2.6.16"				if BR2_LINUX_2_6_16
-	default "2.6.17"				if BR2_LINUX_2_6_17
-	default "2.6.18"				if BR2_LINUX_2_6_18
-	default "2.6.19"				if BR2_LINUX_2_6_19
-	default "2.6.19.2"				if BR2_LINUX_2_6_19_2
-	default "2.6.20"				if BR2_LINUX_2_6_20
-	default "2.6.20.4"				if BR2_LINUX_2_6_20_4
-	default "2.6.21"				if BR2_LINUX_2_6_21
-	default "2.6.21.1"				if BR2_LINUX_2_6_21_1
-	default "2.6.21.6"				if BR2_LINUX_2_6_21_6
-	default "2.6.22"				if BR2_LINUX_2_6_22
-	default "2.6.22.1"				if BR2_LINUX_2_6_22_1
-	default "2.6.22"				if BR2_LINUX_2_6_23_RC1
-	default "2.6.22"				if BR2_LINUX_2_6_SNAP
-	default "2.6.22"				if BR2_LINUX_2_6_MM
-	default $(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION)	if BR2_LINUX_CUSTOM
+	string #"Selected Tarball:"
+	default "2.6.15" if BR2_LINUX_2_6_15
+	default "2.6.16" if BR2_LINUX_2_6_16
+	default "2.6.17" if BR2_LINUX_2_6_17
+	default "2.6.18" if BR2_LINUX_2_6_18
+	default "2.6.19" if BR2_LINUX_2_6_19
+	default "2.6.19.2" if BR2_LINUX_2_6_19_2
+	default "2.6.20" if BR2_LINUX_2_6_20
+	default "2.6.20.4" if BR2_LINUX_2_6_20_4
+	default "2.6.21" if BR2_LINUX_2_6_21
+	default "2.6.21.1" if BR2_LINUX_2_6_21_1
+	default "2.6.21.6" if BR2_LINUX_2_6_21_6
+	default "2.6.22" if BR2_LINUX_2_6_22
+	default "2.6.22.1" if BR2_LINUX_2_6_22_1
+	default "2.6.22" if BR2_LINUX_2_6_23_RC1
+	default "2.6.22" if BR2_LINUX_2_6_SNAP
+	default "2.6.22" if BR2_LINUX_2_6_MM
+	default $(BR2_CUSTOM_DOWNLOAD_LINUX26_VERSION) if BR2_LINUX_CUSTOM
 
 config BR2_LINUX26_VERSION
-	string	"Selected Version:"
-	default "2.6.15"				if BR2_LINUX_2_6_15
-	default "2.6.16"				if BR2_LINUX_2_6_16
-	default "2.6.17"				if BR2_LINUX_2_6_17
-	default "2.6.18"				if BR2_LINUX_2_6_18
-	default "2.6.19"				if BR2_LINUX_2_6_19
-	default "2.6.19.2"				if BR2_LINUX_2_6_19_2
-	default "2.6.20"				if BR2_LINUX_2_6_20
-	default "2.6.20.4"				if BR2_LINUX_2_6_20_4
-	default "2.6.21"				if BR2_LINUX_2_6_21
-	default "2.6.21.1"				if BR2_LINUX_2_6_21_1
-	default "2.6.21.6"				if BR2_LINUX_2_6_21_6
-	default "2.6.22"				if BR2_LINUX_2_6_22
-	default "2.6.22.1"				if BR2_LINUX_2_6_22_1
-	default "2.6.22"				if BR2_LINUX_2_6_23_RC1
-	default "2.6.22"				if BR2_LINUX_2_6_SNAP
-	default "2.6.22"				if BR2_LINUX_2_6_MM
-	default $(BR2_CUSTOM_LINUX26_VERSION)		if BR2_LINUX_CUSTOM
+	string "Selected Version:"
+	default "2.6.15" if BR2_LINUX_2_6_15
+	default "2.6.16" if BR2_LINUX_2_6_16
+	default "2.6.17" if BR2_LINUX_2_6_17
+	default "2.6.18" if BR2_LINUX_2_6_18
+	default "2.6.19" if BR2_LINUX_2_6_19
+	default "2.6.19.2" if BR2_LINUX_2_6_19_2
+	default "2.6.20" if BR2_LINUX_2_6_20
+	default "2.6.20.4" if BR2_LINUX_2_6_20_4
+	default "2.6.21" if BR2_LINUX_2_6_21
+	default "2.6.21.1" if BR2_LINUX_2_6_21_1
+	default "2.6.21.6" if BR2_LINUX_2_6_21_6
+	default "2.6.22" if BR2_LINUX_2_6_22
+	default "2.6.22.1" if BR2_LINUX_2_6_22_1
+	default "2.6.22" if BR2_LINUX_2_6_23_RC1
+	default "2.6.22" if BR2_LINUX_2_6_SNAP
+	default "2.6.22" if BR2_LINUX_2_6_MM
+	default $(BR2_CUSTOM_LINUX26_VERSION) if BR2_LINUX_CUSTOM
 
 config BR2_LINUX26_RC_PATCH
-	string	#"Selected Patch:"
-	default ""					if BR2_LINUX_2_6_15
-	default ""					if BR2_LINUX_2_6_16
-	default ""					if BR2_LINUX_2_6_17
-	default ""					if BR2_LINUX_2_6_18
-	default ""					if BR2_LINUX_2_6_19
-	default ""					if BR2_LINUX_2_6_19_2
-	default ""					if BR2_LINUX_2_6_20
-	default ""					if BR2_LINUX_2_6_20_4
-	default ""					if BR2_LINUX_2_6_21
-	default ""					if BR2_LINUX_2_6_21_1
-	default ""					if BR2_LINUX_2_6_21_6
-	default ""					if BR2_LINUX_2_6_22
-	default ""					if BR2_LINUX_2_6_22_1
-	default "patch-2.6.23-rc1.bz2"			if BR2_LINUX_2_6_23_RC1
-	default $(BR2_CUSTOM_LINUX26_RC_PATCH)		if BR2_LINUX_CUSTOM
+	string #"Selected Patch:"
+	default "" if BR2_LINUX_2_6_15
+	default "" if BR2_LINUX_2_6_16
+	default "" if BR2_LINUX_2_6_17
+	default "" if BR2_LINUX_2_6_18
+	default "" if BR2_LINUX_2_6_19
+	default "" if BR2_LINUX_2_6_19_2
+	default "" if BR2_LINUX_2_6_20
+	default "" if BR2_LINUX_2_6_20_4
+	default "" if BR2_LINUX_2_6_21
+	default "" if BR2_LINUX_2_6_21_1
+	default "" if BR2_LINUX_2_6_21_6
+	default "" if BR2_LINUX_2_6_22
+	default "" if BR2_LINUX_2_6_22_1
+	default "patch-2.6.23-rc1.bz2" if BR2_LINUX_2_6_23_RC1
+	default $(BR2_CUSTOM_LINUX26_RC_PATCH) if BR2_LINUX_CUSTOM
 
 choice
 	prompt "Linux Kernel Configuration"
@@ -272,17 +272,17 @@
 	  board-imposed value by passing LINUX26_KCONFIG=<path> to
 	  make.
 
-config	BR2_LINUX26_DEFCONFIG
+config BR2_LINUX26_DEFCONFIG
 	bool "Run make <board>_defconfig "
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Configure Linux by make <board>_defconfig
+	  Configure Linux by make <board>_defconfig
 
 config BR2_LINUX_CUSTOMIZE
 	bool "Run make ARCH=$(ARCH) xconfig before build"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Configure Linux by make xconfig
+	  Configure Linux by make xconfig
 endchoice
 
 config BR2_PACKAGE_LINUX_KCONFIG
@@ -307,54 +307,56 @@
 	bool "bzImage"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.19.2
+	  Linux 2.6.19.2
 
 config BR2_LINUX_BIN_UIMAGE
 	bool "uImage"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Build uImage binary
+	  Build uImage binary
 
 config BR2_LINUX_BIN_VMLINUX
 	bool "vmlinux"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Build vmlinux binary
+	  Build vmlinux binary
 
 config BR2_LINUX_BIN_ZIMAGE
 	bool "zImage"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Linux 2.6.19.2
+	  Linux 2.6.19.2
 
 config BR2_LINUX_BIN_CUSTOM
 	bool "<custom> Linux binary"
 	depends BR2_PACKAGE_LINUX
 	help
-	  	Build custom Linux binary format
+	  Build custom Linux binary format
 endchoice
 
 config BR2_LINUX_BIN_CUSTOM_BIN
 	string "custom kernel binary format"
 	depends on BR2_LINUX_BIN_CUSTOM
-	default	""
+	default ""
 	help
-		Which Linux binary format?
+	  Which Linux binary format?
 
 config BR2_PACKAGE_LINUX_FORMAT
 	string #"kernel binary format"
 	depends on BR2_PACKAGE_LINUX
-	default "bzImage"			if	BR2_LINUX_BIN_BZIMAGE
-	default "uImage"			if	BR2_LINUX_BIN_UIMAGE
-	default "vmlinux"			if	BR2_LINUX_BIN_VMLINUX
-	default "zImage"			if	BR2_LINUX_BIN_ZIMAGE
-	default $(BR2_LINUX_BIN_CUSTOM_BIN)	if	BR2_LINUX_BIN_CUSTOM
+	default "bzImage" if BR2_LINUX_BIN_BZIMAGE
+	default "uImage" if BR2_LINUX_BIN_UIMAGE
+	default "vmlinux" if BR2_LINUX_BIN_VMLINUX
+	default "zImage" if BR2_LINUX_BIN_ZIMAGE
+	default $(BR2_LINUX_BIN_CUSTOM_BIN) if BR2_LINUX_BIN_CUSTOM
 	help
 	  kernel binary format.
 	  Popular values include:
 	  - bzImage
 	  - zImage
 	  - vmlinux
+	  - zImage
+	  - xipImage
 	  and other, architecture dependant formats.
 
 	  Note that the default format is supposed to be set by your
@@ -371,11 +373,11 @@
 config BR2_LINUX_IN_ROOTFS
 	bool "Copy kernel to root file system"
 	depends BR2_PACKAGE_LINUX
-	default	n
+	default n
 	help
-	  	Copy kernel to <root>/boot directory
+	  Copy kernel to <root>/boot directory
 
-menuconfig	BR2_LINUX_COPY
+menuconfig BR2_LINUX_COPY
 	bool "Secondary Copy"
 	depends on BR2_PACKAGE_LINUX
 	default y
@@ -383,8 +385,8 @@
 config BR2_LINUX_COPYTO
 	string "also copy the image to..."
 	depends BR2_LINUX_COPY
-	default	"/tftpboot"
+	default "/tftpboot"
 	help
-	  	Copy kernel to secondary location
+	  Copy kernel to secondary location
 
 endif
