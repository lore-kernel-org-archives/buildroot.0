Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E44C77B60
	for <buildroot@archiver.kernel.org>; Wed, 26 Apr 2023 20:46:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C7F8A417CC;
	Wed, 26 Apr 2023 20:46:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7F8A417CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ayyWKg5mrm0Y; Wed, 26 Apr 2023 20:46:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D25A440459;
	Wed, 26 Apr 2023 20:46:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D25A440459
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EDA41BF42E
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 20:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82079418CB
 for <buildroot@lists.busybox.net>; Wed, 26 Apr 2023 20:46:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82079418CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HbaiFw7pwEEs for <buildroot@lists.busybox.net>;
 Wed, 26 Apr 2023 20:46:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3F5940234
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F3F5940234
 for <buildroot@buildroot.org>; Wed, 26 Apr 2023 20:46:14 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1prm1g-00CxCM-2z; Wed, 26 Apr 2023 22:46:08 +0200
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 2cf4b094;
 Wed, 26 Apr 2023 20:45:58 +0000 (UTC)
Date: Wed, 26 Apr 2023 23:45:54 +0300
Message-ID: <20230426234554.GB2297911@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Knight <james.d.knight@live.com>
In-Reply-To: <CALAjcgUYQ2bdGfJ_-0L6p1+HjagD0Nxg9F6dEdjt8hr_Yw-Omw@mail.gmail.com>
References: <SN4P221MB0682FB7AA70635712FC71C57A0649@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
 <2fd1acce-9795-aa38-44e7-7f7cbdd1a57a@gmail.com>
 <CALAjcgUYQ2bdGfJ_-0L6p1+HjagD0Nxg9F6dEdjt8hr_Yw-Omw@mail.gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xhc4DdfFIL815mMy62w1XVzNwUEDJUN9NAPycR15Duw=; b=NsOEKtNfrA+OelxE8ZdKefH8Ts
 H53qTRWUVcVGc2NNFCJ0ubuIbu3YhcF/Jpwzj8BTzT3G+ZIPSqGk9Xpb+u9hiPCJ+GFrkZfQi0wWK
 ZzgaUnWTnr3S4GJHrnSKiAcIqLV2zaNiVE+USX++6TWT6JYa3OfJNMvGNLVBfLSFFvJZIhGzKM7mn
 GEpJuwtSssyEvUVshzqPzreTZw0ki/eAySCvBYmES27x+vYPuA6dX8EHN+Dh2VNje1Vryh0Cc0Yi3
 3z4sqeWWYWYAqIeAEDk/d0Jpb9As8vdHnoT1yobREbbDrSbNIQtgNwUBVScfuI3vCzMFmZa9KY5ae
 SWN81whw==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=NsOEKtNf
Subject: Re: [Buildroot] [PATCH] package/sway: add runtime dependency on
 xkeyboard-data
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Raphael Pavlidis <raphael.pavlidis@gmail.com>,
 James Knight <james.d.knight@live.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="===============2538814837028848962=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2538814837028848962==
