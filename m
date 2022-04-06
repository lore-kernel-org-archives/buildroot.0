Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A8BC433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Apr 2022 20:59:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 470D881465;
	Wed,  6 Apr 2022 20:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sQf8mPq4r4O9; Wed,  6 Apr 2022 20:59:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C13981758;
	Wed,  6 Apr 2022 20:59:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D3391BF27E
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:59:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0C157408C1
 for <buildroot@lists.busybox.net>; Wed,  6 Apr 2022 20:59:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3L6Agp_Vd3va for <buildroot@lists.busybox.net>;
 Wed,  6 Apr 2022 20:59:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B575D40B61
 for <buildroot@buildroot.org>; Wed,  6 Apr 2022 20:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7Hi2dxluJP/ZJ7ns1gLmY6YPjjazTZTD/8qGmHBJsps=; b=UnHGAi/eLFbbQjZLqgJGwUm19O
 96PPWYwrBewIoKGumLJE9Qh6p0lvACD1USdfR5/ilY8rOTkgNI6xB4wuQLquEEpJImX7CWWO3nqOx
 KTdzVBR0AtMhDxSPzRyLotZeh+XoeVbzliedVrTghOehCV7OSYX+AyGUGPZCcUYmdvmG/FNMEY0n/
 fkIVngwNUR00H89BwnqBSP/S787cF0PAlkYHQtf/TmOzwAz5DATRdu+/+x5pBFw5upRWlAtmub7YH
 TptQHucxBJpFIgUzIgCLYXRFoiAKWRRH2Ax+6gCVBkpi1+eDwlJahDHB+xRa2OcjiHX4FnbbPP6XK
 IGXMqq/A==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1ncCjz-000C3e-Rv; Wed, 06 Apr 2022 22:58:59 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id b820da5d;
 Wed, 6 Apr 2022 20:58:41 +0000 (UTC)
Date: Wed, 6 Apr 2022 23:58:27 +0300
Message-ID: <20220406235827.GB2664461@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
In-Reply-To: <20220406185552.4011357-1-fontaine.fabrice@gmail.com>
References: <20220406185552.4011357-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/woff2: use github helper
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2154207716483237178=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2154207716483237178==
Content-Type: multipart/signed; boundary="5HVETlLIhv0anwGC"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--5HVETlLIhv0anwGC
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAwNiBBcHIgMjAyMiAyMDo1NTo1MiArMDIwMCBGYWJyaWNlIEZvbnRhaW5lIDxmb250
YWluZS5mYWJyaWNlQGdtYWlsLmNvbT4gd3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogRmFicmljZSBG
b250YWluZSA8Zm9udGFpbmUuZmFicmljZUBnbWFpbC5jb20+CgpBY2tlZC1ieTogQWRyaWFuIFBl
cmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dvZmYy
L3dvZmYyLmhhc2ggfCAyICstCj4gIHBhY2thZ2Uvd29mZjIvd29mZjIubWsgICB8IDMgKy0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9wYWNrYWdlL3dvZmYyL3dvZmYyLmhhc2ggYi9wYWNrYWdlL3dvZmYyL3dvZmYy
Lmhhc2gKPiBpbmRleCA0NjkwNzFlM2MyLi4wODEyZGFiY2YxIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2Uvd29mZjIvd29mZjIuaGFzaAo+ICsrKyBiL3BhY2thZ2Uvd29mZjIvd29mZjIuaGFzaAo+IEBA
IC0xLDUgKzEsNSBAQAo+ICAjIExvY2FsbHkgZ2VuZXJhdGVkOgo+IC1zaGE1MTIgIGM3ODhiYmEx
NTMwYWVjNDYzZTc1NWU5MDFmOTM0MmY0YjU5OWUzYTA3ZjU0NjQ1ZmVmMWRjMzg4YWI1ZDVjMzA2
MjU1MzVlNWRkMzhlOWU3OTJlMDRhNjQwNTc0YmFhNTBlZWVmYjZiNzMzOGFiNDAzNzU1ZjRhNGUw
YzMwNDRkICB2MS4wLjIudGFyLmd6Cj4gK3NoYTUxMiAgYzc4OGJiYTE1MzBhZWM0NjNlNzU1ZTkw
MWY5MzQyZjRiNTk5ZTNhMDdmNTQ2NDVmZWYxZGMzODhhYjVkNWMzMDYyNTUzNWU1ZGQzOGU5ZTc5
MmUwNGE2NDA1NzRiYWE1MGVlZWZiNmI3MzM4YWI0MDM3NTVmNGE0ZTBjMzA0NGQgIHdvZmYyLTEu
MC4yLnRhci5nego+ICAKPiAgIyBIYXNoIGZvciBsaWNlbnNlIGZpbGVzOgo+ICBzaGE1MTIgIDhl
ZTkyNGRhM2ZiNWQxNjEzNWFkY2Y2YThmYmU5ZTJlOGYzZDJkODA0Njg2MTdlNzJjYTRmYTA1OWE2
MGY4NDU1YzlhNWY2OGE4ZGMzODFiMTI5N2M4YmYzOWM4ODdhOTEyZDBmNjkyNDZkMjYwNGFkYTc0
ZDNkYTllOGU0OTBiICBMSUNFTlNFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd29mZjIvd29mZjIu
bWsgYi9wYWNrYWdlL3dvZmYyL3dvZmYyLm1rCj4gaW5kZXggYjJmZjMzZmU5OC4uOTM3ZThjZjcz
NiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dvZmYyL3dvZmYyLm1rCj4gKysrIGIvcGFja2FnZS93
b2ZmMi93b2ZmMi5tawo+IEBAIC01LDggKzUsNyBAQAo+ICAjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
Iwo+ICAKPiAgV09GRjJfVkVSU0lPTiA9IDEuMC4yCj4gLVdPRkYyX1NPVVJDRSA9IHYkKFdPRkYy
X1ZFUlNJT04pLnRhci5nego+IC1XT0ZGMl9TSVRFID0gaHR0cHM6Ly9naXRodWIuY29tL2dvb2ds
ZS93b2ZmMi9hcmNoaXZlCj4gK1dPRkYyX1NJVEUgPSAkKGNhbGwgZ2l0aHViLGdvb2dsZSx3b2Zm
Mix2JChXT0ZGMl9WRVJTSU9OKSkKPiAgV09GRjJfTElDRU5TRSA9IE1JVAo+ICBXT0ZGMl9MSUNF
TlNFX0ZJTEVTID0gTElDRU5TRQo+ICBXT0ZGMl9JTlNUQUxMX1NUQUdJTkcgPSBZRVMKPiAtLSAK
PiAyLjM1LjEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+
IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoK
Q2hlZXJzLArigJRBZHJpw6FuCg==

--5HVETlLIhv0anwGC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYk3+8wAKCRCRxVnb5MkS
O9tVAJ9YL0WFVxZl1HxP+xb+IzGXhDOZCgCeLrXycrpAmoFgf/jXObvsuRhcDqU=
=yxlj
-----END PGP SIGNATURE-----

--5HVETlLIhv0anwGC--

--===============2154207716483237178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2154207716483237178==--
