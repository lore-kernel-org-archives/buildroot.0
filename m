Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252E1C4167B
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 21:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6B9560C0F;
	Tue,  7 Nov 2023 21:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6B9560C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R0WCQQPBz_iI; Tue,  7 Nov 2023 21:52:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D7BAE60D4F;
	Tue,  7 Nov 2023 21:52:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D7BAE60D4F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6A951BF5A8
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:52:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A44B84176A
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 21:52:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A44B84176A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VuUNAIHKBp-S for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 21:52:05 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 90B644176C
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 21:52:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 90B644176C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:251d:f18c:43f3:5a5b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B561113F86E;
 Tue,  7 Nov 2023 22:51:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Nov 2023 22:51:57 +0100
Date: Tue, 7 Nov 2023 22:51:57 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20231107215157.GN229059@scaer>
References: <20231031090114.618913-1-giulio.benetti@benettiengineering.com>
 <a9454b05-faf1-4b77-9247-79f028735fe1@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a9454b05-faf1-4b77-9247-79f028735fe1@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1699393924;
 bh=k9W7A4g4CLFA/KaKthd0HCzPtSm+ebe2UjuhbGOt0bk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lwdwQ0QjBysg+vDEsC7V9I2/rT7yvIAdGEd+8bUjxEPCQKV6vcyLj3QREbr4Wazid
 +pVrT1srZPnJ+ljyaRjk3OzpSEmaL0OT4DhRrDy1FxwabjYIq90gSItJzwop3kC6Vg
 pZjxLC8Si4HYt5AT/cbpGj3+FMkwBEZlqgxVv1jjVxMPJ7r6pP9x7GFgOoaqDH5mMR
 oN9LkyDrVvbQ4KPtEaVKtK6R5EW/Q16FRPcOCuXIGd+bfy5/i9BMLW/VUICCwTxfwf
 vN6L+OGZLnzLAPdGenuNZOWdfNMVVlJGRbFl3/QD82m6km4oj11v2YsFJ1+5A+B+Gm
 Xmxq2AX29PJKQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lwdwQ0Qj
Subject: Re: [Buildroot] [PATCH] package/nodejs: fix additional modules
 installation
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

