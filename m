Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413C1C001DC
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:25:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED34940A59;
	Wed, 26 Jul 2023 21:25:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED34940A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yh6zzDyt9Ktf; Wed, 26 Jul 2023 21:25:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E263840BCC;
	Wed, 26 Jul 2023 21:25:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E263840BCC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 078831BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E25C76120B
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E25C76120B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVRAL7HS9XDg for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC00860AC0
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DC00860AC0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA203835E9; Wed, 26 Jul 2023 21:25:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 26 Jul 2023 23:25:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 029296c748b235c8e09dba85502d464ca6af050d
X-Git-Newrev: 293196b2baecd27bc41107393a72cf4aeb5f11bc
X-Patchwork-Hint: ignore
Message-Id: <20230726212528.CA203835E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/rock5b: new defconfig
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
Content-Type: multipart/mixed; boundary="===============5967656333840139723=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5967656333840139723==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=293196b2baecd27bc41107393a72cf4aeb5f11bc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the defconfig file needed to build u-boot, kernel
and rootfs for the Rock 5B. In addition it adds a kernel config
fragment file, which activates the needed ethernet driver support.
It also adds a readme and post image scripts, needed to generate an
sdcard.img file, which can be flashed on an SD card to boot the
Radxa Rock 5B.

Signed-off-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
[yann.morin.1998@free.fr:
  - drop custom version
  - fix shellcheck in post-image script
]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                        |  2 ++
 board/radxa/rock5b/boot.cmd       |  3 ++
 board/radxa/rock5b/genimage.cfg   | 34 +++++++++++++++++++++
 board/radxa/rock5b/linux.fragment |  1 +
 board/radxa/rock5b/post-image.sh  |  7 +++++
 board/radxa/rock5b/readme.txt     | 62 +++++++++++++++++++++++++++++++++++++++
 board/radxa/rock5b/rock5b.its     | 46 +++++++++++++++++++++++++++++
 configs/rock5b_defconfig          | 40 +++++++++++++++++++++++++
 8 files changed, 195 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 464d1db552..0ff44c195d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1805,6 +1805,8 @@ F:	package/libcamera/
 
 N:	Kilian Zinnecker <kilian.zinnecker@mail.de>
 F:	package/rockchip-rkbin/
+F:	configs/rock5b_defconfig
+F:	board/radxa/rock5b/
 
 N:	Klaus Heinrich Kiwi <klaus@linux.vnet.ibm.com>
 F:	package/wqy-zenhei/
