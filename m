Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BA41CCF9E3
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 20:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2FC4B8175E;
	Tue,  4 Nov 2025 20:08:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zPhcZNRMkvsb; Tue,  4 Nov 2025 20:08:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F3BBB82980
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BBB82980;
	Tue,  4 Nov 2025 20:08:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B7E52278
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CB3940EB2
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:08:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wBJd2xR2wTH6 for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 20:08:45 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AB5040EA2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AB5040EA2
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AB5040EA2
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 20:08:44 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:7427:ac55:2702:f075])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A513E5FFAF;
 Tue,  4 Nov 2025 21:08:38 +0100 (CET)
To: buildroot@buildroot.org
Cc: Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
 Julien Olivain <ju.o@free.fr>
Date: Tue,  4 Nov 2025 21:08:33 +0100
Message-ID: <20251104200833.4095436-1-ju.o@free.fr>
X-Mailer: git-send-email 2.51.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1762286922;
 bh=TKiQOX1HcZKq3MY8/pB981hAulfHytXXmyFJy6WrBVA=;
 h=From:To:Cc:Subject:Date:From;
 b=TwY4bpQ8t8HHmiBwEsApBnAD/FyIop9woA/ywEcrXdCqmvLZjLqXo9EJtdXJU39V6
 l62h3G0pYudw7RC4qGw/u7NJ6yt6MAIwnFWgCXQLFYjMqkQxAO+rWVLtKb8+7/z62K
 OiU/SlZClrhQJTP0WbhtjFkpj0Dh9K0leI1GVRHMQZ1rJEu/0yCfTTGnYEMxUewRZj
 SZhe09E2h7fQx08h9z3mJMsTdZTll8Jcm9hFHOhjsai56x2Yu43SM1VyNj4gNPMuKE
 ExK1i3Yd70bqU+yRa9A4juNspDI+vEmfO+o5LUXeKVAOo9cJREZ1Yo4yVa1pGCsQYh
 YwvN0DtN+JzJw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=TwY4bpQ8
Subject: [Buildroot] [PATCH 1/1] configs/pine64_star64: update to latest
 upstream uboot and LTS kernel
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since Buildroot commit [1] "package/gcc: switch to GCC 14.x as the
default", pine64_star64_defconfig compilation is failing in
u-boot with error:

    drivers/video/dw_hdmi.c: In function 'dw_hdmi_write':
    drivers/video/dw_hdmi.c:81:42: error: passing argument 2 of 'writeb' makes pointer from integer without a cast [-Wint-conversion]

See build failure [2].

Upstream U-Boot includes a support for this board since commit [3],
first included in v2024.07.
Upstream Kernel includes a support for this board since commit [4],
first included in v6.11.

This commit switches uboot and linux from the repository
https://github.com/Fishwaldo
to their respective upstream sources.

U-Boot is updated from the fork from a v2021.10 base to v2025.10.
The Linux Kernel is updated from the fork from a v5.15.131 base
to v6.12.56.

While at it, this commit updates the defconfig to the new convention:
- It adds custom hashes and enables BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
- It switches to a glibc stable bootlin external toolchain

Note that the upstream uboot defconfig name for the pine64 star64
board is starfive_visionfive2 (which is in fact another, but very
similar board). The detection of the board is made inside the SPL.
See [5].

Finally, switching to upstream uboot and kernel required few
adjustments:
- The genimage.cfg is updated to use the "u-boot.itb" file produced by
  U-Boot,
- In genimage.cfg, the uboot partition-type-uuid is changed to
  xbootldr (the genimage human readable name), to follow the
  recommendation of the UUID to use from [5],
- In extlinux.conf, rootwait is added in kernel arguments,
- The post-build.sh script and the star64-uboot-fit-image.its file
  are removed: they are no longer needed, since U-Boot and Binman
  are managing everything,
- BR2_TARGET_UBOOT_SPL_NAME is updated in the defconfig, to reflect
  the file name generated by U-Boot,
