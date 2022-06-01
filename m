Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01ADAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 14:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5C3A82F32;
	Wed,  1 Jun 2022 14:18:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ajl34P1ZB5I1; Wed,  1 Jun 2022 14:18:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7F5C81AAB;
	Wed,  1 Jun 2022 14:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1ED331BF2C7
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 14:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AD4A4011A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 14:18:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q7QtAC_csoxN for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 14:18:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EACC40C32
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 14:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PcGlZZFJ/2AURMWkaz/asP+Edxrw6RJUT7QfxBBfcAU=; b=Fq/8T7rC8IcxkbCxorakzTlRep
 faDNfRXdNb/dW8Y3XR+brzLxUhnSkv8ESGb6+Nvi1nGtBk0b8vdJZQzlj1wb35L8ES2H2/fHwS7lT
 iCff/woxutYt+CGI8Lv+XraD7LOFV66KChkGQfCRcSwZIrP3gQPn3jmKIupNwDYGktKMmxqwmmqQK
 8BnhP7hlzRV7Nr0ZhiQo2Hw5cFhrWXVQQR9QbplqXPH4VatY+l8MYcYRQeO4fbaknJzau4tKyWXOX
 aqy82Q2ecFROEwsf/pPYZEIQ/0Hbx4wA7GVrxeL0V+fB2iy22mLnSJs6fe+sJ4iP3I4fr0Y8TdmKH
 3Fuio2zA==;
Received: from 91-153-34-181.elisa-laajakaista.fi ([91.153.34.181] helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1nwPBP-007RD5-Ea; Wed, 01 Jun 2022 16:18:47 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 532b8cb4;
 Wed, 1 Jun 2022 14:18:33 +0000 (UTC)
Date: Wed, 1 Jun 2022 17:18:28 +0300
Message-ID: <20220601171828.GB870187@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Michael Nosthoff <buildroot@heine.tech>
In-Reply-To: <20220601103905.GB863200@momiji>
References: <54-6295dc80-3-54e5e980@111886211> <20220601103905.GB863200@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: bump to version
 2.36.2
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3399472225200262774=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============3399472225200262774==
Content-Type: multipart/signed; boundary="ZIu43+8qDNAAGDfj"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--ZIu43+8qDNAAGDfj
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgYWdhaW4sCgpPbiBXZWQsIDAxIEp1biAyMDIyIDEwOjM5OjA1ICswMzAwIEFkcmlhbiBQZXJl
eiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKIAo+IE9uIFR1ZSwgMzEgTWF5
IDIwMjIgMTE6MTQ6NTcgKzAyMDAgTWljaGFlbCBOb3N0aG9mZiB2aWEgYnVpbGRyb290IDxidWls
ZHJvb3RAYnVpbGRyb290Lm9yZz4gd3JvdGU6Cj4gPgo+ID4gWy4uLl0KPiA+IAo+ID4gSSB0cmll
ZCB3aXRoIHRoZSBsYXRlc3QgbWFzdGVyIGJyYW5jaCAod2l0aCAyLjM2LjMpIGFuZCBleHRlbmRl
ZCB0aGUgcmFzcGJlcnJ5cGk0X2RlZmNvbmZpZyB3aXRoIGdyYXBoaWNzIGRyaXZlci4KPiA+IAo+
ID4gVGhpcyBpcyB0aGUgZGVmY29uZmlnOgo+ID4KPiA+IFsuLi5dCj4gCj4gVGhhbmtzIGEgbG90
IGZvciBzaGFyaW5nIHlvdXIgY29uZmlnLCB0aGF0IHdhcyBtb3N0IGhlbHBmdWwhIEkgaGF2ZSBi
ZWVuCj4gYWJsZSB0byByZXByb2R1Y2UgdGhlIGJ1aWxkIGlzc3VlIGFuZCBJIGFtIGFscmVhZHkg
d29ya2luZyBvbiBhIGZpeCwKPiB3aGljaCB3aWxsIG1ha2UgaXQgaW50byB0aGUgMi4zNi40IHJl
bGVhc2UgaW4gc29tZSB3ZWVrcy4gSW4gdGhlCj4gbWVhbnRpbWUgSSB3aWxsIHN1Ym1pdCBhIGZp
eCB0byBoYXZlIHRoZSBwYXRjaCBpbiBCdWlsZHJvb3QuCgpJIGFtIHN0aWxsIHdvcmtpbmcgdGhy
b3VnaCBmaW5pc2hpbmcgYW5kIHRlc3RpbmcgYSBmaXgsIGJ1dCBJIGhhdmUKYWxyZWFkeSBmaWxl
ZCBhbiBpc3N1ZSBpbiBCdWd6aWxsYSB0byB0cmFjayB0aGlzLiBGZWVsIGZyZWUgdG8gc3Vic2Ny
aWJlCnRvIHRoZSBpc3N1ZSBbMV0gdG8gZm9sbG93IGFsb25nIDopCgpDaGVlcnMsCuKAlEFkcmnD
oW4KCi0tLQpbMV0gaHR0cHM6Ly9idWdzLndlYmtpdC5vcmcvc2hvd19idWcuY2dpP2lkPTI0MTE4
Mgo=

--ZIu43+8qDNAAGDfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYpd1NAAKCRCRxVnb5MkS
O/7aAJ9juChr2OWidLrxmRSjx4cnUtRNzgCcDKOzVt6Q79Me+9PgmgZkl//gnfg=
=e6P0
-----END PGP SIGNATURE-----

--ZIu43+8qDNAAGDfj--

--===============3399472225200262774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3399472225200262774==--
