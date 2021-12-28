Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C34DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 21:03:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A94C60B6E;
	Tue, 28 Dec 2021 21:03:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4PMPqJOpmkCz; Tue, 28 Dec 2021 21:03:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5619560B66;
	Tue, 28 Dec 2021 21:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 942F91BF344
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2F0B640253
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 21:02:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HynZgZSXiKqD for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D149405B0
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 21:02:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id E560182BDD; Tue, 28 Dec 2021 20:56:26 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Tue, 28 Dec 2021 22:01:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d94e2b6dd4f291a77bbfd06eabb7ce85c9bb6aa9
X-Git-Newrev: 444f6d22cc954f080bc92fe445dad27361401c04
X-Patchwork-Hint: ignore
Message-Id: <20211228205626.E560182BDD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/microchip_sama7g5ek: new defconfigs
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

commit: https://git.buildroot.net/buildroot/commit/?id=444f6d22cc954f080bc92fe445dad27361401c04
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new defconfigs for sama7g5 evaluation kit.
Update README with new defconfigs.
Board uses linux 5.15 mainline.

Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    |  5 ++
 board/atmel/readme.txt                        |  2 +
 board/microchip/sama7g5ek/genimage.cfg        | 31 ++++++++++++
 configs/microchip_sama7g5ek_mmc_defconfig     | 25 ++++++++++
 configs/microchip_sama7g5ek_mmc_dev_defconfig | 68 +++++++++++++++++++++++++++
 5 files changed, 131 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index cdfe922d66..78e41b7d7c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -789,6 +789,11 @@ F:	package/optee-client/
 F:	package/optee-examples/
 F:	package/optee-test/
 
+N:	Eugen Hristev <eugen.hristev@microchip.com>
+F:	board/atmel/readme.txt
+F:	board/microchip/sama7g5ek/
+F:	configs/microchip_sama7g5ek*
+
 N:	Eugene Tarassov <eugene@largest.net>
 F:	package/tcf-agent/
 
diff --git a/board/atmel/readme.txt b/board/atmel/readme.txt
index a29d027214..a9c427e90b 100644
--- a/board/atmel/readme.txt
+++ b/board/atmel/readme.txt
@@ -25,6 +25,8 @@ This guide covers the following configurations:
  - microchip_sam9x60ek_mmc_dev_defconfig
  - microchip_sama5d2_icp_mmc_defconfig
  - microchip_sama5d2_icp_mmc_dev_defconfig
+ - microchip_sama7g5ek_mmc_defconfig
+ - microchip_sama7g5ek_mmc_dev_defconfig
 
 These configurations will use AT91Bootstrap, u-boot and a linux kernel from
 the git trees maintained by Atmel.
diff --git a/board/microchip/sama7g5ek/genimage.cfg b/board/microchip/sama7g5ek/genimage.cfg
new file mode 100644
index 0000000000..ade29e4b5d
--- /dev/null
+++ b/board/microchip/sama7g5ek/genimage.cfg
@@ -0,0 +1,31 @@
+# Image for SD card boot on Microchip SAMA7G5EK (sama7g5 evaluation kit)
+#
+image boot.vfat {
+	vfat {
+		files = {
+			"zImage",
+			"at91-sama7g5ek.dtb",
+			"boot.bin",
+			"u-boot.bin"
+		}
+	}
+	size = 16M
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
+		offset = 1M
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/configs/microchip_sama7g5ek_mmc_defconfig b/configs/microchip_sama7g5ek_mmc_defconfig
new file mode 100644
index 0000000000..940b658c7d
--- /dev/null
+++ b/configs/microchip_sama7g5ek_mmc_defconfig
@@ -0,0 +1,25 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sama7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2021.04)/u-boot-at91-linux4sam-2021.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama7g5ek_mmc1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
diff --git a/configs/microchip_sama7g5ek_mmc_dev_defconfig b/configs/microchip_sama7g5ek_mmc_dev_defconfig
new file mode 100644
index 0000000000..e7f2f9ca83
--- /dev/null
+++ b/configs/microchip_sama7g5ek_mmc_dev_defconfig
@@ -0,0 +1,68 @@
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_PTHREAD_DEBUG=y
+BR2_TOOLCHAIN_BUILDROOT_CXX=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/microchip/sama7g5ek/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_DEFCONFIG="sama7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91-sama7g5ek"
+BR2_PACKAGE_LINUX_TOOLS_IIO=y
+BR2_PACKAGE_BZIP2=y
+BR2_PACKAGE_XZ=y
+BR2_PACKAGE_ZIP=y
+BR2_PACKAGE_GDB=y
+BR2_PACKAGE_LMBENCH=y
+BR2_PACKAGE_STRACE=y
+BR2_PACKAGE_TREE=y
+BR2_PACKAGE_DOSFSTOOLS=y
+BR2_PACKAGE_DOSFSTOOLS_FATLABEL=y
+BR2_PACKAGE_DOSFSTOOLS_FSCK_FAT=y
+BR2_PACKAGE_DOSFSTOOLS_MKFS_FAT=y
+BR2_PACKAGE_MMC_UTILS=y
+BR2_PACKAGE_MTD=y
+BR2_PACKAGE_WILC1000_FIRMWARE=y
+BR2_PACKAGE_EVTEST=y
+BR2_PACKAGE_SETSERIAL=y
+BR2_PACKAGE_SPI_TOOLS=y
+BR2_PACKAGE_USBUTILS=y
+BR2_PACKAGE_LIBSYSFS=y
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_DTC=y
+BR2_PACKAGE_DTC_PROGRAMS=y
+BR2_PACKAGE_ARGP_STANDALONE=y
+BR2_PACKAGE_BLUEZ5_UTILS=y
+BR2_PACKAGE_BRIDGE_UTILS=y
+BR2_PACKAGE_CAN_UTILS=y
+BR2_PACKAGE_ETHTOOL=y
+BR2_PACKAGE_IPERF=y
+BR2_PACKAGE_IPROUTE2=y
+BR2_PACKAGE_IPTABLES=y
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_LRZSZ=y
+BR2_PACKAGE_MII_DIAG=y
+BR2_PACKAGE_OPENSSH=y
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_HTOP=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,at91bootstrap,v4.0.0)/at91bootstrap-v4.0.0.tar.gz"
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama7g5eksd_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,linux4sam,u-boot-at91,linux4sam-2021.04)/u-boot-at91-linux4sam-2021.04.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="sama7g5ek_mmc1"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
