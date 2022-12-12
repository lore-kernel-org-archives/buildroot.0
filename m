Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FC8AC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 19:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F7381831;
	Mon, 12 Dec 2022 19:47:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F7381831
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hJbeTtHTg0Ac; Mon, 12 Dec 2022 19:47:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E42D817E4;
	Mon, 12 Dec 2022 19:47:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6E42D817E4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A148F1BF35E
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8950F60E40
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 19:47:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8950F60E40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UkOI2S46xZQH for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 19:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 248B060E2A
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 248B060E2A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 19:46:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed9d:5312:e657:8b79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id B73C12003D0;
 Mon, 12 Dec 2022 20:46:51 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 12 Dec 2022 20:46:51 +0100
Date: Mon, 12 Dec 2022 20:46:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221212194651.GA1807803@scaer>
References: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221212172724.4364-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670874416;
 bh=lQ0To9MmeIL0TigG6lOzK3alxiDjWRENpt4ddbYtDiE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W+Se8pDWk5TcXb1uWAoBvtOlQs7IMcP5j7+k0ZvJlb86HgrI/fxI7el6pLTmzQs7M
 kLmUo1FZnGrxUlWD8kxp/l265ysyOFt1SgEtxSc1hQrdNINeaq3sxpTsG6XXKyAiBB
 Q03cyRUXFIvthXxhKlVnl4OdKTSYSqLs3LRDT7Id5AfN2uLP6L/F0Dul0lAij7vbMc
 cPqft3dErLEnXz6BS0EKHJcCHl9F2idtWGVgodOg1IIHvOV9bDihKgfnQyBknoH1wC
 QmPKHg8++iJVAyP38mWAyQOAIs7jkjCufmW8DcEy/ljsevoPgoQXAbn2wSwo1371LI
 WgxFRAVG7Kewg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=W+Se8pDW
Subject: Re: [Buildroot] [PATCH 1/2] package/libmbim: fix license
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
Cc: Aleksander Morgado <aleksander@aleksander.es>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RmFicmljZSwgQWxsLAoKK1BldGVyIGZvciBiYWNrcG9ydHMKCk9uIDIwMjItMTItMTIgMTg6Mjcg
KzAxMDAsIEZhYnJpY2UgRm9udGFpbmUgc3Bha2UgdGh1c2x5Ogo+IGxpYm1iaW0gbGlicmFyeSBp
cyBsaWNlbnNlZCB1bmRlciBMR1BMLTIuMSsgc2luY2UgYXQgbGVhc3QgdmVyc2lvbiAxLjguMAo+
IGFuZAo+IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5kL2xp
Ym1iaW0vLS9jb21taXQvMjVjYzNlZDg4ZDI1YjE3YzE4ZmIzMmY0NmY5NmI1NjA4MzQzODdkMwo+
IAo+IFNpZ25lZC1vZmYtYnk6IEZhYnJpY2UgRm9udGFpbmUgPGZvbnRhaW5lLmZhYnJpY2VAZ21h
aWwuY29tPgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5rcy4KClRoYW5rcyBmb3IgbWFraW5nIHRo
YXQgYSBzZXBhcmF0ZSBwYXRjaCwgd2UgY2FuIGJhY2twb3J0IGl0IHRvIHN0YWJsZQpicmFuY2hl
cyEg8J+RjQoKUmVnYXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvbGlibWJp
bS9saWJtYmltLm1rIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtYmltL2xpYm1iaW0ubWsg
Yi9wYWNrYWdlL2xpYm1iaW0vbGlibWJpbS5tawo+IGluZGV4IDFjMTJiODIyOTguLmU3MjhjZjU4
ZjkgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9saWJtYmltL2xpYm1iaW0ubWsKPiArKysgYi9wYWNr
YWdlL2xpYm1iaW0vbGlibWJpbS5tawo+IEBAIC02LDcgKzYsNyBAQAo+ICAKPiAgTElCTUJJTV9W
RVJTSU9OID0gMS4yOC4yCj4gIExJQk1CSU1fU0lURSA9IGh0dHBzOi8vZ2l0bGFiLmZyZWVkZXNr
dG9wLm9yZy9tb2JpbGUtYnJvYWRiYW5kL2xpYm1iaW0vLS9hcmNoaXZlLyQoTElCTUJJTV9WRVJT
SU9OKQo+IC1MSUJNQklNX0xJQ0VOU0UgPSBMR1BMLTIuMCsgKGxpYnJhcnkpLCBHUEwtMi4wKyAo
cHJvZ3JhbXMpCj4gK0xJQk1CSU1fTElDRU5TRSA9IExHUEwtMi4xKyAobGlicmFyeSksIEdQTC0y
LjArIChwcm9ncmFtcykKPiAgTElCTUJJTV9MSUNFTlNFX0ZJTEVTID0gQ09QWUlORyBDT1BZSU5H
LkxJQgo+ICBMSUJNQklNX0NQRV9JRF9WRU5ET1IgPSBmcmVlZGVza3RvcAo+ICBMSUJNQklNX0lO
U1RBTExfU1RBR0lORyA9IFlFUwo+IC0tIAo+IDIuMzUuMQo+IAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0t
LS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAg
WWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwg
RXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWdu
ZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5
OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhl
cmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwg
SFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0t
LScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
