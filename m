Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AECB1C3ABD8
	for <buildroot@archiver.kernel.org>; Fri, 16 May 2025 18:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6DC9761320;
	Fri, 16 May 2025 18:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jD0uqR7rDP2; Fri, 16 May 2025 18:00:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7E4F6613CE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E4F6613CE;
	Fri, 16 May 2025 18:00:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C30A13D
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1202183CA8
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jTH7BVok49L for <buildroot@buildroot.org>;
 Fri, 16 May 2025 17:59:44 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2119A83C42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2119A83C42
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2119A83C42
 for <buildroot@buildroot.org>; Fri, 16 May 2025 17:59:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 4BCBA1C0FCB; Fri, 16 May 2025 19:59:40 +0200 (CEST)
Message-ID: <e1fc9313-282f-4223-81e1-0a6f3ecef4ed@rnout.be>
Date: Fri, 16 May 2025 18:41:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Simon Richter <simon@sinic.eu>, yann.morin@orange.com,
 Vincent Jardin <vjardin@free.fr>
Cc: buildroot@buildroot.org
References: <20241120073755.17583-1-simon@sinic.eu>
 <Zz2f6UeSKuyrpZuJ@yd-6wlzhs3> <57b1206c-8972-47f1-9255-e70b1185e6a1@sinic.eu>
Content-Language: en-GB, fr-BE
In-Reply-To: <57b1206c-8972-47f1-9255-e70b1185e6a1@sinic.eu>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1747418380; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=lX2pE8ssvwRW4CGfuQSu2/bCiwMG/69b9jQ/FL8nno4=;
 b=Cmy/sPgpijiJk4D3p8Orh8XLZVmE908Z6T68Etci7FdUA0h5dY80/ZsnbjIT7JF2iTZ53D
 mubIxzz/C3clZkwcs4xFe7qw7EO/Ee1fJNjOfF07Aua1Ds7F+TgLy60TKjWLOlJIS7EBS7
 DbbT/JcpTkFg/YT8Di9RPsckeUzQ8tt2JkxkpmiiqV6a/wTSkRd2CEhtjpRk3hhH0YEe71
 GGcjTEAQlm1pf0yWiFCEwojxPALCqECW/OgBkRYkaRqVDSNe1qPaaJ+dpgEY8HEj9GA32B
 4ASVUGItgjSs9ARs8tZN7F598xl5/FBXfzLfW5/15ZPXKwfMfUgT/V+lygs53A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=rnout.be header.i=@rnout.be
 header.a=rsa-sha256 header.s=dkim header.b=Cmy/sPgp
