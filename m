Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5738ECD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03579419BD;
	Sat, 31 Aug 2024 19:02:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ECi-00RuaIDk; Sat, 31 Aug 2024 19:02:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 239EC419CD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 239EC419CD;
	Sat, 31 Aug 2024 19:02:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BB59B1BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71A88143A
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id paLtvKJIHfZs for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:01:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 29EB081432
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29EB081432
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 29EB081432
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:01:54 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.123.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MatRT-1sCmUn486N-00fO2g; Sat, 31
 Aug 2024 21:01:51 +0200
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:01:26 +0200
Message-ID: <20240831190126.366600-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240831190126.366600-1-fiona.klute@gmx.de>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:fb541QHWhTP93pC2FsqeDd3tTakOmGocY8jSIfNHqPzmBpeki16
 DvjHr7QoZ3dAyeWw/T9TagHYGXBmkFsJw1vAs/e1rZKCCM9/FA1ErLWyHCiY8c94dMlhJZ7
 cjV5Q/l9KSabvMkja4mX7CebcTMnHJFHeB6SMmiGpir/zI6gR8/foVEU1Uz+JGmqEBtHuXV
 H028nEVCTwaJJoZgpG8SQ==
UI-OutboundReport: notjunk:1;M01:P0:igQxcu+lgZI=;JsErsrxWnFcrYcxBZ8OJKL50etr
 pgHh81LmQchJ7C5gRPwaBBa8cTNDZgdMasTOXdU33oRYyjStz0JoUIqSs7cdNRooc30GfQ+Ki
 r4ZcRx+h6HOFTAAr2epKd/AFXkD0MLSI9wmY7AW6+k6DhLtetpVmTUnGbT7E/hO7B2IeXmaPY
 y4Hh8H/Hxj2mx/e8THPtT1JFRZHwLbODXcXON+RBBg9fTQ/vqRsGz0Cu5YZt1XijFsUDfhgyW
 j4mC+piGDhfZHrrByqSMY0cVv9WNTmn/jU6RWkik6Jw6U8NJD8MQhhp7JSBO7J/Zy/jaXoefx
 dk2NxnLjMyp6YHsgoAT4XRODxhqoDP9zigLxj7J5KWsCf/dysM01EOqGWiLlqy5ecocuDeQCG
 4aSogblP0IoaVMw3pEOmCkw02X/7eRiJJqh005Rbomp7ExEaWl1vvx41iY7xtveqjdYY8wDfC
 4XIyrpOhxZ0DWesDwfHHs/sioqrLiUdfb6/ITVNAEOwKDL7q5pjtb4vAzYx2kdRMWelq137T2
 7LWaC6OeuXLZ2Xoh9IJsx7wrvFXEmlu5MV939XYNmkc/JES84W+i3wJKL0isoWgOH8mTneojm
 QhFaNV4fiCdrzBF53KMEBbX0278SuR5eUlcmUgtmJgvdPPrt73pNHHrgocmlOBlKLEu32vnWl
 oeQJd/sD+XNOMA9cCJKP5bMp9e5EULR7zSvfHBcWVikRlPUpYpSzcGx4e6eoJTw8/81h3rj+v
 JJwJ6ziWZGZSIGldOixMuSWV7Zkr0oPDXf30DHINPz8UuOHihnEiZfzTQUQ8jhZiL/GujUsCJ
 S6SpIMKMcbEoh/7k5O6Jm6HQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725130911; x=1725735711; i=fiona.klute@gmx.de;
 bh=s7Samo/Y+lKo87RTxVhEU1tOGnnZ88vyPGxcWvdMLUw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=DhBhg0EKgc3RjkUtOChw3Jms2HavTNJjvST0yhwNIDN+k/kmrFplxGLpz1Q4MORn
 T+z20av2PL1xr+KmAyYMx0NUL1EZN16YoFIq+U+YR/knDGLk3nKGtw2PQQ/rCL5jC
 cPUa17mxYVGNsV5i9eE86QroOZDX1BJFP+Cog8+Pq80AhqHq/t1Ej6IEhOOkGBX/Q
 9OrrFoLYzORRjAX0R3yfcLjWVi3ldCZP06frEKEkJqMIB1/+woSxQvkX61GSfu5SQ
 NJNcEYOsO9WSAHfvW3+MGDS5CbiSjprzJSFsPO3KpH3CjNhg2a/RB/AHMzhHTTKmT
 pjc4PBTZYB2yt1ttsA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=DhBhg0EK
