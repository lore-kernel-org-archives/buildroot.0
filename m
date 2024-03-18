Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9F89C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99F7340A14;
	Mon, 18 Mar 2024 13:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KYTiE684Eu7B; Mon, 18 Mar 2024 13:33:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED06440A42
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED06440A42;
	Mon, 18 Mar 2024 13:33:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 82E1F1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6F5F281448
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:33:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V8mSlNoZR7c5 for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:33:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::129; helo=mail-lf1-x129.google.com;
 envelope-from=javad.rahimipetroudi@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7D0F181447
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D0F181447
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7D0F181447
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:33:48 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-513e134f73aso1669349e87.2
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 06:33:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710768826; x=1711373626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NfFsH5GO86JprgLrl5ZSQupJY2gyzJvpUPPzzHQOnh4=;
 b=kXX7LRFZxoWLOJFI05XPwqqR2Fn0DMxcF32uJJe4o0Rz0Br8XR1pVoJ7a2zWP98/D0
 COw6m6R+ktscrjtdX9CFGq1NxytLS5jVyVNa6L9aXzIm+Xe3iZ6UJ+27q1C3etBX6EkU
 vTN1SA3a1hotl7msT8utjnNxE67mSpuNLW+ftsvUZWDGO98rdeMCs7adQGvCyQhHAJey
 YM7FDAHyZCTIUv1wQbATEzAv/QaCgzGjDz+RxYajjKp5PlPk/SXHpffWZqw69wKfKamM
 QwuI3qVU303Nov7EVjCgX357FtUyk2aC+/ugBlxGik7BbQ87vfzWYgQn7RLAsCVTFGDy
 NKdA==
X-Gm-Message-State: AOJu0YwQI/z6L79jLVmSvn4+SAOGPMd3Lc6p2yPf6kV78571M9XV+/5H
 dFWHJrszb14sizhh21SgYQFTsZJYctjnZdkoCUSocswzOt/Azt1aNDO9E6pMpYshw1feN+FiaNR
 oiK0=
X-Google-Smtp-Source: AGHT+IH2OfbEQLG0v8d5sv/pMcOtmh0pmLfoWf/zQ9PbN7ZqOPljOTEtT5YxR18MeCMmw9Zp7OnB0Q==
X-Received: by 2002:a19:2d15:0:b0:513:8f53:cab0 with SMTP id
 k21-20020a192d15000000b005138f53cab0mr9110881lfj.27.1710768825873; 
 Mon, 18 Mar 2024 06:33:45 -0700 (PDT)
Received: from mind.. (ip-188-118-3-185.reverse.destiny.be. [188.118.3.185])
 by smtp.gmail.com with ESMTPSA id
 t11-20020adfe44b000000b0033e122a9a91sm9816325wrm.105.2024.03.18.06.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Mar 2024 06:33:45 -0700 (PDT)
X-Google-Original-From: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
To: buildroot@buildroot.org
Date: Mon, 18 Mar 2024 14:33:38 +0100
Message-ID: <20240318133338.1811892-2-javad.rahimipetroudi@mind.be>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be>
References: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=essensium.com; s=google; t=1710768826; x=1711373626; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NfFsH5GO86JprgLrl5ZSQupJY2gyzJvpUPPzzHQOnh4=;
 b=LNrKSoLAIi3omoiX+k7ZNqsQnY7tay3G1eqG5MQ1SHoI2ncfkBnyfTfJkYL7J/SBpE
 +BfUReOjhWnhK03mlidsxxwt6Wlok1cYs2lLgvDCxep/YVpLyzy6HtDOce3dndlbTeV7
 DWcn4Zxi7Y//KZrt1fw+mNPwrk0N2u1V5NzKxkbO4sZgnjwxARW9wfrQ/kL1hcZmARCi
 ITkB8IvgEBk0g3s1ctKMtW7FRzKDWAv3uTICwTOfq7+9tncmGY8uX8mn85RDuZoOH8SF
 /NXUoNPFTrHLjYPSp72MSjgYyKLjzxqEdjUKXt7ftbkcIZjXCm43rXAutbhe3kkm+IjL
 YWjQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=essensium.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=essensium.com header.i=@essensium.com
 header.a=rsa-sha256 header.s=google header.b=LNrKSoLA
Subject: [Buildroot] [PATCH v2 2/2] configs/avenger96: bump Linux version to
 6.6.21LTS
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
From: Javad Rahimipetroudi via buildroot <buildroot@buildroot.org>
Reply-To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This patch upgrades Kernel version to 6.6.21 LTS on avenger96 board.
Beside that, the device tree path also modified to point the device
tree in proper location.
As another change, with the default root append (mmcblk1p4) in
'extlinux.conf' file in the overlay directory of the board,
the rootfs was not possible to be detected. This file also
modified to point to the proper mmc block.

---
Changes v1 -> v2:
  - Remove uboot changes from Linux patch to Uboot (suggested by Peter)
  - Fix the kernel header version for the toolchain.(suggested by Peter)

Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
---
 board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
 configs/avenger96_defconfig                               | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
index 5d506b3dae..7d6d7f8a44 100644
--- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
+++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label stm32mp157c-dk2-buildroot
   kernel /boot/zImage
   devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
-  append root=/dev/mmcblk1p4 rootwait
+  append root=/dev/mmcblk0p4 rootwait
diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
index 0afdaacf8d..67b6d16749 100644
--- a/configs/avenger96_defconfig
+++ b/configs/avenger96_defconfig
@@ -3,7 +3,7 @@ BR2_arm=y
 BR2_cortex_a7=y
 
 # Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # System configuration
 BR2_GLOBAL_PATCH_DIR="board/arrow/avenger96/patches"
@@ -13,10 +13,10 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/stmicroelectronics/common/stm32mp157/post-im
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.21"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32mp157a-dhcor-avenger96"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="st/stm32mp157a-dhcor-avenger96"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
