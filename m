Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC3FC021B1
	for <buildroot@archiver.kernel.org>; Thu, 20 Feb 2025 14:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0851361222;
	Thu, 20 Feb 2025 14:16:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBixu-Y0hSez; Thu, 20 Feb 2025 14:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C810B61254
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C810B61254;
	Thu, 20 Feb 2025 14:16:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4A9E2CF
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:16:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CBB783F04
 for <buildroot@buildroot.org>; Thu, 20 Feb 2025 14:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NWtHqDFVTEXz for <buildroot@buildroot.org>;
 Thu, 20 Feb 2025 14:16:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=miquel.raynal@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7AA9A83F23
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7AA9A83F23
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7AA9A83F23
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 14:16:00 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id AF521583C47
 for <buildroot@busybox.net>; Thu, 20 Feb 2025 13:58:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0AE4431ED;
 Thu, 20 Feb 2025 13:58:13 +0000 (UTC)
To: David Oberhollenzer <david.oberhollenzer@sigma-star.at>
Cc: MTD Mailing List <linux-mtd@lists.infradead.org>,  Buildroot Mailing
 List <buildroot@busybox.net>,  "Josh Boyer (Fedora)"
 <mtd-utils-maintainers@fedoraproject.org>,  "Bastian Germann (Debian)"
 <bage@debian.org>, (Rosa Linux) <a.proklov@rosalinux.ru>,
 Embedded Gentoo <embedded@gentoo.org>,  "Robin H. Johnson"
 <robbat2@gentoo.org>,  "John (OpenWRT)" <john@phrozen.org>, "Michael Tross
 (T2 SDE)" <michael@tross.org>,  "Oliver Schinagl (Alpine)"
 <oliver@schinagl.nl>,  "Orphaned (Void Linux)" <orphan@voidlinux.org>,
 "Sergey Bolshakov (ALT Linux)" <sbolshakov@altlinux.org>,  "Silvan Calarco
 (openmamba)" <silvan.calarco@mambasoft.it>,  "Viric (nixpkgs)"
 <viric@viric.name>,  "Pascal Bleser (SUSE)" <pascal.bleser@opensuse.org>,
 "Levente Polyak (Arch)" <anthraxx@archlinux.org>,  =?utf-8?Q?Llu=C3=ADs?=
 Batlle i Rossell
 (NixOS) <shaba@altlinux.org>,  Richard Weinberger <richard@nod.at>, Zhihao
 Cheng <chengzhihao1@huawei.com>