Content-Type: multipart/signed; boundary="vXiLsjqBdQl95r35"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--vXiLsjqBdQl95r35
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAyNiBBcHIgMjAyMyAxNjowNTo0NCAtMDQwMCBKYW1lcyBLbmlnaHQgPGphbWVzLmQu
a25pZ2h0QGxpdmUuY29tPiB3cm90ZToKPiBSYXBoYWVsLAo+IAo+IE9uIFdlZCwgQXByIDI2LCAy
MDIzIGF0IDE6MjHigK9QTSBSYXBoYWVsIFBhdmxpZGlzCj4gPHJhcGhhZWwucGF2bGlkaXNAZ21h
aWwuY29tPiB3cm90ZToKPiA+IElmIHRoaXMgaXMgY2F1c2VkIGJ5IGxpYnhrYmNvbW1vbiwgd291
bGQgaXQgdGhlbiBiZSBiZXR0ZXIgdG8gYWRkIHRoaXMKPiA+IHJ1bnRpbWUgZGVwZW5kZW5jeSB0
byB3bHJvb3RzLCBiZWNhdXNlIGxpYnhrYmNvbW1vbiBpcyBhIGRlcGVuZGVuY3kgb2YKPiA+IHds
cm9vdHMgbm90IHN3YXkuIE1heWJlLCB0aGUgc2FtZSBwcm9ibGVtIG9jY3VycyBvbiBjYWdlIChh
bHNvIGEgd2xyb290cwo+ID4gYmFzZWQgY29tcG9zaXRvciksIHRvby4KPiAKPiBXaGlsZSBJIGNh
bm5vdCBzYXkgSSBoYXZlIG11Y2gga25vd2xlZGdlIG9uIHdscm9vdHMgYW5kIHRoZSBwcm9ncmFt
cwo+IHdoaWNoIHJlbHkgb24gaXQsIGZyb20gbXkgdW5kZXJzdGFuZGluZyBpcyB0aGF0IGV2ZW4g
aWYgYSBwcm9ncmFtIHVzZXMKPiB3bHJvb3RzLCBpdCBkb2VzIG5vdCBuZWNlc3NhcmlseSBuZWVk
IGtleWJvYXJkL2lucHV0IHN1cHBvcnQgdG8KPiBmdW5jdGlvbi4gVGVzdGVkIHJ1bm5pbmcgY2Fn
ZSB3aXRob3V0IHhrZXlib2FyZC1jb25maWcgYW5kIGl0IHNlZW1lZAo+IHRvIHNvbWV3aGF0IGZ1
bmN0aW9uIChlLmcuIGBjYWdlIGVzMmdlYXJzX3dheWxhbmRgOyBncmFudGVkLCBzb21lIGNhZ2UK
PiBsb2dzIGRpZCB3YXJuIGFib3V0IG5vdCBiZWluZyBhYmxlIHRvIGdlbmVyYXRlIGFuIFhLQiBj
b250ZXh0KS4gV2l0aAo+IHRoYXQgaW4gbWluZCwgaXQgbWFrZXMgbWUgaGVzaXRhbnQgdG8gcHVz
aCB0aGUgdXNlIG9mIHhrZXlib2FyZC1jb25maWcKPiBmb3IgYWxsIHdscm9vdHMgdXNlIGNhc2Vz
LCBzaW5jZSBtYXliZSB0aGVyZSBhcmUgZW52aXJvbm1lbnRzIG91dAo+IHRoZXJlIHRoYXQgZG8g
bm90IGNhcmUgYWJvdXQgaW5wdXQuIEFuZCBzaW5jZSB3ZXN0b24gYW5kIFggYXJlIChJCj4gc3Vz
cGVjdCkgY29tbW9ubHkgaW5wdXQgZHJpdmVuIGFuZCBzZWxlY3QgdGhpcyBjb25maWd1cmF0aW9u
IGluCj4gQnVpbGRyb290IG5vdywgdGhpcyBpcyB3aGVyZSBteSBhc3N1bXB0aW9uIGxlZCB0byB3
YW50aW5nIHRvIGFkZCBpdAo+IGZvciBTd2F5Lgo+IAo+IEludGVyZXN0aW5nIGVub3VnaCwgcGxh
eWluZyB3aXRoIGNvZyAod2hpY2ggdXNlcyBsaWJ4a2Jjb21tb24gYW5kIG5vdAo+IHdscm9vdHMp
LCBpdCBoYXMgYSB1bmlxdWUgZXhwZXJpZW5jZSBhcyB3ZWxsLiBUaGUgYXBwbGljYXRpb24gY2Fu
Cj4gc3RhcnQgYW5kIHJlbmRlciBhIHBhZ2U7IGhvd2V2ZXIsIGFueSBpbnB1dCBpbnRlcmFjdGlv
biB3aWxsIFNFR0ZMVAo+IGNvZy4gSSBhc3N1bWUgdGhhdCB0aGlzIGlzIGp1c3QgYSBjYXNlIG9m
IHRoZSBpbXBsZW1lbnRhdGlvbiB3aGljaAo+IGRvZXMgbm90IHByb3Blcmx5IGhhbmRsZSBhIG5v
LWlucHV0IHNjZW5hcmlvIChwZXJzb25hbGx5LCBJIGZlZWwgdGhpcwo+IGlzIGEgdXNlIGNhc2Ug
aXQgc2hvdWxkIGJlIGFibGUgdG8gaGFuZGxlKS4KCkkgc3VwcG9zZSB5b3UgYXJlIHVzaW5nIENv
ZyB3aXRoIGl0cyBvd24gRFJNL0tNUyBzdXBwb3J0ICjigJxjb2cgLVAgZHJt4oCdKSwKb3IgaXMg
dGhpcyB1bmRlciBXYXlsYW5kPyBBdCBhbnkgcmF0ZSwgeW91IGFyZSByaWdodCBhbmQgQ29nIHNo
b3VsZCBub3QKY3Jhc2ggaWYgdGhlcmUgYXJlbid0IGlucHV0IGRldmljZXMsIHRoYXQncyBhIGJ1
Zy4gQ291bGQgeW91IHBsZWFzZSByZXBvcnQKdGhlIHByb2JsZW0gYXQgaHR0cHM6Ly9naXRodWIu
Y29tL0lnYWxpYS9jb2cvaXNzdWVzPwoKPiBbLi4uXSBHaXZlbiB0aGF0IGl0IGZhdWx0cyBub3cs
IEkgd291bGQgYWxzbyB3b25kZXIgaWYgdGhlCj4gYEJSMl9QQUNLQUdFX1hLRVlCT0FSRF9DT05G
SUdgIGZsYWcgc2hvdWxkIGJlIHNldCBmb3IgdGhpcyBwYWNrYWdlLgoKVGhhdCB3b3VsZCBiZSBh
IHdvcmthcm91bmQsIHdoaWNoIElNTyB3b3VsZCBiZSBva2F5IHRvIGRvIHdoaWxlIHVudGlsCndl
IHB1dCBvdXQgYSBuZXcgQ29nIHJlbGVhc2UgdGhhdCByZXNvbHZlcyB0aGUgY3Jhc2ggb24gbm8g
aW5wdXRzIGlzc3VlLgoKPiBBIGxvb2sgYXQgc29tZSBwb3B1bGFyIGRpc3RyaWJ1dGlvbnMgd2hp
Y2ggdXNlIGxpYnhrYmNvbW1vbiBhcmUKPiBkaXN0cmlidXRlZCBpbiBhIHdheSB3aGVyZSB0aGUg
ZGlzdHJpYnV0aW9uJ3MgYHhrZXlib2FyZC1jb25maWdgLWxpa2UKPiBwYWNrYWdlIGlzIGEgZGVw
ZW5kZW5jeSBvbiBsaWJ4a2Jjb21tb24gKGZyb20gd2hhdCBJIGNhbiB0ZWxsLCBib3RoCj4gQXJj
aCBhbmQgVWJ1bnR1IGRvIHRoaXMpLiBNYXliZSBpdCB3b3VsZCBiZSBiZXN0IHRvIGhhdmUgbGli
eGtiY29tbW9uCj4gaW1wbHkgdXNhZ2Ugb24geGtleWJvYXJkLWNvbmZpZywgd2hpY2ggd291bGQg
aGVscCBpbmNsdWRlIGEga2V5bWFwCj4gZGF0YSBmb3IgYWxsIHRoZXNlIHVzZSBjYXNlcy4gQW5k
IGlmIGEgZGV2ZWxvcGVyIGhhcyBhIGRlc2lyZSB0bwo+IG1hbmFnZSB0aGVpciBvd24gY3VzdG9t
aXplZCBrZXltYXAgZGF0YSwgdGhleSBjYW4gb3B0IHRvIG5vdCB1c2UKPiB4a2V5Ym9hcmQtY29u
ZmlnIGFuZCBtYW5hZ2UgdGhlIGluY2x1c2lvbiBvZiBjdXN0b20ga2V5bWFwIGRhdGEgdmlhCj4g
dGhlaXIgQlNQL3Bvc3QtYnVpbGQgc2NyaXB0cy4gRm9yIGV4YW1wbGU6Cj4gCj4gICAgICBjb25m
aWcgQlIyX1BBQ0tBR0VfTElCWEtCQ09NTU9OCj4gICAgICAgICAgIC4uLgo+ICAgICAgICAgICBp
bXBseSBCUjJfUEFDS0FHRV9YS0VZQk9BUkRfQ09ORklHCj4gCj4gQW5kIGRyb3AgdGhlIGV4aXN0
aW5nIHNlbGVjdGlvbnMgb24gYEJSMl9QQUNLQUdFX1dFU1RPTmAgYW5kCj4gYEJSMl9QQUNLQUdF
X1hTRVJWRVJfWE9SR19TRVJWRVJgLgo+IAo+IE9yIGlmIHdlIGp1c3Qgd2FudCB0byBtYWtlIHRo
aW5ncyBzaW1wbGUsIGZvciBhIHNlbGVjdCBvbgo+IGBCUjJfUEFDS0FHRV9YS0VZQk9BUkRfQ09O
RklHYCBpbiBgQlIyX1BBQ0tBR0VfTElCWEtCQ09NTU9OYCwgYW5kIGFueQo+IGRldmVsb3BlciB3
YW50aW5nIGN1c3RvbSBrZXlkYXRhIGNhbiBqdXN0IG1hbmlwdWxhdGUgdGhlIHRhcmdldCdzCj4g
YC91c3Ivc2hhcmUvWDExL3hrYmAgY29udGVudHMgdGhlbXNlbHZlcy4KCkNoZWVycywK4oCUQWRy
acOhbgo=

--vXiLsjqBdQl95r35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEmNggAKCRCRxVnb5MkS
O5GmAJ48e+22gKxVtJFvP6bZE6G/z06CIwCaAtE3PFfdcuG7oZsoWcu838gf8H8=
=4T03
-----END PGP SIGNATURE-----

--vXiLsjqBdQl95r35--

--===============2538814837028848962==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2538814837028848962==--
