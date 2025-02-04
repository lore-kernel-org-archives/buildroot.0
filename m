Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D977DC02194
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 14:47:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 86D94607EC;
	Tue,  4 Feb 2025 14:47:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G58NX6z4NEsF; Tue,  4 Feb 2025 14:47:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A080B60656
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A080B60656;
	Tue,  4 Feb 2025 14:47:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 536FA12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4EB7960783
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ND3Lg0n7Ccdf for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 14:47:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 36E9060656
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E9060656
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36E9060656
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 14:47:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D6DB442F5;
 Tue,  4 Feb 2025 14:47:23 +0000 (UTC)
Date: Tue, 4 Feb 2025 15:47:22 +0100
To: =?UTF-8?B?U8OpYmFzdGllbg==?= Szymanski <sebastien.szymanski@armadeus.com>
Cc: buildroot@buildroot.org
Message-ID: <20250204154722.29eef633@windsurf>
In-Reply-To: <20250204-usbutils-libiconv-v1-1-231fe27db48c@armadeus.com>
References: <20250204-usbutils-libiconv-v1-1-231fe27db48c@armadeus.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthhqredtredtjeenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeehudetueefkeeiveeigeeugeeigfdvveehgffguddtieeuvddtgfelvdegveelieenucffohhmrghinhepsghoohhtlhhinhdrtghomhenucfkphepuddtledrkeelrddvfedvrdehheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedutdelrdekledrvdefvddrheehpdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepshgvsggrshhtihgvnhdrshiihihmrghnshhkihesrghrmhgruggvuhhsrdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738680443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3IKrihN0fkIEDBd+zBls6IUZVgTyU7CVYR3WXkz04Ys=;
 b=evE6TiOWmJK2/FB5/HFw+jNBW8AkQoTjYHlpyGpINpNYkszvszwZlo1rqw/fwTG4tsu/3M
 +XVXuGdUV+5HKjYidGdfQueUfPuCcmia5bT9Oql+nSsJk01mDPC/C8cSYHQJuXT5idd74O
 UOruWe08/jGbAuoCiPsuy9VUqWlcvIJ/l4s51Y91/+OILEaKLJHEG0v+JKy4JIKlgUmwgJ
 0vZeVfv54KSiEU9FSWXeG1WG1SHcm05lqtjsCNtdm4TBfY5EjfRkJx77guOZmeSYmVcHdN
 kM1fKlsetx0mpJ+538GRB4HH8iMPiP8tjU4OkZEuglIbxYm11x2DSLIWA5dd9g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=evE6TiOW
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAwNCBGZWIgMjAyNSAwOTozODo1MiArMDEwMApTw6liYXN0aWVuIFN6eW1hbnNraSA8
c2ViYXN0aWVuLnN6eW1hbnNraUBhcm1hZGV1cy5jb20+IHdyb3RlOgoKPiBpY29udi5oIGlzIGFs
d2F5cyBpbmNsdWRlZCBieSB1c2JtaXNjLmMgc28gc2VsZWN0IEJSMl9QQUNLQUdFX0xJQklDT05W
Cj4gaWYgIUJSMl9FTkFCTEVfTE9DQUxFCgpIYXZlIHlvdSBiZWVuIGFibGUgdG8gZmlndXJlIG91
dCBzaW5jZSB3aGVuIHRoaXMgcHJvYmxlbSBzdGFydGVkCm9jY3VycmluZywgc28gd2UgY2FuIHVu
ZGVyc3RhbmQgd2hldGhlciB0aGUgZml4IG5lZWRzIHRvIGJlIGJhY2twb3J0ZWQKdG8gYSBzdGFi
bGUgYnJhbmNoIG9yIG5vdD8KClRoYW5rcyEKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwg
Y28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2lu
ZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4v
bGlzdGluZm8vYnVpbGRyb290Cg==
