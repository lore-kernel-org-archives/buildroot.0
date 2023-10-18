Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2862CDB47E
	for <buildroot@archiver.kernel.org>; Wed, 18 Oct 2023 16:43:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 65FC940004;
	Wed, 18 Oct 2023 16:43:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 65FC940004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kiGAgZSQF17E; Wed, 18 Oct 2023 16:43:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D1A340597;
	Wed, 18 Oct 2023 16:42:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1D1A340597
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D1C61BF267
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2361442166
 for <buildroot@lists.busybox.net>; Wed, 18 Oct 2023 16:42:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2361442166
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RDUK0jhbn0yP for <buildroot@lists.busybox.net>;
 Wed, 18 Oct 2023 16:42:57 +0000 (UTC)
X-Greylist: delayed 29081 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 18 Oct 2023 16:42:56 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8215841E71
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8215841E71
 for <buildroot@buildroot.org>; Wed, 18 Oct 2023 16:42:56 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 44D5740008;
 Wed, 18 Oct 2023 16:42:53 +0000 (UTC)
Date: Wed, 18 Oct 2023 18:42:52 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20231018184252.20c64e43@bootlin.com>
In-Reply-To: <20231018161859.GB2607@scaer>
References: <cover.1697576472.git.yann.morin.1998@free.fr>
 <3a0be46ecee62af708a5c63ebcd4845228fc29a5.1697576472.git.yann.morin.1998@free.fr>
 <20231018105301.495c5899@bootlin.com> <20231018152047.GA2607@scaer>
 <20231018173807.1586a883@bootlin.com> <20231018161859.GB2607@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1697647373;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tc8tamCH6AGQolASxcbkxArz94I/iPIV2KZ6DnR1f0A=;
 b=Qrt3FDTobcamNw/0iUydhX7fXLt9THtoa6eh8cukyOzoZcUYANJJ6PxC5Juh3A35Foqyik
 fZdrzjuu+xI9hT9fSUgJH02N8u1ydknwDN9myQRbtDPGaybe9yCgXBKS9ic3+e3VDuUDot
 gYnkLyEXj82bCdTFlpNtUJ5a7tRi7M6saDIAMF8F0/mvW6HC0rGCsALSI60GeIgeMmVMlO
 u6BxS0OfLkQTdTl1A8GBq7rC5D77vqRWKxcYm8Ogyc9ngoj3bQ5j/skXZBstcl7U4T2Xhi
 Dntf6nKL1JTY2B0AS29AcKfDt0QSlPhDmMF06Qeu85FhJcVyoc32+rqFu8XB1A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Qrt3FDTo
Subject: Re: [Buildroot] [PATCH 2/2] package/pkg-utils: teach
 per-package-rsync to copy or hardlink dest
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

