Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56701C5AD49
	for <buildroot@archiver.kernel.org>; Sun,  8 Jun 2025 11:57:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F46A40BBB;
	Sun,  8 Jun 2025 11:57:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiXvp0MAiZMJ; Sun,  8 Jun 2025 11:57:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DDB2409A1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DDB2409A1;
	Sun,  8 Jun 2025 11:57:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 790E3C8
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:57:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5FB5F40BFC
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:57:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bchgnaJalJHN for <buildroot@buildroot.org>;
 Sun,  8 Jun 2025 11:57:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=220.197.31.3;
 helo=m16.mail.163.com; envelope-from=andyshrk@163.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 608F34041B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 608F34041B
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.3])
 by smtp2.osuosl.org (Postfix) with ESMTP id 608F34041B
 for <buildroot@buildroot.org>; Sun,  8 Jun 2025 11:57:18 +0000 (UTC)
Received: from ProDesk.. (unknown [])
 by gzga-smtp-mtada-g1-1 (Coremail) with SMTP id
 _____wD3V2n9dkVo0I7sGw--.24883S2; 
 Sun, 08 Jun 2025 19:41:53 +0800 (CST)
From: Andy Yan <andyshrk@163.com>
To: buildroot@buildroot.org
Cc: ju.o@free.fr,
	Andy Yan <andyshrk@163.com>
Date: Sun,  8 Jun 2025 19:41:22 +0800
Message-ID: <20250608114143.405210-1-andyshrk@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3V2n9dkVo0I7sGw--.24883S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjfU16pBUUUUU
X-Originating-IP: [58.22.7.114]
X-CM-SenderInfo: 5dqg52xkunqiywtou0bp/xtbBkBNmXmhFccxpBgABsF
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Type; bh=e3Dp3bcekBnWeD/8EtC+XX7pTIle5OnasVuftOAvhJg=;
 b=mTYzeANSCsSlOzuy/CiGfW9dlVKI1Cm3uYJGvDvnhYb7TnHWtLnqMdeuKShwHn
 Zp9ffuNgl3qkSF/GMo0veXcLRhsSt9weOfi93CDQC4H7+zkY54UiKVgXlyAVW1o6
 cne17Pv98+i08Up4ckJdPx05MCeArr++wbZkaXvtOVrwk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=163.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=mTYzeANS
Subject: [Buildroot] [PATCH v2] configs/coolpi_4b: new defconfig
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
Content-Type: multipart/mixed; boundary="===============1195547155527559663=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1195547155527559663==
Content-Type: text/plain; charset=all
Content-Transfer-Encoding: 8bit

CoolPi 4B is a rk3588s based SBC[0].
Specification:
- Rockchip RK3588S
- LPDDR4 2/4/8/16 GB
- TF scard slot
- eMMC 8/32/64/128 GB module
- Gigabit ethernet drived by PCIE with RTL8111HS
- HDMI Type D out
- Mini DP out
- USB 2.0 Host x 2
- USB 3.0 OTG x 1
- USB 3.0 Host x 1
- WIFI/BT module AIC8800
- 40 pin header

[0]https://www.cool-pi.com/product/cp4b/

Signed-off-by: Andy Yan <andyshrk@163.com>

---

Changes in v2:
- Align website address.
- Fix shellcheck warnings
- Remove weston,gstreamer and some other packages

 board/coolpi/coolpi-4b/extlinux.conf |  4 ++
 board/coolpi/coolpi-4b/genimage.cfg  | 35 +++++++++++++++++
 board/coolpi/coolpi-4b/post-image.sh |  7 ++++
 board/coolpi/coolpi-4b/readme.txt    | 57 ++++++++++++++++++++++++++++
 configs/coolpi_4b_defconfig          | 39 +++++++++++++++++++
 5 files changed, 142 insertions(+)
 create mode 100644 board/coolpi/coolpi-4b/extlinux.conf
 create mode 100644 board/coolpi/coolpi-4b/genimage.cfg
 create mode 100755 board/coolpi/coolpi-4b/post-image.sh
 create mode 100644 board/coolpi/coolpi-4b/readme.txt
 create mode 100644 configs/coolpi_4b_defconfig

