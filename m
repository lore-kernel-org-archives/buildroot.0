Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8990C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 20:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C7D260B38;
	Wed, 29 Dec 2021 20:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Kfe3EJPWUus; Wed, 29 Dec 2021 20:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E1AA606F2;
	Wed, 29 Dec 2021 20:40:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 222B31BF331
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 20:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1EF24606F2
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 20:40:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qhz0DK5zUsZD for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 20:40:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 41BF660615
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 20:40:45 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id w27so14811591qkj.7
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 12:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sd6JryqVepLyyQei1jJBZtSDLSQxT4l11de0oAh2WoI=;
 b=pQ2qVW5stxMHWaL6iXRt+Kb9dNtbEECLqjMCyH2LET2Ui3LGMAneqUAyFgC6u/302V
 p25dhx1OJNAffzTXS8n6sExOADHDPOr4IX4CgdTgRiv6cLYE7wpVT3c7YHJHD/sx1EI2
 z4OlJWkbaunk6lZGvSx74D/+rTae90JWgQ61pIG1xfnpVX6jK44BKKwj451F6emcD3ds
 wKFlK+fr9Xwf9MxV19lHdldrXQ0mEYOScDxV+I9SOYqs9G1RX/S/So6qtciz5Gay4f8e
 a/cQKHrzZ1P3m0JWW62HW0i186IITP57yN9V7zOpDsM4Lr+Oec/RcgfKtFrCg9NE4qA6
 aDnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sd6JryqVepLyyQei1jJBZtSDLSQxT4l11de0oAh2WoI=;
 b=okU8OAyFsRs9YiNw1OB1ONl1mvCpRnh9DT5BmDM5Je81mVj/AWvx9HXNyN/nRVXiTp
 o1ZO/ATEkdo9fHbtCqMSYk1stoX/HIYkqSW7KUh0tCuGpoP9OLzk6dR6HX9+M6X2GTFj
 X+8D7wTGn3CG5qXdZVSrcHRamPJdsYlQk7KUGDRsa1PHBoEod2tNS/ByfZkUnt68i5WU
 3BUkTCyYjQkMWi+ny+Nzp+CL+qRfdMRV0JfFRv3vWsA7fluhEEyvGJLF5iO4+lu3EB5R
 79QvMr8Rr3GLea8+Z5lO0fVhkGWfNL1Qg1cKBPGfNKzO3xiue0Dxv++5hrhTqmAePn5r
 PQig==
X-Gm-Message-State: AOAM532H88gL/PhUMSuy4dVjfiAXecEViImV4R4DVUumhHImK1YwKC8S
 vE77oYKL17ip15peyYqd7UckwbWdRi8=
X-Google-Smtp-Source: ABdhPJyllDUFBFs9cCLb2WrVEq2HroQ3u4GquIxAVFtYBo+32PtjBqAnfXtUFgV4XmOx06tY+gftbQ==
X-Received: by 2002:a05:620a:bc7:: with SMTP id
 s7mr20203233qki.334.1640810443734; 
 Wed, 29 Dec 2021 12:40:43 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:c4ce:8129:9976:888d])
 by smtp.gmail.com with ESMTPSA id
 a16sm19037619qta.94.2021.12.29.12.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 12:40:43 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Dec 2021 17:40:36 -0300
Message-Id: <20211229204036.705008-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6ulpico: Bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Current U-Boot is an old version and fails to build:

/usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here

Bump U-Boot to fix the problem.

Latest U-Boot has switched to distro boot and SPL, so make the necessary
changes to support it. Other advantage of bumping U-Boot is that
it also supports the other imx6ul-pico variants.

While at it, also bump U-Boot to the 5.15 LTS.

Fixes:
- https://gitlab.com/buildroot.org/buildroot/-/jobs/1915006192
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 .../rootfs_overlay/boot/extlinux/extlinux.conf   |  4 ++++
 configs/imx6ulpico_defconfig                     | 16 ++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)
 create mode 100644 board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf

diff --git a/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf b/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf
new file mode 100644
index 000000000000..9e6099f33237
--- /dev/null
+++ b/board/technexion/imx6ulpico/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+Label imx6ul-pico-buildroot
+	kernel ../zImage
+	fdtdir ../
+  	append root=PARTUUID=${uuid} rootwait rw console=${console},${baudrate}
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 56ae58875274..e406d9938bdb 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 4.17 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_17=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -15,11 +15,12 @@ BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.17"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-hobbit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-pi imx6ul-pico-hobbit imx6ul-pico-dwarf"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
 # wifi firmware for brcm4339
 BR2_PACKAGE_LINUX_FIRMWARE=y
@@ -35,10 +36,13 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
 # required tools to create the eMMC image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
