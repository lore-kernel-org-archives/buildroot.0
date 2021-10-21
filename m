Return-Path: <SRS0=A6xV=PJ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52D16C433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:03:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C12D16128B
	for <buildroot@archiver.kernel.org>; Thu, 21 Oct 2021 20:03:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C12D16128B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 759EB40749;
	Thu, 21 Oct 2021 20:03:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tiir012qrHc; Thu, 21 Oct 2021 20:03:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C70C240221;
	Thu, 21 Oct 2021 20:03:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6A7181BF360
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5103960F4B
 for <buildroot@lists.busybox.net>; Thu, 21 Oct 2021 20:03:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9E410NsC55gT for <buildroot@lists.busybox.net>;
 Thu, 21 Oct 2021 20:03:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 16D9460F38
 for <buildroot@buildroot.org>; Thu, 21 Oct 2021 20:03:06 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 02230240009;
 Thu, 21 Oct 2021 20:03:03 +0000 (UTC)
Date: Thu, 21 Oct 2021 22:03:03 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211021220303.3a532634@windsurf>
In-Reply-To: <5ea5ddc7-84fe-8636-1fc5-86b8d0242025@mind.be>
References: <20211008212136.721533-1-thomas.petazzoni@bootlin.com>
 <20211008212136.721533-2-thomas.petazzoni@bootlin.com>
 <5ea5ddc7-84fe-8636-1fc5-86b8d0242025@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] support/scripts/pkg-stats: use the new
 'stable_versions' field of release-monitoring.org
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
Cc: Francois Perrad <fperrad@gmail.com>, "Yann E.
 MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVGh1LCAyMSBPY3QgMjAyMSAyMToxNDoxOCArMDIwMApBcm5vdXQgVmFuZGVjYXBwZWxsZSA8
YXJub3V0QG1pbmQuYmU+IHdyb3RlOgoKPiA+ICAgLSAic3RhYmxlX3ZlcnNpb25zIiwgd2hpY2gg
aXMgYW4gYXJyYXkgb2Ygc3RyaW5nIGxpc3Rpbmcgb25seQo+ID4gICAgIG5vbi1wcmUtcmVsZWFz
ZSB2ZXJzaW9ucy4gSXQgaXMgb3JkZXJlZCBuZXdlc3QgZmlyc3QgdG8gb2xkZXN0Cj4gPiAgICAg
bGFzdC4gIAo+IAo+ICAgU28gd2UgY2FuIGJlIHN1cmUgdGhhdCAic3RhYmxlX3ZlcnNpb25zIiBp
cyBwcmVzZW50PyBZYW5uIGNvbW1pdHRlZCBhbiBlYXJsaWVyIAo+IHZlcnNpb24gYnkgRnJhbmPM
p29pcyBkb2luZyB0aGUgc2FtZSB0aGluZywgYnV0IGl0IGZhbGxzIGJhY2sgdG8gJ3ZlcnNpb24n
IGlmIAo+ICdzdGFibGVfdmVyc2lvbnMnIGRvZXNuJ3QgZXhpc3QuCgpXaGVuIEkgaW1wbGVtZW50
ZWQgdGhpcywgSSBsb29rZWQgYXQgdGhlIEpTT04gYmx1cmIgcHJvdmlkZWQgYnkKcmVsZWFzZS1t
b25pdG9yaW5nLm9yZywgYW5kIGluIGFsbCBjYXNlcyB0aGF0IEkgY291bGQgc2VlLCB0aGUKInN0
YWJsZV92ZXJzaW9ucyIgZmllbGQgd2FzIHByZXNlbnQuCgpJIGNhbm5vdCBiZSAxMDAlIHN1cmUg
dGhvdWdoIHRoYXQgaXQgd2lsbCAqYWx3YXlzKiBiZSBwcmVzZW50LgoKVGhvbWFzCi0tIApUaG9t
YXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFu
ZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1h
aWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9v
dC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
