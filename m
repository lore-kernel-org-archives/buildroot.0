Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 906F5C61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 22:13:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D1684058B;
	Thu, 23 Feb 2023 22:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D1684058B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D28NSPq7twnX; Thu, 23 Feb 2023 22:13:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7410F40569;
	Thu, 23 Feb 2023 22:13:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7410F40569
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 781361BF338
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:13:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51B2781233
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 22:13:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51B2781233
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NRPgrc81341Y for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 22:13:02 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C2938120B
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6C2938120B
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 22:13:02 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AFA71C0004;
 Thu, 23 Feb 2023 22:12:59 +0000 (UTC)
Date: Thu, 23 Feb 2023 23:12:58 +0100
To: Martin =?UTF-8?B?QsO2aA==?= via buildroot <buildroot@buildroot.org>
Message-ID: <20230223231258.0e07045c@windsurf>
In-Reply-To: <20230223201511.217372-2-contact@martb.dev>
References: <20230223201511.217372-1-contact@martb.dev>
 <20230223201511.217372-2-contact@martb.dev>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1677190379;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7GWletOEHMQRhJ22knrSIPBnpJQOX4GtSb9b49pP6CQ=;
 b=IaOLKcG6fglv67bURzUJbC2Lar4+K3WUmUDCstmI5LfkZSARMfoouXW+Ht2BQXvN186bEl
 AjX2nFWZjl2PAdfs68ySDn8gxdrk89I9wzmfbbVisdVxMpXmjLEFPsJdqPMIZyEumrGdD3
 WkMEu0mU2dGd9IANJpH6IMjJRu+iMiNgAcTko7eKkIPCVRyGFmweSZcXPHSKzGsEO+2s3t
 r3t9zIDsPEX6JpjsbXw/u7Pul3P33i70pf3gGR5l03taV/lCVNxjKuF0ojCoURXWCqeQn7
 D03RFmE3FdrurW+MDj3aqxdVtV5EJVT587dTTcJ68TuEHHBFanREH0hgaWfVmw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=IaOLKcG6
Subject: Re: [Buildroot] [PATCH 2/2] package/gnuradio: remove pybind target
 suffix when crosscompiling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Martin =?UTF-8?B?QsO2aA==?= <contact@martb.dev>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gTWFydGluLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoLiBTb21lIGNvbW1lbnQvcXVlc3Rp
b24gYmVsb3cuCgpPbiBUaHUsIDIzIEZlYiAyMDIzIDIxOjE1OjExICswMTAwCk1hcnRpbiBCw7Zo
IHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnPiB3cm90ZToKCj4gVGhpcyBp
cyByZXF1aXJlZCBhcyBweWJpbmQxMSB1c2VzIGhvc3QgcHl0aG9uMyBhbmQgdGhlcmVmb3JlIHRo
ZSBob3N0IHBsYXRmb3JtIHN1ZmZpeGVzLgo+IFdpdGhvdXQgdGhpcyBjaGFuZ2UgZ251cmFkaW8g
YW5kIGFsbCBwbHVnaW5zIHJlbHlpbmcgb24gaXRzIEdyUHliaW5kIG1hY3JvcywgdXNlIHRoZSB3
cm9uZyBzdWZmaXhlcy4KPiBUaGlzIGxlYWRzIHRvIG1vZHVsZSBsb2FkIGZhaWx1cmVzIHdoZW4g
Y3Jvc3Njb21waWxpbmcuCj4gCj4gU2VlOgo+IC0gaHR0cHM6Ly9naXRodWIuY29tL2dudXJhZGlv
L2dudXJhZGlvL2lzc3Vlcy81NDU1Cj4gLSBodHRwczovL2dpdGh1Yi5jb20vcHliaW5kL3B5Ymlu
ZDExL2lzc3Vlcy8zNjQwCj4gCj4gU2lnbmVkLW9mZi1ieTogTWFydGluIELDtmggPGNvbnRhY3RA
bWFydGIuZGV2Pgo+IC0tLQo+ICAuLi5uZC1yZW1vdmUtc3VmZml4LXdoZW4tY3Jvc3Njb21waWxp
bmcucGF0Y2ggfCA1NiArKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFuZ2VkLCA1NiBp
bnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBwYWNrYWdlL2dudXJhZGlvLzAwMDEt
Z3JQeUJpbmQtcmVtb3ZlLXN1ZmZpeC13aGVuLWNyb3NzY29tcGlsaW5nLnBhdGNoCj4gCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvZ251cmFkaW8vMDAwMS1nclB5QmluZC1yZW1vdmUtc3VmZml4LXdo
ZW4tY3Jvc3Njb21waWxpbmcucGF0Y2ggYi9wYWNrYWdlL2dudXJhZGlvLzAwMDEtZ3JQeUJpbmQt
cmVtb3ZlLXN1ZmZpeC13aGVuLWNyb3NzY29tcGlsaW5nLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwLi4wYWM0Mzk1ZTU4Cj4gLS0tIC9kZXYvbnVsbAo+ICsr
KyBiL3BhY2thZ2UvZ251cmFkaW8vMDAwMS1nclB5QmluZC1yZW1vdmUtc3VmZml4LXdoZW4tY3Jv
c3Njb21waWxpbmcucGF0Y2gKPiBAQCAtMCwwICsxLDU2IEBACj4gK0Zyb20gYzU4NzYwYjAwMmMx
YTk1NGE5YWI2MjgzNTI5MDBmY2Q4ZTZlMTk5YyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPiAr
RnJvbTogPT9VVEYtOD9xP01hcnRpbj0yMEI9QzM9QjZoPz0gPGNvbnRhY3RAbWFydGIuZGV2Pgo+
ICtEYXRlOiBXZWQsIDIyIEZlYiAyMDIzIDAzOjA1OjA4ICswMTAwCj4gK1N1YmplY3Q6IFtQQVRD
SF0gZ3JQeUJpbmQ6IGZpeCBpbnZhbGlkIHN1ZmZpeAo+ICsKPiArVGhpcyBpcyByZXF1aXJlZCBh
cyBweWJpbmQxMSB1c2VzIGhvc3QgcHl0aG9uMyBhbmQgdGhlcmVmb3JlIHRoZSBob3N0IHBsYXRm
b3JtIHN1ZmZpeGVzLgoKV2UgbmVlZCB5b3VyIFNpZ25lZC1vZmYtYnkgaGVyZSwgYW5kIGFsc28g
dGhlIHVwc3RyZWFtIHN0YXR1cyBvZiB0aGlzCnBhdGNoLgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
