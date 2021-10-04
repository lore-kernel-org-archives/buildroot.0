Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51F8BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 08:14:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6B9D6121F
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 08:14:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B6B9D6121F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66407415E1;
	Mon,  4 Oct 2021 08:14:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M_s3yXRHBb1p; Mon,  4 Oct 2021 08:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5CBB4148C;
	Mon,  4 Oct 2021 08:14:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 678041BF2FD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 08:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6307D844DD
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 08:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Thi6t0XrXVXE for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 08:14:09 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B0FA84939
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 08:14:08 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 1CA30240012;
 Mon,  4 Oct 2021 08:14:04 +0000 (UTC)
Date: Mon, 4 Oct 2021 10:14:02 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211004101402.485b8670@bootlin.com>
In-Reply-To: <6dcfa41a-d847-1774-53af-111faaf561ee@mind.be>
References: <20211001125302.386178-1-herve.codina@bootlin.com>
 <20211001152610.1ff12e0c@windsurf>
 <20211001183539.53c49fdb@bootlin.com>
 <6dcfa41a-d847-1774-53af-111faaf561ee@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lua-augeas: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpPbiBTdW4sIDMgT2N0IDIwMjEgMTI6MzA6MDggKzAyMDAKQXJub3V0IFZhbmRlY2FwcGVs
bGUgPGFybm91dEBtaW5kLmJlPiB3cm90ZToKClsuLi5dCj4gPiBJIGNhbiBjaGFuZ2UgdG8gInNl
bGVjdCIgaGVyZSBpZiB5b3UgcHJlZmVyLiAgCj4gCj4gICBZZXMsIHNlbGVjdCBpcyBwcmVmZXJy
ZWQuIEkgZG9uJ3Qga25vdyB3aHkgaXQgd2FzIG5vdCBkb25lIGxpa2UgdGhhdCBmb3IgCj4gcHl0
aG9uLWF1Z2Vhcy4KCldpbGwgYmUgY2hhbmdlZCB0byAnc2VsZWN0JyBpbiB2MgoKPiAKPiBbc25p
cF0KPiA+IElmIHRoaXMgbWFrZXMgc2Vuc2UsIEkgY2FuIGFkZCB0aGUgZm9sbG93aW5nIGNvbW1l
bnQgaW4gdjI6Cj4gPiAgICBMREZMQUdTPSQoTERGTEFHUykgaXMgcHJlc2VudCB0byBwYXNzIExE
RkxBR1MgZnJvbSBlbnZpcm9ubWVudAo+ID4gICAgdG8gY29tbWFuZCBsaW5lLgo+ID4gICAgV2l0
aCBMREZMQUdTIGluIGNvbW1hbmQgbGluZSwgcmVsYXRlZCBvcmRpbmFyeSBhc2lnbm1lbnQgcHJl
c2VudAo+ID4gICAgaW4gdGhlIG1ha2VmaWxlIGFyZSBpZ25vcmVkIGFuZCBzbyBsdWEtYXVnZWFz
IG1ha2VmaWxlIGNhbm5vdCBub3QKPiA+ICAgIGFkZCAnLUwvbGliJyB0byB0aGlzIHZhbHVlLiAg
Cj4gCj4gICBZZXMgcGxlYXNlIGFkZCB0aGF0IGNvbW1lbnQuIEl0IGNhbiBiZSBpbiB0aGUgY29t
bWl0IG1lc3NhZ2Ugb3IgaW4gdGhlIC5tayAKPiBmaWxlLCB1cCB0byB5b3UuCgpDb21tZW50IHdp
bGwgYmUgYWRkZWQgaW4gLm1rIGluIHYyCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuCgpIZXJ2w6kK
Ci0tIApIZXJ2w6kgQ29kaW5hLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5n
aW5lZXJpbmcKaHR0cHM6Ly9ib290bGluLmNvbQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWls
ZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1
aWxkcm9vdAo=