WWFubiwgQWxsLAoKT24gV2VkLCAxOCBPY3QgMjAyMyAxODoxODo1OSArMDIwMAoiWWFubiBFLiBN
T1JJTiIgPHlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyPiB3cm90ZToKCj4gSGVydsOpLCBBbGwsCj4g
Cj4gT24gMjAyMy0xMC0xOCAxNzozOCArMDIwMCwgSGVydmUgQ29kaW5hIHZpYSBidWlsZHJvb3Qg
c3Bha2UgdGh1c2x5Ogo+ID4gT24gV2VkLCAxOCBPY3QgMjAyMyAxNzoyMDo0NyArMDIwMAo+ID4g
Illhbm4gRS4gTU9SSU4iIDx5YW5uLm1vcmluLjE5OThAZnJlZS5mcj4gd3JvdGU6ICAKPiA+ID4g
SGVydsOpLCBBbGwgIAo+ID4gPiA+ID4gLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsKPiA+ID4g
PiA+ICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gPiA+ID4gPiBAQCAtMjE0LDEwICsyMTQs
MTkgQEAgaWZlcSAoJChCUjJfUEVSX1BBQ0tBR0VfRElSRUNUT1JJRVMpLHkpCj4gPiA+ID4gPiAg
IyAkMTogc3BhY2Utc2VwYXJhdGVkIGxpc3Qgb2YgcGFja2FnZXMgdG8gcnN5bmMgZnJvbQo+ID4g
PiA+ID4gICMgJDI6ICdob3N0JyBvciAndGFyZ2V0Jwo+ID4gPiA+ID4gICMgJDM6IGRlc3RpbmF0
aW9uIGRpcmVjdG9yeQo+ID4gPiA+ID4gKyMgJDQ6IGxpdGVyYWwgImNvcHkiIG9yICJoYXJkbGlu
ayIgdG8gY29weSBvciBoYXJkbGluayBmaWxlcyBmcm9tIHNyYyB0byBkZXN0Cj4gPiA+ID4gPiAg
ZGVmaW5lIHBlci1wYWNrYWdlLXJzeW5jCj4gPiA+ID4gPiAgCW1rZGlyIC1wICQoMykKPiA+ID4g
PiA+ICAJJChmb3JlYWNoIHBrZywkKDEpLFwKPiA+ID4gPiA+IC0JCXJzeW5jIC1hIC0tbGluay1k
ZXN0PSQoUEVSX1BBQ0tBR0VfRElSKS8kKHBrZykvJCgyKS8gXAo+ID4gPiA+ID4gKwkJcnN5bmMg
LWEgXAo+ID4gPiA+ID4gKwkJCS0taGFyZC1saW5rcyBcICAgIAo+ID4gPiA+IFlvdSBwcmVzZXJ2
ZSBoYXJkIGxpbmtzICgtLWhhcmQtbGlua3MpIGluIGFsbCBjYXNlcyAoY29weSBhbmQgaGFyZGxp
bmspLgo+ID4gPiA+IEluIGNhc2Ugb2YgY29weSwgaXMgaXQgY29ycmVjdCB0byBwcmVzZXJ2ZSBo
YXJkIGxpbmtzID8gICAgCj4gPiA+IFllcywgLS1oYXJkLWxpbmtzIGlzOgo+ID4gPiAKPiA+ID4g
ICAgIFRoaXMgdGVsbHMgcnN5bmMgdG8gbG9vayBmb3IgaGFyZC1saW5rZWQgZmlsZXMgaW4gdGhl
IHNvdXJjZSBhbmQKPiA+ID4gICAgIGxpbmsgdG9nZXRoZXIgdGhlIGNvcnJlc3BvbmRpbmcgZmls
ZXMgb24gdGhlIGRlc3RpbmF0aW9uLiAgCj4gPiBJbiBjYXNlIG9mICdjb3B5JywgeW91IGtlZXAg
aGFyZC1saW5rcyBhbHJlYWR5IHByZXNlbnQgaW4gc291cmNlIGFuZCBzbyB0aGUKPiA+IGRlc3Rp
bmF0aW9uIChmaW5hbCBob3N0L3RhcmdldCBkaXJzKSBpcyBub3QgYSBmdWxsIGNvcHkuICAKPiAK
PiBBaCwgaXQgZG9lcyBub3QgaGFyZC1saW5rIHNvbWV0aGluZyBpbiBkZXN0IGludG8gc3JjLiBU
aGUgaGFyZGxpbmtzIGFyZQo+IG9ubHkgaW4gdGhlIGRlc3RpbmF0aW9uLiBTZWUgYmVsb3cuLi4K
PiAKPiA+IFNvbWUgaGFyZC1saW5rcyBjYW4gYmUgcHJlc2VudCBhbmQgcG9zdC1idWlsZCBzY3Jp
cHRzIGNhbiBzdGlsbCBjb3JydXB0IHNvbWUKPiA+IHBlci1wYWNrYWdlIHNvdXJjZXMuCj4gPiAK
PiA+IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkga2VlcGluZyBoYXJkLWxpbmtzIG9uIHRoaXMgbGFz
dCBjb3B5IGlzIG5lZWRlZCBhbmQgSQo+ID4gcHJvYmFibHkgbWlzcyBzb21ldGhpbmcuLi4gIAo+
IAo+IFRoYXQgaXMgYmVjYXVzZSB3ZSBjYW4gaGF2ZSBoYXJkLWxpbmtzIGluIGhvc3Qgb3IgdGFy
Z2V0LiBGb3IgZXhhbXBsZSwKPiBnaXQgd2lsbCBpbnN0YWxsIGEgbG90IG9mIGhhcmQtbGlua3Mg
aW4gL3Vzci9saWJleGVjL2dpdC1jb3JlLwo+IChleGNlcnB0KToKPiAKPiAgICAgJCBscyAtbGkg
cGVyLXBhY2thZ2UvZ2l0L3RhcmdldC91c3IvbGliZXhlYy9naXQtY29yZS8KPiAgICAgOTU4ODc3
MCAtcnd4ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDMzMTg4MjggT2N0IDE2IDE3OjQ1IGdpdC12
YXIKPiAgICAgOTU4ODc3MCAtcnd4ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDMzMTg4MjggT2N0
IDE2IDE3OjQ1IGdpdC12ZXJpZnktY29tbWl0Cj4gICAgIDk1ODg3NzAgLXJ3eHIteHIteCAxNDEg
eW1vcmluIHltb3JpbiAzMzE4ODI4IE9jdCAxNiAxNzo0NSBnaXQtdmVyaWZ5LXBhY2sKPiAgICAg
OTU4ODc3MCAtcnd4ci14ci14IDE0MSB5bW9yaW4geW1vcmluIDMzMTg4MjggT2N0IDE2IDE3OjQ1
IGdpdC12ZXJpZnktdGFnCj4gICAgIDk1ODg3NzAgLXJ3eHIteHIteCAxNDEgeW1vcmluIHltb3Jp
biAzMzE4ODI4IE9jdCAxNiAxNzo0NSBnaXQtdmVyc2lvbgo+IAo+ICAgICAkIGxzIC1saSB0YXJn
ZXQvdXNyL2xpYmV4ZWMvZ2l0LWNvcmUvCj4gICAgIDk2MDAxOTAgLXJ3eHIteHIteCAxNDEgeW1v
cmluIHltb3JpbiAyODMyODYwIE9jdCAxNiAxNzo0NSBnaXQtdmFyCj4gICAgIDk2MDAxOTAgLXJ3
eHIteHIteCAxNDEgeW1vcmluIHltb3JpbiAyODMyODYwIE9jdCAxNiAxNzo0NSBnaXQtdmVyaWZ5
LWNvbW1pdAo+ICAgICA5NjAwMTkwIC1yd3hyLXhyLXggMTQxIHltb3JpbiB5bW9yaW4gMjgzMjg2
MCBPY3QgMTYgMTc6NDUgZ2l0LXZlcmlmeS1wYWNrCj4gICAgIDk2MDAxOTAgLXJ3eHIteHIteCAx
NDEgeW1vcmluIHltb3JpbiAyODMyODYwIE9jdCAxNiAxNzo0NSBnaXQtdmVyaWZ5LXRhZwo+ICAg
ICA5NjAwMTkwIC1yd3hyLXhyLXggMTQxIHltb3JpbiB5bW9yaW4gMjgzMjg2MCBPY3QgMTYgMTc6
NDUgZ2l0LXZlcnNpb24KPiAKPiBBcyB5b3UgY2FuIHNlZSwgaW4gZ2l0J3MgUFBELCBnaXQgdG9v
bHMgYXJlIGhhcmQtbGlua3MsIGFuZCBpbiB0YXJnZXQvCj4gdGhleSBhbHNvIGFyZSBoYXJkLWxp
bmtzLiBCdXQgdGhlIGlub2RlIGlzIGRpZmZlcmVudCwgc28gdGhlIGhhcmQtbGlua3MKPiBpbiB0
YXJnZXQvIGFyZSBkaWZmZXJlbnQgZnJvbSB0aGUgaGFyZC1saW5rcyBpbiB0aGUgUFBELgo+IAo+
IEhvd2V2ZXIsIGluIGFsbCB0aGUgUFBEcyBvZiBwYWNrYWdlcyB0aGF0IGhhdmUgZ2l0IGFzIGEg
ZGVwZW5kZW5jeSwgdGhlCj4gaGFyZC1saW5rcyB3b3VsZCBhbGwgYmUgdG8gdGhlIHNhbWUgaW5v
ZGUsIDk1ODg3NzAuCj4gCj4gKFRoZSBzaXplIGRlbHRhIGlzIGJlY2F1c2UgdGhlIGZpbGVzIGlu
IHRhcmdldC8gYXJlIHN0cmlwcGVkLikKPiAKPiBTbywgaW4gY2FzZSBvZiAiY29weSIsIHRoaXMg
aXMgYWN0dWFsbHkgYSBjb3B5LCB0aGF0IGtlZXBzIGV4aXN0aW5nCj4gaGFyZC1saW5rcyBpbiB0
aGUgc291cmNlLCBhcyBuZXcgaGFyZC1saW5rcyBpbiB0aGUgZGVzdGluYXRpb24uIFdpdGhvdXQK
PiAtLWhhcmQtbGlua3MsIHRoZSBmaWxlcyBpbiB0YXJnZXQvdXNyL2xpYmV4ZWMvZ2l0LWNvcmUv
IHdvdWxkIGFsbCBoYXZlIGEKPiBkaWZmZXJlbnQgaW5vZGUsIGFzIHRoZXkgd291bGQgYmUgZGlm
ZmVyZW50IGZpbGVzLCBhbmQgdGhhdCB3b3VsZAo+IHRyZW1lbmRvdXNseSBpbmNyZWFzZSB0aGUg
ZmlsZXN5c3RlbSBzaXplIChzcXVhc2hmcyB3b3VsZCBub3RpY2UsIGFuZAo+IHdvdWxkIHN0b3Jl
IHRoZSBjb250ZW50IG9ubHkgb25jZSwgYnV0IHdvdWxkIHN0aWxsIGNyZWF0ZSBhcyBtYW55IGlu
b2Rlcwo+IGFzIG5lZWRlZCwgdGhvdWdoKS4KPiAKClRoYW5rcyBhIGxvdCBmb3IgdGhlc2UgZXhw
bGFuYXRpb25zIQpJdCBpcyBjbGVhcmVyIGluIG15IG1pbmQgbm93LgoKTWF5YmUsIGluIHRoZSBj
b21taXQgbG9nOgotLS0gODwgLS0tCnJzeW5jIC0taGFyZC1saW5rcyBvcHRpb24gYWxsb3dzIHRv
IGtlZXAgZXhpc3RpbmcgaGFyZC1saW5rcyBpbiB0aGUgc291cmNlCmFzIG5ldyBoYXJkLWxpbmtz
IGluIHRoZSBkZXN0aW5hdGlvbiAoImNvcHkiIG9mIGhhcmQtbGlua3MpLgpIYXZpbmcgdGhpcyBo
YXJkLWxpbmtzICJjb3B5IiBjb250cmlidXRlcyB0byB0aGUgZGlyZWN0b3JpZXMgc2l6ZQpyZWR1
Y3Rpb24uCi0tLSA4PCAtLS0gCgpXaXRoIGFsbCB0aGF0IHNhaWQ6ClJldmlld2VkLWJ5OiBIZXJ2
ZSBDb2RpbmEgPGhlcnZlLmNvZGluYUBib290bGluLmNvbT4KCkJlc3QgcmVnYXJkcywKSGVydsOp
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
