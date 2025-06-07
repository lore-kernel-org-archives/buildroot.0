Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CDBC5B543
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00E8B40A3F;
	Sat,  7 Jun 2025 18:21:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GA6xzGlEdo9Y; Sat,  7 Jun 2025 18:21:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B2A040986
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B2A040986;
	Sat,  7 Jun 2025 18:21:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DB90D255
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CBD6D4063F
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SrwSiqQhGFoI for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E1C6940638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1C6940638
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1C6940638
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 684322540107;
 Sat,  7 Jun 2025 14:12:46 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sat, 07 Jun 2025 14:12:46 -0400
X-ME-Sender: <xms:HoFEaNWvRNnX62zlADhDbLrU9joTuhm2Q6EpSkhlxEb2NCBUagkXGQ>
 <xme:HoFEaNlXik4ruXtvO3UDEJqnGsEF4FCzmCJSiAFiJ2ZfzkjwpV8b2gwlC6pElHqNb
 jzp_HPMVork0WKdppw>
X-ME-Received: <xmr:HoFEaJa1QN33wrhYTd4He9w1aFYRJh14Xsyb695dwhNk9piWnOJfbyKDp_QQrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgeptdenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihes
 shgvnhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnih
 essghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihes
 sggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrih
 hnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothes
 sghuihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:HoFEaAWB3RY4Tk4MgK2jQIzw8jZEqFInkinEAY_O6ZyjSh4111wKjw>
 <xmx:HoFEaHkxGkEVpISEZTgcO7PILdr4WDQ2S3PX_xOhF0vBT2vnm2wAKw>
 <xmx:HoFEaNdiDEtd2cvVM0syPxa7QXEUBNidjvNwluNYcTe-5ctDx7Cphg>
 <xmx:HoFEaBHR5BfMyvewN5efSogN4s21A72dWVpsqg1pgmYNxgbMW3gLsw>
 <xmx:HoFEaMTFUh6bBCqW0pHB17AWDgdHwrbUtGxU4AAlQ73IrR1mjOXkyg5T>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:45 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:39 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-5-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319966;
 x=1749406366; bh=gY2FE3W+TrCleJVo0+OL977SIO7qkH/xDBqw9g+PmG0=; b=
 Lr1kbU1KZ7gZQVGinGF+FYkGLWULHw/k+SX86YXGljfVwr2gPZm5lanxGiPZIkJi
 wfJqo342dUkS1zOU+u5wF3jXWuEHHiy3t/O/m5mgSbgCeVLK+RLuvGfx3+UGFn4F
 Kv08fkkB5v2VqLC4mn+6J8sf2YBWOdBgyUZk+KFAMYBa93kznUFD9XiznJwfHl29
 nOaFT/F2UcWl0yhjB8xoyKcrExRmnNYWgJySM17qZr69kr0bbDW9sl68TrGJHyD3
 0WO3Vpa7JR7kPmNrHzoKrwc6kgrAGJkQSgQeXjxDbe5jpfa1Y0L+6+oWmPhXYZE+
 P2SsUXnICN1OopEqZ5fNew==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319966; x=
 1749406366; bh=gY2FE3W+TrCleJVo0+OL977SIO7qkH/xDBqw9g+PmG0=; b=q
 QqVJTHOT+2cp2z4n/GPxRbQXj1m0SLB3S4NeemmGzPk36ATXJtK6RvhYK+vxMZg3
 aZyIo2o9Q8KvCsmwQaIRlP6k1awRvypKDd/Wfgfi1OPy0B7qlKHsKs38PEmmJUax
 d3dMgjM7PQZ2iPjMPEtKZiXwREB/TaAgkMwZmaf/nVZSwU3iH0szyHFoMkkxzq4o
 B0NxbMQ+5BWplOFjDlohYSFA06NKnoLgUgm3n62eU9vdjwUyQ2oX8TOObimklhLU
 FrYpM6F2OdoM8uo+3nWcF9lbjZOw0AiNkoU+g+xQgl62zdQPJQQ+vN80E/hHtqB/
 fN8S82FIFVjWa+Lg2I7OA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=Lr1kbU1K; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=qQqVJTHO
Subject: [Buildroot] [PATCH v2 5/9] linux: Introduce {vmlinux,
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
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
