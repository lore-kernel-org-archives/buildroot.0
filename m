Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 715EDC87FCF
	for <buildroot@archiver.kernel.org>; Wed, 13 Aug 2025 10:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294BB82143;
	Wed, 13 Aug 2025 10:44:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RxDwp5rvTOia; Wed, 13 Aug 2025 10:43:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3033181FA8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3033181FA8;
	Wed, 13 Aug 2025 10:43:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1C0F938
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:43:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 93D6781FA8
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:43:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GK-YTVm4y43B for <buildroot@buildroot.org>;
 Wed, 13 Aug 2025 10:43:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 96ADA80FFB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 96ADA80FFB
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 96ADA80FFB
 for <buildroot@buildroot.org>; Wed, 13 Aug 2025 10:43:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5BFD04321C;
 Wed, 13 Aug 2025 10:43:54 +0000 (UTC)
Date: Wed, 13 Aug 2025 12:43:53 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: "Romain Naour" <romain.naour@smile.fr>, <buildroot@buildroot.org>,
 =?UTF-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, "Nicolas Carrier"
 <nicolas.carrier@nav-timing.safrangroup.com>
Message-ID: <20250813124353.4015c466@windsurf>
In-Reply-To: <DBZCJ6MUT01E.IED2BZIAW291@bootlin.com>
References: <20250806-php-lua-v2-1-a73faad939e9@bootlin.com>
 <e0045fd1-40e1-4af8-8031-9e051aff6833@smile.fr>
 <DBZCJ6MUT01E.IED2BZIAW291@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddufeektddtucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnheptedthfehjeegffevteeuteetheekkeevudeuleegfedvkedvueetudduudekgeevnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeehpdhrtghpthhtoheprghlvgigihhsrdhlohhthhhorhgvsegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehsmhhilhgvr
 dhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhrtghpthhtohepnhhitgholhgrshdrtggrrhhrihgvrhesnhgrvhdqthhimhhinhhgrdhsrghfrhgrnhhgrhhouhhprdgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755081834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g5PqPjGkd19W1TcwNUdA9tRhT8pbZ/n5E9x9+xifXd8=;
 b=ZFOPiNrtbhT+cy96XTjnvb87Szqtjfid84ggHp6IdDQyPis0a+0/plC7qIQApbAoNQ1xEl
 jIxkZeIDWQ8IZfvwL/MrA9Gwuinj2+Yg31ARXbLgJA0tBOIOFhyFnGunHTYa7OASd8mIcS
 loy6gQFQbevcF2DA5Wd8bhm8kvSEkr7nC6Avl0ZtJ5UnueY/sZ+/aEeM7cvtbRxGqCN4yK
 zGIARhEVtT+lE3KTsnnZdhm3qHTIrMKDMmd1RUQ7KqTnCtDfvG2YtIhNBNQRsMd9bgQJBY
 kBVI7PPIRy7JNOeLBW5WjRT3iWgXY83/isAYZu1awP84ZLefY+QB9zVhJCpjYQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ZFOPiNrt
Subject: Re: [Buildroot] [PATCH v2] package/php-lua: fix build with
 PHP8/GCC14
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

T24gTW9uLCAxMSBBdWcgMjAyNSAwNzoyNDowNyArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gPiBDaGVjay1wYWNrYWdlIHdhcm4gYWJv
dXQgbWlzc2luZyAiVXBzdHJlYW06IiBsaW5rLgo+ID4KPiA+IFNpbmNlIHRoZSBwYXRjaCBjb21l
IGZyb20gYSBmb3JrLCB1c2luZyAiVXBzdHJlYW0iIGxvb2tzIHdyb25nIGhlcmUuCj4gPiBNYXli
ZSBVcHN0cmVhbTogbi9hID8gIAo+IAo+IFN1cmUsIEkgY2FuIGFkZCB0aGlzIGVtcHR5IFVwc3Ry
ZWFtIGluIHRoZSBuZXh0IHJldmlzaW9uLgoKSSBkb24ndCB0aGluayAiVXBzdHJlYW06IG4vYSIg
aXMgdmVyeSB1c2VmdWwuCgpJbiBmYWN0LCBzb21ldGhpbmcgbGlrZToKClVwc3RyZWFtOiB1cHN0
cmVhbSBkZWFkLCB0YWtlbiBmcm9tIGZvcmsgYXQgaHR0cHM6Ly9naXRodWIuY29tL2JhZG9vL3Bo
cC1sdWEvcHVsbC84CgppcyBJTU8gYSBsb3QgbW9yZSB1c2VmdWwuCgpUaG9tYXMKLS0gClRob21h
cyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXggYW5k
IEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFp
bGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
