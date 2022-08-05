Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2ABCC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 16:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D546823CF;
	Fri,  5 Aug 2022 16:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D546823CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id krlYcWwSGDOK; Fri,  5 Aug 2022 16:30:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 998308125D;
	Fri,  5 Aug 2022 16:30:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 998308125D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6652E1BF9CB
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 419858125D
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 16:30:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 419858125D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VPFeYDNGhtkx for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 16:29:59 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2437A80C02
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2437A80C02
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 16:29:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5864:4f9d:d5e2:80b0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 3CC5619F751;
 Fri,  5 Aug 2022 18:29:54 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 18:29:53 +0200
Date: Fri, 5 Aug 2022 18:29:53 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220805162953.GD3621445@scaer>
References: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220804203555.29029-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659716997;
 bh=ZnTH14WySTljndp6JaRljJyQWI0dn/HMCmqEdyWtYP8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Nc37lCTDJKMtiAbCa4yBuGr26NAADLr+Qo9d6ZNvytHcaaPpIEJHnxBz6eRudOJvR
 9rxakFLOpLBeKOskyvrXpN1ITbxalKyaTi8yrwAvLDsCJzlW8Xv4H2rHCT2bBAc7zg
 EUxR37fc9/HdAkLQWNhDQKvMAJTRHrbsDus8J34NBKcw4Lavxi8rpjd4aVFG7an6zU
 7jDRnQxybuKbS/4nYLVObRetj/qyQ146EIJUUjdqW3Y5/GxM7xPLDEuzf9YqvNq/J6
 uBof6vVhQ0fJWDSb9j2UpFHF7V4kHQHQmEAdqkullps5S/3xlVQjIOTGXpH71pl3wq
 jzPc/JBg7+Aeg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Nc37lCTD
Subject: Re: [Buildroot] [PATCH 1/2] package/pistache: fix dependency on
 rapidjson
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
Cc: Thomas Ruschival <thomas@ruschival.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

