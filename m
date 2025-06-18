Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EFD6C71157
	for <buildroot@archiver.kernel.org>; Wed, 18 Jun 2025 18:26:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DCA7C40665;
	Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NB_tYGnaYcoV; Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2A51E4066C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A51E4066C;
	Wed, 18 Jun 2025 18:26:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EA52151
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74F74404E5
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mj7Zs3HborAU for <buildroot@buildroot.org>;
 Wed, 18 Jun 2025 18:26:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.157;
 helo=fhigh-a6-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C36CC404BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C36CC404BF
Received: from fhigh-a6-smtp.messagingengine.com
 (fhigh-a6-smtp.messagingengine.com [103.168.172.157])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C36CC404BF
 for <buildroot@buildroot.org>; Wed, 18 Jun 2025 18:26:09 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 8E32E11401C5;
 Wed, 18 Jun 2025 14:20:49 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Wed, 18 Jun 2025 14:20:49 -0400
X-ME-Sender: <xms:gQNTaIg3G_t-NbmARSew16eLa7xC2GYX9hSlhsUs1VMrWOgOGlz9Fg>
 <xme:gQNTaBDx0MfqZBuiVEd9yCuqeynoBskqif51hlrQXjUuWygS5cDFijyELfpOVMT7Y
 Vdb9DmwzjGX90amJQ0>
X-ME-Received: <xmr:gQNTaAFcq96D838l9CjjR9djg1acZkMA9Ipq7wnqDYiSCYCKiSJRhHhIDpqZ_dnaRCHgh1CSHuNPtgAoC8zh8r4LDoPCUj1rwuf8NQOgZVfTzGLdLyOkugEFd5XrfxIzWeHQYUWSbqViIBo>
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
X-ME-Proxy: <xmx:gQNTaJR-brfhQGVHOlw9dsaLAAzwh8swwJKbTmIX0Xvb_ZoRVrtEVg>
 <xmx:gQNTaFyheKQDwNBKSxyyIWI0AbNs5Qnpwfj5JzO_6vTVwTW-kjVfMg>
 <xmx:gQNTaH74C3KLR_gFFoxVlDm9BE7wdKHGsZG9JVAPBHasgUXufjye4g>
 <xmx:gQNTaCyTHxsUZs4n9yLcqgtQgpvkKOCGlg1ksJOt6tUAl9LYko3KoA>
 <xmx:gQNTaMpKwi3M7cEUwhl7lVtiEsvMT0j_rmTwU6aKsqsN7eiLSizV5i-J>
Feedback-ID: ifd894703:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 18 Jun 2025 14:20:48 -0400 (EDT)
From: Jiaxun Yang <jiaxun.yang@flygoat.com>
Date: Wed, 18 Jun 2025 19:20:29 +0100
MIME-Version: 1.0
Message-Id: <20250618-loongarch-v3-4-d11baae32eea@flygoat.com>
References: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
In-Reply-To: <20250618-loongarch-v3-0-d11baae32eea@flygoat.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>, 
 Romain Naour <romain.naour@gmail.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Dick Olsson <hi@senzilla.io>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Romain Naour <romain.naour@smile.fr>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=707;
 i=jiaxun.yang@flygoat.com; h=from:subject:message-id;
 bh=9NX70bA4iYXqpqrW3jR0Lm+s48ZqI0MDlAsdMuKkJaU=;
 b=owGbwMvMwCHmXMhTe71c8zDjabUkhoxg5grzul/n9jxb+4CZZbHmzI2TAytnt29cule6LH7dC
 5O5q7MedJSyMIhxMMiKKbKECCj1bWi8uOD6g6w/MHNYmUCGMHBxCsBEJvoxMvwKfi32mMGhvn3J
 AUm9Pe9zJKaeuTVLzXB24c+2FWXOkXcY/orUX1vRtUff2NZy/4zItc03PJ/LZqVwtC9aypY9/6B
 dGzsA
X-Developer-Key: i=jiaxun.yang@flygoat.com; a=openpgp;
 fpr=980379BEFEBFBF477EA04EF9C111949073FC0F67
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=flygoat.com; h=
 cc:cc:content-transfer-encoding:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm2; t=1750270849;
 x=1750357249; bh=b7Geglgn5oVXky3s8lb6Bqp43JBar6G2UJ5PMQ5A9pU=; b=
 FdkGOdyOB5+ZNJBQStRlfcHeZI/wyGH5FAER4Z+wURNWd3KbvkMfTAc5ETuwY2QE
 Es3Yi6Zxj4SMfC8nEMZG8u3FSsHQM8KW8yGVIZpWzZfsCljYG12gB2YVQA7KTkgk
 3SstjxFBNaQT4F08Pmjq/iGmqZlirT2lO1zuFneEtHKN9ZYK2ZuUVrA9EUuB0uvz
 TKRA7XwshyF40eNvOSqUUaH2O2qXhP6jLXNlYe1CqBFnFdhYMwpWQOq8VtBJM/+A
 nxQs2cY3CYV4SIgIMQTKURJyNPrdGYjgjxSqRr7jIHYEYypCV4YLMviebfwkqPs7
 uKIVuxtyoWddBlEj1v+3Xw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:content-type:date:date:feedback-id:feedback-id
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1750270849; x=
 1750357249; bh=b7Geglgn5oVXky3s8lb6Bqp43JBar6G2UJ5PMQ5A9pU=; b=c
 /G21tAIUFb6yACmctTqhZVRWonnt4suR9gLX9/8vp3XAbt0Fe4hnlnKGAV+KFExN
 15uJxDctmgiYUV5U3lkj5ehQ8V5xypTIV7c+pA0hcjDBUtRcsQmRp3oSr4hDT/G3
 nMkOjw0BGgmmckTCFMo9kWdAz3L4JlTfOR2vz6aVuoQ//yTdJtjaz5tZpMukt80v
 8RDv2VC65rzRz4aCRnPg43tGsXW3EQbIXYk4UeCjqB+lgupta36DmVSZe38RIM8m
 D2DwbUtq2lJC9DVBLDxoIJbKyyKddXJ6687thAP8AywUjjBdArrPgiafrEAW9zdm
 SH/E9wcj4RROynGjb4F7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=flygoat.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=flygoat.com
 header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=FdkGOdyO; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=c/G21tAI
Subject: [Buildroot] [PATCH v3 04/11] package/musl: Enable LoongArch64
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

musl introduced LoongArch64 support in 1.2.5.

Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
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
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
