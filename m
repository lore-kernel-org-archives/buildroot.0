Return-Path: <SRS0=01xH=PX=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9623EC433F5
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 02:17:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F44260FED
	for <buildroot@archiver.kernel.org>; Thu,  4 Nov 2021 02:17:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6F44260FED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ECBA360808;
	Thu,  4 Nov 2021 02:17:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ekRW89_OYPVT; Thu,  4 Nov 2021 02:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F1F5607F2;
	Thu,  4 Nov 2021 02:17:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B532C1BF283
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 02:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 97C1E81551
 for <buildroot@lists.busybox.net>; Thu,  4 Nov 2021 02:17:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xJRe0e17BuN0 for <buildroot@lists.busybox.net>;
 Thu,  4 Nov 2021 02:17:12 +0000 (UTC)
X-Greylist: delayed 00:35:35 by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 81432814B5
 for <buildroot@buildroot.org>; Thu,  4 Nov 2021 02:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=DLRm8XFB5o0WMxS3BEltg7WAVWG4Sb6BEnqGJYcEe6w=; 
 b=CK6DjDx2lv1F9/1PCDDvrpTdLNHULDRB8JjaYgCgsnLpMpSA+TVXYFQh5AWq6z1j36X4OZQieYVIm28tQbw9f9ekBNlIGpdOOlQiW93AaR3GPrignb76tm0rHjIHbi99NQyJfAzNDSbKrh8/VQQMfVxus0vSAMcCb+Cfm9ofT5JLhU8Df+BXw8i0iFxqb6KPWi7USMbRUWY1h3QrDC0ggF9nvFRKghOOsrB59uPo9TdBDV7AhNRf6MQ+Cl59qXnGbjTNUYRTwU0Mwh6FRqJOJ57FxR7KzuVt9XvDo4DtTe0dLsA0fhozMCi4SIBx2hQ30Cwu0QlVbl1m7+D02ZXqmQ==;
Received: from 91-152-140-142.elisa-laajakaista.fi ([91.152.140.142]
 helo=momiji) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1miRl8-00009Y-Rc; Thu, 04 Nov 2021 02:41:42 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 58784385;
 Thu, 4 Nov 2021 01:41:15 +0000 (UTC)
Date: Thu, 4 Nov 2021 03:41:15 +0200
Message-ID: <20211104034115.GB825816@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Adam Duskett <aduskett@gmail.com>
In-Reply-To: <20211104003607.2022984-3-aduskett@gmail.com>
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <20211104003607.2022984-3-aduskett@gmail.com>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH vRFC 2/4] package/webkitgtk: add
 gobject-introspection optional dependency
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <aduskett@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4660682972754770608=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4660682972754770608==
Content-Type: multipart/signed; boundary="JCTIf449Gy+I8Ans"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--JCTIf449Gy+I8Ans
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gV2VkLCAwMyBOb3YgMjAyMSAxNzozNjowNSAtMDcwMCBBZGFtIER1c2tldHQgPGFkdXNrZXR0
QGdtYWlsLmNvbT4gd3JvdGU6Cj4gRW5hYmxlIGludHJvc3BlY3Rpb24gd2hlbiBHT2JqZWN0IElu
dHJvc3BlY3Rpb24gaXMgZW5hYmxlZC4KPiBNaWRvcmkgOS4wIHJlcXVpcmVzIHdlYmtpdGd0ayBi
dWlsdCB3aXRoIGdvYmplY3QtaW50cm9zcGVjdGlvbgo+IHN1cHBvcnQuCj4gCj4gU2lnbmVkLW9m
Zi1ieTogQWRhbSBEdXNrZXR0IDxhZHVza2V0dEBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQWRy
aWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdl
L3dlYmtpdGd0ay93ZWJraXRndGsubWsgfCA4ICsrKysrKystCj4gIDEgZmlsZSBjaGFuZ2VkLCA3
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93
ZWJraXRndGsvd2Via2l0Z3RrLm1rIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4g
aW5kZXggYTNkYjI0OWFlNi4uNGQ1ZDBiODllMiAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtp
dGd0ay93ZWJraXRndGsubWsKPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsubWsK
PiBAQCAtMjEsNyArMjEsNiBAQCBXRUJLSVRHVEtfQ09ORl9PUFRTID0gXAo+ICAJLURFTkFCTEVf
R0FNRVBBRD1PRkYgXAo+ICAJLURFTkFCTEVfR0VPTE9DQVRJT049T0ZGIFwKPiAgCS1ERU5BQkxF
X0dUS0RPQz1PRkYgXAo+IC0JLURFTkFCTEVfSU5UUk9TUEVDVElPTj1PRkYgXAo+ICAJLURFTkFC
TEVfTUlOSUJST1dTRVI9T04gXAo+ICAJLURFTkFCTEVfU1BFTExDSEVDSz1PTiBcCj4gIAktRFBP
UlQ9R1RLIFwKPiBAQCAtNTksNiArNTgsMTMgQEAgZWxzZQo+ICBXRUJLSVRHVEtfQ09ORl9PUFRT
ICs9IC1ERU5BQkxFX1dFQkRSSVZFUj1PRkYKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BB
Q0tBR0VfR09CSkVDVF9JTlRST1NQRUNUSU9OKSx5KQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9
IC1ERU5BQkxFX0lOVFJPU1BFQ1RJT049T04KPiArV0VCS0lUR1RLX0RFUEVOREVOQ0lFUyArPSBn
b2JqZWN0LWludHJvc3BlY3Rpb24KPiArZWxzZQo+ICtXRUJLSVRHVEtfQ09ORl9PUFRTICs9IC1E
RU5BQkxFX0lOVFJPU1BFQ1RJT049T0ZGCj4gK2VuZGlmCj4gKwoKTmljZSB0byBzZWUgdGhpcyBo
YXBwZW4gPSkKCj4gICMgT25seSBvbmUgdGFyZ2V0IHBsYXRmb3JtIGNhbiBiZSBidWlsdCwgYXNz
dW1lIFgxMSA+IFdheWxhbmQKPiAgCj4gICMgR1RLMy1YMTEgdGFyZ2V0IGdpdmVzIE9wZW5HTCBm
cm9tIG5ld2VyIGxpYmd0azMgdmVyc2lvbnMKPiAtLSAKPiAyLjMyLjAKPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--JCTIf449Gy+I8Ans
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYYM6OwAKCRCRxVnb5MkS
OyojAJ4mFOWuKpQNvxMsC8I3XvSiW20/iwCaAm3WFfeFDlYLwPPdpSPdRsnnHj4=
=gJef
-----END PGP SIGNATURE-----

--JCTIf449Gy+I8Ans--

--===============4660682972754770608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4660682972754770608==--
