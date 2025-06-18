Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDE27C7115D
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FBAD409D7;
	Wed, 18 Jun 2025 18:26:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s97QY3Gyh0BL; Wed, 18 Jun 2025 18:26:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0646406F8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0646406F8;
	Wed, 18 Jun 2025 18:26:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B060F151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9712381131
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5ddWP2_2DmCG for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.147;
 helo=fout-a4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EC60281128
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC60281128
Received: from fout-a4-smtp.messagingengine.com
 (fout-a4-smtp.messagingengine.com [103.168.172.147])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC60281128
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfout.phl.internal (Postfix) with ESMTP id 96309138044A;
 Wed, 18 Jun 2025 14:20:54 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 14:20:54 -0400
X-ME-Sender: <xms:hgNTaOpYJOGoeXucAVPBdXVHOaYcy6PujSIlGlJiRiHAEVUnMCv1yA>
 <xme:hgNTaMozCrBdem58rAEi1RxQ95Y3ZpfnZHFlg47Xdec1LiS_r1awBz9QN7cNQpl7i
 ujpPfjgCLLDCf8c2Zg>
X-ME-Received: <xmr:hgNTaDPhdwARlxNsN_TLcBsHZzMbG7O_8K0xWya8OxdFaoTymv1YaafQV0O_5RDt0S2Y35Cg7m-XHJ9jQfH13DtMI0lbHXCWYnnxWCUf2TFFS6z-j7uZWym4nhPfLk_ZilOy335HoN879TU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehh
 ihesshgvnhiiihhllhgrrdhiohdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhessh
 hmihhlvgdrfhhr
X-ME-Proxy: <xmx:hgNTaN4gRgEupzRN8PqehxKIXXlQW-YpsGMpE5A5cLvC12xvVVFg2g>
 <xmx:hgNTaN42T5kkruHmLGpwO1mMbQXncuBlKo9rsI1ZZkuM7eoKyqB75A>
 <xmx:hgNTaNhslAu--zR7sPMCUwyiz0AxAJhMHUyBHJJfRvoa7YRa6W3eVg>
 <xmx:hgNTaH75uWEarMH93QrEp-6AEP_KyK31Ig67dlMi13rvIk_WDnFAwg>
 <xmx:hgNTaAJPOXAXd_31njOTCyMkD_BR2VVHB0Sd2P8-p2hObp5T-Y5Whzia>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:53 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:33 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-8-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2907;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=x51uRgFoqvQanbaEFJ6NAD0sdDJvFXuAFzyUcja2Fp0=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5sp5k+5s5fXo/uuXpvrB/76U4ZWV8X45sSKcylvE5
 /LdiKrvKGVhEONgkBVTZAkRUOrb0HhxwfUHWX9g5rAygQxh4OIUgIlozGP4w1Hk9ZTn34P9M9VT
 onxUDfTdAs+35Vx0vff95CaRr8XCBowMV/OSWM/u3hn/6i37RMnScxN3X5zwg1P5ou0UkeqK9vf
 /2QA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270854;
 x=1750357254; bh=59/q74N+YjSZwKjnfKHG72HhzCoJLblTY3rAy8mgYCI=; b=
 FRQjB5a8GppeNaedTYNlLID6IQ9E9QTG7YwfW0l502xSqIYZE0xE2cI7rJRI7hwB
 /VZDKFMXLsayq6BmhvWWU+SvE/Q4hpjxAX8wwf+G4G8sOsYVaC4hHwHhz81KgGuz
 8V600JYnivXesmPGW227WUPR0cnvpFgysAGISClCcIzdih4MyHi63pBEuErUrVYF
 yMl2AQWaA/6W9ZzeojS9l/M2zOIlg5P8ThXicTju3QoVzfyokYESREB+F+tNq1Pt
 4bmwrqD4+Y76D976iRoxJtLV3iEI1iw2TfyiFtq0nRsU1i1IhQCRKa1dOktLbAWl
 CjUEzbi3V+EgTlUe06xOWw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270854; x=
 1750357254; bh=59/q74N+YjSZwKjnfKHG72HhzCoJLblTY3rAy8mgYCI=; b=d
 balBBbgwKe+7GNxDbp45rjdjquneqrhlxAG9MOEiLJwKvAmoKe44GFHsnr7qL7hi
 iifF1QdsOJihiQnA3GkFcEPT9O7LmfxdJp5lIpeoJHE046m8yoZWwh9TMiwhD/v8
 75bT0Yuff969v0ppdyQHCJvROoVVY/fUY3cBBmGhSnFI+9Cdm4OHnl2Ux5Bk7Tte
 LjThPs4B8L7kyh+z1UKV8ZfIwLQiJQwSZv9V9o1PdccPKd9yF0HZzkpgSeKQZEEd
 ao+ajKS41C2oXsIsY1MCKTcpbGcfXe0ncITjdiy74sqAn25K2LWEm1jBLbVqH144
 pImedoDGwwOb2OY9/oD3g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=FRQjB5a8; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=dbalBBbg
