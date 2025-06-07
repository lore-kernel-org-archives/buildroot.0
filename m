Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E558AC61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B680D40B81;
	Sat,  7 Jun 2025 18:21:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8jQ2ssWk2F-C; Sat,  7 Jun 2025 18:21:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D54240B4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D54240B4F;
	Sat,  7 Jun 2025 18:21:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DB45C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4EEF140638
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Pz4TL-iyc1DL for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:06 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.151;
 helo=fout-b8-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED90D4063C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED90D4063C
Received: from fout-b8-smtp.messagingengine.com
 (fout-b8-smtp.messagingengine.com [202.12.124.151])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED90D4063C
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:05 +0000 (UTC)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.stl.internal (Postfix) with ESMTP id A068511400D1;
 Sat,  7 Jun 2025 14:12:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Sat, 07 Jun 2025 14:12:41 -0400
X-ME-Sender: <xms:GYFEaIdPGJ_pk03Z2gJWcy2Zz4xiQhaM5wliaWfCOj6_X6nTS81FrQ>
 <xme:GYFEaKNCNz9q2EidDvZkoRRtton6fXkzYX4fzxrrTlvx1bWTGms6tMI7WoLM3VfWa
 jS_olKNnQGeQUJCUo8>
X-ME-Received: <xmr:GYFEaJgpClDq1mP3jkjv2LF0RStS7rIbnKsKGuSklFXpj7BNZ3vWQ39ZXxwwug>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugdeikeejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepgeeljefgtdekjeefhffhueethfeu
 udeuveeiiedvffejuddttedvteelheegheeinecuffhomhgrihhnpeifihhkihhpvgguih
 grrdhorhhgpdhlohhonhhgshhonhdrtghnnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtg
 homhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
 jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihessh
 gvnhiiihhllhgrrdhiohdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihes
 sghoohhtlhhinhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessg
 gvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtoheprhhomhgrihhn
 rdhnrghouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessg
 huihhlughrohhothdrohhrgh
X-ME-Proxy: <xmx:GYFEaN-xtaJaR-DM-RuMDu59bYDUCuegbeFuNVWAXdA9iJsC2BoXow>
 <xmx:GYFEaEvaAh0EsLegn42l5DkDlkI_CzXcTF7nlJPGteslfGQgBJK_dA>
 <xmx:GYFEaEHwYLKB5zfpOb9ylrJzK_GvtByKzn6oviVw2lPh8du4IA4dww>
 <xmx:GYFEaDNDqld9rlw12n6akOG-4_CP8DLTMwrNAW9I30H8XOFmiyiRtg>
 <xmx:GYFEaOYbcmGE8xmunjckO8x84fkcY026Eg7ZqrqiALJknC3MMygz2V-3>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:40 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:36 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-2-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319961;
 x=1749406361; bh=MoLxxLHNnXEjzRqm7gV0nBmcEnxoqoEROajoszXpLGw=; b=
 XrxaNOqylzhoKErPgr2NXbH1FGKexZW7P2JhFKPhJMqBBQzhbBf2h6HzhlCSC1bC
 8G0aFIuwwAEjgfTM1ZDKrYn5lzQOZ8Mi6bsC6EEMvf3Tx8QQs38RIm/IdiJLQd41
 xUvi4YXGbEvVAvpp6iyfVOv/u1yJN/U79WRxCRrJUTWyM/RyXMeMDEz+ZphppTGL
 3LFtiKDt1SwVKmiRdrZAZE/km0Zra6dGcIwOUqVnDSTmnYIBmAGGi6k+BKVRJfXd
 H/Fg7NzHRAuZbjNnTAHm/pgjVtGZs2UZpuFhviJOOJ5QvU5rVa2IqxkQadXBjaxv
 l/X+hicIIfIuloBC5Yxw5w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319961; x=
 1749406361; bh=MoLxxLHNnXEjzRqm7gV0nBmcEnxoqoEROajoszXpLGw=; b=D
 XMMDWO4+xhCEpruOw2/mPPqBL9mjGBS88ZO5RhZt0Z3cqChXp87zGI0nguQU2f1Z
 DoQQnADTaTrXyT3yJIRD99u1BeiIYUJpWpjyyL8OMCWnMk4TsWAOOdllDecZb+NI
 kWMuwUYWUhQihgglKUQEsbgAd0RR2cXrzcWFZxg/u/JxHLF2b5e3emXx9RvitDSs
 pfl8nwG7yjHFy/S0UExbms40zTOLAYn71aKS1tewEBkqXVKUuk5H2p3Iee3GiD3o
 cLrRmenrGb+KXNDCGGbtuM3m4vr+fxRqj8nHgQiOQSGjtOyCgUzpdQOJjueIZCkc
 2QxXCX11GDyvMvwmyMt9Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=XrxaNOqy; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=DXMMDWO4
Subject: [Buildroot] [PATCH v2 2/9] arch: Introduce LoongArch64
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

Introduce LoongArch64 at architecture level.

Config.in.loongarch is prepared for possible loongarch32
enablement in future.

Internal toolchain is supported, as our minimal binutils
version is already beyond LoongArch minimal version and
GCC option is limited by BR2_ARCH_NEEDS_GCC_AT_LEAST_12.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
v2:
	- Style fixes
	- add commit message about internal toolchain
