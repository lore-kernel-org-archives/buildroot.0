Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11208C87FCB
	for <buildroot@archiver.kernel.org>; Wed,  6 Aug 2025 14:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BBFCA845F0;
	Wed,  6 Aug 2025 14:52:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CwBzb8oyQq3c; Wed,  6 Aug 2025 14:52:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4FFC8454E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4FFC8454E;
	Wed,  6 Aug 2025 14:52:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id F174ED79
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E20848454E
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uvV3AnUn32Dv for <buildroot@buildroot.org>;
 Wed,  6 Aug 2025 14:52:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AE341843FF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE341843FF
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AE341843FF
 for <buildroot@buildroot.org>; Wed,  6 Aug 2025 14:52:18 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E1F36442C2;
 Wed,  6 Aug 2025 14:52:12 +0000 (UTC)
Date: Wed, 6 Aug 2025 16:52:11 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: <buildroot@buildroot.org>, =?UTF-8?B?SGVydsOp?= Codina
 <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250806165211.1dad0824@windsurf>
In-Reply-To: <DBVC4NHTNJCS.Z7MM8XO0B49K@bootlin.com>
References: <20250806-php-dbus-v1-1-78cbe7d1797f@bootlin.com>
 <20250806110836.387c867c@windsurf>
 <DBV9S1S4XEEA.2DHT8AEV8PEL9@bootlin.com>
 <20250806123423.33451a9c@windsurf>
 <DBVC4NHTNJCS.Z7MM8XO0B49K@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekfeegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepgedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhto
 hephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1754491934;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GXhzMZBe+/37yT4UFuiivRBvXK4A0DOFcKusGLBxcg=;
 b=m+th9pYgvlpLg2R5hJP8hUdS2mzuH5RtI2zdGQMaqBFWZ4vtum8JDfoPlM7cxBdYi/ruGC
 6iBSC/YA/Wxha4ok1P3AEm9SqINtFcyLSPpu43BZaIi+mnfd19u6WogH4/ienBTgAGto8X
 aTRc/WsWieDd05Yy2bgYhcCpYIghyrch/OPfe6LxsTlxYfluuAn3gPnKOq2VH7N3PnF3Np
 aBcnT+I+ewscLUzW8foMTp8UOQVYuY7BLhScpqD6XfMnx0Avt8CEO8VfuH8PRLJBiVPjmT
 wzEYrd/DL9Yjw1vIBZ4Cr7G7t8jRZTkW81fi5dwKV2FU+OdVFa3s79whwW1NQw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=m+th9pYg
Subject: Re: [Buildroot] [PATCH] package/php-pecl-dbus: fix build with PHP8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCAwNiBBdWcgMjAyNSAxNDoxNDoyOSArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSSBndWVzcyB5b3UgYXJlIG1lYW5pbmcg
R0NDIDE0LnggOikKCkFoLCB5ZXMgc29ycnkuIEknbSB3b3JraW5nIG9uIHByZXBhcmluZyBhIG5l
dyByZWxlYXNlIG9mIEJvb3RsaW4KdG9vbGNoYWlucyBmb3Igd2hpY2ggc3RhYmxlIHdpbGwgYmUg
R0NDIDE0IGFuZCBibGVlZGluZy1lZGdlIHdpbGwgYmUKR0NDIDE1LCBzbyBJIG1pc3NlZCB0aGF0
IHRoZSBfY3VycmVudF8gdmVyc2lvbnMgb2YgdGhlIHRvb2xjaGFpbnMgYXJlCnN0YWJsZSA9IEdD
QyAxMywgYmxlZWRpbmcgZWRnZSA9IEdDQyAxNC4KClRob21hcwotLSAKVGhvbWFzIFBldGF6em9u
aSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVu
Z2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QK
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxt
YW4vbGlzdGluZm8vYnVpbGRyb290Cg==