- BR2_PACKAGE_HOST_STARFIVE_SPLTOOL is removed from the defconfig,
  it is no longer needed, since upstream U-Boot produces the file
  at the correct format,
- BR2_PACKAGE_HOST_UBOOT_TOOLS is also removed from the defconfig,
  it is no longer needed since U-Boot uses Binman,
- the defconfig is updated to include the new uboot requirements
  (BR2_TARGET_UBOOT_{NEEDS,USE}_*),
- the pine64_star64_defconfig entry is removed from .checkpackageignore
  it is no longer needed.

This patch was tested on a Pine64 Star64 board V1.1,
PCB revision: 0xc1, BOM revision: A.

Fixes:
- [2]

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/1e1fafa1f0f5069418e92f702c2a66db6408a634
[2] https://gitlab.com/buildroot.org/buildroot/-/jobs/11916952973
[3] https://source.denx.de/u-boot/u-boot/-/commit/7ebf7e77c0616ef0d2f58cc1684c230f656bd3d6
[4] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=2606bf583b9623694b864c220fd6b3d2ed13ba13
[5] https://source.denx.de/u-boot/u-boot/-/blob/v2025.10/doc/board/starfive/pine64_star64.rst

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                           |  1 -
 board/pine64/star64/genimage.cfg              |  4 +--
 .../overlay/boot/extlinux/extlinux.conf       |  2 +-
 board/pine64/star64/patches/linux/linux.hash  |  2 ++
 board/pine64/star64/patches/uboot/uboot.hash  |  2 ++
 board/pine64/star64/post-build.sh             |  9 ------
 .../pine64/star64/star64-uboot-fit-image.its  | 29 -------------------
 configs/pine64_star64_defconfig               | 28 ++++++++++--------
 8 files changed, 23 insertions(+), 54 deletions(-)
 create mode 100644 board/pine64/star64/patches/linux/linux.hash
 create mode 100644 board/pine64/star64/patches/uboot/uboot.hash
 delete mode 100755 board/pine64/star64/post-build.sh
 delete mode 100644 board/pine64/star64/star64-uboot-fit-image.its

diff --git a/.checkpackageignore b/.checkpackageignore
index efe5d54711..98864936eb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -152,7 +152,6 @@ configs/orangepi_pc2_defconfig lib_defconfig.ForceCheckHash
 configs/orangepi_zero_plus_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_defconfig lib_defconfig.ForceCheckHash
 configs/pine64_pinecube_defconfig lib_defconfig.ForceCheckHash
-configs/pine64_star64_defconfig lib_defconfig.ForceCheckHash
 configs/s6lx9_microboard_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_defconfig lib_defconfig.ForceCheckHash
 configs/sipeed_lichee_rv_dock_defconfig lib_defconfig.ForceCheckHash
diff --git a/board/pine64/star64/genimage.cfg b/board/pine64/star64/genimage.cfg
index 74940016f4..20326710c5 100644
--- a/board/pine64/star64/genimage.cfg
+++ b/board/pine64/star64/genimage.cfg
@@ -12,8 +12,8 @@ image sdcard.img {
         }
 
         partition uboot {
-                image = "opensbi_uboot_payload.img"
-                partition-type-uuid = 5B193300-FC78-40CD-8002-E86C45580B47
+                image = "u-boot.itb"
+                partition-type-uuid = xbootldr
                 offset = 4M
         }
 
diff --git a/board/pine64/star64/overlay/boot/extlinux/extlinux.conf b/board/pine64/star64/overlay/boot/extlinux/extlinux.conf
index db7cfb7b8b..4a76fc1624 100644
--- a/board/pine64/star64/overlay/boot/extlinux/extlinux.conf
+++ b/board/pine64/star64/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label star64
   kernel /boot/Image
   devicetree /boot/jh7110-pine64-star64.dtb
