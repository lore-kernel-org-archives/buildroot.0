Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C33C52D7C
	for <buildroot@archiver.kernel.org>; Tue, 13 Aug 2024 13:54:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A1C5780B0D;
	Tue, 13 Aug 2024 13:54:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2P8KFI0svKXp; Tue, 13 Aug 2024 13:54:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF9D681980
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF9D681980;
	Tue, 13 Aug 2024 13:54:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2B6321BF275
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 13:54:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 17CA340395
 for <buildroot@lists.busybox.net>; Tue, 13 Aug 2024 13:54:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I0C6i1VVVWDL for <buildroot@lists.busybox.net>;
 Tue, 13 Aug 2024 13:54:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4EC0140471
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EC0140471
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4EC0140471
 for <buildroot@buildroot.org>; Tue, 13 Aug 2024 13:54:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.116.209]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N95eJ-1s9OXr1Ki7-014rYm; Tue, 13
 Aug 2024 15:54:04 +0200
Message-ID: <e0ee0dca-132f-4f29-93ed-e272b6767867@gmx.de>
Date: Tue, 13 Aug 2024 15:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: buildroot@buildroot.org, =?UTF-8?Q?Jos=C3=A9_Mendes?=
 <jp.baltazar.mendes@gmail.com>
References: <CAFAK9+dq5Sru4npWX=u1P3y70a5bveavSLRhBoB-6r7wZZyg7A@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CAFAK9+dq5Sru4npWX=u1P3y70a5bveavSLRhBoB-6r7wZZyg7A@mail.gmail.com>
X-Provags-ID: V03:K1:AAqrlW7yBYrORqGSyO4upQzz/4IznhwMOkoOOmmLs3xPoHkle0B
 HVepFlDa1l5Ixx/oNCyYFZjy+OKhCVOr5+KQCELoDiPhcTAqUjkO3CXbSLUZOCd50DYw9Vb
 2QqevrGKLu1rz/1t9izjWjE4+QqYCkyBHO1dCn2xYc+sWscKhiVkQ2Wmtu3/tdce8aXMn7Y
 3odtPrjpvJiAMR7HyOfyg==
UI-OutboundReport: notjunk:1;M01:P0:V4ELtc4afXM=;qxLThyveQiOJqFgsV8abzX6maQ4
 xoAeyMcJFr6l0ctOp06yIpRyutBDm/vI/O6N8gBUya5MQpxQjw3emhVMSL3zVsxy3ZR08hnnY
 lz5Qn24hW4j9FMU/m2YdM6wx5VcW6SD58dtVmSrlHOiUvl6or7pimYWIwhj7Xx4KW+uVVCNik
 utOCAsCHsNBS0Y3Al/t3GnW3Rr2JvpfSzQEy2kaWAW4zx2kjlBhl+f9ru2KNSSJnJwso0fOTX
 BBZzN815x3UYKurkcW+R2mg4+1D0tx9ffQwgWKIG9o3yPv599+AxItUeA51Tax1LIVbcURcLW
 tSCWr6eH+fC+W8NquP7kW77TSpD684V7V5Kj6XaXuq7fudcHfiokU8NiICPdgzt8qUYJWISNi
 YaYz1Cw1oCQum8sz0vp2PCVZsFkQaEW2mXpG5iNQDkVKKCyKIgAWndWDp95qTB/PBHgs7trnh
 VBIdOc/i6M00zebIsrAjtnYlUZQ/iQ5KerSuT2ugBPnBa/0yb6ehvr3z75GiN6H1xcGbSY1HQ
 p9wz5ld3OT3jfVYLbRqtaXhiVZk0Qv1R2VAwNdMCWqgpatg0AU5fXAXBMkrA7pgThbFHoL2Og
 ct3IP0ywhN66HHjcXQJbUrm8JjJktWHITUalZXCdORIChelnzEIXnIEMpJ6xEIq4i0YxiPNBP
 55whQ/NWxuU1ccO5v5v6HaVY/YcqFKeLAxXc0B3RVaR5d2fiWDADiOxw3Lu8S2PEmO9oIIg2h
 Ok5M3y6IEM3hPFYTeAFYdbFINFkWE0MizbyTD/i/vRYVvwnDljCFiFR8CYcD2Raqi89UFVdZ5
 9EV1/mPlpYvHQhUhkVyeClhw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1723557244; x=1724162044; i=fiona.klute@gmx.de;
 bh=zNxJZ0aZR1ijsIl2SeuQ2jKLRQJ3KX2GV3H4GfGH848=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=AlN0qltSP5a+Y89FVE4+KLdT2XKQRIF82vDZdMZ+YlQTuV16tVO9sPKPIUpXikP3
 CnVEwfU86FIuN7iLt3dEI/X2TwpfORRuJIxlE1NLEXfB+LAbjQoBaFftbPax4JSSb
 nv3KgUIPbi+FErOn6fidmiy9b7MyL1elfdljL4g2jpjmxhTMDL34G6vZQEbVHuhie
 Me5GJXwfWbC0DIG4DTpXeYYAvZSflgiD4jY/smgzu/fB5TGW1zBuxZxtVgkByClSs
 ugF8MT+1S7G827kJcYKnESNd9zdCTjXo3pvkrJfLFDqV0nlZZdMrIA2DMxnzO65E0
 lfgA6UbUHrEBBWbTyA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=AlN0qltS
