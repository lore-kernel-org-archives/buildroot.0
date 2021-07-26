Return-Path: <SRS0=wdlY=MS=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24F3C4338F
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:40:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5C204601FD
	for <buildroot@archiver.kernel.org>; Mon, 26 Jul 2021 21:40:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5C204601FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 219E940343;
	Mon, 26 Jul 2021 21:40:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tR2iI2rqHKlw; Mon, 26 Jul 2021 21:40:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A4D2402FE;
	Mon, 26 Jul 2021 21:40:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6E3741BF2F1
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6AC10402FE
 for <buildroot@lists.busybox.net>; Mon, 26 Jul 2021 21:40:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w42PR81fEyW7 for <buildroot@lists.busybox.net>;
 Mon, 26 Jul 2021 21:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81DE640124
 for <buildroot@buildroot.org>; Mon, 26 Jul 2021 21:40:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AA0BD89004; Mon, 26 Jul 2021 21:05:58 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Jul 2021 23:33:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b65220f56677c0df2646a6d56c9b3e28732dc054
X-Git-Newrev: 8bab9cf65a803287bb49ccd5d2b376ae7cd9c8ac
X-Patchwork-Hint: ignore
Message-Id: <20210726210558.AA0BD89004@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/terasic_de10nano_cyclone5: new
 defconfig
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============6625445843408849966=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============6625445843408849966==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=8bab9cf65a803287bb49ccd5d2b376ae7cd9c8ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Terasic DE10 Nano is an SoCFPGA cycloneV based board.
References:
- https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=1046
- https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard

Note: there is no dts in kernel (mainline or intel), but since DE0 Nano Soc is
similar, the corresponding dts is usually used

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 ++
 .../terasic/de10nano_cyclone5/barebox-env/boot/mmc |  8 +++++
 .../de10nano_cyclone5/barebox-env/init/automount   |  5 +++
 .../de10nano_cyclone5/barebox-env/nv/boot.default  |  1 +
 .../barebox-env/nv/linux.bootargs.console          |  1 +
 board/terasic/de10nano_cyclone5/genimage.cfg       | 42 ++++++++++++++++++++++
 board/terasic/de10nano_cyclone5/readme.txt         | 41 +++++++++++++++++++++
 configs/terasic_de10nano_cyclone5_defconfig        | 31 ++++++++++++++++
 8 files changed, 131 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f722ec9611..48d7ac4876 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1109,6 +1109,8 @@ F:	configs/arm_juno_defconfig
 F:	board/arm/juno/
 
 N:	Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
+F:	board/terasic/de10nano_cyclone5/
+F:	configs/terasic_de10nano_cyclone5_defconfig
 F:	package/gnuradio/
 F:	package/gqrx/
 F:	package/gr-osmosdr/
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
new file mode 100644
index 0000000000..fed2b0b45d
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
@@ -0,0 +1,8 @@
+#!/bin/sh
+
+global.bootm.oftree="/boot/socfpga_cyclone5_de0_nano_soc.dtb"
+global.bootm.image="/boot/zImage"
+
+#bootargs-ip
+
+global.linux.bootargs.dyn.root="root=/dev/mmcblk0p3 rw rootwait"
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/init/automount b/board/terasic/de10nano_cyclone5/barebox-env/init/automount
new file mode 100644
index 0000000000..4092ecbaec
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/init/automount
@@ -0,0 +1,5 @@
+#!/bin/sh
+
+# SD card slot, first partition
+mkdir -p /mnt/mmcblk0p2
+automount -d /mnt/mmcblk0p2 'mount /dev/mmc0.1 /mnt/mmcblk0p2'
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default b/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
new file mode 100644
index 0000000000..61f529d69a
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
@@ -0,0 +1 @@
+mmc
diff --git a/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console b/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
new file mode 100644
index 0000000000..476b1fbe49
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
@@ -0,0 +1 @@
+console=ttyS0,115200
diff --git a/board/terasic/de10nano_cyclone5/genimage.cfg b/board/terasic/de10nano_cyclone5/genimage.cfg
new file mode 100644
index 0000000000..76b1d03649
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/genimage.cfg
@@ -0,0 +1,42 @@
+image boot.vfat {
+	vfat {
+		file zImage {
+			image = "zImage"
+		}
+
+		file socfpga_cyclone5_de0_nano_soc.dtb {
+			image = "socfpga_cyclone5_de0_nano_soc.dtb"
+		}
+
+		file barebox.bin {
+			image = "barebox-socfpga-de10_nano.img"
+		}
+
+		file barebox.env {
+			image = "barebox-env"
+		}
+	}
+	size = 8M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		partition-type = 0xa2
+		image = "barebox-socfpga-de10_nano-xload.img"
+		size = 1M
+	}
+
+	partition boot {
+		partition-type = 0xc
+		bootable = "true"
+		image = "boot.vfat"
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext2"
+	}
+}
diff --git a/board/terasic/de10nano_cyclone5/readme.txt b/board/terasic/de10nano_cyclone5/readme.txt
new file mode 100644
index 0000000000..f9d8fc756a
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/readme.txt
@@ -0,0 +1,41 @@
+Terasic DE10 Nano Development Board
+
+Intro
+=====
+
+More information about this board can be found here:
+https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard
+
+Build
+=====
+
+First, load socrates config for buildroot
+
+    make terasic_de10nano_cyclone5_defconfig
+
+Build everything
+
+    make
+
+Following files will be generated in output/images
+
+.
+├── barebox-env
+├── barebox-socfpga-de10_nano.img
+├── barebox-socfpga-de10_nano-xload.img
+├── boot.vfat
+├── rootfs.ext2
+├── rootfs.ext4 -> rootfs.ext2
+├── rootfs.tar
+├── sdcard.img
+├── socfpga_cyclone5_de0_nano_soc.dtb
+└── zImage
+
+Creating bootable SD card
+=========================
+
+Simply invoke
+
+dd if=output/images/sdcard.img of=/dev/sdX
+
+Where X is your SD card device (not partition)
diff --git a/configs/terasic_de10nano_cyclone5_defconfig b/configs/terasic_de10nano_cyclone5_defconfig
new file mode 100644
index 0000000000..8fb7cf664a
--- /dev/null
+++ b/configs/terasic_de10nano_cyclone5_defconfig
@@ -0,0 +1,31 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_11=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/terasic/de10nano_cyclone5/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/altera-opensource/linux-socfpga.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-5.11_21.06.01_pr"
+BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_de0_nano_soc"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_BAREBOX=y
+BR2_TARGET_BAREBOX_CUSTOM_VERSION=y
+BR2_TARGET_BAREBOX_CUSTOM_VERSION_VALUE="2021.07.0"
+BR2_TARGET_BAREBOX_BOARD_DEFCONFIG="socfpga"
+BR2_TARGET_BAREBOX_IMAGE_FILE="images/barebox-socfpga-de10_nano.img"
+BR2_TARGET_BAREBOX_CUSTOM_ENV=y
+BR2_TARGET_BAREBOX_CUSTOM_ENV_PATH="board/terasic/de10nano_cyclone5/barebox-env"
+BR2_TARGET_BAREBOX_AUX=y
+BR2_TARGET_BAREBOX_AUX_BOARD_DEFCONFIG="socfpga-xload-2"
+BR2_TARGET_BAREBOX_AUX_IMAGE_FILE="images/barebox-socfpga-de10_nano-xload.img"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y

--===============6625445843408849966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============6625445843408849966==--
