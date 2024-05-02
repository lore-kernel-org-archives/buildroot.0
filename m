Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7619DC4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 14:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BF0760B07;
	Thu,  2 May 2024 14:18:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvlGVsOuH2h1; Thu,  2 May 2024 14:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7CF5608EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7CF5608EE;
	Thu,  2 May 2024 14:18:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4851BF589
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 14:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B1A1608EE
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 14:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aR1EaQC5QwhW for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 14:18:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7BC1B608B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BC1B608B6
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BC1B608B6
 for <buildroot@buildroot.org>; Thu,  2 May 2024 14:18:14 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-34da35cd01cso2219802f8f.2
 for <buildroot@buildroot.org>; Thu, 02 May 2024 07:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714659493; x=1715264293;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JvHt5B0s0CECcedAdH5xNGSjX5ummyWtuCo2Rx04gBY=;
 b=nE+Ujnb4aCWDWe/i0uwsAkzagXoEjml/Vsc5kdN3IvITh7ToQFzBQFxSm9cVsgZSGm
 Q2wUkMEuBI2dTvCuOeWAb8t9BgxTLW1B3kgvwfapypKM2rjspYQtJaFqJ5o6FTm2ICmQ
 eTDrWPlv2rMoALU2/yYzG/kDFR3z1JDtw3zfsZKMk9jEdYVMcOs3aQgdGisynjC/OzkC
 N/8uEHikbAxP8Ip3pGkqe4Yl4dq7qni6tUPMfneRWJATJtrI6VQBNWiQPKeGX4WHg1Qj
 RIXJxyp0nkLiSEfK/2QoxSu/U4AH51RHapHFy7IandKNYLJT5uygkQoqBLf0MaDnsEFO
 M1SA==
X-Gm-Message-State: AOJu0Ywxf0tAs751MIkKrg+rKrG1vU/A20BqfrBpVfMbU1qHe9tMM7RA
 pjhEQXzo53Yd9ZIDngf6eOcCjJ90srCKEGcHpv5D3p3OLuTyYPYLY1FnH/Cw3keuOcL3yFJsXm7
 M
X-Google-Smtp-Source: AGHT+IHNQtN+j4GDUbIHQS6gdLdh9giOXDgjlecrFnWTZw9l2MPwSLT/bemLHW3GekQFBEWVB4eJkQ==
X-Received: by 2002:a5d:4538:0:b0:34d:a9ff:7ebf with SMTP id
 j24-20020a5d4538000000b0034da9ff7ebfmr4513445wra.22.1714659492485; 
 Thu, 02 May 2024 07:18:12 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 d9-20020adff2c9000000b0034dd56189e8sm1381421wrp.22.2024.05.02.07.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 May 2024 07:18:12 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 16:18:09 +0200
Message-ID: <20240502141809.2292787-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1714659493; x=1715264293;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JvHt5B0s0CECcedAdH5xNGSjX5ummyWtuCo2Rx04gBY=;
 b=KHSUBmwu+kRhJXKoHGjIbj8Fvt+S8EJrj53MYqn2MWMQLjDW7Xm54uGF6w0AfXCSNm
 Cg6AvNI1MN1NuzJxTChZ5ylr1FtqQ650JaeUuC47WXag0/08FOKsYfEU6tmlqDxcVNWF
 19zq47M6Jw8p1lR/gCKrhRtDMzvECJ4oivGyzzb9DF5BByj2QSkfN2erfDo9H99LZsLF
 c6Ajoat7C3PwoRmW6F44EJ8xTF+IeOWhw0Tog3ymYBeVCOpRt6C2CtEz/d/jJ959+WYT
 j3QRt1GU91oWJxFCctu0D0wmdch8hqQ+ooYaFhASyxORFOvMz3UhST1yhjFw3C42yDB8
 JyLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=KHSUBmwu
Subject: [Buildroot] [PATCH] configs/beagleboneai64_defconfig: new defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adds support for BeagleBone AI-64 board by introducing the
beagleboneai64_defconfig file and related support files.

Retrieve BSP settings from meta-ti (may be useful for other TI boards):

- This defconfig requires u-boot binman support added in u-boot since
  2023.10.
  See FOSDEM 2024 talk by TI folks about Binman and how it simplify
  the overall boot-loader build flow [1].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD = "generic"
  meta-ti]$ git grep TFA_BOARD
  meta-ti-bsp/conf/machine/beagleplay.conf:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62axx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am62xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am64xx.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/am65xx.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j7200.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721e.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j721s2.inc:TFA_BOARD = "generic"
  meta-ti-bsp/conf/machine/include/j722s.inc:TFA_BOARD = "lite"
  meta-ti-bsp/conf/machine/include/j784s4.inc:TFA_BOARD = "j784s4"

- Set BR2_TARGET_UBOOT_NEEDS_ATF_BL31 to provide BL31 variable pointing
  to ATF bl31.bin to the U-Boot build process [2].

- Set BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE to OP-TEE as BL32
  secure payload. meta-ti set "SPD=opteed" to build ATF [3].