VGhvbWFzwrIsIEFsbCwKCk9uIDIwMjItMDgtMDQgMjI6MzUgKzAyMDAsIFRob21hcyBQZXRhenpv
bmkgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gcmFwaWRqc29uIGhhcyBiZWVuIGFkZGVk
IGFzIGEgZGVwZW5kZW5jeSBvZiBwaXN0YWNoZSBhcyBwYXJ0IG9mIGNvbW1pdAo+IDJmMzIxODU2
Nzk1MzE4NTAwOGVjODYyZjgxNGJlYmVjYjlkNmVkODIgKCJwYWNrYWdlL3Bpc3RhY2hlOiBidW1w
Cj4gdmVyc2lvbiAmIHN3aXRjaCB0byBtZXNvbiBidWlsZCIpLCB1c2luZyBhICJkZXBlbmRzIG9u
Ii4gSG93ZXZlciwgYXMKPiBpdCBpcyBhIGxpYnJhcnkgZGVwZW5kZW5jeSwgYSAic2VsZWN0IiBp
cyBub3JtYWxseSB1c2VkIGluIEJ1aWxkcm9vdC4KPiAKPiByYXBpZGpzb24ncyBvbmx5IGRlcGVu
ZGVuY3kgaXMgb24gQysrIHN1cHBvcnQsIHdoaWNoIGlzIGFscmVhZHkgYQo+IGRlcGVuZGVuY3kg
b2YgcGlzdGFjaGUuCj4gCj4gSW4gYWRkaXRpb24sIHVzZSA9IGluc3RlYWQgb2YgKz0gZm9yIHRo
ZSByYXBpZGpzb24gZGVwZW5kZW5jeSBpbiB0aGUKPiAubWsgZmlsZSwgYXMgaXQncyBhbiB1bmNv
bmRpdGlvbmFsIGRlcGVuZGVuY3kuCj4gCj4gQ2M6IFRob21hcyBSdXNjaGl2YWwgPHRob21hc0By
dXNjaGl2YWwuZGU+Cj4gQ2M6IEFybm91dCBWYW5kZWNhcHBlbGxlIChFc3NlbnNpdW0vTWluZCkg
PGFybm91dEBtaW5kLmJlPgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBQZXRhenpvbmkgPHRob21h
cy5wZXRhenpvbmlAYm9vdGxpbi5jb20+CgpBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKUmVn
YXJkcywKWWFubiBFLiBNT1JJTi4KCj4gLS0tCj4gIHBhY2thZ2UvcGlzdGFjaGUvQ29uZmlnLmlu
ICAgfCAyICstCj4gIHBhY2thZ2UvcGlzdGFjaGUvcGlzdGFjaGUubWsgfCAyICstCj4gIDIgZmls
ZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1n
aXQgYS9wYWNrYWdlL3Bpc3RhY2hlL0NvbmZpZy5pbiBiL3BhY2thZ2UvcGlzdGFjaGUvQ29uZmln
LmluCj4gaW5kZXggODA2YzI3MDc3YS4uNTNhNGI3M2E1OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdl
L3Bpc3RhY2hlL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2UvcGlzdGFjaGUvQ29uZmlnLmluCj4g
QEAgLTQsOSArNCw5IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9QSVNUQUNIRQo+ICAJZGVwZW5kcyBv
biBCUjJfVVNFX1dDSEFSCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMK
PiAgCWRlcGVuZHMgb24gQlIyX0lOU1RBTExfTElCU1REQ1BQCj4gLQlkZXBlbmRzIG9uIEJSMl9Q
QUNLQUdFX1JBUElESlNPTgo+ICAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9VU0VTX1VDTElC
Qwo+ICAJZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9IQVNfQklOVVRJTFNfQlVHXzI3NTk3Cj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfUkFQSURKU09OCj4gIAloZWxwCj4gIAkgIFBpc3RhY2hlIGlz
IGEgbW9kZXJuIGFuZCBlbGVnYW50IEhUVFAgYW5kIFJFU1QgZnJhbWV3b3JrCj4gIAkgIGZvciBD
KysuIEl0IGlzIGVudGlyZWx5IHdyaXR0ZW4gaW4gcHVyZSBDKysxNyBhbmQgcHJvdmlkZXMKPiBk
aWZmIC0tZ2l0IGEvcGFja2FnZS9waXN0YWNoZS9waXN0YWNoZS5tayBiL3BhY2thZ2UvcGlzdGFj
aGUvcGlzdGFjaGUubWsKPiBpbmRleCA2NWQ5YjI0MTJjLi5mNGRlNWUzYjJhIDEwMDY0NAo+IC0t
LSBhL3BhY2thZ2UvcGlzdGFjaGUvcGlzdGFjaGUubWsKPiArKysgYi9wYWNrYWdlL3Bpc3RhY2hl
L3Bpc3RhY2hlLm1rCj4gQEAgLTEwLDcgKzEwLDcgQEAgUElTVEFDSEVfTElDRU5TRSA9IEFwYWNo
ZS0yLjAKPiAgUElTVEFDSEVfTElDRU5TRV9GSUxFUyA9IExJQ0VOU0UKPiAgCj4gIFBJU1RBQ0hF
X0lOU1RBTExfU1RBR0lORyA9IFlFUwo+IC1QSVNUQUNIRV9ERVBFTkRFTkNJRVMgKz0gcmFwaWRq
c29uCj4gK1BJU1RBQ0hFX0RFUEVOREVOQ0lFUyA9IHJhcGlkanNvbgo+ICAKPiAgaWZlcSAoJChC
UjJfUEFDS0FHRV9PUEVOU1NMKSx5KQo+ICBQSVNUQUNIRV9ERVBFTkRFTkNJRVMgKz0gb3BlbnNz
bAo+IC0tIAo+IDIuMzcuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJv
b3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
LS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBS
ZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6
IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04g
ICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0t
LS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRw
Oi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2
ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0t
Xi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApi
dWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QK
