Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78742C46CD3
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 21:50:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3262381C18;
	Sun, 24 Dec 2023 21:50:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3262381C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2PqmGviN6eaK; Sun, 24 Dec 2023 21:49:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 807E081BF5;
	Sun, 24 Dec 2023 21:49:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 807E081BF5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A68C31BF86B
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7EF6D60B46
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 21:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7EF6D60B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1KJPo4bGj8n for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 21:49:56 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E06960AB0
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 21:49:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E06960AB0
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6ACAF5FFC0;
 Sun, 24 Dec 2023 22:49:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Dec 2023 22:49:52 +0100
Date: Sun, 24 Dec 2023 22:49:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZYingMU8uw9J21b7@landeda>
References: <20231221153620.237439-1-adam.duskett@amarulasolutions.com>
 <20231221153620.237439-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231221153620.237439-4-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1703454594;
 bh=f/G+iMsp+urz9Z6/6HvO3LN/BYQs6177lSMmJZUWxFQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jOdYAjWFKPlBfHndIKuWrrip5o5Mp+GzGquAPzUrnpcBTcE1V6CrjrkxY3ufKH+C4
 MAv2fr5O9dXeSFtjWV3advwykFxhfiypYwajXLzpPklm1z+QhT002qOFicyfpjXHTK
 mg4Cm/C6ceUs2VaUgwGruJYEoeg6ED9VqUL98hgnynTGTSOuZYBGSUbG9pSdZFHuMx
 Ntrt6+wN8RuiXDKxfB0sS6tpOgMt8X4kL+BKypchO5Ufrxahu/DUOBTSZg9u51Ya9t
 CndvIsh7GR/MO0o6pDQdq9NadnyId2QUWFngzv7SEC49LSmDXSxZZnk1FHqhz6sVvt
 QJ0+J6MdD1Npg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jOdYAjWF
Subject: Re: [Buildroot] [PATCH v4 04/10] package/ncurses: install foot
 terminfo if foot is selected
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

QWRhbSwgQWxsLAoKT24gMjAyMy0xMi0yMSAwODozNiAtMDcwMCwgQWRhbSBEdXNrZXR0IHNwYWtl
IHRodXNseToKPiBGcm9tIGZvb3QvSU5TVEFMTC5tZDoKPiBgYGAKPiBBcyBvZiBuY3Vyc2VzIDIw
MjEtMDctMzEsIG5jdXJzZXMgaW5jbHVkZXMgYSB2ZXJzaW9uIG9mIGZvb3TigJlzCj4gdGVybWlu
Zm8uICoqVGhlIHJlY29tbWVuZGF0aW9uIGlzIHRvIHVzZSB0aG9zZSoqLCBhbmQgb25seSBpbnN0
YWxsIHRoZQo+IHRlcm1pbmZvIGRlZmluaXRpb25zIGZyb20gdGhpcyBnaXQgcmVwbyBpZiB0aGUg
c3lzdGVt4oCZcyBuY3Vyc2VzCj4gcHJlZGF0ZXMgMjAyMS0wNy0zMS4KPiBgYGAKPiAKPiBTbyBp
dCBpcyBiZXN0IHRvIGZvbGxvdyB0aGUgaW5zdHJ1Y3Rpb25zIGFuZCBpbnN0YWxsIHRoZSBmb290
IHRlcm1pbmZvCj4gcHJvdmlkZWQgYnkgbmN1cnNlcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBZGFt
IER1c2tldHQgPGFkYW0uZHVza2V0dEBhbWFydWxhc29sdXRpb25zLmNvbT4KCkFwcGxpZWQgdG8g
bWFzdGVyLCB0aGFua3MuCgpSZWdhcmRzLApZYW5uIEUuIE1PUklOLgoKPiAtLS0KPiAgcGFja2Fn
ZS9uY3Vyc2VzL25jdXJzZXMubWsgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tayBi
L3BhY2thZ2UvbmN1cnNlcy9uY3Vyc2VzLm1rCj4gaW5kZXggM2I4MDVjYjFmZC4uMDBlMWMwZDQy
NCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL25jdXJzZXMvbmN1cnNlcy5tawo+ICsrKyBiL3BhY2th
Z2UvbmN1cnNlcy9uY3Vyc2VzLm1rCj4gQEAgLTczLDYgKzczLDEzIEBAIE5DVVJTRVNfVEVSTUlO
Rk9fRklMRVMgPSBcCj4gIAl4L3h0ZXJtLXhmcmVlODYgXAo+ICAJJChjYWxsIHFzdHJpcCwkKEJS
Ml9QQUNLQUdFX05DVVJTRVNfQURESVRJT05BTF9URVJNSU5GTykpCj4gIAo+ICtpZmVxICgkKEJS
Ml9QQUNLQUdFX0ZPT1QpLHkpCj4gK05DVVJTRVNfVEVSTUlORk9fRklMRVMgKz0gXAo+ICsJZi9m
b290IFwKPiArCWYvZm9vdCtiYXNlIFwKPiArCWYvZm9vdC1kaXJlY3QKPiArZW5kaWYKPiArCj4g
IGlmZXEgKCQoQlIyX1BBQ0tBR0VfTkNVUlNFU19XQ0hBUikseSkKPiAgTkNVUlNFU19DT05GX09Q
VFMgKz0gLS1lbmFibGUtd2lkZWMKPiAgTkNVUlNFU19MSUJfU1VGRklYID0gdwo+IC0tIAo+IDIu
NDMuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
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
