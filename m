Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A5ACA9ECF
	for <buildroot@archiver.kernel.org>; Sun, 11 Oct 2026 19:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56F14404E9;
	Sun, 11 Oct 2026 19:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZO9HkUXCgFlx; Sun, 11 Oct 2026 19:15:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5012E404EC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791746152;
	b=UZtzufO/Pflg2yWNULnrtYk0gnK+DEDorizP8mNZF6X29VvHhI+1hmILmRes5SejPBNP
	 3C4NS951AKM/Q7iG07U5RupE3MJjRhxUVCYn3FUuvDDTAZBt8nuxisK/ZLwh7dOAn+Ib+
	 JmvIIDYAeJYGeJlg3tp3H1gJpJZrmhaQMPcSl+XGO3gjSXjLMzCU5zoSkgtYMGQeE24UJ
	 YCa7LDw/mOX2ELn2NQFnuVdUI2S1jfN7DsJ99F3/+/VGJsu3+6E/STnR884+ab35/8VJd
	 ZT7+auvmtMOAI9NRbLkNbOL33uvfZOZOLzv0AbOPTdL7dxZtJMW9xEwy3Vvlw80xhqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791746152;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=B+lIV7g0+bAhYq4vWdEKg4JKm/LBWNHbK0DCG+k2K1A=;
	b=E+ORbBE9mUx15nEc/+Yxd5h4MGzqmr4fRRj0ILb7+AN+vjdYgfK3jdqMu8QFspVPVkgL
	 xkLplsjKJqWXqGYwSKQ7loSvTYrQwi22mVlMoQW2AXaJ9IdLvaVRKcs3J5AHMshHulusc
	 dyXEC12V4GHRJ7PQwTR1o0GfG29GK4GXt03qv37nRBNGAeL6ChbiuJgPfG1YiiMas8r+9
	 in+pF0SS4NCjZaNIqx+EfEkRBlWiLBH9qORUOVHTpQgWmshyFD6aJai+BK0AN1Vl7G+w8
	 VWq29tzkqanHtRmFMLP07rOXLy2WouKvY8gIJMwJTY2JvSsczou5cfqJ/odat3QYJcg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791746152;
	bh=B+lIV7g0+bAhYq4vWdEKg4JKm/LBWNHbK0DCG+k2K1A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Oj6X8YNdw1wwkIEWUgckr8QzKB3/0kEYIMXGcjAuao8uBTHIEXSeFQMdGCE7aRDrj
	 Ks7u3L62P+i8k9hZDobKsPkI0Ah5IISiwSu1pqFn0FIsV4Yzk6pWSYaU1ls06eRdUd
	 sZjwq6qPliHvBqGgCX945jPeMl4tnCn28ox0bRP5W9dhRno3ZHwzQEEUdF+uIYm+PF
	 H6a3Qo3PNDnMIVyJEDUlx5HXp7XszIeRErIuyeqjtBioXPCGx2St4FyiveTlwEIPHC
	 HXvkasi3Ori0UmUNLYk/EVzxme07I9nSBzQ4J7/liDe3XgLmQygF2xMUfp9Tic8Ajd
	 eJCv/ulPk9Ycg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5012E404EC;
	Sun, 11 Oct 2026 19:15:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7EDE1A6
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B92D3404EC
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FsgmJL_luM4N for <buildroot@buildroot.org>;
 Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BCE37404E9
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791746148;
 b=jw5JynflZd4UosfN64Cix7hnRYIe8e8nzE3dpEkeAIMkhzbYuAeFVYXsD2G0aKGPBbEO
 1I1tcE+OQh/9e7H7SJ78mxh1HDOPg/o/ArY8oNN2HzJlAugT0vTSSQ0HBCm6TciW3+zyG
 +oRT/QyQHBP3JZeEJ5ZXdxXLdkXpgiAlqCUg4stBfdmBvPxIxmXDWs9zqdc9pJBQzPaVj
 6ZOtrK//8xy3U/tQK8RWCeXlbDr/K15P57jO7PrAoxooH8h4+fFlKNNnz5RCvLtciL2yX
 aDtoq4bGJZou0I35eC6KkfQo+wQvbtCivVSQeDFgINYjRU1iZaHnnWQRKAI6jNrz06w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791746148;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=AHL3BEG3JW4Lbg2I/js5FpZYTqwPPKn/xur59jMwk1A=;
 b=iZlDiN7FqOhYw0E0upOri9j70vuZ6MLFddJc9VTywiH2yQyBWTWBX0XAR/rg+HCTCSSp
 +iCaHTSrx0u1ZfykUo5Tf2bF97Fw5z+A1lSXDj+/jFtlz9OWsw69oK4CMXpv1tZ/MFPtC
 RDttrNRau0k91kE0by/Ul3FTafm/IhU9+hCRqD5k77COoNQJYzylP3ydpSuXMu+jaVMJk
 bIbUlOchrxU1veP2WoNoy40NVdc7aJPjUDRZmL3ZYA9Xmf0ToIu1LwLZOBkHfe7Z9ghzm
 oYsmBQ0FD9dV4fZvlfuT74DIJhuQ/Sr5Hv0eMsEcgU93oyM/OEcsjR/b+7tkIrQO4cg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCE37404E9
 for <buildroot@buildroot.org>; Sun, 11 Oct 2026 19:15:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2BEF9525C; Sun, 11 Oct 2026 19:14:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Oct 2026 21:13:34 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60d1b04a69c7735c3d2d4d5ef9f47ca501271c97
