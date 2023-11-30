Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F664C10DCE
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 22:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 161C143649;
	Thu, 30 Nov 2023 22:48:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 161C143649
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b_IFtrWX7dRp; Thu, 30 Nov 2023 22:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AE5F43653;
	Thu, 30 Nov 2023 22:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AE5F43653
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1101E1BF844
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE1396FA42
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 22:48:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE1396FA42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c9mGHZU077Vf for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 22:48:23 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BBD9360A64
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 22:48:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBD9360A64
Received: from 91-152-140-108.elisa-laajakaista.fi ([91.152.140.108]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1r8ppL-008zKM-V9; Thu, 30 Nov 2023 23:48:12 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id fd0c8e7a;
 Thu, 30 Nov 2023 22:48:11 +0000 (UTC)
Date: Fri, 1 Dec 2023 00:48:11 +0200
Message-ID: <20231201004811.GF232434@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20231114150652.GB1974649@igalia.com>
References: <Thomas Devoogdt
 <20231001165218.1960930-3-thomas.devoogdt@barco.com>
 <20231110164617.569602-1-thomas@devoogdt.com>
 <20231114150652.GB1974649@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4TfsadseuF9D7ukCqKFtLLCOsRYEphO5xNJ0OswIR5o=; b=JcAPnvMOQeSgwXv42Vkuo2LPyB
 pu0shTkyJZDosFV7Nzvkqu4uXQuSl09Zcc6FsDyXgrAMT/QxuNvt/ZNosKfUQRM3UM+HqPqFmZtKt
 O/Fj5aYIM4CH+fNRsYoEhvf1tPkeOshn2ja4DqmzMVscqEtH6PHORqe1odBXu9xImpzcoNW8xRLxR
 DumArtIuR2oMn9L2U9UPwoF7id3ifL1qGf8RoHbnZwrpWhFojbr7m87KyzTJcgDBl+jWwCdGVuvl2
 7giBR5RIvxRobOOAYzMiY9i9eLEJSzH5yKO6NqnH4RqVbpWDRje/hYF1s8qQBWtj7t0lXw5PQNADh
 SsaI/FHA==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=JcAPnvMO
Subject: Re: [Buildroot] [PATCH v5 1/3] package/webkitgtk: make gbm support
 optional
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>, buildroot@buildroot.org,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============7611738849698181030=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7611738849698181030==
Content-Type: multipart/signed; boundary="RV/xCA7vDyqklXmL"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--RV/xCA7vDyqklXmL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNCBOb3YgMjAyMyAxNTowNjo1MiArMDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAxMCBOb3YgMjAyMyAxNzo0Njox
NSArMDEwMCBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+ID4g
VGhpcyB3YXMgYWRkZWQgdXBzdHJlYW0gaW4gY29tbWl0Ogo+ID4gCj4gPiBodHRwczovL2dpdGh1
Yi5jb20vV2ViS2l0L1dlYktpdC9jb21taXQvMjJlNGMwMzg2NjA1ZDg0ZjQyZjJkNDZmZDIwYmRj
NDZlMzA3ODQ5OAo+ID4gCj4gPiBUaGUgJ1VTRV9PUEVOR0xfT1JfRVMnIGZsYWcgaXMgZGVmYXVs
dCBPTiwgd2hpY2ggd2lsbCBlbmFibGUgJ1VTRV9HQk0nLAo+ID4gc28gZW5zdXJlIHRoYXQgd2Ug
dW5zZXQgJ1VTRV9HQk0nIGlmIHdlIGRvbid0IGhhdmUgbGliZ2JtLgo+ID4gCj4gPiBTaWduZWQt
b2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gCj4g
VGVzdGVkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCkFj
a2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KIAo+ID4g
LS0tCj4gPiB2MiwzLDQsNTogbm8gY2hhbmdlCj4gPiAtLS0KPiA+ICBwYWNrYWdlL3dlYmtpdGd0
ay93ZWJraXRndGsubWsgfCA3ICsrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRp
b25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
bWsgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsKPiA+IGluZGV4IGJiNmRmM2Q1OTIu
Ljg4YmRmYWUyN2IgMTAwNjQ0Cj4gPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
bWsKPiA+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+ID4gQEAgLTg4LDYg
Kzg4LDEzIEBAIGVsc2UKPiA+ICBXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1ERU5BQkxFX0dMRVMy
PU9GRgo+ID4gIGVuZGlmCj4gPiAgCj4gPiAraWZlcSAoJChCUjJfUEFDS0FHRV9IQVNfTElCR0JN
KSx5KQo+ID4gK1dFQktJVEdUS19DT05GX09QVFMgKz0gLURVU0VfR0JNPU9OCj4gPiArV0VCS0lU
R1RLX0RFUEVOREVOQ0lFUyArPSBsaWJnYm0KPiA+ICtlbHNlCj4gPiArV0VCS0lUR1RLX0NPTkZf
T1BUUyArPSAtRFVTRV9HQk09T0ZGCj4gPiArZW5kaWYKPiA+ICsKPiA+ICBpZmVxICgkKEJSMl9Q
QUNLQUdFX0xJQkdUSzNfWDExKSx5KQo+ID4gIFdFQktJVEdUS19DT05GX09QVFMgKz0gLURFTkFC
TEVfWDExX1RBUkdFVD1PTgo+ID4gIFdFQktJVEdUS19ERVBFTkRFTkNJRVMgKz0gbGliZ2wgXAo+
ID4gLS0gCj4gPiAyLjM0LjEKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QKPiA+IAo+IAo+IENoZWVycywKPiDigJRBZHJpw6FuCj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFp
bGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxk
cm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCkNoZWVycywK4oCUQWRyacOhbgo=

--RV/xCA7vDyqklXmL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZWkRKwAKCRCRxVnb5MkS
OyJ6AJ9DwS61WlorPJDLBLKGBpuqQN4c5gCfZyddG3fB3hspZlz0eX87I9So10c=
=PYj+
-----END PGP SIGNATURE-----

--RV/xCA7vDyqklXmL--

--===============7611738849698181030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7611738849698181030==--