- Set BR2_TARGET_OPTEE_OS_PLATFORM to "k3-j721e".
  meta-ti uses the OPTEEMACHINE to set optee-os platform [4].
  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

- u-boot is looking at /boot/dtb/ti for devicetree. But Buildroot
  strips the prefixes when installing them into /boot. Set
  BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME to keep "ti" directory used by
  the kernel to organize device tree sources.
  TI's mmc.env [5] uses "dtb" as additional subdirectory, so we need
  to create a symlink to make sure /boot/dtb/ti exist.
  (Yocto uses KERNEL_DTBDEST = "${KERNEL_IMAGEDEST}/dtb").
  Using a symlink avoid to customize too much the u-boot environment.

- At least, provide a custom uEnv.txt to avoid using "Standard boot"
  or "distroboot" [6] to boot.

- Provide a hash file for all custom package version
  (arm-trusted-firmware, linux, ti-k3-r5-loader, uboot) to enable
  BR2_DOWNLOAD_FORCE_CHECK_HASHES.

Note: Texas Instuments SK-TDA4VM [7] uses the same SoC than the
  BeagleBone AI-64, install the k3-j721e-sk.dtb in /boot/dtb/ti to
  support this board from this defconfig.

[1] https://fosdem.org/2024/schedule/event/fosdem-2024-3067-standardizing-the-generation-and-signing-of-boot-images/
[2] https://git.yoctoproject.org/meta-ti/commit/?id=e74b9a1746d4d04757c87c1920a0f743e55ff096
[3] https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc?h=09.02.00.004#n7
[4] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23
[5] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/include/env/ti/mmc.env?ref_type=tags#L18
[6] https://source.denx.de/u-boot/u-boot/-/blob/v2024.04/doc/develop/distro.rst?ref_type=tags
[7] https://www.ti.com/tool/SK-TDA4VM

More information about the board can be found at:
https://www.beagleboard.org/boards/beaglebone-ai-64

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
Add "beagleboneai64" directory to board/beagleboard/ since we could
move all other Beagleboard's boards (beagleboardx15, beaglebone,
beagleboneai and beaglev) to the same subdirectory.
---
 DEVELOPERS                                    |  2 +
 board/beagleboard/beagleboneai64/genimage.cfg | 29 +++++++++++
 .../arm-trusted-firmware.hash                 |  2 +
 .../patches/linux-headers/linux-headers.hash  |  1 +
 .../beagleboneai64/patches/linux/linux.hash   |  2 +
 .../ti-k3-r5-loader/ti-k3-r5-loader.hash      |  1 +
 .../beagleboneai64/patches/uboot/uboot.hash   |  1 +
 .../beagleboard/beagleboneai64/post-build.sh  | 15 ++++++
 board/beagleboard/beagleboneai64/readme.txt   | 39 +++++++++++++++
 board/beagleboard/beagleboneai64/uEnv.txt     |  6 +++
 configs/beagleboneai64_defconfig              | 50 +++++++++++++++++++
 11 files changed, 148 insertions(+)
 create mode 100644 board/beagleboard/beagleboneai64/genimage.cfg
 create mode 100644 board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
 create mode 120000 board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
 create mode 100644 board/beagleboard/beagleboneai64/patches/linux/linux.hash
 create mode 100644 board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
 create mode 100644 board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
 create mode 100755 board/beagleboard/beagleboneai64/post-build.sh
 create mode 100644 board/beagleboard/beagleboneai64/readme.txt
 create mode 100644 board/beagleboard/beagleboneai64/uEnv.txt
 create mode 100644 configs/beagleboneai64_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 5d198567d8..6c38cbdf2d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2681,10 +2681,12 @@ F:	package/irssi/
 F:	package/vnstat/
 
 N:	Romain Naour <romain.naour@gmail.com>
+F:	board/beagleboard/beagleboneai64/
 F:	board/qemu/
 F:	board/ti/am574x-idk/
 F:	configs/qemu_*
 F:	configs/am574x_idk_defconfig
+F:	configs/beagleboneai64_defconfig
 F:	package/alure/
 F:	package/aubio/
 F:	package/bcc/
