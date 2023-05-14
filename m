Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6C6C77B7D
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 13:40:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF72C41B5E;
	Sun, 14 May 2023 13:40:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF72C41B5E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1sKtA6TGEJE1; Sun, 14 May 2023 13:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7357D4191A;
	Sun, 14 May 2023 13:40:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7357D4191A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D6191BF5A4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:40:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 73F2E60BE4
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 13:40:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 73F2E60BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fiM2XX9ixXb2 for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 13:40:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243AD60BDE
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 243AD60BDE
 for <buildroot@buildroot.org>; Sun, 14 May 2023 13:40:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 37E25B0056B;
 Sun, 14 May 2023 15:39:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 15:39:55 +0200
Date: Sun, 14 May 2023 15:39:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?Q?S=C3=A9bastien?= Szymanski <sebastien.szymanski@armadeus.com>
Message-ID: <20230514133955.GD2582048@scaer>
References: <20230227102240.30064-1-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230227102240.30064-1-sebastien.szymanski@armadeus.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684071601;
 bh=b3i9X1c/e3BNOQ3sX2hd5aDPaRJAntfsO3nx8jV2Img=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPeN874atFSjsF46WdVARBAukt0aA7M1rZ3Y3kvnvhzmPESVfE9tu5Ek3zkB8djAi
 rfa88KcIQ4tn4FimPni2lE4RZ8DRYcyQ7dP19eH1s+pcngOJWhihQ3M3L5/SfFlKBE
 ZUX3pBuoEMSxSYsNN1OYKG6suPoPxmrAUgTmF9W3NCTCcpFi2J6Mg3jt+Gtv7i91EJ
 55/qQsyZtRwy+d64FMKpQTZBsDNo9Q3oEoigY7sZ76fEOujxhJnFK+9+lU3O9Mcvhx
 aFJLsh1BdiF9Uu0kmFuVXlyqH0tmN8P8cDt+KEKdjCcoyuQRsEWacuTYIBSNR+gXaq
 Ehf5u6mkZsEwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZPeN874a
Subject: Re: [Buildroot] [PATCH 1/1] package/glmark2: bump to version 2023.01
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

U8OpYmFzdGllbiwgQWxsLAoKT24gMjAyMy0wMi0yNyAxMToyMiArMDEwMCwgU8OpYmFzdGllbiBT
enltYW5za2kgc3Bha2UgdGh1c2x5Ogo+IENvbnZlcnQgdGhlIHBhY2thZ2UgdG8gYSBtZXNvbiBw
YWNrYWdlIGFzIHJlY29tbWFuZGVkIGJ5IHVwc3RyZWFtLgo+IERyb3Agbm8gbW9yZSBuZWVkZWQg
cGF0Y2hzLgo+IAo+IEZpeGVzOiBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0
cy9iMzIvYjMyNDVjNGVlOGUwYjM1OTJiMDllMGJjNTdiYzA5MjgwMTg5MzZjMgo+IFNpZ25lZC1v
ZmYtYnk6IFPDqWJhc3RpZW4gU3p5bWFuc2tpIDxzZWJhc3RpZW4uc3p5bWFuc2tpQGFybWFkZXVz
LmNvbT4KPiAtLS0KWy0tU05JUC0tXQo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2dsbWFyazIvZ2xt
YXJrMi5tayBiL3BhY2thZ2UvZ2xtYXJrMi9nbG1hcmsyLm1rCj4gaW5kZXggYmFjOWQ5ZmY2ZmMy
Li4wZmM0NjZhZmYzN2UgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9nbG1hcmsyL2dsbWFyazIubWsK
PiArKysgYi9wYWNrYWdlL2dsbWFyazIvZ2xtYXJrMi5tawo+IEBAIC00LDE1ICs0LDEyIEBACj4g
ICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLUdMTUFSSzJfVkVSU0lPTiA9IDA2
ZTc4YjY3NzAyYjU0MTMzMzVlY2RmMWFlODE2ZGE5YzIwZjZlZDkKPiArR0xNQVJLMl9WRVJTSU9O
ID0gMjAyMy4wMQo+ICBHTE1BUksyX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGdsbWFyazIsZ2xtYXJr
MiwkKEdMTUFSSzJfVkVSU0lPTikpCj4gIEdMTUFSSzJfTElDRU5TRSA9IEdQTC0zLjArLCBTR0l2
MQo+ICBHTE1BUksyX0xJQ0VOU0VfRklMRVMgPSBDT1BZSU5HIENPUFlJTkcuU0dJCj4gIEdMTUFS
SzJfREVQRU5ERU5DSUVTID0gaG9zdC1wa2djb25mIGpwZWcgbGliZWdsIGxpYnBuZwo+ICAKPiAt
IyBUaGUgYnVuZGxlZCB3YWYgc2NyaXB0IGlzIHRvbyBvbGQgZm9yID49IHB5dGhvbjMuMTEKPiAt
R0xNQVJLMl9ORUVEU19FWFRFUk5BTF9XQUYgPSBZRVMKPiAtCj4gIGlmZXEgKCQoQlIyX1BBQ0tB
R0VfR0xNQVJLMl9GTEFWT1JfRFJNX0dMRVNWMikseSkKPiAgR0xNQVJLMl9ERVBFTkRFTkNJRVMg
Kz0gbGliZHJtIGxpYmdibSBsaWJnbGVzIHVkZXYKPiAgR0xNQVJLMl9GTEFWT1JTICs9IGRybS1n
bGVzdjIKPiBAQCAtNDQsNyArNDEsNyBAQCBHTE1BUksyX0ZMQVZPUlMgKz0gd2F5bGFuZC1nbAo+
ICBlbmRpZgo+ICAKPiAgR0xNQVJLMl9DT05GX09QVFMgKz0gXAo+IC0JLS1wcmVmaXg9L3VzciBc
Cj4gLQktLXdpdGgtZmxhdm9ycz0kKHN1YnN0ICQoc3BhY2UpLCQoY29tbWEpLCQoR0xNQVJLMl9G
TEFWT1JTKSkKPiArCS1EZmxhdm9ycz0kKHN1YnN0ICQoc3BhY2UpLCQoY29tbWEpLCQoR0xNQVJL
Ml9GTEFWT1JTKSkgXAo+ICsJLS1wcmVmaXg9L3VzcgoKLS1wcmVmaXg9L3VzciBpcyBhbHJlYWR5
IHBhc3NlZCBieSB0aGUgbWVzb24tcGFja2FnZSBpbmZyYSwgc28gSSBkcm9wcGVkCnRoYXQsIGFu
ZCBtYWRlIHRoZSBhc3NpZ25tZW50IGEgc2luZ2xlLWxpbmUsIHNpbXBsZSBhc3NpZ25tZW50LgoK
QXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0k
KGV2YWwgJCh3YWYtcGFja2FnZSkpCj4gKyQoZXZhbCAkKG1lc29uLXBhY2thZ2UpKQo+IC0tIAo+
IDIuMzkuMgo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cgot
LSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0t
LS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUg
RW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMg
NjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9f
XyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0t
OiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmlu
LmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3Bp
cmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
