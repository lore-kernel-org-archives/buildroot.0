Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC071C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:00:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 34E938475F;
	Mon, 19 May 2025 11:00:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b_68OaV9UcU2; Mon, 19 May 2025 11:00:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0FAD18475A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FAD18475A;
	Mon, 19 May 2025 11:00:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1638BE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB60141173
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PR4P67S01n-S for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3549C40DBA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3549C40DBA
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 334ED82A2E; Mon, 19 May 2025 10:40:04 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 May 2025 15:26:06 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b473d99416e08cb174482c5428809cecf1c7bf9c
X-Git-Newrev: 2e05f22ff862192a7e512d0db0486351bba94ae8
X-Patchwork-Hint: ignore
Message-Id: <20250519104004.334ED82A2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/freescale_imx93frdm:
 new defconfig
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0779938303844882149=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0779938303844882149==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=2e05f22ff862192a7e512d0db0486351bba94ae8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit adds support for the i.MX 93 FRDM (Freedom) board.

The i.MX93 FRDM development board is a low-cost and compact
development board featuring the i.MX93 applications processor.

See: https://nxp.com/FRDM-IMX93

This defconfig is based on freescale_imx93evk_defconfig introduced
by Sébastien, in Cc.

Note: the Linux and U-Boot repositories are forks. This is because
the NXP software team did not included all the necessary i.MX93 FRDM
patches in the standard NXP i.MX BSP at the time of this commit.
Instead, patches were published in a dedicated Yocto Layer from [1].
The forks used in this defconfig are simply the repositories [2]
and [3] with patches from [1] applied on them. This is only to make this
defconfig simpler in the meantime the BSP patches are included in the
NXP BSP repositories.

Thanks to Martin Chabot for lending a board!

[1] https://github.com/nxp-imx-support/meta-imx-frdm
[2] https://github.com/nxp-imx/uboot-imx
[3] https://github.com/nxp-imx/linux-imx

Cc: Martin Chabot <martin.chabot@gmail.com>
Cc: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
Tested-by: Julien Olivain <ju.o@free.fr>
[Julien: Tested on board 700-94611 Rev B1]
Signed-off-by: Julien Olivain <ju.o@free.fr>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  2 +
 .../arm-trusted-firmware/arm-trusted-firmware.hash |  2 +
 .../patches/linux-headers/linux-headers.hash       |  1 +
 board/freescale/imx93frdm/patches/linux/linux.hash |  2 +
 board/freescale/imx93frdm/patches/uboot/uboot.hash |  2 +
 board/freescale/imx93frdm/readme.txt               | 74 ++++++++++++++++++++++
 configs/freescale_imx93frdm_defconfig              | 41 ++++++++++++
 7 files changed, 124 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index c4d14aa875..16b15c2238 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1804,9 +1804,11 @@ F:	configs/ts7680_defconfig
 F:	package/paho-mqtt-c
 
 N:	Julien Olivain <ju.o@free.fr>
+F:	board/freescale/imx93frdm/
 F:	board/qemu/riscv64-virt-efi/
 F:	board/spike/
 F:	board/technexion/imx8mmpico/
+F:	configs/freescale_imx93frdm_defconfig
 F:	configs/imx8mmpico_defconfig
 F:	configs/qemu_riscv64_virt_efi_defconfig
 F:	configs/spike_riscv32_defconfig
