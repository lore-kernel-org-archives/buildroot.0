Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA536C7115B
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87FCC8112C;
	Wed, 18 Jun 2025 18:26:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 31aL0Lb3ABqr; Wed, 18 Jun 2025 18:26:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A60B281136
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A60B281136;
	Wed, 18 Jun 2025 18:26:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6FA96E2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 52BC160B39
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q6sdc7j_7WEp for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
X-Greylist: delayed 324 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Jun 2025 18:26:09 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B47B560B30
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B47B560B30
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B47B560B30
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfhigh.phl.internal (Postfix) with ESMTP id D4E9211401D8;
 Wed, 18 Jun 2025 14:20:50 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Wed, 18 Jun 2025 14:20:50 -0400
X-ME-Sender: <xms:ggNTaKKkcEIM5vezJ9RzBPA8ATt3P0MPZ40Of-dSyNz2ZBaodulnew>
 <xme:ggNTaCLBLQdqlHflW47wwN_rGBnTvJO_AMW9UxeIR68zdnwlWw04Z55i-r1hpIjeM
 Zh7eY2NsqAN7Aa0nkg>
X-ME-Received: <xmr:ggNTaKsfuKhTUbOCs7lnDDC_Y1AM1yLcZgbhiChMaLemECyUYmXnn-2jdMwGuHZApdY9Dzcn0QBZCeQdQIvJaimZFJqVBBpnVjXsHz0JzwSs_nfk-4YkuOa6LdC1YCTXaV9dVHkkfZD938M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeehucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ggNTaPaJYANbz8TFPLiLdGfo9ykwGAy2AO3B4zrUZ7nkqkztCWJAGQ>
 <xmx:ggNTaBaGGev030oCGFYEmZ5N_eE8a2lKY1mgplK74f2Lm2-f4lLfFA>
 <xmx:ggNTaLB3hDkQlN3_9LtNf2nLWxz2AIDQjUwBthPuokJvXTbRXUeOjw>
 <xmx:ggNTaHanzOmQmGbgZDOFXq1wHgjxpDrx25HgaP_gDRMfiX5Do3eakw>
 <xmx:ggNTaExghTEWhOKLTEqylERsPYb2sGauhmYiCwNN-yeR5lro7sW80c_p>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:49 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:30 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-5-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2010;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=Zhskbp8WzjrUNiv7ob6ahXUyH8rjBAWVmAYMo1eqq+0=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5orJRbM9RD9+5ZFckLHsUC63qHB1qH7qq4e7Zwueu
 zb3QvbjjlIWBjEOBlkxRZYQAaW+DY0XF1x/kPUHZg4rE8gQBi5OAZhIkhsjw7JvXhHuXk45Lqnv
 /dirVrs12nW7fXm8rVy1c8vtKSL/TjD8TxecdJ/3Q9fJpUumepwOfPVw53qPDwnWUQJKu6aLr3i
 7gRMA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270850;
 x=1750357250; bh=zxC09LGy3ZAe+Ae8RuUCdcKTlpVR36yE1yhM6H9W7Hs=; b=
 3u8VLC7jNsaXNp4olHBUlfOV5oKKveBXoesY+9NeUW748FnXvJMnrrymmqnAclRQ
 9JMgaKrb+pM/mTPN0MlDf6BCkUSAEweuRj/4K1DsWfbW4k2+f3bSefSUHWIUAHN0
 zR1226Rb6hDYf4tfb1ol113ELWMMbTQSkbCA+a5nSzrbIcCJdzKZtCuiC0DGiRUJ
 AeK6nKzH5Z/Wop3f1IhwUf2XT8hgU1MOddWgvz68Qa4jPeQSh20P00SqTwNT8rk6
 +FjrZzU6a2AtUiniW661uvXC2Sl7LpcpFsWfQK/6xShPhIK42fLs5yeNBxT8WtCl
 P8PSN0Sk7vrHISFWzxAvJA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270850; x=
 1750357250; bh=zxC09LGy3ZAe+Ae8RuUCdcKTlpVR36yE1yhM6H9W7Hs=; b=O
 okQann3kcilE3CygGW9mFSMBorZk4ycF84G29OU7QEY3X9rkFz3SegpDFOMpe9KP
 PaRif1rhaKffpZTrkcV9fXtm0TXC5uoIt/wY8cBgrub/T20i9dxQse73YKZVKJGy
 UAXJHD8kty7uLCWXO49p8QQpwEheY5PoC6B+9Pq+3DueOsDrZXw1kftRz6+CBP3j
 MUVKMY04NUiN1X/j2XVe/lphnZMGJ7VdLoaGgAzBAUkrBrrt6H6Z+WE7O7FKzySG
 jFml03hR0XF27yezXLURu6mIxxQHPCx+U4meNVXnAgNUYaVW7k1Tj5mLAtkHKxu0
 pcA+qX2cm4spFRTEhA4ng==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=3u8VLC7j; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=OokQann3
Subject: [Buildroot] [PATCH v3 05/11] linux: Introduce {vmlinux,
 vmlinuz}.efi kernel binary format
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

vmlinux.efi and vmlinuz.efi are standard file names for LoongArch
EFISTUB kernel.

Introduce them to build system.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 linux/Config.in | 8 ++++++++
 linux/linux.mk  | 4 ++++
 2 files changed, 12 insertions(+)

diff --git a/linux/Config.in b/linux/Config.in
index ddd65154464f9949161c04c07a25d5035407e4f1..970cc3b63f1cc95a2f56c6abc30f6ff7571af41b 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -294,6 +294,10 @@ config BR2_LINUX_KERNEL_VMLINUX_BIN
 	bool "vmlinux.bin"
 	depends on BR2_mips || BR2_mipsel || BR2_sh
 
+config BR2_LINUX_KERNEL_VMLINUX_EFI
+	bool "vmlinux.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_VMLINUX
 	bool "vmlinux"
 
@@ -305,6 +309,10 @@ config BR2_LINUX_KERNEL_VMLINUZ_BIN
 	bool "vmlinuz.bin"
 	depends on BR2_mips || BR2_mipsel
 
+config BR2_LINUX_KERNEL_VMLINUZ_EFI
+	bool "vmlinuz.efi"
+	depends on BR2_loongarch64
+
 config BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM
 	bool "custom target"
 	help
diff --git a/linux/linux.mk b/linux/linux.mk
index 16762ac2e63a9510dccc2f626b7515694e113256..0520394931ce7950a750d4f57dab451377886612 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -262,12 +262,16 @@ else ifeq ($(BR2_LINUX_KERNEL_LINUX_BIN),y)
 LINUX_IMAGE_NAME = linux.bin
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_BIN),y)
 LINUX_IMAGE_NAME = vmlinux.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUX_EFI),y)
+LINUX_IMAGE_NAME = vmlinux.efi
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUX),y)
 LINUX_IMAGE_NAME = vmlinux
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ),y)
 LINUX_IMAGE_NAME = vmlinuz
 else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_BIN),y)
 LINUX_IMAGE_NAME = vmlinuz.bin
+else ifeq ($(BR2_LINUX_KERNEL_VMLINUZ_EFI),y)
+LINUX_IMAGE_NAME = vmlinuz.efi
 endif
 # The if-else blocks above are all the image types we know of, and all
 # come from a Kconfig choice, so we know we have LINUX_IMAGE_NAME set

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