diff --git a/board/coolpi/coolpi-4b/extlinux.conf b/board/coolpi/coolpi-4b/extlinux.conf
new file mode 100644
index 0000000000..466ab1eed6
--- /dev/null
+++ b/board/coolpi/coolpi-4b/extlinux.conf
@@ -0,0 +1,4 @@
+label coolpi-4b-buildroot
+  kernel /Image.gz
+  devicetree /rk3588s-coolpi-4b.dtb
+  append root=/dev/mmcblk1p2 rw rootfstype=ext4 earlycon earlyprintk console=ttyS2,1500000n8 rootwait
diff --git a/board/coolpi/coolpi-4b/genimage.cfg b/board/coolpi/coolpi-4b/genimage.cfg
new file mode 100644
index 0000000000..826d899c95
--- /dev/null
+++ b/board/coolpi/coolpi-4b/genimage.cfg
@@ -0,0 +1,35 @@
+# SD card image for Cool PI 4b
+
+image boot.vfat {
+	vfat {
+		files = {
+			"Image.gz",
+			"rk3588s-coolpi-4b.dtb",
+			"extlinux"
+		}
+	}
+	size = 32M
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
diff --git a/board/coolpi/coolpi-4b/post-image.sh b/board/coolpi/coolpi-4b/post-image.sh
new file mode 100755
index 0000000000..65b79e81c8
--- /dev/null
+++ b/board/coolpi/coolpi-4b/post-image.sh
@@ -0,0 +1,7 @@
+#!/usr/bin/env bash
+set -e
+
+BOARD_DIR="$(dirname "$0")"
+gzip -fk "${BINARIES_DIR}/Image"
+install -m 0644 -D "$BOARD_DIR/extlinux.conf" "$BINARIES_DIR/extlinux/extlinux.conf"
+support/scripts/genimage.sh -c board/coolpi/coolpi-4b/genimage.cfg
diff --git a/board/coolpi/coolpi-4b/readme.txt b/board/coolpi/coolpi-4b/readme.txt
new file mode 100644
index 0000000000..7213ab3bae
--- /dev/null
+++ b/board/coolpi/coolpi-4b/readme.txt
@@ -0,0 +1,57 @@
+Cool Pi 4B
+==============
+https://www.cool-pi.com/product/cp4b/
+
+Build:
+======
+  $ make coolpi_4b_defconfig
+  $ make
+
+Files created in output directory
+=================================
+
+output/images
+.
+output/images/
+├── boot.vfat
+├── extlinux
+│   └── extlinux.conf
+├── Image
+├── Image.gz
+├── rk3588_bl31_v1.40.elf
+├── rk3588_ddr_lp4_2112MHz_lp5_2736MHz_v1.12.bin
+├── rk3588s-coolpi-4b.dtb
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── u-boot.bin
+└── u-boot-rockchip.bin
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
+The Cool Pi 4B has a 40-pin GPIO header.
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
diff --git a/configs/coolpi_4b_defconfig b/configs/coolpi_4b_defconfig
new file mode 100644
index 0000000000..25ae188157
--- /dev/null
+++ b/configs/coolpi_4b_defconfig
@@ -0,0 +1,39 @@
+BR2_aarch64=y
+BR2_cortex_a76_a55=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_14=y
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_TARGET_GENERIC_HOSTNAME="coolpi"
+BR2_TARGET_GENERIC_ISSUE="Welcome to the CoolPi 4B"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/coolpi/coolpi-4b/post-image.sh"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.14.10"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3588s-coolpi-4b"
+BR2_LINUX_KERNEL_DTB_OVERLAY_SUPPORT=y
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_RTL_8169=y
+BR2_PACKAGE_LINUX_FIRMWARE_ARM_MALI_CSF=y
+BR2_PACKAGE_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_ROCKCHIP_RKBIN_TPL_FILENAME="bin/rk35/rk3588_ddr_lp4_2112MHz_lp5_2400MHz_v1.18.bin"
+BR2_PACKAGE_ROCKCHIP_RKBIN_BL31_FILENAME="bin/rk35/rk3588_bl31_v1.48.elf"
+BR2_PACKAGE_LIBDRM=y
+BR2_PACKAGE_LIBDRM_INSTALL_TESTS=y
+BR2_PACKAGE_OPENSSH=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="512M"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="coolpi-4b-rk3588s"
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYELFTOOLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_ROCKCHIP_RKBIN=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-- 
2.43.0

base-commit: 00f0fca15a696eafae688b58c0df220ef5a2e2dc
branch: board-upsteam


--===============1195547155527559663==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1195547155527559663==--
