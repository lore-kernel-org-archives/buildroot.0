Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C81EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 18:47:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A489581342;
	Mon, 27 Dec 2021 18:47:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r9s70Z0xtDr1; Mon, 27 Dec 2021 18:47:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C188133A;
	Mon, 27 Dec 2021 18:47:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A4C6C1BF3D6
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9401581334
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 18:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bQZA8VoqbS8x for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 18:47:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E2AE181330
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 18:47:01 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id m2so13517588qkd.8
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 10:47:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1O7GDHegRovq/Sn5cqsndHkNbEfAkESJKrZBhqgdWnw=;
 b=hkI2VNetPPfPe+nUvdVWVHlYXkrtO/DIIErN1IOgS8fHMlcn1g0ysSYsSMzr/n7Kiq
 fD17lEQAoHewGidK54yT7l2lGz8zdeK5niE0LDg0OyK2sfiHBqKqaNh9Pe+UWxVLVHBm
 gOLYo4PVeZi56cjJhQ0vdC2VGL0H0O48KQm3p6E+AlDDA+fTe7DSi8b44KZEQIEkj+I/
 YbAmzj2uoPj9XGruIrBx4PMiDeZVV4FKBMEcWIsJWDF53cP9SM/cw6tl6XP3BSiFnbqG
 N4THTHKCO1FkTMrsv/XpSyfSxfiRPm8ozGhJcZ6FuNZwcFeD1Jc3AoYxTIfqRsa5Mhl6
 FqrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1O7GDHegRovq/Sn5cqsndHkNbEfAkESJKrZBhqgdWnw=;
 b=exfdQ5XmvW+vi6qzY6HP+Qu/sXyCDZKOC2CIkIFXNRHrZDi5WlQIZmBX4thP4xEPhm
 7XdCTYMGwaOeGBDK8+59M2S1sMxKnkn7w2oMvJQlq9kQ5FInVJP+FkJiZEvzi8VCECGT
 j1ml98DRBTQaBWdokcbhrWqmMYl+Z2k1qqUShd6CR9HNKmnirB2Ij6b7RgxT7gchxArA
 R1E9Sue/TlT9T/AZbumxnSTjsHceCoBpBgzgG1YS8IjLw4NSOLlgXKyzKAPyKrH5Rj9n
 KKVnrRJvua3A02wLS17CyUsqJaTv4ciZSU176KoUqZh/acIMVDTkZ8DzxDDohQeWXnib
 pLSg==
X-Gm-Message-State: AOAM530hwlhXNepY+jL7g6YzvTXboJpXD88/ZHg/KC/FRFlKHsIEcwk8
 mZGdadtgFf+8M+5dEsSxN590paQpBGc=
X-Google-Smtp-Source: ABdhPJy/KlHtBXT7HFJ8B7aVsUEAL2NG+9IQ/54T6OgiMvmV3WzIX00k+rhMAoi+YFU6HWtBAOwXFg==
X-Received: by 2002:a05:620a:44ce:: with SMTP id
 y14mr12812049qkp.451.1640630820373; 
 Mon, 27 Dec 2021 10:47:00 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:8f6b:751e:ed35:8559])
 by smtp.gmail.com with ESMTPSA id
 u17sm13956189qki.2.2021.12.27.10.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 10:46:59 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:46:53 -0300
Message-Id: <20211227184653.3248009-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] configs/imx6sx-sdb: Bump U-Boot and kernel
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

Bump U-Boot to version 2021.10 and kernel to 5.15.11.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
Changes since v1:
- Fix typo in the U-Boot version.

 configs/imx6sx-sdb_defconfig | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/configs/imx6sx-sdb_defconfig b/configs/imx6sx-sdb_defconfig
index 7ad662aa2ce1..c36520a165dc 100644
--- a/configs/imx6sx-sdb_defconfig
+++ b/configs/imx6sx-sdb_defconfig
@@ -3,19 +3,20 @@ BR2_cortex_a9=y
 BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sxsabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.55"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb imx6sx-sdb-reva"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
