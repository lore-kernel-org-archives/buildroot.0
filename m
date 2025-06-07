Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDDAC61DB2
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB76340AED;
	Sat,  7 Jun 2025 18:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mjt4nJR7tkbI; Sat,  7 Jun 2025 18:21:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 776B840A4D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 776B840A4D;
	Sat,  7 Jun 2025 18:21:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00FF6C8
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB73540741
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xF_7-hnwWzdo for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 026ED40995
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 026ED40995
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 026ED40995
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 2DD4A25400FD;
 Sat,  7 Jun 2025 14:12:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Sat, 07 Jun 2025 14:12:43 -0400
X-ME-Sender: <xms:GoFEaLnsN8NT4T_xmniTpbHHISwjYfQYEGAK4X1EmEkgn6eDGC82Ng>
 <xme:GoFEaO0cAE7vB2hfAYIuhzQs4JHxRLMO6sfMvcbR7WupjincjMQfzZLklHWdEaTV1
 ZZBGy92LOCI-TAqMn0>
X-ME-Received: <xmr:GoFEaBqX5Xc-S7nLZhhnexCcMxSHkk9hL-wJQcGXXZhWWrov5V9zSazOVMSJ6g>
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
X-ME-Proxy: <xmx:GoFEaDkeXm84MLH0fAXaFpyZQzupwmGw6mBfNpQfK3YeOfylXYDroQ>
 <xmx:GoFEaJ3YCYEX7hueCjhPA9GQajzuzXwfrGw3ZhnScrXPBaFF6gz3Tw>
 <xmx:GoFEaCvlcCG8Avj5YQOrkOdRb1xn5dANZfp3BndVzPOAUt1Ze9WP5g>
 <xmx:GoFEaNXGN6sYRNP6SxWPjLimnoEbnA9XATXwUp_lbEV10dV-nUfkDw>
 <xmx:G4FEaIiDNLoaftsX9iz5U_nClz6FtZ9uI5bi68bAz2_DAg5KUhvEiJXJ>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:41 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:37 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-3-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319963;
 x=1749406363; bh=uUsRI0INyF39sP7NdjPMYXUzGkQvxOLGTLTzqzJG9LU=; b=
 DL5/Hbete1iH+rPDkfFbRLQi3QUnVzD3z+gomrIACSUFy2DTpn3WCzIilvUmn1PF
 J9FZXQjKYDOPzunnJjcs6mFLqfjjhAldkYUJ0TeXex3JzTUUisHLckpGV6hvgyvm
 kht+0nZKtAotBsKnraC0/WqjYI9L1NAQGAScD6XMwIty9tEYyAf6wr333Tg4QEJq
 St2y2ex3Z3SXckZHreq2HBjQigUKezU5c5Rmpo4AaEn1kWxnSjtxSFE+ylLmDYf6
 oAtjar7Diz8NbR/0vGK2OaUr1/eqC8bT0ePT12cWU4BCF82/FgRjC9wyTX/8wsGz
 4lo0sV2J8ynsUTbUANYVeg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319963; x=
 1749406363; bh=uUsRI0INyF39sP7NdjPMYXUzGkQvxOLGTLTzqzJG9LU=; b=b
 OXWZ/PsNdxyjwd2alyEYhhvB/3maGaHQjZ84XAA2t0P1R2V7ZU2gSO3MwRIc5b0e
 v4lc9zlP54FAjCbemblxezNbTrICiHodHl9OoAG4ac0f4G8oX/qonsRC/6HjfzFO
 vZDWEMzopYL5pfblqoxNeZixvxtkp64au0swkWU/XYZZxuAfMLQ6Ju4FWAt10exj
 ZXqn3dGyxttKFYCAEv4w4WlcCUsyr0dF6SANt4jNzNlpd9SJ6rYMhzOQ69STQees
 LMx63tr1FfO5qMdtGfdeXB7+iegiglgC8IKR3nYvF36TZ2aWGFaBc9D0AqDER8EY
 7BOYlGc43k67yDfDTHY7A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=DL5/Hbet; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=bOXWZ/Ps
Subject: [Buildroot] [PATCH v2 3/9] package/glibc: Enable LoongArch64 support
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

Glibc introduced LoongArch64 support in 2.36, it requires kernel
5.19 to build.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/glibc/Config.in                 | 2 ++
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/package/glibc/Config.in b/package/glibc/Config.in
index 52752e975e494aabe67b27b601defc504dbba94a..9a4fe6f3db0a1ca4f1ad37f7e1ea709664e254d5 100644
--- a/package/glibc/Config.in
+++ b/package/glibc/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_mips
 	default y if BR2_mipsel
@@ -35,6 +36,7 @@ config BR2_PACKAGE_GLIBC_SUPPORTS
 	# toolchain/toolchain-buildroot/Config.in
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_10 || !BR2_powerpc64le
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19 || !BR2_loongarch64
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_5 || !BR2_MIPS_NAN_2008
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4 || !BR2_RISCV_32
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0 || !BR2_RISCV_64
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0173f40d9768bc279dab7c6a50fe64d7501aa192..0bccdc817cc9f7e15d2285285e8c93cd432288f6 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -48,6 +48,10 @@ comment "glibc needs a toolchain w/ kernel headers >= 3.2"
 	depends on BR2_PACKAGE_GLIBC_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
+comment "glibc on LoongArch64 needs a toolchain w/ headers >= 5.19"
+	depends on BR2_loongarch64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_19
+
 # glibc >= 2.26 require kernel headers >= 3.10 on powerpc64le.
 comment "glibc on powerpc64le needs a toolchain w/ headers >= 3.10"
 	depends on BR2_powerpc64le

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
