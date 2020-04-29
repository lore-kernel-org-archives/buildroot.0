From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 29 Apr 2020 23:23:13 +0200
Subject: [Buildroot] [git commit] board/hardkernel/odroidc2: remove unused
 files
Message-ID: <20200429210827.18C9E90B4A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=197da6286612df9c0c1b5f41e307e1a9be780d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit b80712a16ae3deb65331a7923aa878e13e2e66b6 ("configs/odroidc2:
remove the defconfig") has removed the odroidc2 defconfig, but left
behind a number of files in board/hardkernel/odroidc2, which are now
unused. Let's remove them.

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/hardkernel/odroidc2/boot.ini      | 176 --------------------------------
 board/hardkernel/odroidc2/genimage.cfg  |  27 -----
 board/hardkernel/odroidc2/post-image.sh |  19 ----
 board/hardkernel/odroidc2/readme.txt    |  53 ----------
 4 files changed, 275 deletions(-)

diff --git a/board/hardkernel/odroidc2/boot.ini b/board/hardkernel/odroidc2/boot.ini
deleted file mode 100644
index 2fdffa3049..0000000000
--- a/board/hardkernel/odroidc2/boot.ini
+++ /dev/null
@@ -1,176 +0,0 @@
-ODROIDC2-UBOOT-CONFIG
-
-########################################################################
-# Changes made to this are overwritten every time there's a new upgrade
-# To make your changes permanent change it on 
-# boot.ini.default
-# After changing it on boot.ini.default run the bootini command to
-# rewrite this file with your personal permanent settings.
-# Documentation: http://odroid.com/dokuwiki/doku.php?id=en:c2_persistent_bootini
-########################################################################
-
-# Possible screen resolutions
-# Uncomment only a single Line! The line with setenv written.
-# At least one mode must be selected.
-
-# Custom modeline!
-# To use custom modeline you need to disable all the below resolutions
-# and setup your own! 
-# For more information check our wiki: 
-# http://odroid.com/dokuwiki/doku.php?id=en:c2_hdmi_autosetting
-# Example below:
-# setenv m "custombuilt" 
-# setenv modeline "1920,1200,154000,74040,60,1920,1968,2000,2080,1200,1202,1208,1235,1,0,1"
-
-# 480 Lines (720x480)
-# setenv m "480i60hz" # Interlaced 60Hz
-# setenv m "480i_rpt" # Interlaced for Rear Projection Televisions 60Hz
-# setenv m "480p60hz" # 480 Progressive 60Hz
-# setenv m "480p_rpt" # 480 Progressive for Rear Projection Televisions 60Hz
-
-# 576 Lines (720x576)
-# setenv m "576i50hz" # Interlaced 50Hz
-# setenv m "576i_rpt" # Interlaced for Rear Projection Televisions 50Hz
-# setenv m "576p50hz" # Progressive 50Hz
-# setenv m "576p_rpt" # Progressive for Rear Projection Televisions 50Hz
-
-# 720 Lines (1280x720)
-# setenv m "720p50hz" # 50Hz
-# setenv m "720p60hz" # 60Hz
-
-# 1080 Lines (1920x1080)
-# setenv m "1080i60hz" # Interlaced 60Hz
-setenv m "1080p60hz" # Progressive 60Hz
-# setenv m "1080i50hz" # Interlaced 50Hz
-# setenv m "1080p50hz" # Progressive 50Hz
-# setenv m "1080p24hz" # Progressive 24Hz
-
-# 4K (3840x2160)
-# setenv m "2160p30hz"    # Progressive 30Hz
-# setenv m "2160p25hz"    # Progressive 25Hz
-# setenv m "2160p24hz"    # Progressive 24Hz
-# setenv m "smpte24hz"    # Progressive 24Hz SMPTE
-# setenv m "2160p50hz"    # Progressive 50Hz
-# setenv m "2160p60hz"    # Progressive 60Hz
-# setenv m "2160p50hz420" # Progressive 50Hz with YCbCr 4:2:0 (Requires TV/Monitor that supports it)
-# setenv m "2160p60hz420" # Progressive 60Hz with YCbCr 4:2:0 (Requires TV/Monitor that supports it)
-
-### VESA modes ###
-# setenv m "640x480p60hz"
-# setenv m "800x480p60hz"
-# setenv m "480x800p60hz"
-# setenv m "800x600p60hz"
-# setenv m "1024x600p60hz"
-# setenv m "1024x768p60hz"  
-# setenv m "1280x800p60hz"
-# setenv m "1280x1024p60hz"
-# setenv m "1360x768p60hz"
-# setenv m "1440x900p60hz"
-# setenv m "1600x900p60hz"
-# setenv m "1680x1050p60hz"
-# setenv m "1600x1200p60hz"
-# setenv m "1920x1200p60hz"
-# setenv m "2560x1080p60hz"
-# setenv m "2560x1440p60hz"
-# setenv m "2560x1600p60hz"
-# setenv m "3440x1440p60hz"
-
-# HDMI BPP Mode
-setenv m_bpp "32"
-# setenv m_bpp "24"
-# setenv m_bpp "16"
-
-# HDMI DVI/VGA modes
-# By default its set to HDMI, if needed change below.
-# Uncomment only a single Line.
-# setenv vout "dvi"
-# setenv vout "vga"
-
-# HDMI HotPlug Detection control
-# Allows you to force HDMI thinking that the cable is connected.
-# true = HDMI will believe that cable is always connected
-# false = will let board/monitor negotiate the connection status
-setenv hpd "true"
-# setenv hpd "false"
-
-# Monitor output
-# Controls if HDMI PHY should output anything to the monitor
-setenv monitor_onoff "false" # true or false
-
-# Server Mode (aka. No Graphics)
-# Setting nographics to 1 will disable all video subsystem
-# This mode is ideal of server type usage. (Saves ~300Mb of RAM)
-setenv nographics "0"
-
-# Meson Timer
-# 1 - Meson Timer
-# 0 - Arch Timer 
-# Using meson_timer improves the video playback however it breaks KVM (virtualization).
-# Using arch timer allows KVM/Virtualization to work however you'll experience poor video
-setenv mesontimer "1"
-
-# UHS (Ultra High Speed) MicroSD mode enable/disable
-setenv disableuhs "false"
-
-# MicroSD Card Detection enable/disable
-# Force the MMC controlled to believe that a card is connected.
-setenv mmc_removable "true"
-
-# USB Multi WebCam tweak
-# Only enable this if you use it.
-setenv usbmulticam "false"
-
-# Default Console Device Setting
-setenv condev "console=ttyS0,115200n8 console=tty0"   # on both
-
-# CPU Frequency / Cores control
-###########################################
-### WARNING!!! WARNING!!! WARNING!!!
-# Before changing anything here please read the wiki entry: 
-# http://odroid.com/dokuwiki/doku.php?id=en:c2_set_cpu_freq
-#
-# MAX CPU's
-# setenv maxcpus "1"
-# setenv maxcpus "2"
-# setenv maxcpus "3"
-setenv maxcpus "4"
-
-# MAX Frequency
-# setenv max_freq "2016"  # 2.016GHz
-# setenv max_freq "1944"  # 1.944GHz
-# setenv max_freq "1944"  # 1.944GHz
-# setenv max_freq "1920"  # 1.920GHz
-# setenv max_freq "1896"  # 1.896GHz
-# setenv max_freq "1752"  # 1.752GHz
-# setenv max_freq "1680"  # 1.680GHz
-# setenv max_freq "1656"  # 1.656GHz
-setenv max_freq "1536"  # 1.536GHz
-
-
-
-###########################################
-
-# Boot Arguments
-if test "${m}" = "custombuilt"; then setenv cmode "modeline=${modeline}"; fi
-
-setenv bootargs "root=/dev/mmcblk0p2 rootwait ro ${condev} no_console_suspend hdmimode=${m} ${cmode} m_bpp=${m_bpp} vout=${vout} fsck.repair=yes net.ifnames=0 elevator=noop disablehpd=${hpd} max_freq=${max_freq} maxcpus=${maxcpus} monitor_onoff=${monitor_onoff} disableuhs=${disableuhs} mmc_removable=${mmc_removable} usbmulticam=${usbmulticam}"
-
-# Booting
-
-setenv loadaddr "0x11000000"
-setenv dtb_loadaddr "0x1000000"
-setenv initrd_loadaddr "0x13000000"
-
-fatload mmc 0:1 ${loadaddr} Image
-fatload mmc 0:1 ${dtb_loadaddr} meson64_odroidc2.dtb
-fdt addr ${dtb_loadaddr}
-
-if test "${mesontimer}" = "0"; then fdt rm /meson_timer; fdt rm /cpus/cpu at 0/timer; fdt rm /cpus/cpu at 1/timer; fdt rm /cpus/cpu at 2/timer; fdt rm /cpus/cpu at 3/timer; fi
-if test "${mesontimer}" = "1"; then fdt rm /timer; fi
-
-if test "${nographics}" = "1"; then fdt rm /reserved-memory; fdt rm /aocec; fi
-if test "${nographics}" = "1"; then fdt rm /meson-fb; fdt rm /amhdmitx; fdt rm /picdec; fdt rm /ppmgr; fi
-if test "${nographics}" = "1"; then fdt rm /meson-vout; fdt rm /mesonstream; fdt rm /meson-fb; fi
-if test "${nographics}" = "1"; then fdt rm /deinterlace; fdt rm /codec_mm; fi
-
-booti ${loadaddr} - ${dtb_loadaddr}
diff --git a/board/hardkernel/odroidc2/genimage.cfg b/board/hardkernel/odroidc2/genimage.cfg
deleted file mode 100644
index 15f97d4457..0000000000
--- a/board/hardkernel/odroidc2/genimage.cfg
+++ /dev/null
@@ -1,27 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"boot.ini",
-			"Image",
-			"meson64_odroidc2.dtb"
-		}
-	}
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition vfat {
-		partition-type = 0xC
-		image = "boot.vfat"
-		offset = 1048576
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-		size = 512M
-	}
-}
diff --git a/board/hardkernel/odroidc2/post-image.sh b/board/hardkernel/odroidc2/post-image.sh
deleted file mode 100755
index aaf12c1e79..0000000000
--- a/board/hardkernel/odroidc2/post-image.sh
+++ /dev/null
@@ -1,19 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-cp ${BOARD_DIR}/boot.ini ${BINARIES_DIR}/
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage                           \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
-
-dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=1 count=442 conv=sync,notrunc
-dd if=${BINARIES_DIR}/u-boot.bin of=${BINARIES_DIR}/sdcard.img bs=512 skip=1 seek=1 conv=fsync,notrunc
diff --git a/board/hardkernel/odroidc2/readme.txt b/board/hardkernel/odroidc2/readme.txt
deleted file mode 100644
index b44aa67f5a..0000000000
--- a/board/hardkernel/odroidc2/readme.txt
+++ /dev/null
@@ -1,53 +0,0 @@
-ODROID-C2
-
-Intro
-=====
-To be able to use ODROID-C2 board with the images generated by
-Buildroot, you have to prepare the SDCard or eMMC.
-
-How to build it
-===============
-
-  $ make odroidc2_defconfig
-
-Then you can edit the build options using
-
-  $ make menuconfig
-
-Compile all and build rootfs image:
-
-  $ make
-
-Note: you will need to have access to the network, since Buildroot will
-download the packages' sources.
-
-Result of the build
--------------------
-
-After building, you should obtain this tree:
-
-    output/images/
-    +-- Image
-    +-- boot.ini                   [1]
-    +-- boot.vfat
-    +-- meson64_odroidc2.dtb
-    +-- rootfs.ext2
-    +-- rootfs.ext4
-    +-- rootfs.tar
-    +-- sdcard.img
-    `-- u-boot.bin
-
-[1] This is the ODROID-C2 configuration file used in u-boot.
-
-How to write the SD card or eMMC
-================================
-
-Once the build process is finished you will have an image called "sdcard.img"
-in the output/images/ directory.
-
-Copy the bootable "sdcard.img" onto an SD card or eMMC with "dd":
-
-  $ sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Insert the SDcard into your ODROID-C2, and power it up. Your new system
-should come up now.
