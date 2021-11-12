Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7E8DC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 707CE402B7;
	Mon,  6 Dec 2021 18:13:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j1fZkGqKWkwr; Mon,  6 Dec 2021 18:13:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9F1641C10;
	Mon,  6 Dec 2021 18:13:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 21E931BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1BA0760D64
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APXZoovwhcGH for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 37F0C60D62
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id C7ADE81061; Mon,  6 Dec 2021 18:07:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 23:09:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6983c511f9e0ddbefc9d46bdef09f0d4d1a6bb52
X-Git-Newrev: 19575e9e9e0a9cdf900f95a56e00654fd77d1ca0
X-Patchwork-Hint: ignore
Message-Id: <20211206180736.C7ADE81061@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: add Raspberry Pi Zero 2
 W
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=19575e9e9e0a9cdf900f95a56e00654fd77d1ca0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Raspberry-Pi Zero 2 W is an affordable single board computer. It is
a more powerful drop-in replacement for the Raspberry Pi Zero W.

The board incorporates an Raspberry-Pi RP3A0 system-in-package (SiP) with
a Broadcom BCM2710A1 and 512MB LPDDR2 SDRAM. The CPU is a quad-core 1Ghz
64-bit Arm Cortex-A53. As for other Raspberry-Pis it also provides
2.4GHz 802.11 b/g/n Wifi, Bluetooth 4.2 and BLE.

The BCM2710 cpu is similar to the Raspberry-Pi 3, it uses the same
kernel configuration as the Raspberry-Pi 2 and 3.

Signed-off-by: Julien Grossholtz <julien.grossholtz@openest.io>
[Based on https://patchwork.ozlabs.org/project/buildroot/patch/20211030213600.3445223-3-julien.grossholtz@openest.io/
  - reformat genimage-raspberrypizero2w.cfg according to the beautify patch-set
  - update kernel version to 9878a11 (5.10.78)
  - use new bcm2710-rpi-zero-2-w dtb
  - update commit log about kernel config (RPi2/3)
  - add DEVELOPERS entries for Julien
]
Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                       |  2 ++
 board/raspberrypi/config_zero2w.txt              | 29 +++++++++++++++++++
 board/raspberrypi/genimage-raspberrypizero2w.cfg | 32 +++++++++++++++++++++
 board/raspberrypi/readme.txt                     |  5 ++++
 board/raspberrypizero2w                          |  1 +
 configs/raspberrypizero2w_defconfig              | 36 ++++++++++++++++++++++++
 6 files changed, 105 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 70262eac8c..6f812eb564 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1512,7 +1512,9 @@ N:	Julien Corjon <corjon.j@ecagroup.com>
 F:	package/qt5/
 
 N:	Julien Grossholtz <julien.grossholtz@openest.io>
+F:	board/raspberrypi/
 F:	board/technologic/ts7680/
+F:	configs/raspberrypizero2w_defconfig
 F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
diff --git a/board/raspberrypi/config_zero2w.txt b/board/raspberrypi/config_zero2w.txt
new file mode 100644
index 0000000000..9e6b7f5ccf
--- /dev/null
+++ b/board/raspberrypi/config_zero2w.txt
@@ -0,0 +1,29 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start.elf
+fixup_file=fixup.dat
+
+kernel=zImage
+
+# To use an external initramfs file
+#initramfs rootfs.cpio.gz
+
+# Disable overscan assuming the display supports displaying the full resolution
+# If the text shown on the screen disappears off the edge, comment this out
+disable_overscan=1
+
+# How much memory in MB to assign to the GPU on Pi models having
+# 256, 512 or 1024 MB total memory
+gpu_mem_256=100
+gpu_mem_512=100
+gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B ,zero W and zero 2) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/board/raspberrypi/genimage-raspberrypizero2w.cfg b/board/raspberrypi/genimage-raspberrypizero2w.cfg
new file mode 100644
index 0000000000..b510fea563
--- /dev/null
+++ b/board/raspberrypi/genimage-raspberrypizero2w.cfg
@@ -0,0 +1,32 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"bcm2710-rpi-zero-2-w.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
+			"zImage"
+		}
+	}
+
+	size = 32M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index d20096b5e6..c81fd801ae 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -28,6 +28,10 @@ For model Zero (model A+ in smaller form factor):
 
   $ make raspberrypi0_defconfig
 
+For model Zero 2 W (model B3 in smaller form factor):
+
+  $ make raspberrypizero2w_defconfig
+
 For model 2 B:
 
   $ make raspberrypi2_defconfig
@@ -79,6 +83,7 @@ After building, you should obtain this tree:
     +-- bcm2708-rpi-cm.dtb          [1]
     +-- bcm2708-rpi-zero.dtb        [1]
     +-- bcm2708-rpi-zero-w.dtb      [1]
+    +-- bcm2710-rpi-zero-2-w.dtb    [1]
     +-- bcm2709-rpi-2-b.dtb         [1]
     +-- bcm2710-rpi-3-b.dtb         [1]
     +-- bcm2710-rpi-3-b-plus.dtb    [1]
diff --git a/board/raspberrypizero2w b/board/raspberrypizero2w
new file mode 120000
index 0000000000..fcdafc81ed
--- /dev/null
+++ b/board/raspberrypizero2w
@@ -0,0 +1 @@
+raspberrypi
\ No newline at end of file
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
new file mode 100644
index 0000000000..ddd6b97b06
--- /dev/null
+++ b/configs/raspberrypizero2w_defconfig
@@ -0,0 +1,36 @@
+BR2_arm=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,9878a118cbdb7779fd15caa45915d22bff381ba3)/linux-9878a118cbdb7779fd15caa45915d22bff381ba3.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-zero-2-w"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypizero2w/config_zero2w.txt"
+
+# MicroSD images generation tools
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
