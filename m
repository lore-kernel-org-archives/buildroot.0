Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF2AC7115A
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9D354071E;
	Wed, 18 Jun 2025 18:31:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MM8IoX915mMI; Wed, 18 Jun 2025 18:31:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E4640737
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26E4640737;
	Wed, 18 Jun 2025 18:31:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FFC0D94
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D90660AE2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7_IXzpeXvGPo for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 97FA760AD2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97FA760AD2
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 97FA760AD2
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:31:10 +0000 (UTC)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal
 [10.202.2.43])
 by mailfhigh.phl.internal (Postfix) with ESMTP id AD7C61140218;
 Wed, 18 Jun 2025 14:20:55 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-03.internal (MEProxy); Wed, 18 Jun 2025 14:20:55 -0400
X-ME-Sender: <xms:hwNTaJU1hrc_f-AoFD71LAEkp1uy_FQIdC908_uXPJkpIfEr6Do4xA>
 <xme:hwNTaJnKmpuVOdcCSp8stqEZmmjEIneawzReU32xdxOPWPMi0LR0eevH0sXygfv3Z
 SJmgrYnoQG3ruRcshU>
X-ME-Received: <xmr:hwNTaFYRWr3FRD5FR0B6GW25ETXPE6U4vUm4mIzYmwg_VCRVRnOk-BYaUK2XZx5GKDhTQgbW0bMBJFpdPNzBgZmJO4Tmvt5XpG8n1d_ejiUScVMSlmW6GmhmPXp-WsnElD4WGRWP5A9AJxg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdeffeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdej
 necuhfhrohhmpeflihgrgihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhi
 hgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepvdekiefhfeevkeeuveetfeelffek
 gedugefhtdduudeghfeuveegffegudekjeelnecuvehluhhsthgvrhfuihiivgepudenuc
 frrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdr
 tghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoh
 epthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthht
 ohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehroh
 hmrghinhdrnhgrohhurhesghhmrghilhdrtghomhdprhgtphhtthhopehgihhulhhiohdr
 sggvnhgvthhtihessggvnhgvthhtihgvnhhgihhnvggvrhhinhhgrdgtohhmpdhrtghpth
 htohepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomhdprhgtphhtthhopehh
 ihesshgvnhiiihhllhgrrdhioh
X-ME-Proxy: <xmx:hwNTaMURGF_ZeovpeCFIljnfT1Z80cl6yb1dcleXcG0f3b4GyfQ2uQ>
 <xmx:hwNTaDlTFpHlJ3v607dTmuUlpfa-zH14ZdRo5Og2cfKGB27JRlIP-Q>
 <xmx:hwNTaJdBuXw6DXncxjpb_KST4mwCBXr36g5mpPAcTcpKc-xwIdLS5A>
 <xmx:hwNTaNEooGcOES_ADw3m-C9DmRLPiDByN4gLsWN3gunG-74pnxxwgA>
 <xmx:hwNTaISdyZAdEH1hTMlUFxs0VpdiTussyiL4C-MX8h0cE42EmhAjdgvK>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:54 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:34 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-9-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=2jSD/t2/2gPunVn+haE0pdo/SNBqaXCdX0zXisLn9yQ=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5krHOVU/ZZzTKw78kfbcX+/yx0hxndH3o8/8Y946M
 9sqJdt0lLIwiHEwyIopsoQIKPVtaLy44PqDrD8wc1iZQIYwcHEKwETi8hj+mfcsXyrglv7wmmSI
 15kFnbczlkq+OOxwk0vqyoyYi95pTxkZZhcpGQW/lBdalzNtwdUjC+s2CrroMfxnv7Vv+9P738s
 XcAIA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270855;
 x=1750357255; bh=HHHToeSuzkebvv3KjzCawV6DaTfo3jMeVQ0v09iIu5o=; b=
 Kwng7bN9uEo0G8+T1fhYmKbh8Rmof6Z80rHh04rpNdXsVXQG1cX8papIzi4OSh8l
 QVcZkGTVT21OL6Xgbn3Vj+DqBcnxZnHUf4c2fi8O9YA2gGlThu7ZpCTx+0ck7AiF
 umwTIVRCft0Zg5RA3mekORCZGZrow7aB0n+g11QDstJW0yIcbwKP31bKOAWkFLwL
 azdrRF6qEgG3o00ymOeqNKZ6RCPP5x6PEKsvDBUkv+XokZfzOCN9LuhrkHD1nGu+
 Bocfj4CBdQfoLH1hJSmDTYiHaAljM/J8azwVlQ8Pm4cANXh/28SQXfqe1FoSZWbi
 b5ufm+Y5eaFD1WO1QUBM5w==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270855; x=
 1750357255; bh=HHHToeSuzkebvv3KjzCawV6DaTfo3jMeVQ0v09iIu5o=; b=f
 XwvjeUVYer2BaJMYFgD4PsC7w7ZdZQJVXzjit9yPzurgFjfdAY5XY+3OwuKgbjZ2
 lwXWKFaJraRnoTaLw+4cFPI8F/LzhV+v+NedjlmnEEy2HuQcoc4CvsNso+ugw1Te
 zrjqXchtGZJlWYlVzR8WeStLS4ebrF1J4jZBbfcCvq+tqIeLVvAtHZZTyAAdM4si
 k7I5ioY5D9+RCxIJ0rZnOHuq9AYAOzeVogIL2LRDhkHAqHvDLUy6/zeADKPGvQok
 qsKymUuib9L2e/ak2tAJR2eTEjnPVG0Sn1gCjinvu8kH78nnA4WIQZc5k6Bg0aQ8
 1+Tg6TBMKEemD+b5KQg1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=Kwng7bN9; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=fXwvjeUV
Subject: [Buildroot] [PATCH v3 09/11] package/qemu: enable loongarch64 as
 target package
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

LoongArch64 emulation system / user emulation is supported
by QEMU.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
---
 package/qemu/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
index 4db114490a41f2625f212e1e33b1bcf637fae9bb..090204d90c51d1d03aaef4378ef2cf74345ed84e 100644
--- a/package/qemu/Config.in.host
+++ b/package/qemu/Config.in.host
@@ -4,6 +4,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
 	default y if BR2_armeb
 	default y if BR2_aarch64
 	default y if BR2_i386
+	default y if BR2_loongarch64
 	default y if BR2_m68k
 	default y if BR2_microblazeel
 	default y if BR2_microblazebe

-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