Subject: Re: [Buildroot] [PATCH] package/pkg-generic.mk: add missing quotes
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ICBIaSBTaW1vbiwKCiAgUmFpc2luZyB0aGlzIHRocmVhZCBmcm9tIHRoZSBkZWFkLi4uCgpPbiAy
MC8xMS8yMDI0IDEyOjIyLCBTaW1vbiBSaWNodGVyIHZpYSBidWlsZHJvb3Qgd3JvdGU6Cj4gSGkg
WWFubiwgaGkgVmluY2VudCwKPiAKPiBBbSAyMC4xMS4yNCB1bSAwOTozOCBzY2hyaWViIHlhbm4u
bW9yaW5Ab3JhbmdlLmNvbToKPj4gU2ltb24sIEFsbCwKCltzbmlwXQo+PiBJbmRlZWQsIGhhdmlu
ZyBgJmAgaW4gYSBmaWxlbmFtZSBpcyByZWFsbHkgYXNraW5nIGZvciB0cm91YmxlIGFsbCBhbG9u
Zwo+PiB0aGUgd2F5ISA6LS8gQXMgdGhpcyBpcyBhIGRvd25sb2FkZWQgZmlsZSwgaGF2ZSB5b3Ug
dHJpZWQgVVJMLWVzY2FwaW5nCj4+IHRoZSBgJmAgd2l0aCAnJTI2JyBpbnN0ZWFkPyBJZiBpdCB3
b3JrcywgdGhhdCB3b3VsZCBnaXZlIGEgb25lLW9mZgo+PiBzb2x1dGlvbiBmb3IgeW91ciBjYXNl
LCBidXQgbWF5YmUgd2UgbmVlZCB0byBoYW5kbGUgdGhhdCBpbiBhIGdlbmVyaWMKPj4gd2F5IChz
b21laG93KS4uLgo+IEkgdHJpZWQgdG8gZW5jb2RlIHRoZSBVUkwgKHRoYW5rcyBAVmluY2VudCks
IGJ1dCBBenVyZSBkb2Vzbid0IGxpa2UgaXQ6Cj4gNDAwIFRoZSB2YWx1ZSBmb3Igb25lIG9mIHRo
ZSBIVFRQIGhlYWRlcnMgaXMgbm90IGluIHRoZSBjb3JyZWN0IGZvcm1hdC4KCiAgSGF2ZSB5b3Ug
dHJpZWQgc2ltcGx5IGFkZGluZyBxdW90ZXMgaW4gdGhlIC5tayBmaWxlPyBTbwoKICAgICA8UEtH
Pl9TT1VSQ0UgPSAnPEZJTEU+P2ZvbyZiYXImYmF6JmJsYWgnCgoKICBSZWdhcmRzLAogIEFybm91
dAoKPiBPdXIgY3VycmVudCBzb2x1dGlvbiBpcyB0byBhYnVzZSA8UEtHPl9ETF9PUFRTIGFzIHdl
IGRvbid0IG5lZWQgdGhlCj4gdmFyaWFibGUgKHdpdGggb3VyIHBhY2thZ2VzIHRvIGJlIGxvYWRl
ZCB2aWEgQXp1cmUpLiBXZSBoYXZlIG91cgo+IG93biBkb3dubG9hZCBzY3JpcHQgKGEgY3VzdG9t
aXplZCBjb3B5IG9mIHN1cHBvcnQvZG93bmxvYWQvd2dldCk6Cj4gCj4gIMKgwqDCoCA8d2hpbGUg
Z2V0b3B0cz4KPiAgwqDCoMKgIHNoaWZ0ICQoKE9QVElORC0xKSkKPiAgwqDCoMKgIHNhcz0iJDHi
gJ0KPiAgwqDCoMKgIHNoaWZ0Cj4gIMKgwqDCoCB1cmw9JHt1cmwjKisqK30gIyByZW1vdmUgdGhl
ICdhemNvcHkrJyBiZWZvcmUgJ2h0dHBzOi8vLi4uJwo+ICDCoMKgwqAgX3dnZXQoKSB7Cj4gIMKg
wqDCoMKgwqDCoMKgIGVjaG8gJHtXR0VUfSDigJwke0B94oCdCj4gIMKgwqDCoMKgwqDCoMKgIGV2
YWwgJHtXR0VUfSDigJwke0B94oCdCj4gIMKgwqDCoCB9Cj4gIMKgwqDCoCBfd2dldCAtTyDigJzi
gJgke291dHB1dH3igJnigJ0g4oCc4oCYJHt1cmx9LyR7ZmlsZW5hbWV9JHtzYXN94oCZ4oCdCj4g
Cj4gCj4gSW4gbXkgb3BpbmlvbiB0aGlzIGlzIG1vcmUgb2YgYSBoYWNrIHRoYW4gYSBzb2x1dGlv
bi4KPiAKPiBEbyB5b3UgaGF2ZSBhbnkgaWRlYXMgb24gaG93IHdlIGNvdWxkIHNvbHZlIHRoaXMg
cHJvcGVybHkgKHNvIHRoYXQKPiB3ZSBjYW4gYnJpbmcgaXQgdXBzdHJlYW0pPwo+IAo+IAo+IFRo
YW5rcyBhbmQgcmVnYXJkcywKPiBTaW1vbgo+IAo+IAo+PiBSZWdhcmRzLAo+PiBZYW5uIEUuIE1P
UklOLgo+Pgo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGlmIHRlc3QgISAtZSAkKCQoUEtHKV9ETF9E
SVIpL2BiYXNlbmFtZSAkJHBgIDsgdGhlbiBcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCAkKGNhbGwgTUVTU0FHRSwiRG93bmxvYWRpbmciKSA7IFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGJyZWFrIDsgXAo+Pj4gLS0gCj4+PiAyLjQ3LjAKPj4+Cj4+PiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4gYnVpbGRyb290IG1haWxp
bmcgbGlzdAo+Pj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPj4+IGh0dHBzOi8vbGlzdHMuYnVp
bGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+
IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxk
cm9vdAo=
