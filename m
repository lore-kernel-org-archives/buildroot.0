Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59622C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 22:04:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C3C7C409ED;
	Tue,  2 Aug 2022 22:04:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C3C7C409ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aAK3L0R8xGAr; Tue,  2 Aug 2022 22:04:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7989409C0;
	Tue,  2 Aug 2022 22:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7989409C0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CE3F71BF48B
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:04:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9850360ABF
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 22:04:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9850360ABF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b3eynDAp3Fbj for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 22:04:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 477EF600C6
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 477EF600C6
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 22:04:24 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 8AAE520004;
 Tue,  2 Aug 2022 22:04:21 +0000 (UTC)
Date: Wed, 3 Aug 2022 00:04:20 +0200
To: Sen Hastings <sen@phobosdpl.com>
Message-ID: <20220803000420.60044a91@windsurf>
In-Reply-To: <fabcfaf5-eaa9-930f-4422-1b7f0980e615@phobosdpl.com>
References: <20220728232357.270130-1-sen@phobosdpl.com>
 <20220728232357.270130-2-sen@phobosdpl.com>
 <20220801190417.061c2858@windsurf>
 <8e538839-349e-09db-cf02-8b8b4ee0abae@mind.be>
 <fabcfaf5-eaa9-930f-4422-1b7f0980e615@phobosdpl.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659477862;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqaZiKAaoD+Dg0KMjgbjFTLQJYb09oIsKBHTq4P1Owo=;
 b=kBlkdZ5eCFm6kS0PPvk3JdwGZ77rbgAoyyiWnt/5JvLz9gOj0VVZ77gqLjaEmukTZX4Wru
 FiZ9Ixn7iMuq9Jo2sIwBdKKieX1tNOuDMHBM0B+SV8JnUkUexCef8v7kr8+XatuVAcSPub
 2zVvR22GsYJDVcwZNLzgnVNBSV0tAc3fhu7GZopnzeqtVPyD97U5YtiAG+HDjIK9mfc67A
 6Kt2Xgl+Y4qV/D2zbnSeU8uNf8A2IyN7AzPOHO2PIgv6cAXiCUiDXIlO+z4qDaF3hGBqRr
 heHw62gliETAaNbw9087o/qlrg83xOFXO7HainlNuKLWO1jInqwaTZcKBByA2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kBlkdZ5e
Subject: Re: [Buildroot] [PATCH 2/3] support/scripts/pkg-stats: adjust
 column widths
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAyIEF1ZyAyMDIyIDE1OjMwOjA2IC0wNTAwClNlbiBIYXN0aW5ncyA8c2VuQHBob2Jv
c2RwbC5jb20+IHdyb3RlOgoKPiA+IMKgU2luY2UgcGtnLXN0YXRzIHRha2VzIGEgcHJldHR5IGxv
bmcgdGltZSB0byBydW4sIGl0IHdvdWxkIGJlIG5pY2UgaWYKPiA+IHlvdSBjb3VsZCBwdWJsaXNo
IHRoZSBvdXRwdXQgb2YgcGtnLXN0YXRzICh3aXRoIG5vIC5jb25maWcpIHNvbWV3aGVyZSBzbwo+
ID4gd2UgY2FuIGxvb2sgYXQgaXQgZGlyZWN0bHkgYW5kIG5vdGljZSB0aGVzZSB0aGluZ3MgZWFz
aWVyLj4gIAo+IFllYWgsIHRoZXNlIHdlaXJkIGVkZ2UgY2FzZXMgb25seSBjcm9wIHVwIHdoZW4g
eW91IGJ1aWxkIGFsbCB0aGUKPiBwYWNrYWdlcy4uLiB3aGljaCByZXF1aXJlcyBidWlsZGluZyBh
bGwgdGhlIHBhY2thZ2VzLgoKTm8sIHlvdSBkb24ndC4gSnVzdCBydW4gaXQgbWFudWFsbHk6Cgou
L3N1cHBvcnQvc2NyaXB0cy9wa2ctc3RhdHMgLS1odG1sIGZvby5odG1sIC0tbnZkLXBhdGggfi9w
YXRoL3RvL3NvbWV3aGVyZS8KClRoaXMgd2lsbCB1c2UgcGtnLXN0YXRzIHdpdGhvdXQgdGhlIC1j
IG9wdGlvbiwgYW5kIHRoZXJlZm9yZSBwa2ctc3RhdHMKd2lsbCBoYW5kbGUgYWxsIHBhY2thZ2Vz
IHJhdGhlciB0aGFuIGp1c3QgdGhlIG9uZXMgc2VsZWN0ZWQgaW4geW91cgpjb25maWd1cmF0aW9u
LgoKVGhvbWFzCi0tIApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGlu
CkVtYmVkZGVkIExpbnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBz
Oi8vYm9vdGxpbi5jb20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