---
 arch/Config.in           |  13 +++++
 arch/Config.in.loongarch | 129 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 142 insertions(+)

diff --git a/arch/Config.in b/arch/Config.in
index ec720e74e193021ed01749945aed1457ec0789a1..cc8b774a448913a7195f0dc12a1b452b6af80fd1 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -80,6 +80,15 @@ config BR2_i386
 	  Intel i386 architecture compatible microprocessor
 	  http://en.wikipedia.org/wiki/I386
 
+config BR2_loongarch64
+	bool "LoongArch64"
+	select BR2_USE_MMU
+	select BR2_ARCH_IS_64
+	help
+	  LoongArch64 is 64-bit architecture developed by Loongson.
+	  http://www.loongson.cn/
+	  https://en.wikipedia.org/wiki/Loongson
+
 config BR2_m68k
 	bool "m68k"
 	# MMU support is set by the subarchitecture file, arch/Config.in.m68k
@@ -379,6 +388,10 @@ if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_aarch64_be
 source "arch/Config.in.arm"
 endif
 
+if BR2_loongarch64
+source "arch/Config.in.loongarch"
+endif
+
 if BR2_m68k
 source "arch/Config.in.m68k"
 endif
diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
new file mode 100644
index 0000000000000000000000000000000000000000..e53432ab50a150818a0a4b8cceabeeeea505be69
--- /dev/null
+++ b/arch/Config.in.loongarch
@@ -0,0 +1,129 @@
+# LoongArch CPU
+
+choice
+	prompt "Target Architecture Variant"
+	default BR2_loongarch64_generic
+
+config BR2_loongarch64_generic
+	bool "Generic LoongArch 64-bit"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
+	help
+	  Generic LoongArch 64-bit processor.
+
+config BR2_loongarch64_v1_0
+	bool "LoongArch64 ISA version 1.0"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.0 processor.
+
+config BR2_loongarch64_v1_1
+	bool "LoongArch64 ISA version 1.1"
+	depends on BR2_ARCH_IS_64
+	select BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	help
+	  LoongArch64 ISA version 1.1 processor.
+
+endchoice
+
+choice
+	prompt "FPU Type"
+	default BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_FPU_64
+	bool "64"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit and 64-bit operations.
+
+config BR2_LOONGARCH_FPU_32
+	bool "32"
+	help
+	  Allow the use of hardware floating-point instructions for
+	  32-bit operations only.
+
+config BR2_LOONGARCH_FPU_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware floating-point instructions.
+endchoice
+
+choice
+	prompt "SIMD Type"
+	default BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_SIMD_NONE
+	bool "none"
+	help
+	  Prevent the use of hardware SIMD instructions.
+
+config BR2_LOONGARCH_SIMD_LSX
+	bool "LSX"
+	help
+	  Enable generating instructions from the 128-bit LoongArch SIMD
+	  Extension (LSX).
+
+config BR2_LOONGARCH_SIMD_LASX
+	bool "LASX"
+	help
+	  Enable generating instructions from the 256-bit LoongArch
+	  Advanced SIMD Extension (LASX) and the 128-bit LoongArch
+	  SIMD Extension (LSX).
+endchoice
+
+choice
+	prompt "Target ABI"
+	default BR2_LOONGARCH_ABI_LP64D if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_64
+	default BR2_LOONGARCH_ABI_LP64F if BR2_ARCH_IS_64 && BR2_LOONGARCH_FPU_32
+	default BR2_LOONGARCH_ABI_LP64S if BR2_ARCH_IS_64 && BR2_LOONGARCH_SIMD_NONE
+
+config BR2_LOONGARCH_ABI_LP64D
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64
+
+config BR2_LOONGARCH_ABI_LP64F
+	bool "lp64f"
+	depends on BR2_ARCH_IS_64
+	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
+
+config BR2_LOONGARCH_ABI_LP64S
+	bool "lp64d"
+	depends on BR2_ARCH_IS_64
+endchoice
+
+config BR2_ARCH
+	default "loongarch64" if BR2_ARCH_IS_64
+
+config BR2_NORMALIZED_ARCH
+	default "loongarch"
+
+config BR2_ENDIAN
+	default "LITTLE"
+
+config BR2_GCC_TARGET_ARCH
+	default "loongarch64" if BR2_loongarch64_generic
+	default "la64v1.0" if BR2_loongarch64_v1_0
+	default "la64v1.1" if BR2_loongarch64_v1_1
+
+config BR2_GCC_TARGET_FPU
+	default "64" if BR2_LOONGARCH_FPU_64
+	default "32" if BR2_LOONGARCH_FPU_32
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_SIMD
+	default "lasx" if BR2_LOONGARCH_SIMD_LASX
+	default "lsx" if BR2_LOONGARCH_SIMD_LSX
+	default "none" if BR2_LOONGARCH_FPU_NONE
+
+config BR2_GCC_TARGET_ABI
+	default "lp64d" if BR2_LOONGARCH_ABI_LP64D
+	default "lp64f" if BR2_LOONGARCH_ABI_LP64F
+	default "lp64s" if BR2_LOONGARCH_ABI_LP64S
+
+config BR2_READELF_ARCH_NAME
+	default "LoongArch"
+
+# vim: ft=kconfig
+# -*- mode:kconfig; -*-

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
