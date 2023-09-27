Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E44E82CA1
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 14:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D03424197C;
	Wed, 27 Sep 2023 14:42:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D03424197C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdvzXhax1OsM; Wed, 27 Sep 2023 14:42:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CC4F7405D6;
	Wed, 27 Sep 2023 14:42:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CC4F7405D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C936D1BF83E
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 14:42:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A268783498
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 14:42:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A268783498
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZYsyWH_la4Fu for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 14:42:43 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D771A83449
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 14:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D771A83449
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-4053c6f0db8so106063145e9.3
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 07:42:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695825760; x=1696430560;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ukcr3Kjrhy4lY6uM6Dw2DExsg3GPiRjFMWu2304Eo8o=;
 b=Xbho7piiQ0KTOC+fUs4UsVrzpP9NUcW1YRO5j8KcUgklxIVdhMTYdD7rN3NsHej3PZ
 TxzPG0g/FMzg2SxVykhvKv+cEKdS3J0W2w66Q24squ6lSsrSzcgZwGjcajOZW/ttlAKe
 jzVU8/+toPAKYkMGceU4kWtXV13PeJuHGIBgtp3gg3AEISTyXRvkllTX+pBv5uwXswmo
 5wm4mymoJJRfjgrsQJCxCTCOvaXxmJPXQoBCY0z8A4fQMrLL2wKoOhpYloookOOK/Oex
 nE+E6l7xmAzwRWmTSpDcgM7kLztC+bwPOYq7p9TIHrSPkTzrS/eCjZzbwY5FvxVVWsOI
 SIdA==
X-Gm-Message-State: AOJu0YxRUiZdDlW50uUqNuZa037AkUPICxfAptDpJ2H9AXCwJWhdiPFB
 3WyyTCdYqgQ3pqqh4nmtuHiCEdW3B4la+NX/RvA=
X-Google-Smtp-Source: AGHT+IE7/gpaaKnNfHWye3BybtKcpVx8nwiEzRdRDpv81s9D4HT9V/Vc7Wu7Wxd5bWY1xoAEoPQOIg==
X-Received: by 2002:a1c:4c15:0:b0:405:5ffd:21d2 with SMTP id
 z21-20020a1c4c15000000b004055ffd21d2mr2425605wmf.19.1695825760383; 
 Wed, 27 Sep 2023 07:42:40 -0700 (PDT)
Received: from P-NTS-Evian.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 b12-20020a5d634c000000b0031ad2f9269dsm17251847wrw.40.2023.09.27.07.42.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 07:42:40 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 16:42:37 +0200
Message-ID: <20230927144237.66777-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1695825760; x=1696430560;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ukcr3Kjrhy4lY6uM6Dw2DExsg3GPiRjFMWu2304Eo8o=;
 b=IM78TK4Id6x7GSe32UPBJGS6zKR4kLxuKrn1n8VPZQa7mwTjbJZ/94ZG4hH4L9aTNc
 Md73oMQfwSz9vUmXNW5TkMSMj4yqBW1STqh9B252YekygHRfQzIatLYeOP3U5QFmeB7q
 3jwIBmnvld5HVOCQkXG+jy+Jn8NhBuXStx2oNRg4cmlBO/0FeG3frO/kaQV1CX5oecTO
 0M+q6/N09Gs3YWtKqliht9ADi7PYH49Kde416/kNJdwTLiyJPDb2jmaUpdrSdc5+0WF5
 rNQ7nUMAzLI5iLN0OIjzns9egXHughJN3An7btw4zEulr4gdreSDEdLjyXnVxMzf/4zI
 pmtg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com
 header.i=@smile-fr.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=IM78TK4I
Subject: [Buildroot] [PATCH] configs/freescale_imx8mpevk_defconfig: bump to
 version lf-6.1.22-2.0.0
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

Update the linux-imx kernel to be aligned with the NXP BSP
LF6.1.22_2.0.0 (same release used in meta-freescale [1]).

Add BR2_TARGET_UBOOT_NEEDS_GNUTLS=y and BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
since they are new dependencies for building mkeficapsule u-boot tool.

The uboot-imx doesn't use the default imx8mp-evk devicetree anymore due
to commit [2]:

"Change to use imx8mp-evk-revb4.dtb and imx8mp-ddr4-evk-revb4.dtb
 as default kernel DTB for iMX8MP re-design EVK board. Old EVK
 board is EOL, to boot old EVK, user can switch to old DTB manually."

Since the freescale_imx8mpevk_defconfig only install imx8mp-evk.dtb in
the final image, the boot stop with:

  Booting from mmc ...
  Failed to load 'imx8mp-evk-revb4.dtb'
  WARN: Cannot load the DT

Add a u-boot defconfig fragment to revert this change [2] and use the
imx8mp-evk.dtb by default.

Runtime tested on i.MX 8M Plus EVK REV B2.

[1] https://github.com/Freescale/meta-freescale/commit/e6b1b6725cd1d44550ba473ff6a80c1b80663965
[2] https://github.com/nxp-imx/uboot-imx/commit/a60e787a6e35b9c14c391e03d41468e4ad63d598

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 board/freescale/imx8mpevk/uboot-fragment.config |  3 +++
 configs/freescale_imx8mpevk_defconfig           | 11 +++++++----
 2 files changed, 10 insertions(+), 4 deletions(-)
 create mode 100644 board/freescale/imx8mpevk/uboot-fragment.config

diff --git a/board/freescale/imx8mpevk/uboot-fragment.config b/board/freescale/imx8mpevk/uboot-fragment.config
new file mode 100644
index 0000000000..b4683be9ef
--- /dev/null
+++ b/board/freescale/imx8mpevk/uboot-fragment.config
@@ -0,0 +1,3 @@
+# Use the upstream devicetree name for EVK board
+# Revert https://github.com/nxp-imx/uboot-imx/commit/a60e787a6e35b9c14c391e03d41468e4ad63d598
+CONFIG_DEFAULT_FDT_FILE="imx8mp-evk.dtb"
diff --git a/configs/freescale_imx8mpevk_defconfig b/configs/freescale_imx8mpevk_defconfig
index 5a72406b67..82ed68c5a9 100644
--- a/configs/freescale_imx8mpevk_defconfig
+++ b/configs/freescale_imx8mpevk_defconfig
@@ -1,12 +1,12 @@
 BR2_aarch64=y
 BR2_ARM_FPU_VFPV3=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/imx8-bootloader-prepare.sh board/freescale/common/imx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="${UBOOT_DIR}/arch/arm/dts/imx8mp-evk.dtb"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-5.10.y-1.0.0)/linux-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,linux-imx,lf-6.1.22-2.0.0)/linux-imx-lf-6.1.22-2.0.0.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v8"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mp-evk"
@@ -19,15 +19,18 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL=y
-BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-5.10.y-1.0.0)/imx-atf-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,imx-atf,lf-6.1.22-2.0.0)/imx-atf-lf-6.1.22-2.0.0.tar.gz"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="imx8mp"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-5.10.y-1.0.0)/uboot-imx-lf-5.10.y-1.0.0.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,nxp-imx,uboot-imx,lf-6.1.22-2.0.0)/uboot-imx-lf-6.1.22-2.0.0.tar.gz"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx8mp_evk"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/freescale/imx8mpevk/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-nodtb.bin"
 BR2_TARGET_UBOOT_SPL=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
