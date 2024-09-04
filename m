Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C11CD4857
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 17:58:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 310DD812EA;
	Wed,  4 Sep 2024 17:58:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X0lGR453C50o; Wed,  4 Sep 2024 17:58:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4026A812EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4026A812EC;
	Wed,  4 Sep 2024 17:58:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0AD1BF473
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:58:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8755640556
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 17:58:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bSABzxAeIxdp for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 17:58:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 930AA4054E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 930AA4054E
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 930AA4054E
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 17:58:30 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id
 41be03b00d2f7-7c3e1081804so3932611a12.3
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 10:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725472709; x=1726077509;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxPpbLiyNfyzlTd78Y3qjdh2ibqMPY9LzLmxXos0qa0=;
 b=AsT+R9NrnEcfTtjNp6NqBziUv6nxrt3KFPAfVnSorlM2jOWuBRpLtI1H81d9se0rjW
 4iIFVFvIb0HUCCy29bEchXuYVxueQqfy5KVGjpzXqRLVcR6eF3oR7KVeYC2CG6CmJWaD
 z3W1MH0ekYyw5V89TpFx4gMhUj9d2EFyU7iV0KULMyKUq6SidcLaewkvYIgEhIFAkguT
 4XW86YRm1Nj5F8N0WbDucxNzr9tB7smL9HQJ3qBPloXWxcmEafAH/+618aW62ceyChK4
 ulLx9fFodN0qXcGNESDq0Ga0wbxku5G55qPrBckMUpC6yGpvV0usj9T3HYeYABj1OSjo
 uBIw==
X-Gm-Message-State: AOJu0Yz6Uv4yRg2Zu5Poz/uYhxIPcSl9dmKY+hX27w77pRcK0RhU8asa
 LTNY16heIzLeHJ6jVxLkOCfwHrt4dsfMWc+uGBBv0XHsq5WhiUhPi0pQAQ==
X-Google-Smtp-Source: AGHT+IHCPNfs6QQP+CT9DTtkNeKURv+Ac3QI6M+6B0gA81ryPbJkzHkqyzTb7+N+bGMq+4Fhqw1MAQ==
X-Received: by 2002:a05:6a20:9f4a:b0:1c3:ea28:3c0e with SMTP id
 adf61e73a8af0-1cce1097c71mr18014356637.33.1725472709189; 
 Wed, 04 Sep 2024 10:58:29 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b37a:332a:2373:a683])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d4fbda7b67sm1878152a12.72.2024.09.04.10.58.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 10:58:28 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 14:58:22 -0300
Message-Id: <20240904175823.2937072-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725472709; x=1726077509; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lxPpbLiyNfyzlTd78Y3qjdh2ibqMPY9LzLmxXos0qa0=;
 b=FhH0zdSxiMX13er6C2/oYndwwMD0vtJkck7p14m5XeR2acgZhtzd6KXw5s2ESm+DC0
 01t0DfU+qhyYf4dNxBVg48Wl5fL4P+CuiL03HaiALr+igZ1asnZ3gECjZ73xX/gClXKt
 b7pGFPZVEwXnDepq4XqImrzo6iV0lA/OytIts7MXozI/vt/lept2KNz9O39jCgOFn2JK
 Vs2E2i6q7o9qnIE+FSirvQYfsUaGePkBEyxV7bGAxhU/8cafZBx3dRhZbBI1UhWsn5qz
 oNAQwfMfvu7h5iSvcAmIZZKcUjkkqkMVSg+cMIAQQC7+Gi6BacpixJahHEN4UVYrPs27
 HuEw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FhH0zdSx
Subject: [Buildroot] [PATCH 1/2] configs/imx6ulpico: update U-Boot and kernel
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

Update to U-Boot 2024.07 and kernel 6.6.48 versions.

The default U-Boot pico-imx6ul_defconfig causes the board to hang in SPL.

Fix it by chaging it to the more specific U-Boot
pico-pi-imx6ul_defconfig. 

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulpico_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index e406d9938bdb..a77eac5c5862 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc5"
@@ -15,10 +15,10 @@ BR2_ROOTFS_OVERLAY="board/technexion/imx6ulpico/rootfs_overlay"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-pico-pi imx6ul-pico-hobbit imx6ul-pico-dwarf"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-pico-pi nxp/imx/imx6ul-pico-hobbit nxp/imx/imx6ul-pico-dwarf"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 
@@ -38,9 +38,9 @@ BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
-BR2_TARGET_UBOOT_BOARDNAME="pico-imx6ul"
+BR2_TARGET_UBOOT_BOARDNAME="pico-pi-imx6ul"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