TWFyY3VzLCBBbGwsCgpPbiAyMDIzLTExLTA2IDIwOjEyICswMTAwLCBNYXJjdXMgSG9mZm1hbm4g
dmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4gVGhhbmtzIEd1aWxpbywgdGhpcyBmaXhlcyBv
dXIgYnVpbGQgcHJvYmxlbSEKPiAKPiBPbiAzMS4xMC4yMyAxMDowMSwgR2l1bGlvIEJlbmV0dGkg
d3JvdGU6Cj4gPkF0IHRoZSBtb21lbnQgdGhlIG5wbV9jb25maWdfbm9kZWRpciBpcyBzZXQgdG8g
dGhlIGJ1aWxkIGRpcmVjdG9yeSBidXQKPiA+bnBtIG5vZGVkaXIgbXVzdCBiZSB0aGUgb25lIG9u
IHRhcmdldCB0byBmaW5kIHRoZSBleHBlY3RlZCBmaWxlcy4gU28gbGV0J3MKPiA+c2V0IG5wbV9j
b25maWdfbm9kZWRpciB0byAkKFRBUkdFVF9ESVIpL3Vzci4KPiA+Cj4gPkZpeGVzOgo+ID5odHRw
czovL2J1Z3MuYnVzeWJveC5uZXQvc2hvd19idWcuY2dpP2lkPTE1ODI2Cj4gPgo+ID5TaWduZWQt
b2ZmLWJ5OiBHaXVsaW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5n
LmNvbT4KPiBUZXN0ZWQtYnk6IE1hcmN1cyBIb2ZmbWFubiA8bWFyY3VzLmhvZmZtYW5uQG90aGVy
bW8uZGU+CgpUaGFua3MgZm9yIHByb3ZpZGluZyB5b3VyIHRlc3RlZC1ieSB0YWcuCgpIb3dldmVy
LCBzaW5jZSBJIGNoYW5nZWQgdGhlIHBhdGNoIHRvIHVzZSBTVEFHSU5HX0RJUiBpbnN0ZWFkIG9m
ClRBUkdFVF9ESVIsIEkgZHJvcHBlZCB5b3VyIHRlc3RlZC1ieSwgYmVjYXVzZSB0aGUgbmV3IGNv
ZGUgaXMgbm93IHRvbwpkaWZmZXJlbnQgZnJvbSB3aGF0IHlvdSB0ZXN0ZWQuCgpTdGlsbCwgc2Vl
aW5nIGEgVGVzdGVkLWJ5IHRhZyBvbiBzdWNoIGEgcGF0Y2ggZ2F2ZSBtZSBlbm91Z2ggaW50ZXJl
c3QKdG8gbG9vayBkZWVwZXIgYW5kIGludmVzdGlnYXRlIHRvIGZpbmQgdGhlIGFjdHVhbCBpc3N1
ZSBhbmQgY29tZSB1cCB3aXRoCmEgYmV0dGVyIGZpeC4gU28sIHRoYW5rIHlvdSEKClJlZ2FyZHMs
Cllhbm4gRS4gTU9SSU4uCgo+ID4tLS0KPiA+ICBwYWNrYWdlL25vZGVqcy9ub2RlanMubWsgfCAy
ICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4g
Pgo+ID5kaWZmIC0tZ2l0IGEvcGFja2FnZS9ub2RlanMvbm9kZWpzLm1rIGIvcGFja2FnZS9ub2Rl
anMvbm9kZWpzLm1rCj4gPmluZGV4IDJhOGM1NzA5MzIuLjhmODY0MTMwNDkgMTAwNjQ0Cj4gPi0t
LSBhL3BhY2thZ2Uvbm9kZWpzL25vZGVqcy5tawo+ID4rKysgYi9wYWNrYWdlL25vZGVqcy9ub2Rl
anMubWsKPiA+QEAgLTIwLDcgKzIwLDcgQEAgTk9ERUpTX0JJTl9FTlYgPSAkKFRBUkdFVF9DT05G
SUdVUkVfT1BUUykgXAo+ID4gICAgICBucG1fY29uZmlnX2FyY2g9JChOT0RFSlNfQ1BVKSBcCj4g
PiAgICAgIG5wbV9jb25maWdfdGFyZ2V0X2FyY2g9JChOT0RFSlNfQ1BVKSBcCj4gPiAgICAgIG5w
bV9jb25maWdfYnVpbGRfZnJvbV9zb3VyY2U9dHJ1ZSBcCj4gPi0gICAgIG5wbV9jb25maWdfbm9k
ZWRpcj0kKEJVSUxEX0RJUikvbm9kZWpzLSQoTk9ERUpTX1ZFUlNJT04pIFwKPiA+KyAgICAgbnBt
X2NvbmZpZ19ub2RlZGlyPSQoVEFSR0VUX0RJUikvdXNyIFwKPiA+ICAgICAgbnBtX2NvbmZpZ19w
cmVmaXg9JChUQVJHRVRfRElSKS91c3IgXAo+ID4gICAgICBucG1fY29uZmlnX2NhY2hlPSQoQlVJ
TERfRElSKS8ubnBtLWNhY2hlCj4gPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gCj4gb3RoZXJtbyBHbWJIIHwgU2l0eiBkZXIgR2VzZWxsc2NoYWZ0OiBBbHplbmF1IHwgQW10
c2dlcmljaHQgQXNjaGFmZmVuYnVyZzogSFJCIDE0NzgzIHwgVVN0LUlkTnIuOiBERTMxOTk3Nzk3
OCB8IEdlc2Now6RmdHNmw7xocnVuZzogRHIuIERlbm5pcyBNZXR6Lgo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlz
dAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAKLi0tLS0tLS0tLS0tLS0tLS0tLi0tLS0t
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