In-Reply-To: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at> (David
 Oberhollenzer's message of "Sat, 15 Feb 2025 17:05:53 +0100")
References: <1b7a55a6-1c5b-4e86-8006-e2010e54367e@sigma-star.at>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Thu, 20 Feb 2025 14:58:13 +0100
Message-ID: <87zfigk9ai.fsf@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeijeeftdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefujghffgffkfggtgfgsehtqhertddtreejnecuhfhrohhmpefoihhquhgvlhcutfgrhihnrghluceomhhiqhhuvghlrdhrrgihnhgrlhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheeigfeufedvhfekfeehueeiheehleeifedvjefhtdehfeefueejgfekveduhfejnecuffhomhgrihhnpehinhhfrhgrrhhoohhtrdgrthenucfkphepledtrdekledrudeifedruddvjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrkeelrdduieefrdduvdejpdhhvghloheplhhotggrlhhhohhsthdpmhgrihhlfhhrohhmpehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopegurghvihgurdhosggvrhhhohhllhgvnhiivghrsehsihhgmhgrqdhsthgrrhdrrghtpdhrtghpthhtoheplhhinhhugidqmhhtugeslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhshigsohigrdhnvghtpdhrtghpthhtohepmhhtugdquhhtihhlshdqmhgrihhnt
 hgrihhnvghrshesfhgvughorhgrphhrohhjvggtthdrohhrghdprhgtphhtthhopegsrghgvgesuggvsghirghnrdhorhhgpdhrtghpthhtoheprgdrphhrohhklhhovhesrhhoshgrlhhinhhugidrrhhupdhrtghpthhtohepvghmsggvugguvggusehgvghnthhoohdrohhrghdprhgtphhtthhopehrohgssggrthdvsehgvghnthhoohdrohhrgh
X-GND-Sasl: miquel.raynal@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1740059897;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oNBQaKv78uyH4ef165+GkBaMZfZdRktVOqIdHeYNWzk=;
 b=FMA3lDV7hCRVqyQ/E+LjfD1dzkugxVVlcCfmenjFy+lsYQwomH7vMbqzwokO3D+MiHg5kg
 DvaX2vXR1mFrmtuEkeb6RY+DWf5IJ8HgCIV6/dMvzVvhHcTKK8iLYJYly6OooLWS+gRhWI
 JK3bM3AZcX67CSYh8LE0uRzo4B9g7Xwt9Rhsrdjxdb12chs5+KXY6n0JhKphDmr6f80ydd
 nnDzwZgKL8Vp9+cf/uY5yaXCqq8rX2L2Nv2ftlKg4kIJns8yjJyKcNPItZ/WzmAvUH4bJE
 vP483JM8VZ5L0PnBXPNISRFf4cZB4dMvaGIpc5FiJTdkGBECadV22Ek6SyUU/g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=FMA3lDV7
Subject: Re: [Buildroot] [ANNOUNCE] mtd-utils-2.3.0 is released
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRGF2aWQsCgorWmhpaGFvCgpPbiAxNS8wMi8yMDI1IGF0IDE3OjA1OjUzICswMSwgRGF2
aWQgT2JlcmhvbGxlbnplciA8ZGF2aWQub2JlcmhvbGxlbnplckBzaWdtYS1zdGFyLmF0PiB3cm90
ZToKCj4gSGksCj4KPiBtdGQtdXRpbHMtMi4zLjAgaXMgcmVsZWFzZWQuCgpUaGFua3MgYSBsb3Qg
Zm9yIHRoaXMgbmV3IHJlbGVhc2UhIEkgd2FudGVkIHRvIGJ1bXAgdGhlIHBhY2thZ2UgdmVyc2lv
bgppbiBCdWlsZHJvb3QgYnV0IEkgZ290IGlzc3VlcywgcGVyaGFwcyB5b3UgY2FuIGhlbHAuCgpB
IHJlZ3VsYXIgYC4vY29uZmlndXJlIC0taG9zdD08YXJtPiAmJiBtYWtlYCB3b3JrcyB3ZWxsIHdo
ZW4gY2xvbmluZyB0aGUKR2l0IHJlcG9zaXRvcnksIGhvd2V2ZXIgQnVpbGRyb290IHVzZWQgdG8g
ZG93bmxvYWQgdGhlIHRhcmJhbGwsIHdoaWNoIGluCnByYWN0aWNlIGRvZXMgbm90IGNvbnRhaW4g
YWxsIHRoZSAuZ3ogZmlsZXM6Cmh0dHBzOi8vZ2l0LmluZnJhcm9vdC5hdC9tdGQtdXRpbHMuZ2l0
L3RyZWUvdGVzdHMvdWJpZnNfdG9vbHMtdGVzdHMvaW1hZ2VzCgpUaGlzIG9mIGNvdXJzZSBsZWFk
cyB0byBhIGJ1aWxkIGZhaWx1cmU6Cm1ha2VbMV06ICoqKiBObyBydWxlIHRvIG1ha2UgdGFyZ2V0
ICd0ZXN0cy91Ymlmc190b29scy10ZXN0cy9pbWFnZXMvZ29vZC5neicsIG5lZWRlZCBieSAnYWxs
LWFtJy4gIFN0b3AuCgpUaGUgY29tbWl0cyBmcm9tIFpoaWhhbyBhY3R1YWxseSBsaXN0IHRoZXNl
IC5neiBmaWxlcyBpbiB0aGUgLmFtIGZpbGVzLAphbmQgdGhleSBhbHNvIGFwcGVhciBpbiB0aGUg
TWFrZWZpbGUuaW4gYXMKCiAgICBAQlVJTERfVEVTVFNfVFJVRUBhbV9fYXBwZW5kXzIyCgp5ZXQg
dGhleSBhcmUgbm90IHBhcnQgb2YgdGhlIGZpbmFsIGRpc3RyaWJ1dGVkIHRhcmJhbGwuIEFueSBp
ZGVhIGhvdyB0bwpmaXggdGhhdCBwcm9wZXJseT8KClRoYW5rcyEKTWlxdcOobApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBs
aXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
