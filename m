Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 312F2C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:06:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3CF861264
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 20:06:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E3CF861264
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BD92B8176E;
	Thu, 11 Nov 2021 20:06:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-VEjfirnIbM; Thu, 11 Nov 2021 20:05:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F248781CBA;
	Thu, 11 Nov 2021 20:05:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1B3371BF9D1
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B5F34059A
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 20:04:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fe41CFBHdVul for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 20:04:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8925E40598
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 20:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636661082;
 bh=fAMZK3TssDQt1SXO1bCVdM7V5xcslwk/4Xs8CWWMksI=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=hzk6/8HTX4Xzh05ymeEcV+zvFmRwHsyBSfkV2qZYa3+O6Onnmd5bMMXg5cA1na78g
 qmbwud9RINznC7KJUD2JX9HkTPEQJVy9IhAzxDmlwppPtFzI0b7tz7FKY5jBpz70J+
 MrEwugPyqhLIdW8eQSiwjq6DrP2oNf8jBGZ2qPRg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.16]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MpDJX-1mMKI91OQR-00qmdM; Thu, 11
 Nov 2021 21:04:42 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 11 Nov 2021 21:04:39 +0100
Message-Id: <20211111200439.15379-7-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211111200439.15379-1-ps.report@gmx.net>
References: <20211111200439.15379-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:zknNH5Nkf48oyMColOHoiIfkWU4dnvJU2Ljg/oaPeqHVFcbSeA1
 B8aBAFIB47pyfbHb2HejmQAlbvr7SLbcQVyjONTZjNnEzs5Uh2WR89P5DGaKvsivI1Ygqhb
 ggQMdcs3IYQjabtpKoYdN1Ck1Ify+Phm8jHVdcopmSjv1RYJGNhcBzIdCcLbOZrfnE2ylvW
 ECl0Z6XY+LasliQbQ+pHg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:01gGGPz+wSo=:M3iutIfyxs0GcVXL+CT2g7
 d0hcEZR0oGZhVXNIHjYJqRfslWMINKiO/eNhg2AjeM6HJMSrKRdLK+eWe49Iz0zQO0aWnPC5Q
 dkrrxsJm4ymfN7ZSLXPJQQJd3vleGOCQr6ULnavdfxuJtBOR01+u3dbv3phvRY1BqFbhie614
 OiWkyxbi+5e4xWwJ3maVSsG+zfbRAFMVWasfvQDvrPvY9KiTYbTY01ct2IhWAYMM2hc9fOM9L
 P1GSj/WUZVlbaI7BtMC7dSX582XTtAHOr8XSyXoGYNmV8gS7lL9ywERu/Gt5moA1gW5Rvznhm
 8Wbd0Yf+fBVozb7rPDgDdARFcYmTD02fKx2Zjl/SkD314aHVC2KGFAyFWoq8YkstMgvumTGoU
 WyrUcZLgigiUANxy4mnUTX/Y8pqLFK0s3/U0LK8oE3iMOPCLkJcgKZ9VJl5WmRSOowCV69mSU
 0J5jIzu0Vf7+TjWI24ma9glK0yMEQI7nNzHQaU0X9ciJ+8ALSTr1LNsWY6T0oPxARivgO/ZCY
 807eXI5kjSjZ/xppbWvB42SPrYt5QVlCrxqsO8crhXVJP3b8rSI91uQ/IIPV35+95TU/Q1NbO
 OtPmz3EzXPPICLq+uxcW9elq9WrKrlHT1Xd8e9CgbIq3jHSqbkeFJfpwvv05CEsk4JTmc0qIO
 93gkX2bP6ph+sjJtua7Gh5DLJmj+fDQlJUNSnjBdbAXQ8t8+AuLJO8k2qCKNT8/JmDZ4/eHB6
 6bFrHOIy13o/cLW9+w2MbUHCspvmsY/zeBiLqwTB7zRpJaGbyz3oxVNinafeHNvFinWvvH//K
 ENrr8DDl461T6GcnKjf5IfqjQ6/bW3UVYk2+X21/bcCOMyXLmKg5wrKZ3lwg8knEHA02n2k9D
 vHfsUK/4V2q3nkkPUR97/ATDOy3FphQ/7bJG0eJPTE3MvpHs64RxJMbPZp2H1TtvZoe8nk3E9
 eHFOTbg9Ema6cPRqn9hrpIvs75v9Whu35wKdVk0bfw3AdY09A/V4zFIzc7sEnwVVfp1BWnO1h
 1YXJ7irHSExHRROBH/klIujdDZVV/bpNQwj2/Bwxnjqt8nFdrb912H/BD7TdnCJW00qdNV5gC
 TF9ZoYhbj4jmAI=
Subject: [Buildroot] [PATCH/next v1 7/7] board/raspberrypi: add Raspberry Pi
 Zero 2 W
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
Cc: Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Julien Grossholtz <julien.grossholtz@openest.io>

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
---
 DEVELOPERS                                    |  2 ++
 board/raspberrypi/config_zero2w.txt           | 29 +++++++++++++++
 .../genimage-raspberrypizero2w.cfg            | 32 +++++++++++++++++
 board/raspberrypi/readme.txt                  |  5 +++
 board/raspberrypizero2w                       |  1 +
 configs/raspberrypizero2w_defconfig           | 36 +++++++++++++++++++
 6 files changed, 105 insertions(+)
 create mode 100644 board/raspberrypi/config_zero2w.txt
 create mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg
 create mode 120000 board/raspberrypizero2w
 create mode 100644 configs/raspberrypizero2w_defconfig

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
-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
