Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E14AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 17:22:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DC21418AC;
	Tue, 22 Nov 2022 17:22:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0DC21418AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a4YMOsH1SX-h; Tue, 22 Nov 2022 17:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD27418B7;
	Tue, 22 Nov 2022 17:22:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADD27418B7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9ACB61BF82F
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 17:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 73229418C0
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 17:22:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 73229418C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dhlJLJ3PMTVr for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 17:22:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 36E0C41895
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 36E0C41895
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 17:22:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:87c9:63c5:f01e:64cb])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 4739C19F5B6;
 Tue, 22 Nov 2022 18:21:56 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 22 Nov 2022 18:21:55 +0100
Date: Tue, 22 Nov 2022 18:21:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Anisse Astier <anisse@astier.eu>
Message-ID: <20221122172155.GA3859771@scaer>
References: <20221121224955.951056-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221121224955.951056-1-anisse@astier.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669137721;
 bh=IZSMPjHSUx4YkSLJ3iHdxEKs/HhePch0MA7tTtLWoC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ag3Ri5xnkOUT5xXkR8UwSBULqAmlBwUYf3S1m7/IGE66BOtjYtSbl5zXtENtV63sZ
 tvMcptatlCcbb0DKc3YZUbtzwDGOUaYkauggrnI7mDoTlZYCUb4y0uO2t/CfANxz86
 JrBqnoadDErHBXm1NG3Hc8QhceemAu5TRmM7RYkDtfX2q12GtKrTm6r3L7Prwy1Pof
 Lrm8JGHfHrJ5UnF6IO6fIDf1gLyzkSMIL2sIiPU/weBCN7h6aJ8GnfCTQuSVWz/Ldt
 dy8ENWEhFPDVZ/C7o5y2/G3wcbAHWfmWHD8+zmz2IFf+VpqYOhxuY46OkGl8gooXjr
 JN3lJWCmJt4uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ag3Ri5xn
Subject: Re: [Buildroot] [PATCH v2] package/go: disable cgo support with
 static libs
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

