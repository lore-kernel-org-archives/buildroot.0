Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65224C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:31:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DB1260AF4;
	Wed, 18 Jun 2025 18:31:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hwn_bR06tz6Z; Wed, 18 Jun 2025 18:31:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 568E360AEC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 568E360AEC;
	Wed, 18 Jun 2025 18:31:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5BA48DA1
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C09A81169
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEvi5G0RyG2e for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7FC8F8115E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FC8F8115E
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7FC8F8115E
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3064011401D2;
 Wed, 18 Jun 2025 14:20:52 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Wed, 18 Jun 2025 14:20:52 -0400
X-ME-Sender: <xms:gwNTaH1F_jKXIasjjQ6NdLMAUnjVpMvIPG620iZd2Nblxu58j-ITfA>
 <xme:gwNTaGEA5OXulN185cAg5yg_VX-sI9Dth9r1JgKSW1QLjSFXkHchRIByhwDbU4qEc
 ccwe8WyhcLH1mbj_AU>
X-ME-Received: <xmr:gwNTaH6nNylDUlO72r1eJykbMWtF_yl3xoyldMyAMudipdIS-UK1Kb3KAGlxtCDUoaX76l9VOdocUf5xz9xUjTpOVj_MAnVYrhLNqsOBYprpiMwitkMQA1bLhxBSJQyCkmF99AxmP9Pyamw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehh
 ihesshgvnhiiihhllhgrrdhiohdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhessh
 hmihhlvgdrfhhr
X-ME-Proxy: <xmx:gwNTaM3wOH7mlfH0BeZG9bu7N5G7o2jb-AQY-ifcb_0rGH52bKnEtw>
 <xmx:gwNTaKF51uVzn9LY1-eaVGv39ZllX-ylOeB166N3PYlK8fxxJ6ap1w>
 <xmx:gwNTaN8L68wOmI7TA-ddyUPLYgO5AJP25FP7srjn13GjIRFeNB0mtw>
 <xmx:gwNTaHn57zJblOqW30YZmXZMkj10Wu8UL4rMS4MeLfGWH0oXSnrhSw>
 <xmx:hANTaJNagwn2y2QNqbdDZGbN06jLl82o6D3sBplLt-iXYFoDNSjnUvTP>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:50 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:31 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-6-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2478;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=BklISkkDUv7d6pmzXe7dRIHfyMSHjbb0uj0LhdRurDU=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5sqrC+p4X0zZcSehSu/1UultGwTspA039HEGqnvwz
 W1p+fCyo5SFQYyDQVZMkSVEQKlvQ+PFBdcfZP2BmcPKBDKEgYtTACZyQoXhf6TDtGQdEYMHj/5e
 WuoSt4fNiNVhosTqhKU/Q0+uzO7nN2D4Hy9stSzfRjjO6rSy4T22g3lPf/QveJ/FFzHr31GDO60
 MnAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270852;
 x=1750357252; bh=1u0BeAom9Y8kVlLU+GIsqZwVMy/b0rG4BATSwjm1wBQ=; b=
 e/PZCxoaYVYak2a/CLa8YNhPB2iCcf2LBsWhv/KdiUeJfThG8FVudk32vvxWkX40
 zINSoAUiL6mCvNoK1PdBpQOtxRGfl1LYl9SnOtIHPXOP14IZbQj2ftpnVxLZwALE
 O2WPC0QtkegRI410N/u9f75tMkl11zjSl2DIY/9u1udrTkKE9uQcXDlVh7mk/oUV
 nU4lw2k4Lb2E0oDRXlU1TujJwFDX4XwX9nRZCfawwFdqLOzQ9l5KEUnh2fnjutQ7
 1d8CoFUAdifrr90sVaVh6SVhISboKbhToP3NbqOMEuSIqtBsDWmUbF+i4LQ2m4Ph
 y0gXUOCgeLD+iI2PUz1Qbw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270852; x=
 1750357252; bh=1u0BeAom9Y8kVlLU+GIsqZwVMy/b0rG4BATSwjm1wBQ=; b=p
 m7pXFid336lcNAIQ0pS/rKtKpxNsJgwwQFdpmWBvhkuDW3miB08nfMHWloeux796
 8/BtDRJlbUETcwR5DScPwqvtHK4yE3RHFX/Jh/wcRQ0QnShcCVL7V0EslzXcDHRi
 dVqf7Os7fos9+3TRj/XmWlENNd7hjDeX5ZvFzmqKCTDKKFWEiGiMPuXEvPI43oQV
 EIFGEzHqEvaodbiVE1060Zmmh9uRRFVrt542d7dEcE9qOaeEkvvvdwZTNvAhYSAi
 X/HxrPxDYBM8cTvm7VncLg4pG6IKNAIUAgwKqNwjGqNXkRiOs85nw3ht8sh2Bfuv
 cQN8MerP1xMa1luhr7oiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=e/PZCxoa; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=pm7pXFid
