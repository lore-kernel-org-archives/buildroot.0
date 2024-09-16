Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75093C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 243AC40488;
	Mon, 16 Sep 2024 11:32:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Kn-NqI1K2IAE; Mon, 16 Sep 2024 11:32:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6BC440B2A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D6BC440B2A;
	Mon, 16 Sep 2024 11:32:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7B06E1BF3AD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75FF940188
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:32:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N-OmemUflEWg for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:32:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 48FD74017D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 48FD74017D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48FD74017D
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:32:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.102.118])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 409A52003DA;
 Mon, 16 Sep 2024 13:32:38 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Sep 2024 13:32:37 +0200
Date: Mon, 16 Sep 2024 13:32:37 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>
Message-ID: <ZugXVY_bWQJw0JwI@landeda>
References: <20240701145708.2886402-1-raphael.melotte@mind.be>
 <20240705091409.3370272-1-raphael.melotte@mind.be>
 <20240705091409.3370272-3-raphael.melotte@mind.be>
 <ZugT2E3Y1M3TjNt_@landeda>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZugT2E3Y1M3TjNt_@landeda>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1726486364;
 bh=32UTL0kh3UL7j90JQetU213c1WYS1sfiz/lkcJyEIS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=niXWPRKMqsl3vIXNUQeQK4W1jResqu/B6MzBHfORSFrVW13GVOpi5UaYWI5PrFHJa
 yvoF/skMdjBBe+vRr62A3Ed2+xcUbmT9iJfCAJRDlu3ae994ec/FyQl8riVBfM0pjL
 3h3uqGMK9tu93ZsqLYK9M8mUD0N8p760PbB2FT17yJoFN99+/s7NqrolIZcT8wtK5r
 5oLTecbHLDWHKMTTmMwPH0DCmYJS9YVLE8mZGpHnPGIgusyM2CgJ/3xsn5LEusidZb
 vLIkqxb/BTs7rP3dsJrRG6wTlnh0myi9DALFNIm4uwTqGpBb9oodI6RU77gGtKGncU
 R3learYvsoS+A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=niXWPRKM
Subject: Re: [Buildroot] [PATCH v2 3/4] package/python-sdbus-networkmanager:
 new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UmFwaGHDq2wsIEFsbCwKCk9uIDIwMjQtMDktMTYgMTM6MTcgKzAyMDAsIFlhbm4gRS4gTU9SSU4g
c3Bha2UgdGh1c2x5Ogo+IFJhcGhhw6tsLCBBbGwsCj4gCj4gT24gMjAyNC0wNy0wNSAxMToxNCAr
MDIwMCwgUmFwaGHDq2wgTcOpbG90dGUgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxvdHRlQG1pbmQuYmU+
ClstLVNOSVAtLV0KPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFlUSE9OX1NEQlVTX05FVFdPUktN
QU5BR0VSCj4gPiArCWJvb2wgInB5dGhvbi1zZGJ1cy1uZXR3b3JrbWFuYWdlciIKPiA+ICsJZGVw
ZW5kcyBvbiBCUjJfUEFDS0FHRV9ORVRXT1JLX01BTkFHRVIgIyBydW50aW1lCj4gPiArCXNlbGVj
dCBCUjJfUEFDS0FHRV9QWVRIT05fU0RCVVMgIyBydW50aW1lCj4gWW91IGZvcmdvdCB0byBwcm9w
YWdhdGUgdGhlIGRlcGVuZGVuY2llcyBmcm9tIHB5dHJob24tc2RidXMuCgpJIGdvdCBib3JlZCB3
aGlsZSB3YWl0aW5nIGF0IHRoZSBhaXJwb3J0LCBzbyBJIGZpeGVkIGl0IHdoaWxlIGFwcGx5aW5n
LgoKPiA+ICsJaGVscAo+ID4gKwkgIE5ldHdvcmtNYW5hZ2VyIGJpbmRzIGZvciBzZGJ1cy4KPiBz
L2JpbmRzL2JpbmRpbmdzLwoKRGFtbmVkLCBJIG1pc3NlZCBmaXhpbmcgdGhhdCBvbmUuIEknbGwg
cHVzaCBhIGZvbGxvd3VwIGNvbW1pdCwgc29ycnkgZm9yCnRoZSBtZXNzLi4uCgo+ID4gKwkgIGh0
dHBzOi8vZ2l0aHViLmNvbS9pZ285NTg2Mi9weXRob24tc2RidXMKPiA+ICsKPiA+ICtjb21tZW50
ICJweXRob24tc2RidXMtbmV0d29ya21hbmFnZXIgbmVlZHMgbmV0d29yay1tYW5hZ2VyIgo+ID4g
KwlkZXBlbmRzIG9uICFCUjJfUEFDS0FHRV9ORVRXT1JLX01BTkFHRVIKPiBZb3UnbGwgYWxzcG8g
bmVlZCB0byB1cGRhdGUgdGhlIGRlcGVuZGVuY2llcyBsaXN0IG9mIHRoZSBjb21tZW50LgoKQXBw
bGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgotLSAKLi0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRk
ZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3
NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAg
ICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAg
QUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEt
Z2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4g
IHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRy
b290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWls
ZHJvb3QK
