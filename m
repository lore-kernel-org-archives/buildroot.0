Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53CAC433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 14:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73BC540886;
	Wed, 29 Dec 2021 14:19:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6C4vA_8VXqxf; Wed, 29 Dec 2021 14:19:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6EFB40868;
	Wed, 29 Dec 2021 14:19:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AD6881BF3A6
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 14:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9F63381466
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 14:19:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KEKAB1wlz23i for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 14:19:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 771FC8130F
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 14:19:13 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id A1685FF805;
 Wed, 29 Dec 2021 14:19:09 +0000 (UTC)
Date: Wed, 29 Dec 2021 15:19:08 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Message-ID: <20211229151908.48d7d04e@windsurf>
In-Reply-To: <ac4e193e-3fcb-80df-a433-70664e5fb850@kaod.org>
References: <20211112160413.2736382-1-clg@kaod.org>
 <20211228221430.7e8cb844@windsurf>
 <f7dc4424-a38a-c448-4436-f1e06b86ffb9@kaod.org>
 <20211229095040.43a2bb32@windsurf>
 <ac4e193e-3fcb-80df-a433-70664e5fb850@kaod.org>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gQ8OpZHJpYywKCk9uIFdlZCwgMjkgRGVjIDIwMjEgMTU6MDE6MzAgKzAxMDAKQ8OpZHJp
YyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cgo+ID4+IGJlY2F1c2UgdGhlIHNhbWUg
aW1hZ2UgY2FuIGJlIHVzZWQgZm9yIHRoZSBRRU1VIG1hY2hpbmUgaW1wbGVtZW50aW5nCj4gPj4g
dGhlIFBPV0VSOCBwcm9jZXNzb3IsIHdoaWNoIGFsc28gd29ya3MgZm9yIFBPV0VSOSBhbmQgUG93
ZXIxMC4gIAo+ID4gCj4gPiBTbyB3aHkgZG9uJ3Qgd2UgdGVzdCBpdCB3aXRoIC1NIHBvd2VybnY4
ID8gIAo+IAo+IFN1cmUuIFdvdWxkIHlvdSByYXRoZXIgaGF2ZSBhIHBwYzY0bGUtcG93ZXJudjgg
YW5kIGEgcHBjNjRsZS1wb3dlcm52OQo+IGNvbmZpZyBpbnN0ZWFkID8KCkluIHRoZSBpbnRlcmVz
dCBvZiBub3QgZ3Jvd2luZyB0b28gbXVjaCB0aGUgbnVtYmVyIG9mIGRlZmNvbmZpZ3MsIEkKd291
bGQgcGVyaGFwcyBzdWdnZXN0IHRvIGhhdmUganVzdCBhIHBvd2VybnY4IGNvbmZpZ3VyYXRpb24s
IGFuZCBpbiBpdHMKcmVhZG1lLnR4dCBmaWxlLCBpbmRpY2F0ZSB0aGF0IGl0IGNhbiBiZSBzaW1p
bGFybHkgdXNlZCBvbiBwb3dlcnBjbnY5LgoKPiBJIGhhdmUgYSBmZXcgb3RoZXIgcGF0Y2hlcyBh
ZGRpbmcgc2ltaWxhciBib2FyZHMgZm9yIDQ0eCBDUFVzLiBJIGNhbgo+IHJlc2VuZCBhIHYyIGZv
ciB0aGUgd2hvbGUuCgpTb3VuZHMgdXNlZnVsLgoKPiBXaGF0J3MgdGhlIHByb2Nlc3MgdG8gYnVt
cCB0aGUgUUVNVSB2ZXJzaW9uID8KClNlbmQgYSBwYXRjaCBhZ2FpbnN0IHRoZSBwYWNrYWdlL3Fl
bXUvIHBhY2thZ2UsIGl0J3MgYXMgc2ltcGxlIGFzIHRoYXQuCklkZWFsbHksIHdoZW4geW91IGRv
IHRoYXQsIG1ha2Ugc3VyZSB0byByZXRlc3QgYWxsIHRoZSBRZW11IGRlZmNvbmZpZ3MsCnRvIGVu
c3VyZSB0aGV5IGNvbnRpbnVlIHRvIGJvb3Qgd2VsbCB1bmRlciB0aGUgbmV3IFFlbXUgdmVyc2lv
bi4gWW91CmNhbiB1c2UgR2l0bGFiIENJIHRvIGF1dG9tYXRlIHRoaXMgdGVzdGluZy4KCkJlc3Qg
cmVnYXJkcywKClRob21hcwotLSAKVGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywg
Qm9vdGxpbgpFbWJlZGRlZCBMaW51eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmlu
ZwpodHRwczovL2Jvb3RsaW4uY29tCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5v
cmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290
Cg==
