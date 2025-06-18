Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB11C7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 357F460A45;
	Wed, 18 Jun 2025 18:26:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eMDjVO-iBtfy; Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5670560ACF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5670560ACF;
	Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C76DE2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC6A840499
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7UHO7zw8q6mJ for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BFBE5404B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFBE5404B7
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BFBE5404B7
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 2D8A611401B8;
 Wed, 18 Jun 2025 14:20:48 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 18 Jun 2025 14:20:48 -0400
X-ME-Sender: <xms:fwNTaBsML1uLWLW-xuHtDHdXfNAxNUdtqz9EJ3vJ3VVZzTGS5B-11A>
 <xme:fwNTaKeFwvJV88I_-yAi95iTe0pOFgfPWvxh82UFdy7S6pncdbuIqLM7BtF1bk2Wx
 _GUG94wiEhnZs-Ko24>
X-ME-Received: <xmr:fwNTaExKOyASoMx6auLkx74MYDNzidBMn6AkJ1GvoeBbFA4mOBvps3ggBf8CHL4db-zckXWMeljhNxveGxJoQc2i4r9oUPk086dQUiLt5FZ0oCXR6ij5w88ksZgp-SGaZuaIFd1xYQYpIEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepfeehgefhudelhfegtdehhefhvedu
 heeghfdukeegledvkeeuueeihfevgfetlefgnecuffhomhgrihhnpehlohhonhhgshhonh
 drtghnnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhep
 jhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdpnhgspghrtghpthhtohepje
 dpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiiho
 nhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuih
 hlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghi
 lhdrtghomhdprhgtphhtthhopehgihhulhhiohdrsggvnhgvthhtihessggvnhgvthhtih
 gvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpthhtohepjhhirgiguhhnrdihrghnghes
 fhhlhihgohgrthdrtghomhdprhgtphhtthhopehhihesshgvnhiiihhllhgrrdhiohdprh
 gtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhr
X-ME-Proxy: <xmx:fwNTaINW8qhWwugWkDEpYKTO6FcgqCI3V8xkJSzuRM_HiOtFEApAxg>
 <xmx:fwNTaB9M8D9GUphkuz8MH2OSY-VXX6T0bZUcMLNgzI2EYCqAYx7qkA>
 <xmx:fwNTaIXfLq34k0e1zGT8-GTZd2dmNpr2WWFPvAo2cOkUpQVAiQJ84Q>
 <xmx:fwNTaCc7ALE3OXqiW6vFagqnZmGJ3Rwvp6a_1ket8PdHoskTZCMsiQ>
 <xmx:gANTaKm3GxCs26JU0_UyAcnYKv8FJiIRWw3l1KTy--O6avhOJzlWx3bi>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:47 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:28 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-3-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2711;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=jrHqApzuiEGvyutXiWM6C/hsSAZuPHlE5G2Dr8iSbg0=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5op3l3I0VVbU6XYsdFor9VGA84Csp3n/NK4Cz3tf8
 2T251h3lLIwiHEwyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwERc0xgZ3lgkc90/71cYkLzj
 QkjTI/NLKzlNdvFufik7c3vDB9tMbkaGWTd9/e9azOx+U5yixM27g2lTB7+L1yKNywwPK/LuvVr
 KAAA=
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270848;
 x=1750357248; bh=8GPJuc0JuykMiH0kmW8NOuOUSw7+dQ7VQG+D+iYANJ0=; b=
 QqAAlKOK+828g8FYBrmKpCgrpTYehzn6LiLScKHIiQW36gJ0QKbzkMTLnS4aBGrm
 zDKrScgr6ummG0R+3r9NMxm5Kw/MkxIj7mjtW+uv++jIqBj2kgzgTe48RDrtQOgB
 Qx6NaW6xI7JK9qln0YPehaEoV7ed7Nffkm+han9yexE79i53hoA+YnUFDFbvPYt2
 D0C+4AvXyrO+qWqpe9GJxogbAJGMxDdMIDseRCZEwlMo3bUloZkwKwXFnLVl5kQs
 Ccby5HOqKYGi32ncltJVcM9eIGeDr+CHO7kiERD8yvl7V5y6HzOPv7TOlBtSVCia
 3i8O5AVoTx1ItdZYnZHspA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270848; x=
 1750357248; bh=8GPJuc0JuykMiH0kmW8NOuOUSw7+dQ7VQG+D+iYANJ0=; b=A
 l8bDii4txZr4ET2taAcuI5neCV8PZLxCO8nyhtcP/0IPQ8PX7pwUaWmZfQEPofkb
 4SyBfZPFLG8iO5dviYODf2E8V35vwQvNr7uEuMwKgohHNTTqFA1DY6kvMn+8f35T
 e9EZfUoEXJCceq47fg1gkBvvVcTBQD7+GPkAa6rw97StjvmE5gE+c5JeEv/9cZsh
 8Zdymy2hwOVeEDz51XPIbh1orQ05eAdXD8iJjBs/XzrTj5gaJ4j67qZ/tTbjWO0F
 yMJhZ7nSldv/Ff/DrNe1IGPiZnqyYeqZBbkuABMBH5fkPdI/Eddfjebe9bRJA1G0
 2izZIgjoYIWqhX19uL5DQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=QqAAlKOK; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=Al8bDii4
Subject: [Buildroot] [PATCH v3 03/11] package/glibc: Enable LoongArch64
 support
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

Unselect BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT to reflect we can
build the toolchain.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
---
 arch/Config.in                          | 1 -
 package/glibc/Config.in                 | 2 ++
 toolchain/toolchain-buildroot/Config.in | 4 ++++
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/Config.in b/arch/Config.in
index 744874362ca73a35d347d3895dd3db7d5e79242b..9193765ff3c55db64eb0915ed852bb2a39f41e66 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -85,7 +85,6 @@ config BR2_loongarch64
 	select BR2_USE_MMU
 	select BR2_ARCH_IS_64
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_12
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  LoongArch64 is 64-bit architecture developed by Loongson.
 	  http://www.loongson.cn/
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
