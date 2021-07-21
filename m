Return-Path: <SRS0=q2PD=MN=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DCB4C12002
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 13:34:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DD0060FEA
	for <buildroot@archiver.kernel.org>; Wed, 21 Jul 2021 13:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DD0060FEA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=trabucayre.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot-bounces@busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5651340190;
	Wed, 21 Jul 2021 13:34:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jAC1Fn6PB1DZ; Wed, 21 Jul 2021 13:34:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 083D5401AF;
	Wed, 21 Jul 2021 13:34:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 24CBD1BF3BC
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 13:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13AA6401AF
 for <buildroot@lists.busybox.net>; Wed, 21 Jul 2021 13:34:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mG8aNTG0kI_U for <buildroot@lists.busybox.net>;
 Wed, 21 Jul 2021 13:34:30 +0000 (UTC)
X-Greylist: delayed 00:06:08 by SQLgrey-1.8.0
Received: from mail (kmf.trabucayre.com [91.121.117.161])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3907740190
 for <buildroot@buildroot.org>; Wed, 21 Jul 2021 13:34:29 +0000 (UTC)
Received: from localhost.localdomain (localhost [127.0.0.1])
 by mail (Postfix) with ESMTP id 4376B39856;
 Wed, 21 Jul 2021 14:59:10 +0200 (CEST)
From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
To: buildroot@buildroot.org
Date: Wed, 21 Jul 2021 14:59:08 +0200
Message-Id: <1626872348-69423-1-git-send-email-gwenj@trabucayre.com>
X-Mailer: git-send-email 1.6.4.2
Subject: [Buildroot] [PATCH v3] board: Add support for terasic DE10 Nano
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4932124939895451527=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============4932124939895451527==
Content-Type: text/plain

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Terasic DE10 Nano is an SoCFPGA cycloneV based board.
References:
- https://www.terasic.com.tw/cgi-bin/page/archive.pl?Language=English&CategoryNo=205&No=1046
- https://rocketboards.org/foswiki/Documentation/DE10NanoDevelopmentBoard

Note: there is no dts in kernel (mainline or intel), but since DE0 Nano Soc is
similar, the corresponding dts is usually used

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
Changes v2 -> v3:
- use barebox default version: v2021.07.0 is now released with DE10 Nano support
Changes v1 -> v2:
- add defconfig and board path in DEVELOPERS
---
 DEVELOPERS                                    |  2 +
 .../de10nano_cyclone5/barebox-env/boot/mmc    |  8 +++
 .../barebox-env/init/automount                |  5 ++
 .../barebox-env/nv/boot.default               |  1 +
 .../barebox-env/nv/linux.bootargs.console     |  1 +
 board/terasic/de10nano_cyclone5/genimage.cfg  | 57 +++++++++++++++++++
 board/terasic/de10nano_cyclone5/readme.txt    | 42 ++++++++++++++
 configs/terasic_de10nano_cyclone5_defconfig   | 28 +++++++++
 8 files changed, 144 insertions(+)
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/boot/mmc
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/init/automount
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/nv/boot.default
 create mode 100644 board/terasic/de10nano_cyclone5/barebox-env/nv/linux.bootargs.console
 create mode 100644 board/terasic/de10nano_cyclone5/genimage.cfg
 create mode 100644 board/terasic/de10nano_cyclone5/readme.txt
 create mode 100644 configs/terasic_de10nano_cyclone5_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index e77ceb2a95..a9f4fe1986 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1105,6 +1105,8 @@ F:	configs/arm_juno_defconfig
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
index 0000000000..3261c62741
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/genimage.cfg
@@ -0,0 +1,57 @@
+image boot.vfat {
+	vfat {
+		file zImage {
+            image = "zImage"
+        }
+
+        file socfpga_cyclone5_de0_nano_soc.dtb {
+            image = "socfpga_cyclone5_de0_nano_soc.dtb"
+        }
+
+        file barebox.bin {
+            image = "barebox-socfpga-de10_nano.img"
+        }
+
+        file barebox.env {
+            image = "barebox-env"
+        }
+	}
+	size = 8M
+}
+
+image boot.img {
+	hdimage {
+		partition-table = "no"
+	}
+
+	partition spl {
+		in-partition-table = "no"
+		image = "barebox-socfpga-de10_nano-xload.img"
+		offset = 0
+		size = 64k
+	}
+
+	size = 1M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition spl {
+		partition-type = 0xa2
+		image = "boot.img"
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
+		size = 500M
+	}
+}
diff --git a/board/terasic/de10nano_cyclone5/readme.txt b/board/terasic/de10nano_cyclone5/readme.txt
new file mode 100644
index 0000000000..c5aafef320
--- /dev/null
+++ b/board/terasic/de10nano_cyclone5/readme.txt
@@ -0,0 +1,42 @@
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
+├── boot.img
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
index 0000000000..4a356f31a8
--- /dev/null
+++ b/configs/terasic_de10nano_cyclone5_defconfig
@@ -0,0 +1,28 @@
+BR2_arm=y
+BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_NEON=y
+BR2_KERNEL_HEADERS_5_11=y
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
+BR2_TARGET_BAREBOX=y
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
-- 
2.31.1


--===============4932124939895451527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============4932124939895451527==--
