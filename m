Return-Path: <SRS0=JPVL=O4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86655C433F5
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:17:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA44060F9C
	for <buildroot@archiver.kernel.org>; Fri,  8 Oct 2021 13:17:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA44060F9C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 81F2B40517;
	Fri,  8 Oct 2021 13:17:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_IhDsm3k_tb; Fri,  8 Oct 2021 13:17:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 998E8404CE;
	Fri,  8 Oct 2021 13:16:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 028FE1BF591
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F14E3404CE
 for <buildroot@lists.busybox.net>; Fri,  8 Oct 2021 13:16:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fb6nu4TmACL6 for <buildroot@lists.busybox.net>;
 Fri,  8 Oct 2021 13:16:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A93C7401E0
 for <buildroot@buildroot.org>; Fri,  8 Oct 2021 13:16:56 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id AFC8160008;
 Fri,  8 Oct 2021 13:16:54 +0000 (UTC)
Date: Fri, 8 Oct 2021 15:16:53 +0200
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211008151653.6be74611@windsurf>
In-Reply-To: <20211005181523.085d94b8@bootlin.com>
References: <20211005131122.3070186-1-herve.codina@bootlin.com>
 <20211005155310.7832c4e4@windsurf>
 <20211005181523.085d94b8@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/pecl-dbus: new package
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

SGVsbG8sCgpPbiBUdWUsIDUgT2N0IDIwMjEgMTg6MTU6MjMgKzAyMDAKSGVydmUgQ29kaW5hIDxo
ZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+IHdyb3RlOgoKPiA+IFRoYW5rcyBmb3IgdGhpcyBuZXcg
cGFja2FnZS4gSSdtIGp1c3Qgd29uZGVyaW5nIGFib3V0IHRoZSBwYWNrYWdlIG5hbWUuCj4gPiBU
aGUgdXBzdHJlYW0gcHJvamVjdCBpcyBpbmRlZWQgbmFtZWQgcGVjbC1kYnVzLCB3aGVyZSBwZWNs
IHN0YW5kcyBmb3IKPiA+ICJQSFAgRXh0ZW5zaW9uIENvbW11bml0eSBMaWJyYXJ5Ii4gQnV0IGFs
bCBvdXIgb3RoZXIgUEhQIHBhY2thZ2VzIGFyZQo+ID4gbmFtZWQgInBocC08c29tZXRoaW5nPiIu
IFNob3VsZCB3ZSBuYW1lIHRoaXMgcGFja2FnZSAicGhwLWRidXMiID8KPiA+ICJwaHAtcGVjbC1k
YnVzIiA/ICAKPiAKPiAicGhwLXBlY2wtZGJ1cyIgc291bmRzIGdvb2QuCj4gSWYgaXQncyBvayBm
b3IgZXZlcnlvbmUsIEkgd2lsbCBjaGFuZ2UgaW4gdjIuCgpGaW5lIHdpdGggbWUuIEFzIHNhaWQs
IEknbSBmaW5lIHdpdGggZWl0aGVyIHBocC1kYnVzIG9yIHBocC1wZWNsLWRidXMuCgo+ID4gPiAr
U2lnbmVkLW9mZi1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFAYm9vdGxpbi5jb20+ICAg
IAo+ID4gCj4gPiBBbmQgc3VibWl0IHRoaXMgdXBzdHJlYW0gPyAgCj4gCj4gSSBkaWQgdG9vLgoK
8J+RjQoKPiA+IEkgd2FzIHdvbmRlcmluZyBpZiB5b3UgbmVlZCBib3RoIEJSMl9QQUNLQUdFX0xJ
QlhNTDIgYW5kCj4gPiBCUjJfUEFDS0FHRV9QSFBfRVhUX0xJQlhNTDIsIGkuZSBkb2VzIHBlY2wt
ZGJ1cyBsaW5rIGRpcmVjdGx5IHdpdGggdGhlCj4gPiBsaWJ4bWwyIG5hdGl2ZSBsaWJyYXJ5ID8g
IAo+IAo+IGxpYnhtbDIgaXMgbmVlZGVkLiBJbiBkYnVzLmMgc291cmNlIGZpbGUsIHdlIGhhdmUK
PiAgICNpbmNsdWRlICJsaWJ4bWwvcGFyc2VyLmgiCj4gICAjaW5jbHVkZSAibGlieG1sL3BhcnNl
ckludGVybmFscy5oIgo+IGFuZCBjYWxscyB0byBsaWJ4bWwyIGZ1bmN0aW9ucyBzdWNoIGFzICd4
bWxQYXJzZU1lbW9yeSgpJwoKU28sIGNvbmZpcm1zIHRoYXQgaXQgbGlua3Mgd2l0aCBsaWJ4bWwy
IGRpcmVjdGx5LCBpbmRlZWQhCgo+ID4gcGVjbC1kYnVzIGNhbiBidWlsZCB3aXRob3V0IGRidXMg
PyE/ICAKPiAKPiBJbmRlZWQsICctLWVuYWJsZS1kYnVzJyBpcyBub3QgbmVlZGVkIGFuZCB3aWxs
IGJlIHJlbW92ZWQgaW4gdjIuCgpBQ0ssIHBlcmZlY3QuCgpUaGFua3MhCgpUaG9tYXMKLS0gClRo
b21hcyBQZXRhenpvbmksIGNvLW93bmVyIGFuZCBDRU8sIEJvb3RsaW4KRW1iZWRkZWQgTGludXgg
YW5kIEtlcm5lbCBlbmdpbmVlcmluZyBhbmQgdHJhaW5pbmcKaHR0cHM6Ly9ib290bGluLmNvbQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRy
b290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
