Return-Path: <SRS0=94yL=PB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C62C433F5
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:47:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8964C60F23
	for <buildroot@archiver.kernel.org>; Wed, 13 Oct 2021 20:47:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8964C60F23
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3888B60B11;
	Wed, 13 Oct 2021 20:47:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mv5CDvDZZ7RV; Wed, 13 Oct 2021 20:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A274E60B06;
	Wed, 13 Oct 2021 20:47:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59E0F1BF35E
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 563AE40734
 for <buildroot@lists.busybox.net>; Wed, 13 Oct 2021 20:47:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TFFZba7oDaA6 for <buildroot@lists.busybox.net>;
 Wed, 13 Oct 2021 20:47:16 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44F9140723
 for <buildroot@buildroot.org>; Wed, 13 Oct 2021 20:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=JE6Un7sCwJVR5vnh5lPdBkVK6m2AIWX599KmHnMnHVI=; 
 b=KIMK4MSLXWtEDISVMIYvvXEtTlccZXAvwLOOUuLQFzKMukyLp9BSh8AtUTk3e/a/iDK40GgE+l3qHa0nMs9xWFMa+OyhIJ/JwhgzwbqdiBoLAf6Ah2m8J8N9JAsEzy+UvCCw+oPugooQW/KuBV3V5EnM8UFt3ZvUTFlAjkeqCOQfrOgT8DihWhbbcADbX8Ipl00Jv+hWyT9inA9TtscfAcvpWUwqMuACymBE/WnVwgU4C5NNxEyacKJ8YbybDiHaa+/O5OVHZ/IY0A6WvPxhDLYDswHb9vgZGDG3oLQWTWS5rknYpVTS4QEERTgSR0VlDF2vXAcJ2vk3ZNJ1RJLhpw==;
Received: from 42.232.60.213.dynamic.reverse-mundo-r.com ([213.60.232.42]
 helo=momiji) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mal9c-0006mA-8i; Wed, 13 Oct 2021 22:47:12 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 3a6e5625;
 Wed, 13 Oct 2021 20:46:46 +0000 (UTC)
Date: Wed, 13 Oct 2021 22:46:40 +0200
Message-ID: <20211013224640.GC330553@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Adam Duskett <aduskett@gmail.com>
In-Reply-To: <20211013161152.74649-1-aduskett@gmail.com>
References: <20211013161152.74649-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: depend on
 host-python3
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
Cc: Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4692859964624844578=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4692859964624844578==
Content-Type: multipart/signed; boundary="xm7l4KmP1Qe2yvcc"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--xm7l4KmP1Qe2yvcc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBXZWQsIDEzIE9jdCAyMDIxIDA5OjExOjUyIC0wNzAwIEFkYW0gRHVza2V0dCA8
YWR1c2tldHRAZ21haWwuY29tPiB3cm90ZToKPiB3cGV3ZWJraXQgYnVpbGRzIHdpdGhvdXQgaXNz
dWUgdXNpbmcgaG9zdC1weXRob24zLgoKSW5kZWVkIGl0IGRvZXMsIGFuZCB0aGUgc2FtZSBnb2Vz
IGZvciB3ZWJraXRndGsgOikKCj4gU2lnbmVkLW9mZi1ieTogQWRhbSBEdXNrZXR0IDxhZHVza2V0
dEBnbWFpbC5jb20+CgpBY2tlZC1CeTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGln
YWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgfCAyICst
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsgYi9wYWNrYWdlL3dwZXdl
YmtpdC93cGV3ZWJraXQubWsKPiBpbmRleCA1ZDViNWY3NDRkLi4wMjQyZjdhMjg4IDEwMDY0NAo+
IC0tLSBhL3BhY2thZ2Uvd3Bld2Via2l0L3dwZXdlYmtpdC5tawo+ICsrKyBiL3BhY2thZ2Uvd3Bl
d2Via2l0L3dwZXdlYmtpdC5tawo+IEBAIC0xNCw3ICsxNCw3IEBAIFdQRVdFQktJVF9MSUNFTlNF
X0ZJTEVTID0gXAo+ICAJU291cmNlL1dlYkNvcmUvTElDRU5TRS1MR1BMLTIuMQo+ICBXUEVXRUJL
SVRfQ1BFX0lEX1ZFTkRPUiA9IHdwZXdlYmtpdAo+ICBXUEVXRUJLSVRfQ1BFX0lEX1BST0RVQ1Qg
PSB3cGVfd2Via2l0Cj4gLVdQRVdFQktJVF9ERVBFTkRFTkNJRVMgPSBob3N0LWdwZXJmIGhvc3Qt
cHl0aG9uIGhvc3QtcnVieSBcCj4gK1dQRVdFQktJVF9ERVBFTkRFTkNJRVMgPSBob3N0LWdwZXJm
IGhvc3QtcHl0aG9uMyBob3N0LXJ1YnkgXAo+ICAJaGFyZmJ1enogY2Fpcm8gaWN1IGpwZWcgbGli
ZXBveHkgbGliZ2NyeXB0IGxpYmdsZXMgbGlic291cCBsaWJ0YXNuMSBcCj4gIAlsaWJwbmcgbGli
eHNsdCBvcGVuanBlZyB3YXlsYW5kLXByb3RvY29scyB3ZWJwIHdwZWJhY2tlbmQtZmRvCj4gIAo+
IC0tIAo+IDIuMzAuMgo+IAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--xm7l4KmP1Qe2yvcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYWdFsQAKCRCRxVnb5MkS
O8f/AJ9ipvxPwl8xUjMkhXfEQUn7LfrhSACfe2WSxLSyfVJJW7gAsWtg0I3YQnw=
=6HoP
-----END PGP SIGNATURE-----

--xm7l4KmP1Qe2yvcc--

--===============4692859964624844578==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4692859964624844578==--