Subject: [Buildroot] [PATCH v3 06/11] boot/grub2: Introduce loongarch64-efi
 target
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

loongarch64-efi target presents in GRUB can be utilised
by any EFI compatible LoongArch64 machine to boot kernel.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 boot/grub2/Config.in | 10 ++++++++++
 boot/grub2/grub2.mk  |  9 +++++++++
 2 files changed, 19 insertions(+)

diff --git a/boot/grub2/Config.in b/boot/grub2/Config.in
index ecee9ef74cdca0847d4ad386a0dc281ced07725b..3a50ec0ad74897cc89793d7c49cd98eb53e74cef 100644
--- a/boot/grub2/Config.in
+++ b/boot/grub2/Config.in
@@ -5,6 +5,7 @@ config BR2_TARGET_GRUB2_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_aarch64
 	default y if BR2_RISCV_64
+	default y if BR2_loongarch64
 	depends on BR2_USE_MMU
 
 menuconfig BR2_TARGET_GRUB2
@@ -112,6 +113,15 @@ config BR2_TARGET_GRUB2_RISCV64_EFI
 	  64bit RISC-V platform and you want to boot Grub 2 as an EFI
 	  application.
 
+config BR2_TARGET_GRUB2_LOONGARCH64_EFI
+	bool "loongarch64-efi"
+	depends on BR2_loongarch64
+	select BR2_TARGET_GRUB2_HAS_EFI_BOOT
+	help
+	  Select this option if the platform you're targetting is a
+	  64bit LoongArch platform and you want to boot Grub 2 as an EFI
+	  application.
+
 if BR2_TARGET_GRUB2_HAS_LEGACY_BOOT
 
 comment "Options for the x86 legacy BIOS or ARM U-Boot support"
diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index 22d609c004834adc09da061ab8839f4aa561a2dd..4562e57a4f2bfa6b6fb086c7ebf8ef4304615e36 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -102,6 +102,15 @@ GRUB2_BUILTIN_CONFIG_riscv64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
 GRUB2_BUILTIN_MODULES_riscv64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
 GRUB2_TUPLES-$(BR2_TARGET_GRUB2_RISCV64_EFI) += riscv64-efi
 
+GRUB2_IMAGE_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/bootloongarch64.efi
+GRUB2_CFG_loongarch64-efi = $(BINARIES_DIR)/efi-part/EFI/BOOT/grub.cfg
+GRUB2_PREFIX_loongarch64-efi = /EFI/BOOT
+GRUB2_TARGET_loongarch64-efi = loongarch64
+GRUB2_PLATFORM_loongarch64-efi = efi
+GRUB2_BUILTIN_CONFIG_loongarch64-efi = $(GRUB2_BUILTIN_CONFIG_EFI)
+GRUB2_BUILTIN_MODULES_loongarch64-efi = $(GRUB2_BUILTIN_MODULES_EFI)
+GRUB2_TUPLES-$(BR2_TARGET_GRUB2_LOONGARCH64_EFI) += loongarch64-efi
+
 # Grub2 is kind of special: it considers CC, LD and so on to be the
 # tools to build the host programs and uses TARGET_CC, TARGET_CFLAGS,
 # TARGET_CPPFLAGS, TARGET_LDFLAGS to build the bootloader itself.

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
