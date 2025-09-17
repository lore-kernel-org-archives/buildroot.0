Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BEA2CAC59F
	for <buildroot@archiver.kernel.org>; Wed, 17 Sep 2025 17:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 486D9411E7;
	Wed, 17 Sep 2025 17:52:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 08TeKEUnBT5G; Wed, 17 Sep 2025 17:52:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BB4741203
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BB4741203;
	Wed, 17 Sep 2025 17:52:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B0DE6199
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 96F376164B
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:52:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8YBCG6p2K_ps for <buildroot@buildroot.org>;
 Wed, 17 Sep 2025 17:52:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9D49361637
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D49361637
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D49361637
 for <buildroot@buildroot.org>; Wed, 17 Sep 2025 17:52:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 345CF5FFAF;
 Wed, 17 Sep 2025 19:52:31 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 17 Sep 2025 19:52:31 +0200
MIME-Version: 1.0
Date: Wed, 17 Sep 2025 19:52:31 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Hoffmann <bubu@bubu1.eu>
In-Reply-To: <CADvTj4rD4nNXkrwpJQJKxX1nUpfg_DVa-9Lr-8FRqa+s5LYpXw@mail.gmail.com>
References: <20250916003036.2506534-1-james.hilliard1@gmail.com>
 <e334751a5a70b13d39c4cb67e47626b1@free.fr>
 <CADvTj4rD4nNXkrwpJQJKxX1nUpfg_DVa-9Lr-8FRqa+s5LYpXw@mail.gmail.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <969f8476e23d93622312df6ff5dcfb3d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758131553;
 bh=iIDq8KWVBiiHPSuC+cZ5zO7v3wYDUCRxmbZYlir1bcs=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=SU6CLnAa97Z36if1ICbsouts9XoWU6KTUEQfSH2EaHCsNOWkPvulfvpHC/Nv01EQc
 yVaSd/77sKkPCjz5yykaMOBCIvqvAUD2IhExsSaQZkHM4GzRwbGCKwOF0OpQT/6FcE
 /A9EoPCpRQvUWKEjQ5bnr30QvVz+xPwnBoH2TPyUVPmDlNO8kUD4yNVUrmOX7BB7Za
 MP7ilHkDpYxjt/mv5hjwJ3CWW+ykU540WfeV8LCujLUhUtZaOHq3aRaBOotZfKNuOY
 VfjF43aTkRGTNXkgZKNyayS1v4EmFjLnykXaD4f6v+0njUtyiSqhnlDZ+NrYzJT21H
 1J22U7uw4beVg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SU6CLnAa
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

