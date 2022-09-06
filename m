Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E24CECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 11:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8EF3812C7;
	Tue,  6 Sep 2022 11:48:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EF3812C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OJm2DJwvhSur; Tue,  6 Sep 2022 11:48:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B412C81096;
	Tue,  6 Sep 2022 11:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B412C81096
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 57DBE1BF337
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B7786107A
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 11:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B7786107A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNN7BWzM5ToH for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 11:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B1A605E8
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 72B1A605E8
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 11:48:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7DDCEB00533;
 Tue,  6 Sep 2022 13:47:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 13:47:56 +0200
Date: Tue, 6 Sep 2022 13:47:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: =?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>
Message-ID: <20220906114756.GY1490660@scaer>
References: <20220906102322.899679-1-kory.maincent@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906102322.899679-1-kory.maincent@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662464880;
 bh=7wxt2uy9uYpY9M76kO3b93HHSfOULPaGjv214SAWqZM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jShk2NMvHbq/y+9MYjb2tqw9N5W6xS+dqnkChVIq6OT1fH/uOQ+VNfq5GjU1K/Scp
 CIBHE46HlRShV248bM0g+18Sea2TTx6RChrDZIkeHqz/RB3kyC919D3K1ibcstlmrR
 gBIS5Vpdnsl3UA6t6h5VEp+iPwN7jVGubScRehN2k7wq8hFyq+1bFkEE3OjfOeUdH5
 S5TqIb/KA7e3xZwlBIlpxi44WnJ0VUNh6jC86FW7iEc7fPBA5MFMkr/ncAX7J8qiwF
 lOm4TfM2A1efMFlB+QuiGjjnIK5KLpcuDgy/IQbM6sYVn1Eu7xlIVT9ZkYf7o9apAg
 BUN1nEbzwAnFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jShk2NMv
Subject: Re: [Buildroot] [PATCH v2 1/2] boot/optee-os: remove
 host-python-pillow build dependency
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