diff --git a/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..7561385cb8
--- /dev/null
+++ b/board/freescale/imx93frdm/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  8cfe0afc903ebbc03f27e4874aa9ce82be78843a8b42ed4c906871e7f311b510  imx-atf-lf-6.6.36-2.1.0.tar.gz
diff --git a/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash b/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/freescale/imx93frdm/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/freescale/imx93frdm/patches/linux/linux.hash b/board/freescale/imx93frdm/patches/linux/linux.hash
new file mode 100644
index 0000000000..0da8c03384
--- /dev/null
+++ b/board/freescale/imx93frdm/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  3244dc3c62c990d9de90e1c7193aa3099e0e74e720de5c9c13edfbfdd802f596  linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
diff --git a/board/freescale/imx93frdm/patches/uboot/uboot.hash b/board/freescale/imx93frdm/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..e512c27f7d
--- /dev/null
+++ b/board/freescale/imx93frdm/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  bced4334363199d5465532d221d06dc3a5b49271067d74408019c825ed2ca715  uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz
diff --git a/board/freescale/imx93frdm/readme.txt b/board/freescale/imx93frdm/readme.txt
new file mode 100644
index 0000000000..3e5f404029
--- /dev/null
+++ b/board/freescale/imx93frdm/readme.txt
@@ -0,0 +1,74 @@
+**********************
+NXP i.MX 93 FRDM board
+**********************
+
+This file documents the Buildroot support for the i.MX 93 FRDM
+(Freedom) board. For more information on this board, see [1].
+
+
+Build
+=====
+
+First, configure Buildroot for the i.MX 93 FRDM board:
+
+    make freescale_imx93frdm_defconfig
+
+Build all components:
+
+    make
+
+When this command completes, the generated image containing everything
+to boot from the SD card is located in "output/images/sdcard.img".
+
+
+Create a bootable SD card
+=========================
+
+To determine the device associated to the SD card have a look in the
+/proc/partitions file:
+
+    cat /proc/partitions
+
+Buildroot prepares a bootable "sdcard.img" image in the output/images/
+directory, ready to be dumped on a SD card. Launch the following
+command as root:
+
+    dd if=output/images/sdcard.img of=/dev/<your-sd-device>
+
+*** WARNING! This will destroy all the card content. Use with care! ***
+
+For details about the medium image layout, see the definition in
+board/freescale/common/imx/genimage.cfg.template_imx9.
+
+
+Boot the i.MX 93 FRDM board
+===========================
+
+To boot your newly created system (refer to the i.MX 93 FRDM
+Documentation [2] for guidance):
+- insert the SD card in the SD slot (P13) of the board;
+- Configure the SW1 boot switches as follows:
+  SW1: 1100 SW1[1-4] ("USDHC2 4-bit SD3.0" Boot Mode)
+- connect a USB Type-C cable into the P16 Debug USB Port and connect
+  using a terminal emulator at 115200 bps, 8n1;
+- power on the board by connecting a USB Type-C cable into the P1
+  Power USB Port.
+
+Note 1: the board boot switches default configuration is:
+SW1: 0100 SW1[1-4] ("USDHC1 8-bit eMMC 5.1" Boot Mode)
+and the board is also pre-flashed with a reference Linux demo
+image. It is important to change the boot config switches to make
+sure the system will boot on the SD Card.
+
+Note 2: the debug USB connector presents 2 UARTs (for example
+/dev/ttyACM[0-1]), the Cortex-A55 UART should be the 1st one (in the
+previous example, /dev/ttyACM0). Refer to the documentation [2] for
+more details.
+
+Enjoy!
+
+
+References
+==========
+[1] https://www.nxp.com/FRDM-IMX93
+[2] https://www.nxp.com/document/guide/getting-started-with-frdm-imx93:GS-FRDM-IMX93
diff --git a/configs/freescale_imx93frdm_defconfig b/configs/freescale_imx93frdm_defconfig
new file mode 100644
index 0000000000..8e16762d8f
--- /dev/null
+++ b/configs/freescale_imx93frdm_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_cortex_a55=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_GLOBAL_PATCH_DIR="board/freescale/imx93frdm/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttyLP0"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx9-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,linux-imx,lf-6.6.36-2.1.0-imx93frdm)/linux-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
+BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx93-11x11-frdm"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
+BR2_PACKAGE_FIRMWARE_ELE_IMX=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.6.36-2.1.0)/imx-atf-lf-6.6.36-2.1.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx93"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,jolivain,uboot-imx,lf-6.6.36-2.1.0-imx93frdm)/uboot-imx-lf-6.6.36-2.1.0-imx93frdm.tar.gz"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx93_11x11_frdm"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y

--===============0779938303844882149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0779938303844882149==--