SGkgSmFtZXMsCgpPbiAxNy8wOS8yMDI1IDE5OjI5LCBKYW1lcyBIaWxsaWFyZCB3cm90ZToKPiBP
biBXZWQsIFNlcCAxNywgMjAyNSBhdCAxMToxOeKAr0FNIEp1bGllbiBPbGl2YWluIDxqdS5vQGZy
ZWUuZnI+IHdyb3RlOgo+PiAKPj4gSGkgSmFtZXMsCj4+IAo+PiBUaGFua3MgZm9yIHRoZSBwYXRj
aC4KPj4gCj4+IE9uIDE2LzA5LzIwMjUgMDI6MzAsIEphbWVzIEhpbGxpYXJkIHdyb3RlOgo+PiA+
IFNpZ25lZC1vZmYtYnk6IEphbWVzIEhpbGxpYXJkIDxqYW1lcy5oaWxsaWFyZDFAZ21haWwuY29t
Pgo+PiA+IC0tLQo+PiBbLi4uXQo+PiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3B5dGhvbi1weWRh
bnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4gYi9wYWNrYWdlL3B5dGhvbi1w
eWRhbnRpYy1jb3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4gaW5kZXggNTA4NWI5MDZk
NS4uNzM0MjcxMWIyYSAxMDA2NDQKPj4gPiAtLS0gYS9wYWNrYWdlL3B5dGhvbi1weWRhbnRpYy1j
b3JlL3B5dGhvbi1weWRhbnRpYy1jb3JlLm1rCj4+ID4gKysrIGIvcGFja2FnZS9weXRob24tcHlk
YW50aWMtY29yZS9weXRob24tcHlkYW50aWMtY29yZS5tawo+PiA+IEBAIC02LDEwICs2LDEwIEBA
Cj4+ID4KPj4gPiAgIyBweXRob24tcHlkYW50aWMgcGlucyBhbiBleGFjdCB2ZXJzaW9uIG9mIHB5
ZGFudGljLWNvcmUgaW4KPj4gPiBweXByb2plY3QudG9tbCwKPj4gPiAgIyBtYWtlIHN1cmUgdG8g
c3luYyBweWRhbnRpYy1jb3JlIHRvIHRoaXMgdmVyc2lvbiB3aGVuIHVwZGF0aW5nCj4+ID4gcHlk
YW50aWMKPj4gPiAtUFlUSE9OX1BZREFOVElDX0NPUkVfVkVSU0lPTiA9IDIuMzMuMgo+PiA+ICtQ
WVRIT05fUFlEQU5USUNfQ09SRV9WRVJTSU9OID0gMi4zOS4wCj4+IAo+PiBUaGlzIG5ldyB2ZXJz
aW9uIGJyZWFrcyB0aGUgcnVudGltZSB0ZXN0cy4gU2VlOgo+PiBodHRwczovL2dpdGxhYi5jb20v
am9saXZhaW4vYnVpbGRyb290Ly0vcGlwZWxpbmVzLzIwNDU0ODc3ODYKPj4gCj4+IENvdWxkIHlv
dSBoYXZlIGEgbG9vayBwbGVhc2U/Cj4+IAo+PiBJdCBpcyBsaWtlbHkgYSBtaXNzaW5nIHJ1bnRp
bWUgZGVwZW5kZW5jeS4gSSBkaWQgbm90IGFwcGxpZWQKPj4gdGhlIHB5dGhvbi1weWRhbnRpYyBi
dW1wIGZyb206Cj4+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWlsZHJv
b3QvcGF0Y2gvMjAyNTA5MTYwMDMzMTkuMjUxMDA1MC0xLWphbWVzLmhpbGxpYXJkMUBnbWFpbC5j
b20vCj4+IAo+PiBJJ2xsIHJldGVzdCBib3RoIGJ1bXBzIGF0IHRoZSBzYW1lIHRpbWUuCj4gCj4g
WWVhaCwgYmFzZWQgb24gdGhlIGVycm9yIEkgdGhpbmsgYXBwbHlpbmcgYm90aCBhdCB0aGUgc2Ft
ZSB0aW1lIHNob3VsZCAKPiBmaXggaXQuCgpJIGRvbid0IHRoaW5rIHNvLiBJIHRlc3RlZCB3aXRo
IGJvdGggcGF0Y2hlcyBhcHBsaWVkIG9uIHRvcCBvZiB0aGUgcmVzdApvZiB5b3VyIHB5dGhvbiB1
cGRhdGVzLiBTZWU6Cmh0dHBzOi8vZ2l0bGFiLmNvbS9qb2xpdmFpbi9idWlsZHJvb3QvLS9jb21t
aXRzL2J1bXAtdGVzdHMucGFja2FnZS50ZXN0X3B5dGhvbl9weWRhbnRpYwoKU28gSSB0aGluayB0
aGVyZSBpcyByZWFsbHkgc29tZSBuZXcgcnVudGltZSBkZXBlbmRlbmN5IG1pc3NpbmcuCgo+PiAK
Pj4gQmVzdCByZWdhcmRzLAo+PiAKPj4gSnVsaWVuLgoKQmVzdCByZWdhcmRzLAoKSnVsaWVuLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
