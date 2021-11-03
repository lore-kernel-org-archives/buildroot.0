Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 537A6C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:30:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81D9D610EA
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 17:30:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 81D9D610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2376760AE1;
	Wed,  3 Nov 2021 17:30:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTn5cfDnONWf; Wed,  3 Nov 2021 17:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8070860AD8;
	Wed,  3 Nov 2021 17:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 549A31BF3EA
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 448EA80F7A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 17:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nKp8YTIK928U for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 17:30:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E71C280F73
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 17:30:10 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C0E63FF80D;
 Wed,  3 Nov 2021 17:30:07 +0000 (UTC)
Date: Wed, 3 Nov 2021 18:30:06 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>
Message-ID: <20211103183006.24c672b1@windsurf>
In-Reply-To: <20211103182047.44562ea9@bootlin.com>
References: <20211103073656.1689919-1-herve.codina@bootlin.com>
 <20211103073656.1689919-2-herve.codina@bootlin.com>
 <20211103164431.6cd1d0f5@windsurf>
 <20211103182047.44562ea9@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] package/alchemy: new host package
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

SGVsbG8gSGVydsOpLAoKT24gV2VkLCAzIE5vdiAyMDIxIDE4OjIwOjQ3ICswMTAwCkhlcnZlIENv
ZGluYSA8aGVydmUuY29kaW5hQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gPiBUaGUga2NvbmZpZyBj
b2RlIGlzIHVuZGVyIEdQTC0yLjAuICAKPiAKPiBJIG1pc3NlZCB0aGlzIG9uZS4KPiAKPiBUaGUg
R1BMLTIuMCBsaWNlbnNlIGZpbGUgaXMgbm90IHByb3ZpZGVkIGJ5IEFsY2hlbXkuCj4gVGhleSBt
ZW50aW9uICdrY29uZmlnIHNvdXJjZSBjb2RlIGlzIEdQTHYyJyBpbiB0aGVpciBSRUFETUUgZmls
ZS4KPiAKPiBBTENIRU1ZX0xJQ0VOU0UgPSBCU0QtMy1DbGF1c2UgKEFsY2hlbXkpLCBHUEwtMi4w
IChrY29uZmlnKQo+IEFMQ0hFTVlfTElDRU5TRV9GSUxFUyA9IENPUFlJTkcgUkVBRE1FCj4gCj4g
SXMgdGhhdCBjb3JyZWN0IGZyb20gQnVpbGRyb290IGV2ZW4gaWYgdGhlIEdMUC0yLjAgbGljZW5z
ZSBmaWxlIGlzIG5vdAo+IHByb3ZpZGVkID8KClllcywgdGhhdCdzIGZpbmUuCgo+ID4gPiArCSQo
VEFSR0VUX01BS0VfRU5WKSBcCj4gPiA+ICsJQUxDSEVNWV9IT01FPSQoQUxDSEVNWV9IT01FKSBc
Cj4gPiA+ICsJQUxDSEVNWV9XT1JLU1BBQ0VfRElSPSIkKEBEKSIgXAo+ID4gPiArCUFMQ0hFTVlf
VEFSR0VUX09VVD1hbGNoZW15LW91dCBcCj4gPiA+ICsJVEFSR0VUX09TPWxpbnV4IFwKPiA+ID4g
KwlUQVJHRVRfT1NfRkxBVk9VUj1idWlsZHJvb3QgXAo+ID4gPiArCVRBUkdFVF9DUk9TUz0iJChU
QVJHRVRfQ1JPU1MpIiBcCj4gPiA+ICsJVEFSR0VUX0FSQ0g9eHh4IFwgICAgCj4gPiAKPiA+IElz
IHRoaXMgaW50ZW5kZWQgPyAgCj4gCj4gWWVzLCBpdCBpcyB0byBhdm9pZCB0aGUgaW50ZXJuYWwg
QWxjaGVteSBhcmNoIG1hbmFnZW1lbnQuCj4gCj4gSXQgY2FuIGxlYWQgdG8gaW5jb3JyZWN0IHJl
c3VsdHMgd2l0aCB0aGUgdG9vbGNoYWluIHdlCj4gcHJvdmlkZWQgaW4gVEFSR0VUX0NST1NTLiBJ
bmRlZWQgdGhleSBhZGQgc29tZSBDRkxBR1MKPiBkZXBlbmRpbmcgb24gZ2l2ZW4gVEFSR0VUX0FS
Q0guCj4gVG8gYXZvaWQgaXNzdWVzLCB0aGlzIHdhcyB0aGUgc2ltcGxlc3Qgd2F5IEkgZm91bmQg
dG8gc2F5Cj4gJ0hleSBBbGNoZW15LCBkbyBub3QgY2FyZSBhYm91dCB0aGUgYXJjaCwgSSBkbyBp
dCBmb3IgeW91Jy4KPiAKPiBNYXliZSB0aGlzIGJyZWFrcyBzb21lIGludGVybmFsIHBhcnRzIHN1
Y2ggYXMgYnVpbGRpbmcgYQo+IENNYWtlIG9yIGFuIGF1dG90b29scyBwYWNrYWdlIGJ1dCBpbiB0
aGUgYnVpbGRyb290IGNvbnRleHQsCj4gQSBDTWFrZSBvciBhbiBhdXRvdG9vbHMgcGFja2FnZSB3
aWxsIG5vdCBiZSBidWlsdCBieSBBbGNoZW15Lgo+IAo+IEkgd2lsbCBhZGQgYSBjb21tZW50IGlu
IHYyLgoKVGhhbmtzIGZvciB0aGUgZXhwbGFuYXRpb24uIEFkZGluZyBhIGNvbW1lbnQgaW4gdGhl
IGNvZGUgd2lsbApkZWZpbml0ZWx5IGJlIHVzZWZ1bCB0byBjbGVhciB1cCB3aGF0J3MgaGFwcGVu
aW5nIHdpdGggdGhpcyBUQVJHRVRfQVJDSAp2YXJpYWJsZS4KClRoYW5rcyEKClRob21hcwotLSAK
VGhvbWFzIFBldGF6em9uaSwgY28tb3duZXIgYW5kIENFTywgQm9vdGxpbgpFbWJlZGRlZCBMaW51
eCBhbmQgS2VybmVsIGVuZ2luZWVyaW5nIGFuZCB0cmFpbmluZwpodHRwczovL2Jvb3RsaW4uY29t
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
