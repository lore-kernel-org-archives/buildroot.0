Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20BAC4332F
	for <buildroot@archiver.kernel.org>; Tue, 22 Nov 2022 10:16:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56CE981F92;
	Tue, 22 Nov 2022 10:16:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56CE981F92
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OQ6JS3Z77teT; Tue, 22 Nov 2022 10:16:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86A1081F80;
	Tue, 22 Nov 2022 10:16:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86A1081F80
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E00371BF4E6
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 10:16:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BAADF81F9C
 for <buildroot@lists.busybox.net>; Tue, 22 Nov 2022 10:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BAADF81F9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4l0F6tedAFKS for <buildroot@lists.busybox.net>;
 Tue, 22 Nov 2022 10:16:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BC1781F8C
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8BC1781F8C
 for <buildroot@buildroot.org>; Tue, 22 Nov 2022 10:16:07 +0000 (UTC)
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CE36C1C0002;
 Tue, 22 Nov 2022 10:16:04 +0000 (UTC)
Date: Tue, 22 Nov 2022 11:16:03 +0100
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20221122111603.03453f8c@xps-13>
In-Reply-To: <20221121174905.GI2516@scaer>
References: <20221116084340.1068161-1-miquel.raynal@bootlin.com>
 <20221121174905.GI2516@scaer>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1669112165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CsIKOsNn3fbYetdVOPePC6RyxHvRTI9rSeCzYgzLEro=;
 b=Y7h2S+54mQvyL1feyCAE7EzyjewPWnT+aUUSaetrnX8fVBb4Zqjxmj6aTHoww0DaOCnB0k
 /w8kTzIcImibsOUifJxbCBodD3SRxKImy1/xxG7pBWwwIclVit/ugCdvoxSVr22wfdwrTn
 YyV/iPvG3njB7F5dGvRxgQPveyNnj6CQ6jk9kTm6mSZdGsJ3psdr8CvKdMT6eVxWqKBg4r
 fk62G/oLq8kLFChkGyBQJe6iv3BsT1tXTxmPXnqqrhcJ/8G8DTcl5u5iXex/bCplkCd+78
 RE0zdrRYTWqfNBihVueSzRvZl6UmWdVpWEGLtIBW9+gt4NmvjNftkv7aAP3Q2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Y7h2S+54
Subject: Re: [Buildroot] [PATCH] README: fix reference to submitting-patches
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
From: Miquel Raynal via buildroot <buildroot@buildroot.org>
Reply-To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gWWFubiwKCnlhbm4ubW9yaW4uMTk5OEBmcmVlLmZyIHdyb3RlIG9uIE1vbiwgMjEgTm92
IDIwMjIgMTg6NDk6MDUgKzAxMDA6Cgo+IE1pcXVlbCwgQWxsLAo+IAo+IE9uIDIwMjItMTEtMTYg
MDk6NDMgKzAxMDAsIE1pcXVlbCBSYXluYWwgdmlhIGJ1aWxkcm9vdCBzcGFrZSB0aHVzbHk6Cj4g
PiBXaGlsZSBsb29raW5nIGZvciByZWZyZXNoaW5nIG15IG1pbmQgYWJvdXQgQnVpbGRyb290IGNv
bnRyaWJ1dGlvbgo+ID4gZ3VpZGVsaW5lcywgSSBhY3R1YWxseSBzdHVtYmxlZCB1cG9uIGEgNDA0
IGVycm9yLiBJdCBzZWVtcyBsaWtlIHRoZQo+ID4gbWFudWFsIFVSTCBoYXMgc2xpZ2h0bHkgZXZv
bHZlZCBzaW5jZSAyMDE2LCBzbyBmaXggaXQuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1pcXVl
bCBSYXluYWwgPG1pcXVlbC5yYXluYWxAYm9vdGxpbi5jb20+Cj4gPiAtLS0KPiA+ICBSRUFETUUg
fCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPiAKPiA+IGRpZmYgLS1naXQgYS9SRUFETUUgYi9SRUFETUUKPiA+IGluZGV4IDAwOGU5OTZm
NWYuLjJkMzNjOGNlMzcgMTAwNjQ0Cj4gPiAtLS0gYS9SRUFETUUKPiA+ICsrKyBiL1JFQURNRQo+
ID4gQEAgLTIzLDQgKzIzLDQgQEAgYnVpbGRyb290IG1haWxpbmcgbGlzdDogYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKPiA+ICBZb3UgY2FuIGFsc28gZmluZCB1cyBvbiAjYnVpbGRyb290IG9uIE9G
VEMgSVJDLgo+ID4gIAo+ID4gIElmIHlvdSB3b3VsZCBsaWtlIHRvIGNvbnRyaWJ1dGUgcGF0Y2hl
cywgcGxlYXNlIHJlYWQKPiA+IC1odHRwczovL2J1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjc3Vi
bWl0dGluZy1wYXRjaGVzICAKPiAKPiBGb3IgbWUsIHRoaXMgZG9lcyBub3QgcmV0dXJuIGEgNDA0
LCBidXQgZG9lcyBwcm9wZXJseSByZWRpcmVjdCB0byB0aGUKPiBmb2xsb3dpbmcgVVJMLi4uIE1h
eWJlIGEgdGVtcG9yYXJ5IGZsdWtlPwo+IAo+IENhbiB5b3UgcGxlYXNlIGRvdWJsZS1jaGVjayBu
b3c/CgpPaCB5ZWFoLCB0aGUgcmVkaXJlY3Rpb24gc2VlbXMgdG8gd29yayBhZ2FpbiwgeW91IGNh
biBzYWZlbHkgaWdub3JlCnRoaXMsIHNvcnJ5IGZvciB0aGUgbm9pc2UuCgpUaGFua3MsCk1pcXXD
qGwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