Subject: [Buildroot] [PATCH v3 08/11] boot/edk2: Add LoongArch64 OVMF support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

LoongArch64 OVMF target is introduced to EDK2 in edk2-202408.

Enable architecture support here.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 boot/edk2/Config.in | 14 +++++++++++++-
 boot/edk2/edk2.mk   |  6 ++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
index 4e6e7d122cb550cbf57ce8fde31779e2d2cbc9a9..734826a8be722c1c45ab157b43fee60ebb4a30a0 100644
--- a/boot/edk2/Config.in
+++ b/boot/edk2/Config.in
@@ -2,6 +2,7 @@ config BR2_TARGET_EDK2_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_RISCV_64
 	default y if BR2_x86_64
 
@@ -21,6 +22,8 @@ if BR2_TARGET_EDK2
 choice
 	prompt "Platform"
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_I386 if BR2_i386
+	default BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64 if \
+		BR2_loongarch64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV if BR2_RISCV_64
 	default BR2_TARGET_EDK2_PLATFORM_OVMF_X64 if BR2_x86_64
 	default BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU if BR2_aarch64
@@ -31,7 +34,15 @@ config BR2_TARGET_EDK2_PLATFORM_OVMF_I386
 	help
 	  Platform configuration for a generic i386 target.
 	  This platform will boot from flash address 0x0.
-	  It should therefore be used as the first bootloader.
+
+config BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
+	bool "LoongArch64"
+	depends on BR2_loongarch64
+	help
+	  Platform configuration for LoongArch QEMU targeting the
+	  Virt machine. This platform will only boot from flash
+	  address 0x1c000000. It should therefore be used as the first
+	  bootloader.
 
 config BR2_TARGET_EDK2_PLATFORM_OVMF_RISCV
 	bool "RISC-V"
@@ -139,6 +150,7 @@ config BR2_TARGET_EDK2_FD_NAME
 	default "OVMF" if BR2_TARGET_EDK2_PLATFORM_OVMF_X64
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU
 	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU_KERNEL
+	default "QEMU_EFI" if BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64
 	default "BL33_AP_UEFI" if BR2_TARGET_EDK2_PLATFORM_ARM_SGI575
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_ARM_VEXPRESS_FVP_AARCH64
 	default "FVP_AARCH64_EFI" if BR2_TARGET_EDK2_PLATFORM_SOCIONEXT_DEVELOPERBOX
diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
index bc4049b2def3e75a1e95ba85696de77d58335a3e..4540a9bdea88e682dedd02ab43937127e3e464e7 100644
--- a/boot/edk2/edk2.mk
+++ b/boot/edk2/edk2.mk
@@ -142,6 +142,12 @@ EDK2_PACKAGE_NAME = OvmfPkg/RiscVVirt
 EDK2_PLATFORM_NAME = RiscVVirtQemu
 EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
 
+else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_LOONGARCH64),y)
+EDK2_ARCH = LOONGARCH64
+EDK2_PACKAGE_NAME = OvmfPkg/LoongArchVirt
+EDK2_PLATFORM_NAME = LoongArchVirtQemu
+EDK2_BUILD_DIR = $(EDK2_PLATFORM_NAME)
+
 endif
 
 EDK2_BASETOOLS_OPTS = \

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
