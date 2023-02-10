Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7949C636D4
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 23:18:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F1AF415BA;
	Fri, 10 Feb 2023 23:18:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F1AF415BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j2hu8B-94Ek4; Fri, 10 Feb 2023 23:18:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B8BA415B4;
	Fri, 10 Feb 2023 23:18:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B8BA415B4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 512051BF473
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:18:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28F7940320
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 23:18:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 28F7940320
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W4-5GnYwc863 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 23:18:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3E384030B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3E384030B
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 23:18:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 49DD45FF96;
 Sat, 11 Feb 2023 00:18:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 11 Feb 2023 00:18:16 +0100
Date: Sat, 11 Feb 2023 00:18:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230210231816.GB2796@scaer>
References: <20220925192030.1648496-1-thomas.petazzoni@bootlin.com>
 <eaaa6d53-ad35-8cf8-7823-0874b268fa88@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <eaaa6d53-ad35-8cf8-7823-0874b268fa88@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1676071102;
 bh=eUCmR7KeaSYF2VO53MHEUYCD2axy5S0e04xWnFQVgZs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g66vgYxFr0G6uJ7jzAD3fMhYXh7uRlfaNtA3mhKG6moVTVTeqN0cD2vdSvxBDL6Nd
 +K4WUam8D/QH3PO08sIu+aTeVhWkCElINHtZjSIcxuo3U6+w6hNaJ2biMr8k52zLaU
 91KjOq/bFofrkUNW//QhxQoXCor9mf895eFzLduHsVxMM8nttKQIi+l+dQgz6HNXTS
 E2gK94Zmfhw99S7Qu80mIALccaXqpgoiQUPOQk5ZNrUiI5N6ewHWl+ybNKOJz+sO28
 XCxXjWhUY5AmUfRKqXckGkJ7LCReteY6DvZj5TYhp7z1F+8vIn7dRgKXshLpTIullY
 ZpSGz9zJdggig==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g66vgYxF