-  append root=/dev/mmcblk1p3 earlycon=sbi
+  append root=/dev/mmcblk1p3 rootwait earlycon=sbi
diff --git a/board/pine64/star64/patches/linux/linux.hash b/board/pine64/star64/patches/linux/linux.hash
new file mode 100644
index 0000000000..8549cf1037
--- /dev/null
+++ b/board/pine64/star64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# From https://www.kernel.org/pub/linux/kernel/v6.x/sha256sums.asc
+sha256  165ca1c37c4607b90e731996b7c1e3311285167d13deeedf08f3f1f0b9d2541a  linux-6.12.57.tar.xz
diff --git a/board/pine64/star64/patches/uboot/uboot.hash b/board/pine64/star64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..98a5c53aaf
--- /dev/null
+++ b/board/pine64/star64/patches/uboot/uboot.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/board/pine64/star64/post-build.sh b/board/pine64/star64/post-build.sh
deleted file mode 100755
index ed0a6ebd52..0000000000
--- a/board/pine64/star64/post-build.sh
+++ /dev/null
@@ -1,9 +0,0 @@
-#!/bin/bash
-BOARD_DIR="$CONFIG_DIR"/board/pine64/star64
-
-# Add header to the SPL
-"$HOST_DIR"/bin/spl_tool -c -f "$BINARIES_DIR"/u-boot-spl.bin
-
-# Create the u-boot FIT image
-cp "$BOARD_DIR"/star64-uboot-fit-image.its "$BINARIES_DIR"
-mkimage -f "$BINARIES_DIR"/star64-uboot-fit-image.its -A riscv -O u-boot -T firmware "$BINARIES_DIR"/opensbi_uboot_payload.img
diff --git a/board/pine64/star64/star64-uboot-fit-image.its b/board/pine64/star64/star64-uboot-fit-image.its
deleted file mode 100644
index 08f603163a..0000000000
--- a/board/pine64/star64/star64-uboot-fit-image.its
+++ /dev/null
@@ -1,29 +0,0 @@
-/dts-v1/;
-
-/ {
-	description = "U-boot-spl FIT image for JH7110 Pine64 Star64";
-	#address-cells = <2>;
-
-	images {
-		firmware {
-			description = "u-boot";
-			data = /incbin/("fw_payload.bin");
-			type = "firmware";
-			arch = "riscv";
-			os = "u-boot";
-			load = <0x0 0x40000000>;
-			entry = <0x0 0x40000000>;
-			compression = "none";
-		};
-	};
-
-	configurations {
-		default = "config-1";
-
-		config-1 {
-			description = "U-boot-spl FIT config for JH7110 Pine64 Star64";
-			firmware = "firmware";
-		};
-	};
-};
-
diff --git a/configs/pine64_star64_defconfig b/configs/pine64_star64_defconfig
index 33c5826a4a..a0356447d5 100644
--- a/configs/pine64_star64_defconfig
+++ b/configs/pine64_star64_defconfig
@@ -1,13 +1,14 @@
 BR2_riscv=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_TOOLCHAIN_EXTERNAL=y
+BR2_GLOBAL_PATCH_DIR="board/pine64/star64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_ROOTFS_OVERLAY="board/pine64/star64/overlay/"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/pine64/star64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pine64/star64/genimage.cfg"
 BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,Star64_linux,1456c984f15e21e28fb8a9ce96d0ca10e61a71c4)/linux-1456c984f15e21e28fb8a9ce96d0ca10e61a71c4.tar.gz"
-BR2_LINUX_KERNEL_DEFCONFIG="pine64_star64"
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.57"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="starfive/jh7110-pine64-star64"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
@@ -17,15 +18,18 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="100M"
 BR2_TARGET_OPENSBI=y
 BR2_TARGET_OPENSBI_PLAT="generic"
-BR2_TARGET_OPENSBI_UBOOT_PAYLOAD=y
+# BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,Fishwaldo,u-boot,172b47f62039605d6806fa96bd403c21cda28996)/u-boot-172b47f62039605d6806fa96bd403c21cda28996.tar.gz"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="pine64_star64"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_visionfive2"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
+BR2_TARGET_UBOOT_NEEDS_OPENSBI=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_ITB=y
 BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin.normal.out"
 BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_STARFIVE_SPLTOOL=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.51.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
