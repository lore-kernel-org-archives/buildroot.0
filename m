Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381CACAC598
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 19:30:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EBB06616F2;
	Wed, 17 Sep 2025 19:30:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yfIjqWDw41tw; Wed, 17 Sep 2025 19:30:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 22DC7616EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 22DC7616EF;
	Wed, 17 Sep 2025 19:30:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AA9DD279
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A4C4B415B4
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:30:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7MfyZ33lkmna for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 19:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AD8FF415B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD8FF415B9
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AD8FF415B9
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 19:30:48 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 8BC062003C8;
 Wed, 17 Sep 2025 21:30:41 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 21:30:41 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 21:30:41 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <CADvTj4p4s9jbx=hVBHhPJQ5yfqQmrL=1XTxJbdkJLRbQr4cO3Q@mail.gmail.com>
References: <20250916003036.2506534-1-james.hilliard1@gmail.com>
 <e334751a5a70b13d39c4cb67e47626b1@free.fr>
 <CADvTj4rD4nNXkrwpJQJKxX1nUpfg_DVa-9Lr-8FRqa+s5LYpXw@mail.gmail.com>
 <969f8476e23d93622312df6ff5dcfb3d@free.fr>
 <CADvTj4p4s9jbx=hVBHhPJQ5yfqQmrL=1XTxJbdkJLRbQr4cO3Q@mail.gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <54f8a68618b7b3c4889a0f902706b84c@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758137445;
 bh=Zb0YuO2D65+8j2/9Em74BgdxiLa6ez8eG7ORJhi9ZeM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pbNil4eolbLSUPoz7xlDx6jwAxG4L/lgCjWoW+r+3y5VoYtIM97fkG4ANsyVpfyBt
 4UOEzQCSryUA9b5fWx274P8xrCqkXC00I9WMYfVzW72q0NT5SSU/2B7WlwEksCD+S7
 vqLKfjcqS8riSq0ptb0LcTS49YRnU1zGnGFyU59v+o+jCC0ZabSIV590aoul0kZ+Kh
 NiK7EEC7aHPtUin3sCxzg2LUiTopiktvv4DAvV0vgkOVtwnA1+gZ2WCSUfyAIOLpqr
 e4+wIRtXk7Ju8+74jVgF7wOcsS/UZCq69dUTdiE2FONFdchAOvrr4EgQ4fezpuT+A4
 G6B3gM8ijk5vA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pbNil4eo
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.39.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgSmFtZXMsCgpPbiAxNy8wOS8yMDI1IDIwOjI0LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBP
biBXZWQsIFNlcCAxNywgMjAyNSBhdCAxMTo1MuKAr0FNIEp1bGllbiBPbGl2YWluIDxqdS5vQGZy
ZWUuZnI+IHdyb3RlOgo+PiAKPj4gSGkgSmFtZXMsCj4+IAo+PiBPbiAxNy8wOS8yMDI1IDE5OjI5
LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPj4gPiBPbiBXZWQsIFNlcCAxNywgMjAyNSBhdCAxMTox
OeKAr0FNIEp1bGllbiBPbGl2YWluIDxqdS5vQGZyZWUuZnI+IHdyb3RlOgo+PiA+Pgo+PiA+PiBI
aSBKYW1lcywKPj4gPj4KPj4gPj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4+ID4+Cj4+ID4+IE9u
IDE2LzA5LzIwMjUgMDI6MzAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+PiA+PiA+IFNpZ25lZC1v
ZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29tPgo+PiA+PiA+
IC0tLQo+PiA+PiBbLi4uXQo+PiA+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weWRh
bnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4+ID4gYi9wYWNrYWdlL3B5dGhv
bi1weWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4+ID4gaW5kZXggNTA4
NWI5MDZkNS4uNzM0MjcxMWIyYSAxMDA2NDQKPj4gPj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1w
eWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4+ID4gKysrIGIvcGFja2Fn
ZS9weXRob24tcHlkYW50aWMtY29yZS9weXRob24tcHlkYW50aWMtY29yZS5tawo+PiA+PiA+IEBA
IC02LDEwICs2LDEwIEBACj4+ID4+ID4KPj4gPj4gPiAgIyBweXRob24tcHlkYW50aWMgcGlucyBh
biBleGFjdCB2ZXJzaW9uIG9mIHB5ZGFudGljLWNvcmUgaW4KPj4gPj4gPiBweXByb2plY3QudG9t
bCwKPj4gPj4gPiAgIyBtYWtlIHN1cmUgdG8gc3luYyBweWRhbnRpYy1jb3JlIHRvIHRoaXMgdmVy
c2lvbiB3aGVuIHVwZGF0aW5nCj4+ID4+ID4gcHlkYW50aWMKPj4gPj4gPiAtUFlUSE9OX1BZREFO
VElDX0NPUkVfVkVSU0lPTiA9IDIuMzMuMgo+PiA+PiA+ICtQWVRIT05fUFlEQU5USUNfQ09SRV9W
RVJTSU9OID0gMi4zOS4wCj4+ID4+Cj4+ID4+IFRoaXMgbmV3IHZlcnNpb24gYnJlYWtzIHRoZSBy
dW50aW1lIHRlc3RzLiBTZWU6Cj4+ID4+IGh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWls
ZHJvb3QvLS9waXBlbGluZXMvMjA0NTQ4Nzc4Ngo+PiA+Pgo+PiA+PiBDb3VsZCB5b3UgaGF2ZSBh
IGxvb2sgcGxlYXNlPwo+PiA+Pgo+PiA+PiBJdCBpcyBsaWtlbHkgYSBtaXNzaW5nIHJ1bnRpbWUg
ZGVwZW5kZW5jeS4gSSBkaWQgbm90IGFwcGxpZWQKPj4gPj4gdGhlIHB5dGhvbi1weWRhbnRpYyBi
dW1wIGZyb206Cj4+ID4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyNTA5MTYwMDMzMTkuMjUxMDA1MC0xLWphbWVzLmhpbGxpYXJkMUBnbWFp
bC5jb20vCj4+ID4+Cj4+ID4+IEknbGwgcmV0ZXN0IGJvdGggYnVtcHMgYXQgdGhlIHNhbWUgdGlt
ZS4KPj4gPgo+PiA+IFllYWgsIGJhc2VkIG9uIHRoZSBlcnJvciBJIHRoaW5rIGFwcGx5aW5nIGJv
dGggYXQgdGhlIHNhbWUgdGltZSBzaG91bGQKPj4gPiBmaXggaXQuCj4+IAo+PiBJIGRvbid0IHRo
aW5rIHNvLiBJIHRlc3RlZCB3aXRoIGJvdGggcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBvZiB0aGUg
Cj4+IHJlc3QKPj4gb2YgeW91ciBweXRob24gdXBkYXRlcy4gU2VlOgo+PiBodHRwczovL2dpdGxh
Yi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vY29tbWl0cy9idW1wLXRlc3RzLnBhY2thZ2UudGVz
dF9weXRob25fcHlkYW50aWMKPj4gCj4+IFNvIEkgdGhpbmsgdGhlcmUgaXMgcmVhbGx5IHNvbWUg
bmV3IHJ1bnRpbWUgZGVwZW5kZW5jeSBtaXNzaW5nLgo+IAo+IEkgdGhpbmsgSSBzZWUgdGhlIGlz
c3VlLCB0aGUgbGF0ZXN0IHZlcnNpb24gb2YgcHlkYW50aWMgc3BlY2lmaWVzIGFuIAo+IG9sZGVy
Cj4gdmVyc2lvbihvdXIgY3VycmVudCB2ZXJzaW9uKSBvZiBweWRhbnRpYy1jb3JlIGZvciBjb21w
YXRpYmlsaXR5Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9weWRhbnRpYy9weWRhbnRpYy9ibG9iL3Yy
LjExLjkvcHlwcm9qZWN0LnRvbWwjTDQ5Cj4gCj4gU28gSSdsbCBkcm9wIHRoZSBweWRhbnRpYy1j
b3JlIGJ1bXAsIHlvdSBzaG91bGQgYmUgYWJsZSB0byBtZXJnZSB0aGUKPiBweWRhbnRpYyBidW1w
IGJ5IGl0c2VsZi4KCkkgY29uZmlybSB0aGUgcHlkYW50aWMgYnVtcCBhbG9uZSB3b3JrcyBmaW5l
OgpodHRwczovL2dpdGxhYi5jb20vam9saXZhaW4vYnVpbGRyb290Ly0vcGlwZWxpbmVzLzIwNDU2
OTcyNjYKClNvIEknbGwgYXBwbHkgaXQgYW5kIGlnbm9yZSBweWRhbnRpYy1jb3JlIGZvciB0aGUg
dGhlIG1vbWVudC4KCkJlc3QgcmVnYXJkcywKCkp1bGllbi4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJv
b3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0
aW5mby9idWlsZHJvb3QK
