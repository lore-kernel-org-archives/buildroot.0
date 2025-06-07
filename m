Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36519C61CE8
	for <buildroot@archiver.kernel.org>; Sat,  7 Jun 2025 18:21:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A840060B67;
	Sat,  7 Jun 2025 18:21:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eL_qFLis_mSg; Sat,  7 Jun 2025 18:21:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED81F60719
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED81F60719;
	Sat,  7 Jun 2025 18:21:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6CDE1F2
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C7EE84099A
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9ruCnyG7qSrz for <buildroot@buildroot.org>;
 Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=202.12.124.158;
 helo=fhigh-b7-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BC5A240741
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC5A240741
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BC5A240741
 for <buildroot@buildroot.org>; Sat,  7 Jun 2025 18:21:07 +0000 (UTC)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id C246F254010B;
 Sat,  7 Jun 2025 14:12:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Sat, 07 Jun 2025 14:12:44 -0400
X-ME-Sender: <xms:HIFEaJ-RXgwYLimj7Rb4yamNrCVfZdbIadlkr_EcKfskmNEPk_lC7Q>
 <xme:HIFEaNv2oqOxUquwNrzjprrQ8r4IpjjysKAfSqtCD4Jbi3yoAnra1SR1R1YNvFk-f
 Tf5zepGJ4rqvYVGgo0>
X-ME-Received: <xmr:HIFEaHA1cInDc4EqSwqmV83Mz0n44ILhUlCGm0-3U_xjkEhK8qJj-gy11zE9Wg>
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
X-ME-Proxy: <xmx:HIFEaNfM7PyB_seOzVqFIWiN5qMczp0pPq3ZByKQS9CPNWhj8AKODg>
 <xmx:HIFEaOMlVPV2WB9_sDh5NMmBVqkQZ8trPKOsKZxX-5Zo5VBbBmlZKg>
 <xmx:HIFEaPmvCFeSba4SFbWvskWwHNfNZaCV6MyQuJB_EtrOt6QfU4B-_g>
 <xmx:HIFEaIs09nbJ2a_ba39iZBHd-CjsyEo4hNjSt2212LgSaVae9PZ64A>
 <xmx:HIFEaD49MA5wFSua0iNqnE4VbUQxXQUs-I1L3Qs8lqG_ZlA_SYqoQ_Xk>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 7 Jun 2025 14:12:43 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Sat, 07 Jun 2025 19:12:38 +0100
MIME-Version: 1.0
Message-Id: <20250607-loongarch-v2-4-90bc4fda9080@flygoat.com>
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
 :references:reply-to:subject:subject:to:to; s=fm2; t=1749319964;
 x=1749406364; bh=eTQjq9A9bgx8ee1O4IrAZo4I1cn0LZdjUcrt9xvnrEY=; b=
 HawzUXc6fE6zKw63W9icbcyY2902zfmyVLypaDavsn0KEJs9yIb/gPtdJe8ZDNd5
 qpG1quXZaZyTqTaiupFAhWxzX+E6F/vfE+Mm2TwPNH3JfThOqTB6047k7eWDlCs6
 m1uDilMhlGB31USUc930YNQvT2saNqk2LCHc1hjtqOvKphtN1mlxsFNLB7u9bWyD
 zDdRdVfJbdkGKgmtL+4iwpwnPfB6hdmzcxObFFLlEFFGQO8jBjPRdODA88BbUV4h
 Yae2Bc+hpDAOswBm++dFgkTPYKltczeO1fAA7YgurrQwluEMqLqHCn3LYCV1Ebks
 ycQwVyQ9FdEBXzmVhWFbSA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1749319964; x=
 1749406364; bh=eTQjq9A9bgx8ee1O4IrAZo4I1cn0LZdjUcrt9xvnrEY=; b=D
 1GnBy4TO1XeevsVyGKNMhYR9zqHrW8FlLGV3qqt3oZ7IUd4ozDUD39j+dqndEPKW
 gROkEcA4sBfVQOxoKaGYnxPI6wlgAz54/lOkJV0GF1UAGTCzNTZlMLKnXaz3mvpO
 ktfdrO7L5lnx1HvbTd/YYNUrIL+IYdEvTjmuqS9vEKvAcv+CBYafRJAMIllZFtGi
 enuNWFWEo8jtuSFTDR79YFsFm7BmedpXDZw3SJAZ3FJ1VXMKY2Zjx0yqIPDZdIu2
 bYzumFKpSdqcgvprCbF5xJYpOYc98mvHeYs8Pa0ZebC3D8KhmIOnjUohIsECyxJF
 kyJwM+/LLIV8u2CdRXu6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=HawzUXc6; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=D1GnBy4T
Subject: [Buildroot] [PATCH v2 4/9] package/musl: Enable LoongArch64 support
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

musl introduced LoongArch64 support in 1.2.5.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index a6e2af054c354fb1078ff918f1058da3367a46a0..70475326f5b29f4b903e91e2be9d52f3b547907d 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k_m68k
 	default y if BR2_microblaze
 	default y if BR2_mips

-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
