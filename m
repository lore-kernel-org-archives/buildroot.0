Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4D7BC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C7E34099A;
	Sat,  7 Jun 2025 18:21:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F5KRsiTlzYaO; Sat,  7 Jun 2025 18:21:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CF1F40986
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CF1F40986;
	Sat,  7 Jun 2025 18:21:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 096331F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC3C160719
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ow7f8UfILsVG for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.151;
 helo=fout-b8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6E4B606F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6E4B606F1
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6E4B606F1
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:05 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id D6E6311400EA;
 Sat,  7 Jun 2025 14:12:47 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 07 Jun 2025 14:12:48 -0400
X-ME-Sender: <xms:H4FEaJ_5Ji-TcHGV-TjqKMUjVd9SLmKpPS4tKvRnzwBJiQz4V6eYwA>
 <xme:H4FEaNs-Z2ATbfRi5J9gXeOtQRFN_i7iLsYaP_5jbvy4PRbuyjWlBr0benOJ_EqN2
 2pi7JyNl50scdGFNJk>
X-ME-Received: <xmr:H4FEaHDdsqE5oI9XTFQ4PJO4ikBadxTpZYGwdqnCu84c6nRCabhXQvHcKRiqMA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihes
 shgvnhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnih
 essghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihes
 sggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrih
 hnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothes
 sghuihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:H4FEaNdUPhSV5MxXNDFsJ4IHaJMg_L8e95cIfIPV7sv82wH6lU2vEQ>
 <xmx:H4FEaOMNO4M0tNBEPutmF8Mw5jjf3Ql8Wn6VkO7J7DAlhbYvxJiCLw>
 <xmx:H4FEaPl3yRbswX04G8xn_pt16Lb9ojFuCC6tOS1j4dNIdAmUUBlAGA>
 <xmx:H4FEaItcu69139o_A4WoogyFr3LPMoC5jAjCg2iqkxGcCFVoA5OfBQ>
 <xmx:H4FEaD5lxQkh3JkCtvVuOMQrAvUkg6tNz2uddZ3_PnED4FWQ8g-8pxiC>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:46 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:40 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-6-90bc4fda9080@flygoat.com>
References: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
In-Reply-To: <20250607-loongarch-v2-0-90bc4fda9080@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319967;
 x=1749406367; bh=vkIkJ9iYAgKHXZRjPX2+z4gu9Xz2Eb1yTEKfD8W91gk=; b=
 njVZkDqwLT7CFESrj1LHdw0cwk6NrB69AMhKG431qmmmmGGndhdAPHSPmBqi2LvN
 9Aaja0ZucMuazr7TO4PEGVJZLjYR8BocbD7ZKj+hidr5EYIKMZVNl2PPLgN0griL
 oEIOANY5makZPghImtp1q2U7Fs6DSnPvSru/isodoF77qyKzJaopslQWW7nShRmX
 un+DWF8Y8x8XFgIV+XQXBiu+SaZHcVobOdMHJfnmnpXnLDFvIgnkstBT/JNQIo1K
 a9+mEnsueobdZAMnzOOVQ2NEh/pVY/LubCPxoUJCqqlHhgtHd93ExlSZ+vItNhrc
 bZEHERKxwCxKGV12zqRT+g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319967; x=
 1749406367; bh=vkIkJ9iYAgKHXZRjPX2+z4gu9Xz2Eb1yTEKfD8W91gk=; b=j
 KJy+V8fc7GWks9qZd9TEMgRHw7GD5u+PBmadraWV8RY5mae/K+6navZFw2SpT+Tf
 EgEehaTn9MpJP/a0P52j01NyfAesf3QUKU9/NoycLX2Qf9PZktrT+toO+QcOKnVg
 n4OOs2Bs6nN3x+3YY8wJ6kGNVbqNLi8haEn6HaBfPtZOlpqOZwGc/PUzjRazZcmM
 /8W0k72tmGz7tmxOAn+YZGeRLM/rNRqHFlKV+mopg55MchUk5VIJMDk2jwdKT6VC
 1TxqczRWHU36oI08vn4BxJmW0ezZzuuCGWy+AKi86uvv67lGsZNASrfeA3noZvUt
 69oXLLnyP1iDVGtheATyg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=njVZkDqw; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=jKJy+V8f
Subject: [Buildroot] [PATCH v2 6/9] boot/grub2: Introduce loongarch64-efi
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