X-Git-Newrev: f43af4ef31cd40270c7db94b98c0ff9f212e6448
X-Patchwork-Hint: ignore
Message-Id: <20261011191429.D2BEF9525C@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 configs/raspberrypicm4io_64_uboot_defconfig: new defconfig
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f43af4ef31cd40270c7db94b98c0ff9f212e6448
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The new config deviates from the existing
configs/raspberrypicm4io_64_defconfig only as far as necessary to
demonstrate booting through U-Boot instead of having the firmware load
the kernel directly. The sample boot script loads the kernel from the
rootfs and uses the device tree provided by the firmware, and should
be compatible with any RPi device that runs U-Boot.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
[Arnout: update kernel to same as raspberrypicm4io_64_defconfig]
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 board/raspberrypi/boot.scr.in                  | 18 ++++++++++++
 board/raspberrypi/config_cm4io_64bit_uboot.txt | 23 +++++++++++++++
 board/raspberrypi/readme.txt                   |  4 +++
 configs/raspberrypicm4io_64_uboot_defconfig    | 40 ++++++++++++++++++++++++++
 4 files changed, 85 insertions(+)

diff --git a/board/raspberrypi/boot.scr.in b/board/raspberrypi/boot.scr.in
new file mode 100644
index 0000000000..1ba733ceaa
--- /dev/null
+++ b/board/raspberrypi/boot.scr.in
@@ -0,0 +1,18 @@
+# Please note that this is only a sample, we recommend you to change
+# it to fit your needs. You should override this file using
+# BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE.
+
+# On most Raspberry Pi boards UART0 is ttyAMA0, Raspberry Pi 5 is
+# different.
+if test "$board_name" = "5 Model B"; then
+    env set serial_uart "ttyAMA10,115200"
+else
+    env set serial_uart "ttyAMA0,115200"
+fi
+env set bootargs "root=/dev/mmcblk0p2 rootwait console=tty1 console=${serial_uart}"
+
+# load kernel from the root partition
+load mmc 0:2 ${kernel_addr_r} boot/Image
+
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
index 31ff424a83..8e1009f254 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -83,6 +83,10 @@ or for CM4 (on IO Board - 64 bit):
 
   $ make raspberrypicm4io_64_defconfig
 
+or to boot CM4 (on IO Board - 64 bit) using U-Boot:
+
+  $ make raspberrypicm4io_64_uboot_defconfig
+
 For model 5 B and 500:
 
   $ make raspberrypi5_defconfig
diff --git a/configs/raspberrypicm4io_64_uboot_defconfig b/configs/raspberrypicm4io_64_uboot_defconfig
new file mode 100644
index 0000000000..84ce16b993
--- /dev/null
+++ b/configs/raspberrypicm4io_64_uboot_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_ARM_FPU_VFPV4=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
+BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_AARCH64_GLIBC_STABLE=y
+BR2_GLOBAL_PATCH_DIR="board/raspberrypi/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit_uboot.txt"
+BR2_PACKAGE_KMOD=y
+BR2_PACKAGE_KMOD_TOOLS=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rpi_arm64"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_KMOD_XZ=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_RASPBERRYPI_USBBOOT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/raspberrypicm4io-64/boot.scr.in"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
