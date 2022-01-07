Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29F8C433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F4B88128D;
	Fri,  7 Jan 2022 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CpWYiN7SEZMR; Fri,  7 Jan 2022 18:42:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A89EC80F50;
	Fri,  7 Jan 2022 18:42:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 465221BF291
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3499A80F50
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 18:42:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z2gd9asRO7q2 for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 18:42:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com
 [IPv6:2607:f8b0:4864:20::936])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42CF180F44
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 18:42:14 +0000 (UTC)
Received: by mail-ua1-x936.google.com with SMTP id x33so10458157uad.12
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 10:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5RF8RefpxaA6LbHvWLcjx1A9sd/+wLxYMEaIQG7Udo=;
 b=HbIguCrXZyP/Og0inzxwlRXMvGiLkcTYifsOf+RxUD4vuXuhOJdZb3iWVb2EUl4UIn
 /EL9Eclthrpy3Tx/dUjX1tz1mQeXLY7GmtGLNJYYbNgEmxsgi+7gmr9nDcjMZTLpgIr4
 6BcSmn8/hmNeP3j5kS8wc1Rw3wnrZQu+OoO1hxYOVpVN2ZFJMGp/IRRdMVcnI+3CwtT6
 ZR1o3KYV99GAhNq+jKjiFhJJ8Fjk/cZgCvoOrnO53CnWPekODsyL/4i6OSvsX5teJSE2
 Jfe61MCRiYfCa6WmHPYIy5lhOH9o7DUw9Qzy0b0LGaRwda8RbxLofK9BACVV+v6wvONS
 k0Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=t5RF8RefpxaA6LbHvWLcjx1A9sd/+wLxYMEaIQG7Udo=;
 b=tPbC2NdcX4PKMqUirr2F5Exo+410ykONo6lPLUZzGEGiuuMEps8GR6u4FzmsKBOznN
 wLrMIEQrwDUw9PbOzQFBGS+G1JSf6bbSZ5V+5CwDr3yMa21bYCdUS68zlwuNjMPJg9KC
 J+0YN85A3xAUDqJ1Wj666lFiLpNc2h7JWxaBYNEw6sW0pqsyE/5OO1rzY+LDxdROYKX5
 iNXdSrDZCwACgGXfW8blMpIfb1wTuc4xrn7h8nvn1zgx6NGZQYlUv1pQ0EI9WvgaG0F6
 5046Y8RkDNMrfjjHGHaqQIKMemr11FvTQTx9gV65OWo3yaOA2enC8t2uhP55YrPHE/44
 P+iA==
X-Gm-Message-State: AOAM531085p6JTiiLR1lKy4edMT9+PYXDxWb9EJOC1RWqxMD5oJknD6C
 +lqyl4qMsTyJ9ypfHLyIMMqmuC0mcvI=
X-Google-Smtp-Source: ABdhPJx9kwLg5bs5sbIjhnAQujBDDXztP8jtx/Kbhnxvdc2+YanzFHcyUcEJjFCaM2HwvlCbGKVJaw==
X-Received: by 2002:a05:6102:54a8:: with SMTP id
 bk40mr9386701vsb.43.1641580933388; 
 Fri, 07 Jan 2022 10:42:13 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:2bb5:b3f3:9180:c62b])
 by smtp.gmail.com with ESMTPSA id
 d124sm3940906vkb.9.2022.01.07.10.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 10:42:12 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 15:42:05 -0300
Message-Id: <20220107184205.971152-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx8mmevk_defconfig: new defconfig
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

Add support for imx8mmevk_defconfig that allows booting a mainline
kernel.

This defconfig still relies on NXP ATF and U-Boot, but in the long term
the plan is to switch to mainline ATF and U-Boot as well.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 DEVELOPERS                           |  1 +
 board/freescale/imx8mmevk/readme.txt |  6 ++++
 configs/imx8mmevk_defconfig          | 41 ++++++++++++++++++++++++++++
 3 files changed, 48 insertions(+)
 create mode 100644 configs/imx8mmevk_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 37c792816a1d..907600be7211 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -823,6 +823,7 @@ F:	configs/imx6ullevk_defconfig
 F:	configs/imx6ulpico_defconfig
 F:	configs/imx7d-sdb_defconfig
 F:	configs/imx7dpico_defconfig
+F:	configs/imx8mmevk_defconfig
 F:	configs/imx8mqevk_defconfig
 F:	configs/mx25pdk_defconfig
 F:	configs/mx51evk_defconfig
diff --git a/board/freescale/imx8mmevk/readme.txt b/board/freescale/imx8mmevk/readme.txt
index 7b69405d3030..a8e80a48f9ea 100644
--- a/board/freescale/imx8mmevk/readme.txt
+++ b/board/freescale/imx8mmevk/readme.txt
@@ -10,8 +10,14 @@ Build
 
 First, configure Buildroot for the i.MX8MM EVK board:
 
+If you want to use the NXP kernel:
+
   make freescale_imx8mmevk_defconfig
 
+Or if you want to use a mainline kernel:
+
+  make imx8mmevk_defconfig
+
 Build all components:
 
   make
diff --git a/configs/imx8mmevk_defconfig b/configs/imx8mmevk_defconfig
new file mode 100644
index 000000000000..2b692342c559
--- /dev/null
+++ b/configs/imx8mmevk_defconfig
@@ -0,0 +1,41 @@
+BR2_aarch64=y
+BR2_ARM_FPU_VFPV3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mm-evk.dtb"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.13"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mm-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_PACKAGE_FREESCALE_IMX=y
+BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM=y
+BR2_PACKAGE_FIRMWARE_IMX=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_GIT=y
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/imx-atf"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mm"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="lf-5.10.y-1.0.0"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mm_evk"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
+BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_IMX_MKIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