QW5pc3NlLCBBbGwsCgpPbiAyMDIyLTExLTIxIDIzOjQ5ICswMTAwLCBBbmlzc2UgQXN0aWVyIHNw
YWtlIHRodXNseToKPiBUaGUgZ28gc3RkbGliICJwbHVnaW4i4oCvcGFja2FnZSByZWxpZXMgb24g
ZGxmY24uaCB3aGljaCBpc24ndCBhdmFpbGFibGUKPiB3aGVuIHdlIGhhdmUgQlIyX1NUQVRJQ19M
SUJTPXkuCj4gCj4gVGhpcyBzaG91bGQgZml4IHRoaXMgYnVpbGQgZXJyb3IgZnJvbSBhdXRvYnVp
bGRlcnM6Cj4gCj4gL2J1aWxkcm9vdC9idWlsZC9ob3N0LWdvLTEuMTkuMy9zcmMvcGx1Z2luL3Bs
dWdpbl9kbG9wZW4uZ286MTE6MTA6IGZhdGFsIGVycm9yOiBkbGZjbi5oOiBObyBzdWNoIGZpbGUg
b3IgZGlyZWN0b3J5Cj4gICAgMTEgfCAjaW5jbHVkZSA8ZGxmY24uaD4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBBbmlzc2UgQXN0aWVyIDxhbmlzc2VAYXN0aWVyLmV1Pgo+IC0tLQo+ICBwYWNrYWdlL2dv
L0NvbmZpZy5pbi5ob3N0IHwgMSArCj4gIHBhY2thZ2UvZ28vZ28ubWsgICAgICAgICAgfCAyICst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vQ29uZmlnLmluLmhvc3QgYi9wYWNrYWdlL2dvL0NvbmZp
Zy5pbi5ob3N0Cj4gaW5kZXggZGVkMDJkM2IzYS4uOWU3OWE3ZGZkNSAxMDA2NDQKPiAtLS0gYS9w
YWNrYWdlL2dvL0NvbmZpZy5pbi5ob3N0Cj4gKysrIGIvcGFja2FnZS9nby9Db25maWcuaW4uaG9z
dAo+IEBAIC0yMyw2ICsyMyw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9IT1NUX0dPX1RBUkdFVF9D
R09fTElOS0lOR19TVVBQT1JUUwo+ICAJIyBHbyBkb2Vzbid0IHN1cHBvcnQgQ0dPIGxpbmtpbmcg
b24gTUlQUzY0eCBwbGF0Zm9ybXMKPiAgCSMgU2VlOiBodHRwczovL2dpdGh1Yi5jb20va2FyYWxh
YmUveGdvL2lzc3Vlcy80Ngo+ICAJZGVwZW5kcyBvbiAhQlIyX21pcHM2NCAmJiAhQlIyX21pcHM2
NGVsCj4gKwlkZXBlbmRzIG9uICFCUjJfU1RBVElDX0xJQlMKCldoeSBkb24ndCB3ZSBtb3ZlIHRo
ZSBkZXBlbmRlbmN5IG9uIHRocmVhZHMgdG8gdGhpcyBzeW1ib2wsIGFuZC4uLgoKPiAgIyBIb3N0
IGdvIHBhY2thZ2VzIHNob3VsZCBkZXBlbmQgb24gQlIyX1BBQ0tBR0VfSE9TVF9HT19IT1NUX0FS
Q0hfU1VQUE9SVFMKPiAgY29uZmlnIEJSMl9QQUNLQUdFX0hPU1RfR09fSE9TVF9BUkNIX1NVUFBP
UlRTCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvZ28vZ28ubWsgYi9wYWNrYWdlL2dvL2dvLm1rCj4g
aW5kZXggZmQ0Y2FhMmU1YS4uZDU0YmU4Y2Q3OCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2dvL2dv
Lm1rCj4gKysrIGIvcGFja2FnZS9nby9nby5tawo+IEBAIC04Nyw3ICs4Nyw3IEBAIEhPU1RfR09f
VEFSR0VUX0VOViA9IFwKPiAgIyBzZXQsIGJ1aWxkIGluIGNnbyBzdXBwb3J0IGZvciBhbnkgZ28g
cHJvZ3JhbXMgdGhhdCBtYXkgbmVlZCBpdC4gIE5vdGUgdGhhdAo+ICAjIGFueSB0YXJnZXQgcGFj
a2FnZSBuZWVkaW5nIGNnbyBzdXBwb3J0IG11c3QgaW5jbHVkZQo+ICAjICdkZXBlbmRzIG9uIEJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFMnIGluIGl0cyBjb25maWcgZmlsZS4KPiAtaWZlcSAoJChC
UjJfVE9PTENIQUlOX0hBU19USFJFQURTKSx5KQo+ICtpZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFT
X1RIUkVBRFMpOiQoQlIyX1NUQVRJQ19MSUJTKSx5OikKCi4uLiB0aGVuIHRoaXMgY29uZGl0aW9u
IHdvdWxkIGJlIGp1c3Q6CiAgICBpZmVxICgkKEJSMl9QQUNLQUdFX0hPU1RfR09fVEFSR0VUX0NH
T19MSU5LSU5HX1NVUFBPUlRTKSx5KQoKSSBhbSBub3QgZm9uZCBvZiB0aGUgY3VycmVudCBzaXR1
YXRpb24sIHdoZXJlIHBhcnRzIG9mIHRoZSBjb25kaXRpb25zCmFyZSBpbiBDb25maWcuaW4sIGFu
ZCB0aGUgcmVzdCBpbiBnby5tay4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+ICBIT1NUX0dP
X0NHT19FTkFCTEVEID0gMQo+ICBlbHNlCj4gIEhPU1RfR09fQ0dPX0VOQUJMRUQgPSAwCj4gLS0g
Cj4gMi4zOC4xCj4gCgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0t
Li0tLS0tLS0tLS0tLS0tLS0tLS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJ
TiAgfCBSZWFsLVRpbWUgRW1iZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNw
aXJhY3k6IHwKfCArMzMgNjYyIDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FN
UEFJR04gICAgIHwgIF9fXyAgICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0t
LS0tLS0tLS4tLS0tLS0tOiAgWCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwK
fCBodHRwOi8veW1vcmluLmlzLWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAg
IHwgICB2ICAgY29uc3BpcmFjeS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4t
LS0tLS0tXi0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