Subject: Re: [Buildroot] [PATCH v2 1/2] package/nodejs: add patch to adjust
 default NodeJS search path
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
Cc: Martin Bark <martin@barkynet.com>, Daniel Price <daniel.price@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzLCBBbGwsCgpPbiAyMDIzLTAyLTA4IDE0OjUxICswMTAwLCBSb21haW4gTmFvdXIgc3Bh
a2UgdGh1c2x5Ogo+IExlIDI1LzA5LzIwMjIgw6AgMjE6MjAsIFRob21hcyBQZXRhenpvbmkgYSDD
qWNyaXTCoDoKPiA+IEJ5IGRlZmF1bHQsIE5vZGVKUyBzZWFyY2hlcyBnbG9iYWwgbW9kdWxlcyBp
biAvdXNyL2xpYi9ub2RlLCBidXQgTlBNCj4gPiBpbnN0YWxscyB0aGVtIGluIC91c3IvbGliL25v
ZGVfbW9kdWxlcy8uIFRoZXJlZm9yZSBieSBkZWZhdWx0LCBpZiBvbmUKPiA+IGluc3RhbGxzIG1v
ZHVsZXMgd2l0aCBCUjJfUEFDS0FHRV9OT0RFSlNfTU9EVUxFU19BRERJVElPTkFMLCB0aGV5IGFy
ZQo+ID4gbm90IGFjY2Vzc2libGUgYnkgTm9kZUpTLCB1bmxlc3MgYnkgcGFzc2luZyBhCj4gPiBO
T0RFX1BBVEg9L3Vzci9saWIvbm9kZV9tb2R1bGVzLyB2YXJpYWJsZS4gU2luY2UgdGhpcyBpcyBu
b3Qgb2J2aW91cywKPiA+IGFuZCBpdCdzIG5pY2VyIHdoZW4gdGhpbmdzIHdvcmsgb3V0IG9mIHRo
ZSBib3gsIHdlIHNpbXBseSBwYXRjaCBOb2RlSlMKPiA+IHRvIGxvb2sgZm9yIG1vZHVsZXMgYXQg
dGhlIHJpZ2h0IHBsYWNlLgo+ID4gCj4gPiBTZWUKPiA+IGh0dHBzOi8vc3RhY2tvdmVyZmxvdy5j
b20vcXVlc3Rpb25zLzE1NjM2MzY3L25vZGVqcy1yZXF1aXJlLWEtZ2xvYmFsLW1vZHVsZS1wYWNr
YWdlCj4gPiBmb3Igc29tZSBkaXNjdXNzaW9ucyBvbiB0aGlzIHRvcGljLgo+IAo+IE5vdGU6IFRo
ZSBub2RlanMgcGFja2FnZSBoYXMgYmVlbiB1cGRhdGUgdG8gMTYuMTguMSBzaW5jZSB5b3VyIHYy
IG9mIG5vZGVqcyBzZXJpZXMuCj4gCj4gUmV2aWV3ZWQtYnk6IFJvbWFpbiBOYW91ciA8cm9tYWlu
Lm5hb3VyQHNtaWxlLmZyPgoKSSBjb3VsZCBub3QgZmluZCB0aGUgb3JpZ2luYWwgcGF0Y2ggaW4g
bXkgbWFpbGJveCwgc28gSSdsbCByZXBseSBoZXJlOgoKQXBwbGllZCB0byBtYXN0ZXIsIHRoYW5r
cy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IEJlc3QgcmVnYXJkcywKPiBSb21haW4KPiAK
PiAKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFBldGF6em9uaSA8dGhvbWFzLnBldGF6
em9uaUBib290bGluLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBzaW5jZSB2MToKPiA+IC0gU2Vh
cmNoIGZvciBib3RoIC91c3IvbGliL25vZGUgYW5kIC91c3IvbGliL25vZGVfbW9kdWxlcyBhcyBz
dWdnZXN0ZWQKPiA+ICAgYnkgWWFubgo+ID4gLS0tCj4gPiAgLi4udWxlcy1janMtbG9hZGVyLmpz
LWFkanVzdC1kZWZhdWx0LXBhLnBhdGNoIHwgMzYgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBh
Y2thZ2Uvbm9kZWpzLzAwMDQtbGliLWludGVybmFsLW1vZHVsZXMtY2pzLWxvYWRlci5qcy1hZGp1
c3QtZGVmYXVsdC1wYS5wYXRjaAo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMv
MDAwNC1saWItaW50ZXJuYWwtbW9kdWxlcy1janMtbG9hZGVyLmpzLWFkanVzdC1kZWZhdWx0LXBh
LnBhdGNoIGIvcGFja2FnZS9ub2RlanMvMDAwNC1saWItaW50ZXJuYWwtbW9kdWxlcy1janMtbG9h
ZGVyLmpzLWFkanVzdC1kZWZhdWx0LXBhLnBhdGNoCj4gPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+
ID4gaW5kZXggMDAwMDAwMDAwMC4uNWI5Mzk5OGU1ZQo+ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysr
IGIvcGFja2FnZS9ub2RlanMvMDAwNC1saWItaW50ZXJuYWwtbW9kdWxlcy1janMtbG9hZGVyLmpz
LWFkanVzdC1kZWZhdWx0LXBhLnBhdGNoCj4gPiBAQCAtMCwwICsxLDM2IEBACj4gPiArRnJvbSBh
MzE0MjViZGZjYjVkNjk1YWIyNWMzZDI5NTg5ODMyNjc4NGNmZmVjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQo+ID4gK0Zyb206IFRob21hcyBQZXRhenpvbmkgPHRob21hcy5wZXRhenpvbmlAYm9v
dGxpbi5jb20+Cj4gPiArRGF0ZTogU3VuLCAyNSBTZXAgMjAyMiAxMToxMDowNiArMDIwMAo+ID4g
K1N1YmplY3Q6IFtQQVRDSF0gbGliL2ludGVybmFsL21vZHVsZXMvY2pzL2xvYWRlci5qczogYWRq
dXN0IGRlZmF1bHQgcGF0aCB0bwo+ID4gKyBzZWFyY2ggbW9kdWxlcwo+ID4gKwo+ID4gK05QTSBp
bnN0YWxscyBtb2R1bGVzIGluIC91c3IvbGliL25vZGVfbW9kdWxlcy8sIGJ1dCBieSBkZWZhdWx0
IE5vZGVKUwo+ID4gK3NlYXJjaGVzIGZvciB0aGVtIG9ubHkgaW4gL3Vzci9saWIvbm9kZS8uIFdl
IGNvdWxkIGFsc28gc2V0IHRoZQo+ID4gK05PREVfUEFUSCBlbnZpcm9ubWVudCB2YXJpYWJsZSwg
YnV0IGl0IGlzIG1vcmUgY29udmllbmllbnQgdG8gaGF2ZQo+ID4gK05vZGVKUyBjb25maWd1cmVk
IGJ5IGRlZmF1bHQgdG8gZmluZCBtb2R1bGVzIHdoZXJlIHRoZXkgYXJlIGluc3RhbGxlZC4KPiA+
ICsKPiA+ICtUaGlzIGlzc3VlIGlzIGRpc2N1c3NlZCBhdAo+ID4gK2h0dHBzOi8vc3RhY2tvdmVy
Zmxvdy5jb20vcXVlc3Rpb25zLzE1NjM2MzY3L25vZGVqcy1yZXF1aXJlLWEtZ2xvYmFsLW1vZHVs
ZS1wYWNrYWdlLgo+ID4gKwo+ID4gK1NpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRo
b21hcy5wZXRhenpvbmlAYm9vdGxpbi5jb20+Cj4gPiArLS0tCj4gPiArIGxpYi9pbnRlcm5hbC9t
b2R1bGVzL2Nqcy9sb2FkZXIuanMgfCAzICsrLQo+ID4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gPiArCj4gPiArZGlmZiAtLWdpdCBhL2xpYi9pbnRl
cm5hbC9tb2R1bGVzL2Nqcy9sb2FkZXIuanMgYi9saWIvaW50ZXJuYWwvbW9kdWxlcy9janMvbG9h
ZGVyLmpzCj4gPiAraW5kZXggZjE5NzFjNDBhNC4uNWZlMzg4NDE1NiAxMDA2NDQKPiA+ICstLS0g
YS9saWIvaW50ZXJuYWwvbW9kdWxlcy9janMvbG9hZGVyLmpzCj4gPiArKysrIGIvbGliL2ludGVy
bmFsL21vZHVsZXMvY2pzL2xvYWRlci5qcwo+ID4gK0BAIC0xMjYxLDcgKzEyNjEsOCBAQCBNb2R1
bGUuX2luaXRQYXRocyA9IGZ1bmN0aW9uKCkgewo+ID4gKyAgICAgcGF0aC5yZXNvbHZlKHByb2Nl
c3MuZXhlY1BhdGgsICcuLicpIDoKPiA+ICsgICAgIHBhdGgucmVzb2x2ZShwcm9jZXNzLmV4ZWNQ
YXRoLCAnLi4nLCAnLi4nKTsKPiA+ICsgCj4gPiArLSAgY29uc3QgcGF0aHMgPSBbcGF0aC5yZXNv
bHZlKHByZWZpeERpciwgJ2xpYicsICdub2RlJyldOwo+ID4gKysgIGNvbnN0IHBhdGhzID0gW3Bh
dGgucmVzb2x2ZShwcmVmaXhEaXIsICdsaWInLCAnbm9kZScpLAo+ID4gKysgICAgICAgICAgICAg
ICAgIHBhdGgucmVzb2x2ZShwcmVmaXhEaXIsICdsaWInLCAnbm9kZV9tb2R1bGVzJyldOwo+ID4g
KyAKPiA+ICsgICBpZiAoaG9tZURpcikgewo+ID4gKyAgICAgQXJyYXlQcm90b3R5cGVVbnNoaWZ0
KHBhdGhzLCBwYXRoLnJlc29sdmUoaG9tZURpciwgJy5ub2RlX2xpYnJhcmllcycpKTsKPiA+ICst
LSAKPiA+ICsyLjM3LjMKPiA+ICsKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2J1aWxkcm9vdAoKLS0gCi4tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4t
LS0tLS0tLS0tLS0tLS0tLS0uLS0tLS0tLS0tLS0tLS0tLS0tLS0uCnwgIFlhbm4gRS4gTU9SSU4g
IHwgUmVhbC1UaW1lIEVtYmVkZGVkIHwgLyJcIEFTQ0lJIFJJQkJPTiB8IEVyaWNzJyBjb25zcGly
YWN5OiB8CnwgKzMzIDY2MiAzNzYgMDU2IHwgU29mdHdhcmUgIERlc2lnbmVyIHwgXCAvIENBTVBB
SUdOICAgICB8ICBfX18gICAgICAgICAgICAgICB8CnwgKzMzIDU2MSAwOTkgNDI3IGAtLS0tLS0t
LS0tLS0uLS0tLS0tLTogIFggIEFHQUlOU1QgICAgICB8ICBcZS8gIFRoZXJlIGlzIG5vICB8Cnwg
aHR0cDovL3ltb3Jpbi5pcy1hLWdlZWsub3JnLyB8IF8vKlxfIHwgLyBcIEhUTUwgTUFJTCAgICB8
ICAgdiAgIGNvbnNwaXJhY3kuICB8CictLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS1eLS0t
LS0tLV4tLS0tLS0tLS0tLS0tLS0tLS1eLS0tLS0tLS0tLS0tLS0tLS0tLS0nCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
