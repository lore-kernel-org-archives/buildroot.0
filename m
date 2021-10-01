Return-Path: <SRS0=lBh3=OV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67C1DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:36:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29A7961A7D
	for <buildroot@archiver.kernel.org>; Fri,  1 Oct 2021 10:36:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 29A7961A7D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=igalia.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E6AB64043C;
	Fri,  1 Oct 2021 10:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3V8CkHsN5GGJ; Fri,  1 Oct 2021 10:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0D24C4021A;
	Fri,  1 Oct 2021 10:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DB931BF2C2
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 95FBF8445F
 for <buildroot@lists.busybox.net>; Fri,  1 Oct 2021 10:36:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pTDpUNhMDN1K for <buildroot@lists.busybox.net>;
 Fri,  1 Oct 2021 10:36:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9704884471
 for <buildroot@buildroot.org>; Fri,  1 Oct 2021 10:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date;
 bh=eWkGwI7AKJbE/Ofai1UaY/1KxOl4rbF0IjTVxSxv0ok=; 
 b=rnlI/Rf8kwqopuFeJqaatNm8zdREK9Z3GVF2rU3BRngvVJnMm46wZloXeqWDm9ptDghs+64bbUeayCvDYcgifJdB1Qbv56Bn6DJCdAS7WOx0SUAouz1ISx8w898FpRlHqcvyd1Mtn1cJly4RXUcPb7k1NEU22VR25tDo6OTYMXVweJg+ATe02wcbZllBP0h/iM6ie9F6A9qgCv9c/rG2DRas3PTeJ2h3uzhxEUTCbML/f/D+VB3B+/ziJd19tB5xxL6xCttXwUmcJRnFZy5i6i+UUybXv9EWlkCTSlGbqB8GaLSEpaMSPGs770Jbvfrpnkfsnr8SlO55LYJzxX+Bqg==;
Received: from 91-158-76-100.elisa-laajakaista.fi ([91.158.76.100] helo=momiji)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1mWFtd-0006jj-2D; Fri, 01 Oct 2021 12:36:05 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id f3a50765;
 Fri, 1 Oct 2021 10:35:55 +0000 (UTC)
Date: Fri, 1 Oct 2021 13:35:54 +0300
Message-ID: <20211001133554.GE1057162@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20211001132559.GC1057162@momiji>
References: <20210924124525.168298-1-james.hilliard1@gmail.com>
 <20211001132559.GC1057162@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: remove
 gst1-plugins-good from dependencies
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Normand <philn@igalia.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4400667766156983453=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4400667766156983453==
Content-Type: multipart/signed; boundary="zcShOCGLkuQS0iru"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--zcShOCGLkuQS0iru
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAwMSBPY3QgMjAyMSAxMzoyNTo1OSArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gT24gRnJpLCAyNCBTZXAgMjAyMSAwNjo0NToy
NSAtMDYwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6
Cj4gPiBUaGlzIGlzIG9ubHkgYSBydW50aW1lIGRlcGVuZGVuY3kgbm90IGEgYnVpbGQgZGVwZW5k
ZW5jeS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQgPGphbWVzLmhpbGxp
YXJkMUBnbWFpbC5jb20+Cj4gCj4gUmV2aWV3ZWQtYnk6IEFkcmlhbiBwZXJleiBkZSBDYXN0cm8g
PGFwZXJlekBpZ2FsaWEuY29tPgo+IAo+ID4gLS0tCj4gPiAgcGFja2FnZS93cGV3ZWJraXQvd3Bl
d2Via2l0Lm1rIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Vi
a2l0Lm1rIGIvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Via2l0Lm1rCj4gPiBpbmRleCA1YzVlNjYy
NWY4Li41MDcxNGI0MzY2IDEwMDY0NAo+ID4gLS0tIGEvcGFja2FnZS93cGV3ZWJraXQvd3Bld2Vi
a2l0Lm1rCj4gPiArKysgYi9wYWNrYWdlL3dwZXdlYmtpdC93cGV3ZWJraXQubWsKPiA+IEBAIC0z
OSw3ICszOSw3IEBAIGlmZXEgKCQoQlIyX1BBQ0tBR0VfV1BFV0VCS0lUX01VTFRJTUVESUEpLHkp
Cj4gPiAgV1BFV0VCS0lUX0NPTkZfT1BUUyArPSBcCj4gPiAgCS1ERU5BQkxFX1ZJREVPPU9OIFwK
PiA+ICAJLURFTkFCTEVfV0VCX0FVRElPPU9OCj4gPiAtV1BFV0VCS0lUX0RFUEVOREVOQ0lFUyAr
PSBnc3RyZWFtZXIxIGdzdDEtbGliYXYgZ3N0MS1wbHVnaW5zLWJhc2UgZ3N0MS1wbHVnaW5zLWdv
b2QKPiA+ICtXUEVXRUJLSVRfREVQRU5ERU5DSUVTICs9IGdzdHJlYW1lcjEgZ3N0MS1saWJhdiBn
c3QxLXBsdWdpbnMtYmFzZQo+ID4gIGVsc2UKPiA+ICBXUEVXRUJLSVRfQ09ORl9PUFRTICs9IFwK
PiA+ICAJLURFTkFCTEVfVklERU89T0ZGIFwKPiA+IC0tIAo+ID4gMi4yNS4xCj4gPiAKPiAKPiBX
ZSBzaG91bGQgZG8gdGhlIHNhbWUgZWRpdCBpbiBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
bWsgOikKCkRvbmUgaW4gaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxk
cm9vdC9wYXRjaC8yMDIxMTAwMTEwMzQxNy4xMDc4MDgyLTEtYXBlcmV6QGlnYWxpYS5jb20vCiAK
CkNoZWVycywK4oCUQWRyacOhbgo=

--zcShOCGLkuQS0iru
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYVbkiwAKCRCRxVnb5MkS
O01SAJ9Ep2mi5dsHx6YLGTSI6JyjMgDhqACeICTsxB3zvlR1fI5qiF+mvPebjvY=
=s5i4
-----END PGP SIGNATURE-----

--zcShOCGLkuQS0iru--

--===============4400667766156983453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4400667766156983453==--
