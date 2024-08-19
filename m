Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4961DC3DA4A
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 22:32:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 740F060861;
	Mon, 19 Aug 2024 22:32:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRu6yrrdqRo9; Mon, 19 Aug 2024 22:32:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 362706083E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 362706083E;
	Mon, 19 Aug 2024 22:32:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E7CB41BF3C8
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:32:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D36DE401D5
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 22:32:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9smTd7dwhO2D for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 22:32:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=yann.morin.1998@free.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 35E1B40169
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35E1B40169
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 35E1B40169
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 22:32:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D99BB13F861;
 Tue, 20 Aug 2024 00:31:55 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Aug 2024 00:31:55 +0200
Date: Tue, 20 Aug 2024 00:31:55 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Christian Stewart <christian@aperture.us>
Message-ID: <ZsPH2xAvcIc7oBUA@landeda>
References: <CAEpB38NWKuFapnjbEofugLm-csmkwq1dUbvh0jRbcPRVO5K19Q@mail.gmail.com>
 <ZsO2bDVn41vsZfq1@landeda>
 <CA+h8R2q9ueiNE+SKXNJGq4zGnquRZ=jN-8MHKOwUNVNcBj7yXA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+h8R2q9ueiNE+SKXNJGq4zGnquRZ=jN-8MHKOwUNVNcBj7yXA@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1724106720;
 bh=3a35IN2sWqS77n1OkldNUhTcfD6TqDBE3VSRLoAtc1s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DL7TPU0CRwMP+6EjuEVZmLmFbB5Ydle21tl/BsczbmdKXlPaI8CzEzLafgPPvMmFX
 ZQtXrjQ4CdOb96JyR1pGmtSw6fbGUw5ihgicFFmOtkS6sl+GsmA2pNbYdu8dY6VqJl
 M6TCw49fQroLfELD+Uwd7mEJ5gadCPxQsOTqWsgg6CTZk6Bd5UjpYa11jF00Basr1A
 taeEyJL+w2wEcxtNSm/B48CzLJ9Go1zU7rqpe2HoGSL0WYsUBWPxNaZyTS0RR/eGjE
 +B40GDy4nWTOni2nENBrRDYrFq1q9DlliI5JSkidaNMnikT+uJBMnQm2pRFGaib8tI
 I3T/FP4cPnsKA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DL7TPU0C