diff --git a/board/beagleboard/beagleboneai64/genimage.cfg b/board/beagleboard/beagleboneai64/genimage.cfg
new file mode 100644
index 0000000000..be5b5c2e6d
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/genimage.cfg
@@ -0,0 +1,29 @@
+image boot.vfat {
+	vfat {
+		files = {
+			"sysfw.itb",
+			"tiboot3.bin",
+			"tispl.bin",
+			"u-boot.img",
+			"uEnv.txt",
+		}
+	}
+
+	size = 16M
+}
+
+image sdcard.img {
+	hdimage {
+	}
+
+	partition u-boot {
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
diff --git a/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
new file mode 100644
index 0000000000..02714d06a0
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  2e18b881ada9198173238cca80086c787b1fa3f698944bde1743142823fc511c  arm-trusted-firmware-v2.10.tar.gz
diff --git a/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
new file mode 120000
index 0000000000..5808d92afe
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/linux-headers/linux-headers.hash
@@ -0,0 +1 @@
+../linux/linux.hash
\ No newline at end of file
diff --git a/board/beagleboard/beagleboneai64/patches/linux/linux.hash b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
new file mode 100644
index 0000000000..cedae67f33
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/linux/linux.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256  4e43d8c5fba14f7c82597838011648056487b7550fd83276ad534559e8499b1d  linux-6.6.18.tar.xz
diff --git a/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
new file mode 100644
index 0000000000..18d6169143
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/ti-k3-r5-loader/ti-k3-r5-loader.hash
@@ -0,0 +1 @@
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
new file mode 100644
index 0000000000..18d6169143
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/patches/uboot/uboot.hash
@@ -0,0 +1 @@
+sha256  18a853fe39fad7ad03a90cc2d4275aeaed6da69735defac3492b80508843dd4a  u-boot-2024.04.tar.bz2
diff --git a/board/beagleboard/beagleboneai64/post-build.sh b/board/beagleboard/beagleboneai64/post-build.sh
new file mode 100755
index 0000000000..025fb79eff
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/post-build.sh
@@ -0,0 +1,15 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp $BOARD_DIR/uEnv.txt $BINARIES_DIR/uEnv.txt
+
+# u-boot is looking at /boot/dtb/ti for devicetree in the rootfs
+# partition while Buildroot install the kernel and its devicetree
+# in /boot (BR2_LINUX_KERNEL_INSTALL_TARGET enabled).
+# Enabling BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME allows to keep the
+# "ti" subdirectory but "dts" is still missing.
+# Make sure /boot/dtb/ti exist by creating a symlink in
+# ${TARGET_DIR}/boot
+# https://git.yoctoproject.org/meta-ti/tree/meta-ti-bsp/recipes-kernel/linux/ti-kernel.inc?h=09.02.00.004#n13
+# https://source.denx.de/u-boot/u-boot/-/blob/v2024.01/include/env/ti/mmc.env?ref_type=tags#L18
+ln -sfn . ${TARGET_DIR}/boot/dtb
diff --git a/board/beagleboard/beagleboneai64/readme.txt b/board/beagleboard/beagleboneai64/readme.txt
new file mode 100644
index 0000000000..fa4e189c44
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/readme.txt
@@ -0,0 +1,39 @@
+BeagleBoard.org BeagleBone AI-64 Development Board
+
+Description
+===========
+
+This configuration will build a basic image for the BeagleBoard.org
+BeagleBone AI-64. For more details about the board, visit:
+
+https://www.beagleboard.org/boards/beaglebone-ai-64
+
+How to Build
+============
+
+Select the default configuration for the target:
+
+$ make beagleboneai64_defconfig
+
+Optional: modify the configuration:
+
+$ make menuconfig
+
+Build:
+
+$ make
+
+To copy the resultimg output image file to an SD card use dd:
+
+$ dd if=output/images/sdcard.img of=/dev/sdX bs=1M
+
+How to Run
+==========
+
+Insert the SD card into the BeagleBone AI-64 board, and power it up
+through the USB Type-C connector. The system should come up (make sure
+to boot from the SD card not from the eMMC). You can use a USB to
+serial adapter to connect to the connector labeled UART0 (J3) to
+communicate with the board.
+
+https://docs.beagleboard.org/latest/boards/beaglebone/ai-64/02-quick-start.html
diff --git a/board/beagleboard/beagleboneai64/uEnv.txt b/board/beagleboard/beagleboneai64/uEnv.txt
new file mode 100644
index 0000000000..3fbaebf7de
--- /dev/null
+++ b/board/beagleboard/beagleboneai64/uEnv.txt
@@ -0,0 +1,6 @@
+bootpart=1:2
+bootdir=/boot
+devtype=mmc
+boot=mmc
+# define uenvcmd with bootcmd_ti_mmc to avoid booting with "standard boot" or "distroboot"
+uenvcmd=run bootcmd_ti_mmc
diff --git a/configs/beagleboneai64_defconfig b/configs/beagleboneai64_defconfig
new file mode 100644
index 0000000000..5ea99631ca
--- /dev/null
+++ b/configs/beagleboneai64_defconfig
@@ -0,0 +1,50 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai64/patches"
+BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai64/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai64/genimage.cfg"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-j721e-beagleboneai64"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.10"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="generic"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-j721e"
+BR2_TARGET_TI_K3_BOOT_FIRMWARE=y
+BR2_TARGET_TI_K3_R5_LOADER=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION=y
+BR2_TARGET_TI_K3_R5_LOADER_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_TI_K3_R5_LOADER_BOARD_DEFCONFIG="j721e_evm_r5"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="j721e_evm_a72"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
+BR2_TARGET_UBOOT_USE_BINMAN=y
+# BR2_TARGET_UBOOT_FORMAT_BIN is not set
+BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="tispl.bin"
+BR2_TARGET_UBOOT_CUSTOM_MAKEOPTS="TEE=$(BINARIES_DIR)/tee-pager_v2.bin"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
