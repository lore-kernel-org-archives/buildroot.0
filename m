Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDE4AC04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:20:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8067E8403F;
	Sat, 30 Jul 2022 12:20:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8067E8403F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1tOcOFf7MV_x; Sat, 30 Jul 2022 12:20:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 898E78403B;
	Sat, 30 Jul 2022 12:20:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 898E78403B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E0A511BF391
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B960A417E5
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:20:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B960A417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_JaUnVnaXe5 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:19:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60B51417DC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60B51417DC
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:19:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A405060129;
 Sat, 30 Jul 2022 14:19:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 14:19:55 +0200
Date: Sat, 30 Jul 2022 14:19:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Roosen Henri <Henri.Roosen@ginzinger.com>
Message-ID: <20220730121955.GS3168@scaer>
References: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c73779fc937946ae6279b66998d6017ba0ffd507.camel@ginzinger.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659183597;
 bh=z7K9tGHgL23ILD/A7GMDAkPPqu/zMfs9k/0NV4EEZ24=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lJnbCqmtG6U7p07S/XD3N8lW05iLoceyav8/h8iPCRNZfowMWntkKs3QZ1gu94hNx
 czegnRTemYOgZoPBxZBzjGBI1PLCVktHbBcPwJuKyDyIUaivaykLtrJToqV2aLxDE6
 c3XMD8KO4AD/UgQGfpeUx7T7Hf+IYjet/FkmYoZdyqkPTIuvvTNZMtQQdhWnjL9XDv
 i6B3ufG1Pvyj8MHtgJ5jgrIaXCW3FUzdb6Xb179KSAx4Fg87VD29hc5B/46/GMPcyh
 LpFdWh6Zvejhdhwsb3j8633rHvOu1566Eex4ZOIBuQFXPt22XkWprnxkVoBsIx8Pgk
 XhRznoc/rroXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lJnbCqmt
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: workaround make 4.3 issue for
 'printvars and 'show-vars'
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVucmksIEFsbCwKCk9uIDIwMjItMDctMjkgMjE6NDkgKzAwMDAsIFJvb3NlbiBIZW5yaSBzcGFr
ZSB0aHVzbHk6Cj4gRXZlbnQgdGhvdWdoIHRoZSBidWcgd2l0aCBtYWtlIDQuMyBoYXMgYmVlbiBy
ZXBvcnRlZCBhbmQgZml4ZWQsIHRoZXJlCj4gaGFzIG5vdCBiZWVuIGEgcmVsZWFzZSBvZiBtYWtl
IHdpdGggdGhlIGZpeCBmb3IgYSBsb25nIHRpbWUsIHNlZSBbMV0uCj4gCj4gQXMgdGhlIHJvb3Qg
Y2F1c2Ugc2VlbXMgdGhlICdmaWx0ZXInIGNvbW1hbmQgY2Fubm90IGhhbmRsZSBsYXJnZQo+IGNo
dW5rcyBvZiBkYXRhLCBsaWtlIC5WQVJJQUJMRVMsIHdlIGNhbiB3b3JrYXJvdW5kIHRoZSBwcm9i
bGVtIGJ5Cj4gdXNpbmcgYSBmb3JlYWNoIGNvbW1hbmQgb3ZlciAuVkFSSUFCTEVTLCB0aGVuIHVz
ZSB0aGUgZmlsdGVyIGNvbW1hbmQuCj4gCj4gSXQgbWlnaHQgbm90IGJlIGxvZ2ljYWwgdG8gcHJv
Z3JhbSBpdCB0aGF0IHdheSwgYnV0IGF0IGxlYXN0IHRoZQo+IGZ1bmN0aW9uYWxpdHkgaXMgbm93
IHVzYWJsZS4KCkF3ZXNvbWUhIEp1c3QgYXdlc29tZSEg8J+RjQoKSSBqdXN0IGFkZGVkIGEgc21h
bGwgY29tbWVudCBpbiB0aGUgTWFrZWZpbGUgdG8gZXhwbGFpbiB0aGF0LCBhbmQKcmVmZXJlbmNl
IHRoZSBidWcuCgo+IFsxXSBodHRwczovL3NhdmFubmFoLmdudS5vcmcvYnVncy8/NTkwOTMjY29t
bWVudDEwCj4gCj4gU2lnbmVkLW9mZi1ieTogSGVucmkgUm9vc2VuIDxoZW5yaS5yb29zZW5AZ2lu
emluZ2VyLmNvbT4KCkFwcGxpZWQgdG8gbWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUu
IE1PUklOLgoKPiAtLS0KPiAgTWFrZWZpbGUgfCAxNSArKysrLS0tLS0tLS0tLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdp
dCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKPiBpbmRleCBiZjEwMWZmNzcwLi5hODU2ZjY5Njg1IDEw
MDY0NAo+IC0tLSBhL01ha2VmaWxlCj4gKysrIGIvTWFrZWZpbGUKPiBAQCAtMTA1NiwyMyArMTA1
NiwxNiBAQCBpZmVxICgkKE5FRURfV1JBUFBFUikseSkKPiAgCSQoUSkkKFRPUERJUikvc3VwcG9y
dC9zY3JpcHRzL21rbWFrZWZpbGUgJChUT1BESVIpICQoTykKPiAgZW5kaWYKPiAgCj4gLS5QSE9O
WTogY2hlY2stbWFrZS12ZXJzaW9uCj4gLWNoZWNrLW1ha2UtdmVyc2lvbjoKPiAtaWZuZXEgKCQo
ZmlsdGVyICQoUlVOTklOR19NQUtFX1ZFUlNJT04pLDQuMyksKQo+IC0JQGVjaG8gIk1ha2UgNC4z
IGRvZXNuJ3Qgc3VwcG9ydCAncHJpbnR2YXJzJyBhbmQgJ3Nob3ctdmFycycgcmVjaXBlcyIKPiAt
CUBleGl0IDEKPiAtZW5kaWYKPiAtCj4gICMgcHJpbnR2YXJzIHByaW50cyBhbGwgdGhlIHZhcmlh
YmxlcyBjdXJyZW50bHkgZGVmaW5lZCBpbiBvdXIKPiAgIyBNYWtlZmlsZXMuIEFsdGVybmF0aXZl
bHksIGlmIGEgbm9uLWVtcHR5IFZBUlMgdmFyaWFibGUgaXMgcGFzc2VkLAo+ICAjIG9ubHkgdGhl
IHZhcmlhYmxlcyBtYXRjaGluZyB0aGUgbWFrZSBwYXR0ZXJuIHBhc3NlZCBpbiBWQVJTIGFyZQo+
ICAjIGRpc3BsYXllZC4KPiAgIyBzaG93LXZhcnMgZG9lcyB0aGUgc2FtZSwgYnV0IGFzIGEgSlNP
TiBkaWN0aW9ubmFyeS4KPiAgLlBIT05ZOiBwcmludHZhcnMKPiAtcHJpbnR2YXJzOiBjaGVjay1t
YWtlLXZlcnNpb24KPiArcHJpbnR2YXJzOgo+ICAJQDoKPiAgCSQoZm9yZWFjaCBWLCBcCj4gLQkJ
JChzb3J0ICQoZmlsdGVyICQoVkFSUyksJCguVkFSSUFCTEVTKSkpLCBcCj4gKwkJJChzb3J0ICQo
Zm9yZWFjaCBYLCAkKC5WQVJJQUJMRVMpLCAkKGZpbHRlciAkKFZBUlMpLCQoWCkpKSksIFwKPiAg
CQkkKGlmICQoZmlsdGVyLW91dCBlbnZpcm9ubWVudCUgZGVmYXVsdCBhdXRvbWF0aWMsIFwKPiAg
CQkJCSQob3JpZ2luICRWKSksIFwKPiAgCQkkKGlmICQoUVVPVEVEX1ZBUlMpLFwKPiBAQCAtMTA4
MiwxMSArMTA3NSwxMSBAQCBwcmludHZhcnM6IGNoZWNrLW1ha2UtdmVyc2lvbgo+ICAKPiAgLlBI
T05ZOiBzaG93LXZhcnMKPiAgc2hvdy12YXJzOiBWQVJTPz0lCj4gLXNob3ctdmFyczogY2hlY2st
bWFrZS12ZXJzaW9uCj4gK3Nob3ctdmFyczoKPiAgCUA6Cj4gIAkkKGluZm8gJChjYWxsIGNsZWFu
LWpzb24sIHsgXAo+ICAJCQkkKGZvcmVhY2ggViwgXAo+IC0JCQkJJChzb3J0ICQoZmlsdGVyICQo
VkFSUyksJCguVkFSSUFCTEVTKSkpLCBcCj4gKwkJCQkkKHNvcnQgJChmb3JlYWNoIFgsICQoLlZB
UklBQkxFUyksICQoZmlsdGVyICQoVkFSUyksJChYKSkpKSwgXAo+ICAJCQkJJChpZiAkKGZpbHRl
ci1vdXQgZW52aXJvbm1lbnQlIGRlZmF1bHQgYXV0b21hdGljLCAkKG9yaWdpbiAkVikpLCBcCj4g
IAkJCQkJIiRWIjogeyBcCj4gIAkJCQkJCSJleHBhbmRlZCI6ICQoY2FsbCBtay1qc29uLXN0ciwk
KCRWKSkkKGNvbW1hKSBcCj4gLS0gCj4gMi4zMC4yCj4gCj4gCgoKCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0
Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4K
fCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9O
IHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVz
aWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYx
IDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAg
VGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAv
IFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0t
LS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVp
bGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3Rz
LmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