diff --git a/board/radxa/rock5b/boot.cmd b/board/radxa/rock5b/boot.cmd
new file mode 100644
index 0000000000..9a3e73e003
--- /dev/null
+++ b/board/radxa/rock5b/boot.cmd
@@ -0,0 +1,3 @@
+setenv bootargs root=/dev/mmcblk0p2 rw rootfstype=ext4 clkin_hz=(25000000) earlycon clk_ignore_unused earlyprintk console=ttyS2,1500000n8 rootwait
+fatload mmc 1:1 ${loadaddr} image.itb
+bootm ${loadaddr}
diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
new file mode 100644
index 0000000000..2943232fc3
--- /dev/null
+++ b/board/radxa/rock5b/genimage.cfg
@@ -0,0 +1,34 @@
+# SD card image for Radxa Rock 5b
+
+image boot.vfat {
+	vfat {
+		files = {
+			"image.itb",
+			"boot.scr"
+		}
+	}
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+		partition-table-type = "hybrid"
+	}
+
+	partition uboot {
+		in-partition-table = "false"
+		image = "u-boot-rockchip.bin"
+		offset = 32K
+	}
+
+	partition boot {
+		partition-type = "0xC"
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/radxa/rock5b/linux.fragment b/board/radxa/rock5b/linux.fragment
new file mode 100644
index 0000000000..811d42a79b
--- /dev/null
+++ b/board/radxa/rock5b/linux.fragment
@@ -0,0 +1 @@
+CONFIG_R8169=y
diff --git a/board/radxa/rock5b/post-image.sh b/board/radxa/rock5b/post-image.sh
new file mode 100755
index 0000000000..c706a5ee78
--- /dev/null
+++ b/board/radxa/rock5b/post-image.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env bash
+set -e
+
+gzip -fk "${BINARIES_DIR}/Image"
+cp board/radxa/rock5b/rock5b.its "${BINARIES_DIR}"
+(cd "${BINARIES_DIR}" && mkimage -f rock5b.its image.itb)
+support/scripts/genimage.sh -c board/radxa/rock5b/genimage.cfg
diff --git a/board/radxa/rock5b/readme.txt b/board/radxa/rock5b/readme.txt
new file mode 100644
index 0000000000..a88b9b46fa
--- /dev/null
+++ b/board/radxa/rock5b/readme.txt
@@ -0,0 +1,62 @@
+RADXA ROCK 5B
+==============
+https://wiki.radxa.com/Rock5/hardware/5b
+
+Build:
+======
+  $ make rock5b_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+├── Image
+├── Image.gz
+├── boot.scr
+├── boot.vfat
+├── image.itb
+├── rk3588-rock-5b.dtb
+├── rk3588_bl31_v1.40.elf
+├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
+├── rock5b.its
+├── rootfs.ext2
+├── rootfs.ext4
+├── rootfs.tar
+├── sdcard.img
+├── u-boot-rockchip.bin
+└── u-boot.bin
+
+Creating bootable SD card:
+==========================
+
+Simply invoke (as root)
+
+sudo dd if=output/images/sdcard.img of=/dev/sdX && sync
+
+Where X is your SD card device.
+
+Booting:
+========
+
+Serial console:
+---------------
+The Rock 5B has a 40-pin GPIO header. Its layout can be seen here:
+https://wiki.radxa.com/Rock5/hardware/5b/gpio
+
+The Uart pins are as follows:
+
+pin 6:  gnd
+pin 8:  tx
+pin 10: rx
+
+Baudrate for this board is 1500000.
+
+Login:
+------
+Enter 'root' as login user, and the prompt is ready.
+
+wiki link:
+----------
+https://forum.radxa.com/c/rock5
diff --git a/board/radxa/rock5b/rock5b.its b/board/radxa/rock5b/rock5b.its
new file mode 100644
index 0000000000..d73659a56e
--- /dev/null
+++ b/board/radxa/rock5b/rock5b.its
@@ -0,0 +1,46 @@
+/dts-v1/;
+
+/ {
+	description = "Rock 5B FIT Image";
+	#address-cells = <1>;
+
+	images {
+		kernel {
+			description = "Kernel";
+			data = /incbin/("Image.gz");
+			type = "kernel";
+			arch = "arm64";
+			os = "linux";
+			compression = "gzip";
+			load = <0x0a200000>;
+			entry = <0x0a200000>;
+			hash {
+				algo = "sha256";
+			};
+		};
+		fdt {
+			description = "Device Tree";
+			data = /incbin/("rk3588-rock-5b.dtb");
+			type = "flat_dt";
+			arch = "arm64";
+			compression = "none";
+			load = <0x0e000000>;
+			entry = <0x0e000000>;
+			hash {
+				algo = "sha256";
+			};
+		};
+	};
+
+	configurations {
+		default = "standard";
+		standard {
+			description = "Standard Boot";
+			kernel = "kernel";
+			fdt = "fdt";
+			hash {
+				algo = "sha256";
+			};
+		};
+	};
+};
diff --git a/configs/rock5b_defconfig b/configs/rock5b_defconfig
new file mode 100644
index 0000000000..6e525d9676
--- /dev/null
+++ b/configs/rock5b_defconfig
@@ -0,0 +1,40 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_KERNEL_HEADERS_5_10=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/radxa/rock5b/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS=""
+BR2_TARGET_GENERIC_HOSTNAME="rock5b"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the rock5b board"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/radxa/kernel.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="52f51a2b5ba178f331af62260d2da86d7472c14b"
+BR2_LINUX_KERNEL_DEFCONFIG="rockchip_linux"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588-rock-5b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/radxa/rock5b/linux.fragment"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="250M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/radxa/rock5b/boot.cmd"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_DTC=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.40.elf"

--===============5967656333840139723==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5967656333840139723==--