Subject: Re: [Buildroot] Raspberry Pi SPL
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSm9zw6khCgpBbSAxMy4wOC4yNCB1bSAxMToyMSBzY2hyaWViIEpvc8OpIE1lbmRlczoKPiBI
aSBhbGwsCj4KPiBJJ20gdHJ5aW5nIHRvIGFkZCBTUEwgYW5kIGtlcm5lbCByZWR1bmRhbmN5IHRv
IG15IHN5c3RlbS4gQ3VycmVudGx5IHRoZQo+IHN5c3RlbSBhbHJlYWR5IGhhcyByb290IGZpbGUg
c3lzdGVtIHJlZHVuZGFuY3kgYnV0IFNQTCBzZWVtcyBoYXJkZXIuCj4KPiBUaGUgY3VycmVudCBw
YXJ0aXRpb24gbGF5b3V0IGlzIHRoZSBmb2xsb3dpbmc6Cj4KPiB8IFUtQm9vdCArIEltYWdlICsg
cnBpX2Zpcm13YXJlIHwgUm9vdGZzQSB8IFJvb3Rmc0IgfCBEYXRhIHBhcnRpdGlvbiB8Cj4KPiBJ
biBteSBtaW5kIHRoZXJlIGFyZSAyIHdheXMgb2YgZG9pbmcgdGhpczoKPgo+IEVpdGhlciBVLUJv
b3QgaXMgbW92ZWQgdG8gaXRzIG93biBwYXJ0aXRpb24gYW5kIEkgaGF2ZSB0aGUgSW1hZ2UgYW5k
Cj4gcnBpX2Zpcm13YXJlIGluIGl0cyBvd24gcGxhY2UuCgpXaGF0IHBhcnRzIG9mIHJwaS1maXJt
d2FyZSBhcmUgeW91IHVzaW5nIGhlcmU/IERUQi9vdmVybGF5cz8gRmlybXdhcmUKZm9yIHRoZSBr
ZXJuZWw/IFRoZSBsYXR0ZXIgZ29lcyBpbnRvIHRoZSByb290ZnMgYW55d2F5LgoKPiB8IFUtQm9v
dCB8IEltYWdlICsgcnBpIEEgfCBJbWFnZSArIHJwaSBCIHwgUm9vdGZzQSB8IFJvb3Rmc0IgfCBE
YXRhCj4gcGFydGl0aW9uIHwKPgo+IE9yIEkgaGF2ZSBhbiBhY3R1YWwgc2VwYXJhdGUgdW5pdCB0
aGF0IGNhbiBzZWxlY3RpdmVseSBib290IGEga2VybmVsIC8gcnVuCj4gYSBCb290bG9hZGVyOgo+
Cj4gfCBTUEwgfCBVLUJvb3QgKyBJbWFnZSArIHJwaSBBIHwgVS1Cb290ICsgSW1hZ2UgKyBycGkg
QiB8IFJvb3Rmc0EgfAo+IFJvb3Rmc0IgfCBEYXRhIHBhcnRpdGlvbiB8Cj4KPiBLZWVwIGluIG1p
bmQgSSBoYXZlIG5vIGlkZWEgaG93IHRvIGRvIGVpdGhlciBvZiB0aGVzZSBhcyBJJ20gc3RpbGwg
cXVpdGUKPiB1bmZhbWlsaWFyIHdpdGggdGhlIGFjdHVhbCBsb3cgbGV2ZWwgYm9vdGluZyBpbnRy
aWNhY2llcy4KQXMgZm9yIGtlcm5lbC9EVEI6IFlvdSdyZSB1c2luZyBVLUJvb3QsIHNvIGFzc3Vt
aW5nIHlvdSB3YW50IHRvIHVwZGF0ZQprZXJuZWwgYW5kIHJvb3RmcyB0b2dldGhlciB0aGUgZWFz
aWVzdCB3YXkgbWF5IGJlIHdoYXQgSSdtIGRvaW5nOiBVc2UgYQpGSVQgaW1hZ2UgWzFdIHRoYXQg
aG9sZHMgYm90aCB0aGUga2VybmVsLCBEVEIsIGFuZCBhbnkgb3ZlcmxheXMgeW91Cm5lZWQsIGFu
ZCBpbmNsdWRlIHRoYXQgaW4gdGhlIHJvb3Rmcy4gVGhlbiBjb25maWd1cmUgVS1Cb290IHRvIGxv
YWQgdGhlCkZJVCBpbWFnZSBmcm9tIHRoZSBzZWxlY3RlZCByb290ZnMuCgpUaGVyZSdzIG9uZSBj
YXRjaDogVS1Cb290IGRvZXMgKm5vdCogc3VwcG9ydCBvdmVybGF5IHBhcmFtZXRlcnMgKHRob3Nl
CmFyZSBhbiBSUGkgdGhpbmcsIG5vdCBzdGFuZGFyZCkuIFlvdSBtYXkgaGF2ZSB0byByZXdyaXRl
IG92ZXJsYXlzIHRoYXQKdXNlIHBhcmFtZXRlcnMgZm9yIHRoaXMgYXBwcm9hY2ggKG9yIGNyZWF0
ZSBhIERUQiB0aGF0IGluY2x1ZGVzIGFueXRoaW5nCnlvdSdkIHVzZSBvdmVybGF5cyBmb3IpLgoK
SWYgeW91IHdhbnQgdG8gaGF2ZSByZWR1bmRhbnQgVS1Cb290IHRoYXQnbGwgcHJvYmFibHkgcmVx
dWlyZSB0aGUKInRyeWJvb3QiIGZlYXR1cmUgb2YgdGhlIFJQaSBib290bG9hZGVyLCBidXQgSSBo
YXZlbid0IHRyaWVkIHRoYXQgbXlzZWxmCnlldC4KCkJlc3QgcmVnYXJkcywKRmlvbmEKClsxXSBo
dHRwczovL2RvY3MudS1ib290Lm9yZy9lbi9sYXRlc3QvdXNhZ2UvZml0L2luZGV4Lmh0bWwKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