Subject: [Buildroot] [PATCH next v2 3/3]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

The new config deviates from the existing
configs/raspberrypicm4io_64_defconfig only as far as necessary to
demonstrate booting through U-Boot instead of having the firmware load
the kernel directly. The sample boot script loads the kernel from the
rootfs and uses the device tree provided by the firmware.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
The config I'm usually using is a bit different, including using a
mainline kernel (which seems strongly preferable to me), but for
defconfig maintenance staying close to the other RPi defconfigs is
probably easiest.

 board/raspberrypi/boot.scr.in                 |  9 +++
 .../raspberrypi/config_cm4io_64bit_uboot.txt  | 23 +++++++
 board/raspberrypi/readme.txt                  |  4 ++
 configs/raspberrypicm4io_64_uboot_defconfig   | 60 +++++++++++++++++++
 4 files changed, 96 insertions(+)
 create mode 100644 board/raspberrypi/boot.scr.in
 create mode 100644 board/raspberrypi/config_cm4io_64bit_uboot.txt
 create mode 100644 configs/raspberrypicm4io_64_uboot_defconfig

diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
new file mode 100644
index 0000000000..a5c986ef99
--- /dev/null
+++ b/board/raspberrypi/boot.scr.in
@@ -0,0 +1,9 @@
+# Please note that this is only a sample, we recommend you to change
+# it to fit your needs. You should override this file using
+# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
+
+# load kernel from the root partition
+load mmc 0:2 ${kernel_addr_r} boot/Image
+env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=ttyAMA0,115200"
+# boot using the FDT provided by firmware
+booti ${kernel_addr_r} - ${fdt_addr}
diff --git a/board/raspberrypi/config_cm4io_64bit_uboot.txt b/board/raspberrypi/config_cm4io_64bit_uboot.txt
new file mode 100644
index 0000000000..eef929186c
--- /dev/null
+++ b/board/raspberrypi/config_cm4io_64bit_uboot.txt
@@ -0,0 +1,23 @@
+# Please note that this is only a sample, we recommend you to change it to fit
+# your needs.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
+# See http://buildroot.org/manual.html#rootfs-custom
+# and http://elinux.org/RPiconfig for a description of config.txt syntax
+
+start_file=start4.elf
+fixup_file=fixup4.dat
+
+kernel=u-boot.bin
+
+# Enable UART0 for serial console on ttyAMA0
+dtoverlay=miniuart-bt
+
+# enable RTC
+dtparam=i2c_vc=on
+dtoverlay=i2c-rtc,pcf85063a,i2c_csi_dsi
+
+# enable dwc2 USB controller (USB 2.0)
+dtoverlay=dwc2,dr_mode=host
+
+# enable 64bits support
+arm_64bit=1
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 81cd81a7f3..dc5216b088 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -65,6 +65,10 @@ or for CM4 (on IO Board - 64 bit):

   $ make raspberrypicm4io_64_defconfig

+or to boot CM4 (on IO Board - 64 bit) using U-Boot:
+
+  $ make raspberrypicm4io_64_uboot_defconfig
+
 For model 5 B:

   $ make raspberrypi5_defconfig
diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
new file mode 100644
index 0000000000..b3b35479d3
--- /dev/null
+++ b/configs/raspberrypicm4io_64_uboot_defconfig
@@ -0,0 +1,60 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+
+# patches
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+
+BR2_SYSTEM_DHCP="eth0"
+
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,576cc10e1ed50a9eacffc7a05c796051d7343ea4)/linux-576cc10e1ed50a9eacffc7a05c796051d7343ea4.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
+
+# Install kernel to rootfs so U-Boot can load it from there, only
+# U-Boot gets included in the /boot partition.
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit_uboot.txt"
+
+# Required tools to create the SD image
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+
+# Required tool to flash CM4 eMMC memory
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
+
+# Filesystem / image
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
+
+# Enable compressed kernel module support
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+
+# U-Boot and tools to build its config script
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_arm64"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/raspberrypi/boot.scr.in"
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
