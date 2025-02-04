Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8A6C02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 15:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF21B81F0D;
	Tue,  4 Feb 2025 15:10:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8RVTrQVB54M; Tue,  4 Feb 2025 15:10:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AE7B81F09
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AE7B81F09;
	Tue,  4 Feb 2025 15:10:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C72C12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C29981EF7
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vwhKvhta7o6L for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 15:10:51 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 67E9781EF5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67E9781EF5
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 67E9781EF5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 15:10:51 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 990BF44111;
 Tue,  4 Feb 2025 15:10:49 +0000 (UTC)
Date: Tue, 4 Feb 2025 16:10:48 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
Message-ID: <20250204161048.5ab4e27e@windsurf>
In-Reply-To: <b2769ce8-7d49-49df-a4da-3c69ef3886e3@armadeus.com>
References: <20250204-usbutils-libiconv-v1-1-231fe27db48c@armadeus.com>
 <20250204154722.29eef633@windsurf>
 <b2769ce8-7d49-49df-a4da-3c69ef3886e3@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdekgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeevleefvdegudevvdelkeekgedvjefhteeghfeitedvveekueefkeffiefhveduudenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738681849;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=REyEYdo8d6N74/pMIaemfBhuort6+AyT2SlvCrREpNU=;
 b=B2xLJ3274joymRBctpScmEZldLm0XO58AYjwJ8Y5V2hJAkUmTsVLffWwxF8Yhc7HfjgKHf
 25igPNaVaLhczBRyeKLobo4x/U3wOoPTZLJrkS766IGS737+Kl52A3VxUTKeswwHhtL9Hp
 saQMF4HXWjrQw4LJUip5EbA1ptHSNkxItXEgIfiPaQH4snrJCi5fEfWRnIxiP8ClOffZJd
 1tOMyq/DYGck4JKIFjySVDs4fyrR3Vv+Zkrz5gChQylqUNOkS9gfydZ1B+iNLpnWpcWh7e
 +tSCKi00huKoliiWkOz4dpMqP3CT2XGHGJ3Cnr8o3UEZbL4yanlYDqnNFXmY5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B2xLJ327
Subject: Re: [Buildroot] [PATCH] package/usbutils: select libiconv if needed
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCA0IEZlYiAyMDI1IDE2OjAxOjEzICswMTAwClPDqWJhc3RpZW4gU3p5bWFuc2tpIDxz
ZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVzLmNvbT4gd3JvdGU6Cgo+IFRoZXJlIGlzIG9uZSBm
YWlsZWQgYnVpbGQgZm9yIHRoZSBzYW1lIHJlYXNvbiBmb3IgdXNidXRpbHMtMDE1IFswXS4gT24g
Cj4gMjAyNC4wMiwgd2UgaGF2ZSB1c2J1dGlscy0wMTcgc28gaXQgY2FuIGJlIGJhY2twb3J0ZWQg
dGhlcmUgSSBndWVzcy4KPiAKPiBbMF0gCj4gaHR0cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0
L3Jlc3VsdHMvYThlL2E4ZTE5NjFkOTEwMDZmYjZkOTljMGFhZjM0ODhhOThhZjczZTkxNDMvLwoK
QSBiZXR0ZXIgY29tbWl0IG1lc3NhZ2UgaXMgdGhlbjoKCiJTaW5jZSB1cHN0cmVhbSBjb21taXQg
N2M3ZmVkMzBmNzU1M2I1NTFmY2UzMTUxZmUzMTVjZjY5ZTYwMjA2NSwgd2hpY2gKZmlyc3QgYXBw
ZWFyZWQgaW4gdXNidXRpbHMgdmVyc2lvbiAwMDcsIGljb252IGlzIHVzZWQgd2hlbiBhdmFpbGFi
bGUuClNpbmNlIHRoZW4sIHRoZSBwYWNrYWdlIGhhcyBiZWVuIGZhaWxpbmcgdG8gYnVpbGQgd2hl
biBsaWJpY29udiBuZWVkcwp0byBiZSBwcm92aWRlZCBieSBhIGxpYnJhcnkgZXh0ZXJuYWwgdG8g
dGhlIEMgbGlicmFyeS4gVGhpcyBjb21taXQKZml4ZXMgdGhhdCBieSAuLi4iCgpUaGlzIHdheSwg
d2UgY2xlYXJseSByZXRyYWNlIHRoZSBvcmlnaW4gb2YgdGhlIHByb2JsZW0sIGluc3RlYWQgb2YK
Imd1ZXNzaW5nIi4KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3du
ZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5n
IGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