Subject: Re: [Buildroot] [PATCH v8 1/1] package/go: use host compiler when
 go-bootstrap unsupported
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
Cc: Anisse Astier <anisse@astier.eu>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Q2hyaXN0aWFuLCBBbGwsCgpPbiAyMDI0LTA4LTE5IDE0OjM0IC0wNzAwLCBDaHJpc3RpYW4gU3Rl
d2FydCBzcGFrZSB0aHVzbHk6Cj4gT24gTW9uLCBBdWcgMTksIDIwMjQgYXQgMjoxN+KAr1BNIFlh
bm4gRS4gTU9SSU4gPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKPiA+ID4gUmVjZW50
IGNoYW5nZXMgYWRkZWQgZ28tc3JjIHdpdGggdGhlIGludGVudCBvZiBhZGRpbmcgZ28tYmluIGxh
dGVyLiBUaGlzCj4gPiA+IGNvbW1pdCBjaGFuZ2VzIGdvLXNyYyB0byBkZXBlbmQgb24gdGhlIGhv
c3QgR28gY29tcGlsZXIgdG8gYm9vdHN0cmFwCj4gPiA+IGdvLXNyYyBvbiBhcmNoaXRlY3R1cmVz
IHRoYXQgY2Fubm90IGJ1aWxkIGdvLWJvb3RzdHJhcC1zdGFnZTEgKHN1Y2ggYXMgYXJtNjQpLgo+
ID4gPgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gU3Rld2FydCA8Y2hyaXN0aWFuQGFw
ZXJ0dXJlLnVzPgo+ID4KPiA+IFRoYW5rcyBmb3IgdGhpcyBuZXcgaXRlcmF0aW9uLiBCdXQgSSdk
IHJhdGhlciBmaXJzdCBoYXZlIHRoZSBzdXBwb3J0IGZvcgo+ID4gaG9zdC1nby1iaW4sIHJhdGhl
ciB0aGFuIHJlbHkgb24gdGhlIHN5c3RlbSBnby4KPiA+Cj4gPiBJbmRlZWQsIHVzbmcgaG9zdC1n
by1iaW4gd291bGQgbm90IHJlcXVpcmUgdGhlIHVzZXIgdG8gaW5zdGFsbCBnbyBvbgo+ID4gdGhl
aXIgc3lzdGVtOyBob3N0LWdvLWJpbiBjYW4gYmUgdXNlZCBvbiBvZGVyIGRpc3RyaWJ1dGlvbnMg
d2hlcmUgYSBnbwo+ID4gY29tcGlsZXIgaXMgbm90IGF2YWlsYWJsZSwgb3Igd2hlcmUgdGhlIGdv
IGNvbXBpbGVyIGlzIHRvbyBvbGQgdG8gYnVpbGQKPiA+IGdvLXNyYy4KPiA+Cj4gPiBTbywgSSBh
bSBub3QgY29udmluY2VkIGFib3V0IHRoaXMgInVzZSB0aGUgc3lzdGVtIGdvIiBzb2x1dGlvbi4K
PiAKPiBUaGVzZSBhcmUgdHdvIGRpZmZlcmVudCB1c2UgY2FzZXMuCj4gCj4gV2hhdCB5b3UgYXJl
IGRlc2NyaWJpbmcgaXMgZG93bmxvYWRpbmcgYW5kIHVzaW5nIHRoZSBwcmUtYnVpbHQgR28gZm9y
Cj4gZXZlcnl0aGluZy4KPiAKPiBXaGF0IHRoaXMgcGF0Y2ggYWNjb21wbGlzaGVzIGlzIGJvb3Rz
dHJhcHBpbmcgaG9zdC1nby1zcmMgdXNpbmcgdGhlCj4gc3lzdGVtIEdvIGNvbXBpbGVyLgo+IAo+
IEJvdGggY2FuIGJlIHN1cHBvcnRlZCwgdGhpcyBwYXRjaCBmaXhlcyB3aGVuIHdlIHNlbGVjdCBo
b3N0LWdvLXNyYyBvbgo+IGFuIGFybTY0IG1hY2hpbmUuCgpTb3JyeSwgSSB3YXMgbm90IGNsZWFy
IGVub3VnaCwgbXkgYmFkLgoKU28sIHRvIG1ha2UgaXQgY2xlYXIgYW5kIGV4cGxpY2l0LCBoZXJl
IGlzIHdoYXQgSSB0aGluayB3ZSBzaG91bGQKc3VwcG9ydDoKCiAgLSBmdWxsIGJvb3RzdHJhcCBj
aGFpbiB1cCB0byBob3N0LWdvLXNyYywgYXQgbGVhc3Qgd2hlcmUgcG9zc2libGUKICAtIGxhc3Qt
c3RhZ2UgYm9vdHN0cmFwIHdpdGggaG9zdC1nby1ib290c3RyYXAtc3RhZ2UzLWJpbiBhbmQgaG9z
dC1nby1zcmMKICAtIGhvc3QtZ28tYmluCgpBcyBmYXIgYXMgSSBjYW4gc2VlLCB0aGVyZSBhcmUg
YmluYXJ5IHJlbGVhc2VzIGZvciBhbGwgbWVhbmluZ2Z1bAphcmNoaXRlY3R1cmVzOgogICAgaHR0
cHM6Ly9nby5kZXYvZGwvCgogICogZ28gMS4xOS4xMyAob3VyIHN0YWdlLTIgYm9vdHN0cmFwKSBo
YXM6CiAgICAgIC0gZ28xLjE5LjEzLmxpbnV4LTM4Ni50YXIuZ3oKICAgICAgLSBnbzEuMTkuMTMu
bGludXgtYW1kNjQudGFyLmd6CiAgICAgIC0gZ28xLjE5LjEzLmxpbnV4LWFybTY0LnRhci5negog
ICAgICAtIGdvMS4xOS4xMy5saW51eC1hcm12NmwudGFyLmd6CiAgICAgIC0gZ28xLjE5LjEzLmxp
bnV4LXBwYzY0bGUudGFyLmd6CiAgICAgIC0gZ28xLjE5LjEzLmxpbnV4LXMzOTB4LnRhci5negoK
ICAqIGdvIDEuMjEuOCAob3VyIHN0YWdlLTMgYm9vdHN0cmFwKSBoYXM6CiAgICAgIC0gZ28xLjIx
LjgubGludXgtMzg2LnRhci5negogICAgICAtIGdvMS4yMS44LmxpbnV4LWFtZDY0LnRhci5negog
ICAgICAtIGdvMS4yMS44LmxpbnV4LWFybTY0LnRhci5negogICAgICAtIGdvMS4yMS44LmxpbnV4
LWFybXY2bC50YXIuZ3oKICAgICAgLSBnbzEuMjEuOC5saW51eC1sb29uZzY0LnRhci5negogICAg
ICAtIGdvMS4yMS44LmxpbnV4LW1pcHMudGFyLmd6CiAgICAgIC0gZ28xLjIxLjgubGludXgtbWlw
czY0LnRhci5negogICAgICAtIGdvMS4yMS44LmxpbnV4LW1pcHM2NGxlLnRhci5negogICAgICAt
IGdvMS4yMS44LmxpbnV4LW1pcHNsZS50YXIuZ3oKICAgICAgLSBnbzEuMjEuOC5saW51eC1wcGM2
NC50YXIuZ3oKICAgICAgLSBnbzEuMjEuOC5saW51eC1wcGM2NGxlLnRhci5negogICAgICAtIGdv
MS4yMS44LmxpbnV4LXJpc2N2NjQudGFyLmd6CiAgICAgIC0gZ28xLjIxLjgubGludXgtczM5MHgu
dGFyLmd6CgpTbyBpZiB3ZSBpbnRyb2R1Y2UgaG9zdC1nby1ib290c3RyYXAtc3RhZ2UzLWJpbiB3
aXRoIGdvIDEuMjEuOCwgd2UKYmFzaWNhbGx5IGdldCBzdXBwb3J0IGZvciBhbGwgYXJjaGl0ZWN0
dXJlcyAoYW5kIG1vcmUpIHdoZXJlIHdlCmV4cGVjdCBCdWlsZHJvb3QgdG8gcnVuICh0byBydW4s
IG5vdCB0byBnZW5lcmF0ZSBjb2RlIGZvciEpLiBNYXliZSBvbmUKY291bGQgYXJndWUgdGhhdCBy
aXNjdjMyIGlzIG1pc3NpbmcsIGJ1dCBJIGRvdWJ0IGFueW9uZSBoYXMgYSByaXNjdjMyCm1hY2hp
bmUgcG93ZXJmdWwgZW5vdWdoIHRvIHJ1biBCdWlsZHJvb3Qgb24gKHJpc2N2NjQgc3VyZSwgcmlz
Y3YzMiBtdWNoCmxlc3MpLCBzbyB0aGF0IGlzIG5vdCBhIGNvbmNlcm4gZWl0aGVyIChJTUhPKS4K
ClRoaXMgd291bGQgYWxzbyBmaXggdGhlIGlzc3VlIHlvdSBhcmUgcmVwb3J0aW5nIG9mIHJ1bm5p
bmcgQnVpbGRyb290IG9uCmFuIEFBcmNoNjQgKGFrYSBhcm02NCkgbWFjaGluZS4KCj4gVGhpcyBp
cyBubyBkaWZmZXJlbnQgZnJvbSB1c2luZyB0aGUgaG9zdCBnY2MgdG8gYm9vdHN0cmFwIHRoZQo+
IEJ1aWxkcm9vdCBnY2MsIG5vPwoKQXMgSSBleHBsYWluZWQgcHJldmlvdXNseSwgdGhlIHN1Z2dl
c3Rpb24gYWJvdmUgd291bGQgYWxsb3cgaGF2aW5nIGEKImZpbmFsIiBnbyBjb21waWxlciBldmVy
eXdoZXJlLCBldmVuIGZvciB0aG9zZSBkaXN0cmlidXRpb25zIHdoZXJlCnRoZXJlIGlzIG5vbmUs
IG9yIHdoZXJlIGl0IGlzIHRvbyBvbGQsIGZvciB3aGljaCB5b3VyIHByb3Bvc2FsIGRvZXMgbm90
CndvcmsuCgpDdXJyZW50bHksIHRoZSBvbGRlc3QgZ2NjIHN1cHBvcnRlZCB0byBidWlsZCBnY2Mg
MTQueCwgaXMgZ2NjIDQuOC4zIFswXQpyZWxlYXNlZCAyMDE0LTA1LTIyLCBqdXN0IHRlbiB5ZWFy
cyBhZ28sIHNvIHZpcnR1YWxseSBhbGwgZGlzdHJpYnV0aW9ucwp0aGF0IG1ha2Ugc2Vuc2UgdG9k
YXkgaGF2ZSBzdWNoIGEgZ2NjIG9yIG1vcmUgcmVjZW50LCBzbyB0aGUgYm9vdHN0cmFwCmNhc2Ug
aXMgbm90IHJlYWxseSBhbiBpc3N1ZSwgYW5kIGEgQyBjb21waWxlciByZWFsbHkgaXMgYSBiYXNp
YyB0b29sIHdlCmNhbiBleHBlY3QgZXZlcnl3aGVyZSwgd2hpbGUgYSBnbyBjb21waWxlciBpcyBk
ZWZpbml0ZWx5IG5vdCBhIGJhc2ljCnRvb2wgd2UgY2FuIGV4cGVjdCBvciByZWx5IG9uLgoKWzBd
IGh0dHBzOi8vZ2NjLmdudS5vcmcvaW5zdGFsbC9wcmVyZXF1aXNpdGVzLmh0bWwKClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS0tLi0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBN
T1JJTiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNv
bnNwaXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8g
Q0FNUEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0t
LS0tLS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8g
IHwKfCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlM
ICAgIHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LV4tLS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
