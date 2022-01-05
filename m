Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51D5FC433EF
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 20:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAC3983281;
	Wed,  5 Jan 2022 20:37:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hFAqwsjUbqa8; Wed,  5 Jan 2022 20:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3725C83267;
	Wed,  5 Jan 2022 20:37:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 952D91BF407
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:37:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 841A040994
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 20:37:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ywrKavq-B7Di for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 20:37:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3790F408D0
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 20:37:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:91d2:d1c6:5626:51cd])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0745D7802CE;
 Wed,  5 Jan 2022 21:37:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641415050;
 bh=P3juFT48TUfo15OVsGRl3dATUGs1zhPvy0HsFjCiMeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iE58tsNcqzzL+drIw8Y2ncP3Tb2SJLKjQ4WIUfE5wLUdAkFrD6HZyaXrgVM4IEZOV
 kjKDZPcLHhaPVWPyLgQanPT+0wO08J/FN/FJetZJGQ1Xvqrx5A/g31xBcKjQj+Ydla
 D0jByHhp3ZzKsLPvSw77NiEHnWqSdoXF+iRuhp89XzOaLiyZ4IFxceL/38MMsE8USn
 4j5cwOHp8v/tf4U96VL85TzTRduRV+ExdWjDalX3krx1R/JLVRX/jG8zPRDJbfhDqW
 yKFm3gAzUyULePfsuMkk7U0CWa/XcywiQb5wmo3WsvNRmT6sKZVOGzesPdf67R0STF
 PBFxSG2EkqeTQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 05 Jan 2022 21:37:27 +0100
Date: Wed, 5 Jan 2022 21:37:27 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ignacy =?utf-8?B?R2F3xJlkemtp?= <ignacy.gawedzki@green-communications.fr>
Message-ID: <20220105203727.GH614810@scaer>
References: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211215173432.r75invoe3ff6mthg@zenon.in.qult.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/fakedate: fix finding the right
 date executable
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SWduYWN5LCBBbGwsCgpPbiAyMDIxLTEyLTE1IDE4OjM0ICswMTAwLCBJZ25hY3kgR2F3xJlkemtp
IHNwYWtlIHRodXNseToKPiBJZiB0aGUgUEFUSCBpbml0aWFsbHkgY29udGFpbnMgaG9zdC9iaW4s
IHRoZW4gdGhlIHJpZ2h0IGRhdGUKPiBleGVjdXRhYmxlIGlzIHRvIGJlIGZvdW5kIGFmdGVyIHRo
ZSAqZmlyc3QqIG9jY3VycmVuY2Ugb2YgZmFrZWRhdGUgaW4KPiBub3JtYWwgKGZvcndhcmQpIFBB
VEggb3JkZXIuICBGaXggdGhlIHdyYXBwZXIgc28gdGhhdCB0aGF0IGZpcnN0Cj4gb2NjdXJyZW5j
ZSBpcyBmb3VuZCBpbmRlZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogSWduYWN5IEdhd8SZZHpraSA8
aWduYWN5Lmdhd2VkemtpQGdyZWVuLWNvbW11bmljYXRpb25zLmZyPgoKQWZ0ZXIgZGlzY3Vzc2lu
ZyB0aGlzIHdpdGggQXJub3V0IGFuZCBUaG9tYXMsIHdlIGNvbmNsdWRlZCB0aGF0IEFybm91dCdz
CnByb3Bvc2FsLCB3aXRoIG15IGx0aWxlIGFtZW5kbWVudCwgd2FzIHRoZSBwcm9wZXIgc29sdXRp
b24uIEV4Y2VwdCB0aGF0CnRoZSBsb29wIGhhZCB0byBiZSBicm9rZW4gb24gZmlyc3QgaGl0LCBv
ZiBjb3Vyc2UsIHNvIEkgYWRkZWQgdGhlIHByb3BlcgpicmVhay4KCkkgYWxzbyBhZGRlZCBhIHRl
c3QgdGhhdCB3ZSBhY3R1YWxseSBkaWQgZmluZCBhIGRhdGUgZXhlY3V0YWJsZS4KCk9mIGNvdXJz
ZSwgaWYgd2UgbWlzc2VkIHNvbWV0aGluZywgdGhlbiBmZWVsIGZyZWUgdG8geWVsIGJhY2shIDst
KQoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+
IC0tLQo+ICBwYWNrYWdlL2Zha2VkYXRlL2Zha2VkYXRlIHwgOSArKysrKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9mYWtlZGF0ZS9mYWtlZGF0ZSBiL3BhY2thZ2UvZmFrZWRhdGUvZmFrZWRhdGUK
PiBpbmRleCA5YmVmMTEzMzU3Li4wM2E0ZjA0MDc5IDEwMDc1NQo+IC0tLSBhL3BhY2thZ2UvZmFr
ZWRhdGUvZmFrZWRhdGUKPiArKysgYi9wYWNrYWdlL2Zha2VkYXRlL2Zha2VkYXRlCj4gQEAgLTIx
LDEzICsyMSwxOCBAQAo+ICBEQVRFX0JJTj1mYWxzZQo+ICAjIERvIG5vdCBjYWxsIGFueSAnZGF0
ZScgYmVmb3JlIHVzIGluIHRoZSBQQVRILCBvciB0aGF0IHdvdWxkIGNyZWF0ZQo+ICAjIGFuIGlu
ZmluaXRlIHJlY3Vyc2lvbi4KPiArbGFzdF9kYXRlPWZhbHNlCj4gIGZvciBkYXRlIGluICQod2hp
Y2ggLWEgZGF0ZSB8dGFjKTsgZG8KPiAgICAgIGlmIFsgIiR7ZGF0ZX0iIC1lZiAiJDAiIF07IHRo
ZW4KPiAtICAgICAgICBicmVhawo+ICsJREFURV9CSU49JGxhc3RfZGF0ZQo+ICAgICAgZmkKPiAt
ICAgIERBVEVfQklOPSIke2RhdGV9Igo+ICsgICAgbGFzdF9kYXRlPSIke2RhdGV9Igo+ICBkb25l
Cj4gIAo+ICtpZiBbICIkREFURV9CSU4iID0gZmFsc2UgXTsgdGhlbgo+ICsgICAgREFURV9CSU49
JGxhc3RfZGF0ZQo+ICtmaQo+ICsKPiAgaWYgWyAtbiAiJFNPVVJDRV9EQVRFX0VQT0NIIiBdOyB0
aGVuCj4gICAgICBGT1JDRV9FUE9DSD0xCj4gICAgICBmb3IgaSBpbiAiJEAiOyBkbwo+IC0tIAo+
IDIuMzIuMAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