S8O2cnksIEFsbCwKCk9uIDIwMjItMDktMDYgMTI6MjMgKzAyMDAsIEvDtnJ5IE1haW5jZW50IHZp
YSBidWlsZHJvb3Qgc3Bha2UgdGh1c2x5Ogo+IEZyb206IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFp
bmNlbnRAYm9vdGxpbi5jb20+Cj4gCj4gaG9zdC1weXRob24tcGlsbG93IGRlcGVuZGVuY3kgd2Fz
IG5lZWRlZCB0byBidWlsZCB0aGUgU1RNaWNyb2VsZWNyb25pY3MKPiB2ZXJzaW9uIGR1cmluZyBp
dHMgcmMgdmVyc2lvbnMgYnV0IGlzIGlzIG5vdCBuZWVkZWQgYW55bW9yZSBpbiB0aGUgcmVsZWFz
ZS4KPiBJdCBpcyB0aGVuIHVzZWxlc3MgdG8ga2VlcCB0aGlzIGRlcGVuZGVuY3kuCj4gCj4gU2ln
bmVkLW9mZi1ieTogS29yeSBNYWluY2VudCA8a29yeS5tYWluY2VudEBib290bGluLmNvbT4KCllv
dSBmb3Jnb3QgdG8gYWRkIGFuIGVudHJ5IGluIENvbmZpZy5pbi5sZWdhY3kuIEJ1dCBzaW5jZSB0
aGF0IG9wdGlvbgp3YXMgbmV2ZXIgcGFydCBvZiBhIHJlbGVhc2UsIHdlIGluZGVlZCBkbyBub3Qg
d2FudCB0byBhZGQgYSBsZWdhY3kKZW50cnkuCgpBcHBsaWVkIHRvIG1hc3RlciAoeWVzLCBtYXN0
ZXIgb24gcHVycG9zZSksIHRoYW5rcy4KClJlZ2FyZHMsCllhbm4gRS4gTU9SSU4uCgo+IC0tLQo+
ICBib290L29wdGVlLW9zL0NvbmZpZy5pbiAgIHwgNyAtLS0tLS0tCj4gIGJvb3Qvb3B0ZWUtb3Mv
b3B0ZWUtb3MubWsgfCA0IC0tLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxMSBkZWxldGlvbnMoLSkK
PiAKPiBkaWZmIC0tZ2l0IGEvYm9vdC9vcHRlZS1vcy9Db25maWcuaW4gYi9ib290L29wdGVlLW9z
L0NvbmZpZy5pbgo+IGluZGV4IGRiN2E5M2MxMGMuLjUyNDQ3MDBiYzIgMTAwNjQ0Cj4gLS0tIGEv
Ym9vdC9vcHRlZS1vcy9Db25maWcuaW4KPiArKysgYi9ib290L29wdGVlLW9zL0NvbmZpZy5pbgo+
IEBAIC05MSwxMyArOTEsNiBAQCBjb25maWcgQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19QWVRI
T05fQ1JZUFRPR1JBUEhZCj4gIAkgIHB5dGhvbi1jcnlwdG9ncmFwaHkuIFNlbGVjdCB0aGlzIG9w
dGlvbiBpZiBvcHRlZS1vcyBuZWVkcwo+ICAJICBweXRob24tY3J5cHRvZ3JhcGh5IHRvIGJlIGJ1
aWx0Lgo+ICAKPiAtY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfTkVFRFNfUFlUSE9OX1BJTExP
Vwo+IC0JYm9vbCAiT1AtVEVFIE9TIG5lZWRzIGhvc3QtcHl0aG9uLXBpbGxvdyIKPiAtCWhlbHAK
PiAtCSAgU29tZSBzcGVjaWZpYyBPUC1URUUgT1MgdmVyc2lvbnMgbWF5IHVzZSBweXRob24tcGls
bG93IHRvCj4gLQkgIGJ1aWxkIHRoZSBUcnVzdGVkIFVzZXIgSW50ZXJmYWNlIGZlYXR1cmUuICBT
ZWxlY3QgdGhpcwo+IC0JICBvcHRpb24gaWYgb3B0ZWUtb3MgbmVlZCBweXRob24tcGlsbG93IHRv
IGJlIGJ1aWx0Lgo+IC0KPiAgY29uZmlnIEJSMl9UQVJHRVRfT1BURUVfT1NfQ09SRQo+ICAJYm9v
bCAiQnVpbGQgY29yZSIKPiAgCWRlZmF1bHQgeQo+IGRpZmYgLS1naXQgYS9ib290L29wdGVlLW9z
L29wdGVlLW9zLm1rIGIvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+IGluZGV4IDEzNmM0YjI0
MDEuLjM4YjBkMzY3ZWYgMTAwNjQ0Cj4gLS0tIGEvYm9vdC9vcHRlZS1vcy9vcHRlZS1vcy5tawo+
ICsrKyBiL2Jvb3Qvb3B0ZWUtb3Mvb3B0ZWUtb3MubWsKPiBAQCAtMzYsMTAgKzM2LDYgQEAgZWxz
ZQo+ICBPUFRFRV9PU19ERVBFTkRFTkNJRVMgKz0gaG9zdC1weXRob24tcHljcnlwdG9kb21leAo+
ICBlbmRpZgo+ICAKPiAtaWZlcSAoJChCUjJfVEFSR0VUX09QVEVFX09TX05FRURTX1BZVEhPTl9Q
SUxMT1cpLHkpCj4gLU9QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBob3N0LXB5dGhvbi1waWxsb3cK
PiAtZW5kaWYKPiAtCj4gIGlmZXEgKCQoQlIyX1RBUkdFVF9PUFRFRV9PU19ORUVEU19EVEMpLHkp
Cj4gIE9QVEVFX09TX0RFUEVOREVOQ0lFUyArPSBob3N0LWR0Ywo+ICBlbmRpZgo+IC0tIAo+IDIu
MjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Cj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gaHR0
cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290CgotLSAK
Li0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0tLS0tLi0tLS0tLS0tLS0tLS0tLS0t
LS4tLS0tLS0tLS0tLS0tLS0tLS0tLS4KfCAgWWFubiBFLiBNT1JJTiAgfCBSZWFsLVRpbWUgRW1i
ZWRkZWQgfCAvIlwgQVNDSUkgUklCQk9OIHwgRXJpY3MnIGNvbnNwaXJhY3k6IHwKfCArMzMgNjYy
IDM3NiAwNTYgfCBTb2Z0d2FyZSAgRGVzaWduZXIgfCBcIC8gQ0FNUEFJR04gICAgIHwgIF9fXyAg
ICAgICAgICAgICAgIHwKfCArMzMgNTYxIDA5OSA0MjcgYC0tLS0tLS0tLS0tLS4tLS0tLS0tOiAg
WCAgQUdBSU5TVCAgICAgIHwgIFxlLyAgVGhlcmUgaXMgbm8gIHwKfCBodHRwOi8veW1vcmluLmlz
LWEtZ2Vlay5vcmcvIHwgXy8qXF8gfCAvIFwgSFRNTCBNQUlMICAgIHwgICB2ICAgY29uc3BpcmFj
eS4gIHwKJy0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLV4tLS0tLS0tXi0tLS0tLS0tLS0t
LS0tLS0tLV4tLS0tLS0tLS0tLS0tLS0tLS0tLScKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVp
bGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9i
dWlsZHJvb3QK
