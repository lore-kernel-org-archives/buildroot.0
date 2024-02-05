Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2FFEC4828D
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 10:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 518D04025A;
	Mon,  5 Feb 2024 10:18:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 518D04025A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uWBZL-0ZbDLi; Mon,  5 Feb 2024 10:18:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8DA04159D;
	Mon,  5 Feb 2024 10:18:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8DA04159D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 26FBE1BF404
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:18:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CC35825B1
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 10:18:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0CC35825B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xQlQJ2jWecI9 for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 10:18:35 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC8B382572
 for <buildroot@busybox.net>; Mon,  5 Feb 2024 10:18:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC8B382572
Received: by mail.gandi.net (Postfix) with ESMTPSA id C569B1BF209;
 Mon,  5 Feb 2024 10:18:31 +0000 (UTC)
Date: Mon, 5 Feb 2024 11:18:30 +0100
To: Francois Perrad <fperrad@gmail.com>
Message-ID: <20240205111830.14a6a456@windsurf>
In-Reply-To: <20240118182808.551258-1-francois.perrad@gadz.org>
References: <20240118182808.551258-1-francois.perrad@gadz.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1707128312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YN2ZzUa/7rBxwPK2M9676zAWoRppHOs72bPwX1Wf+7k=;
 b=ce5g+WZ2ZXZ4q4HZzmM8L55BtCRKmzsWBmaV95mROjXKcSy14OpQ5nuoNhz19xo107sXip
 Fav/NqFk1nH7sYjccrCKovWk2Gk3V5PYESbaO7G7EBfMMfB0Qm023XvJmRdf8LmB351svy
 ZKtC6Epn8KIhOrsB2QYXsJRde9vDcWSDyhAB7jfMUEUMeNhVhs/IRn9It5xuVpbRjS1Gv5
 55vATQapAi9i2DApEiTSs6aaeZAVamlo/lOAk3P2jcUpbVQwIhvJWB2ULF58tFFbNpJOq7
 zyxqSAWdSZ1Ph1J49t/k77/AqeYsJPqrllsmtOikff5c3AQt5i7Mx8AKPaKL9Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=ce5g+WZ2
Subject: Re: [Buildroot] [PATCH] package/autoconf: bump to version 2.72
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gRnJhbsOnb2lzLAoKT24gVGh1LCAxOCBKYW4gMjAyNCAxOToyODowOCArMDEwMApGcmFu
Y29pcyBQZXJyYWQgPGZwZXJyYWRAZ21haWwuY29tPiB3cm90ZToKCj4gaHR0cHM6Ly9naXQuc2F2
YW5uYWguZ251Lm9yZy9jZ2l0L2F1dG9jb25mLmdpdC90cmVlL05FV1M/aD12Mi43Mgo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5jb2lzIFBlcnJhZCA8ZnJhbmNvaXMucGVycmFkQGdhZHoub3JnPgo+IC0t
LQo+ICBwYWNrYWdlL2F1dG9jb25mLzAwMDEtZG9udC1hZGQtZGlydHktdG8tdmVyc2lvbi5wYXRj
aCB8IDIgKy0KPiAgcGFja2FnZS9hdXRvY29uZi9hdXRvY29uZi5oYXNoICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyICstCj4gIHBhY2thZ2UvYXV0b2NvbmYvYXV0b2NvbmYubWsgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgMiArLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKCkZvbGxvd2luZyB5b3VyIGZlZWRiYWNrLCBJIGFwcGxpZWQgYW5k
IHB1c2hlZCB5b3VyIHBhdGNoIHRvIG1hc3Rlci4KTGV0J3Mgd2F0Y2ggYW5kIHNlZSBob3cgdGhp
bmdzIGdvIGluIHRoZSBhdXRvYnVpbGRlcnMgaW4gdGhlIG5leHQgZmV3CmRheXMuCgpUaGFua3Mh
CgpUaG9tYXMKLS0gClRob21hcyBQZXRhenpvbmksIENUTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
