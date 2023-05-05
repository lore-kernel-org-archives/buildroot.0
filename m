Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCBBC77B7C
	for <buildroot@archiver.kernel.org>; Fri,  5 May 2023 11:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7DBE429D9;
	Fri,  5 May 2023 11:57:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7DBE429D9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nYmHru-RtShj; Fri,  5 May 2023 11:57:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15D3B41DF2;
	Fri,  5 May 2023 11:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15D3B41DF2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 99C3F1BF3BF
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:57:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 276A5429C4
 for <buildroot@lists.busybox.net>; Fri,  5 May 2023 11:57:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 276A5429C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v4Zi_cslGWgV for <buildroot@lists.busybox.net>;
 Fri,  5 May 2023 11:57:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03DA6400C5
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 03DA6400C5
 for <buildroot@buildroot.org>; Fri,  5 May 2023 11:57:26 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1puu3w-001paw-AY; Fri, 05 May 2023 13:57:24 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 097841f1;
 Fri, 5 May 2023 11:57:22 +0000 (UTC)
Date: Fri, 5 May 2023 14:57:22 +0300
Message-ID: <20230505145722.GJ3311548@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230428075920.3750005-5-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
 <20230428075920.3750005-5-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cuEWP5SuFPYp4pJoaJuoJqMmjoi4cb53fmCZRJi8WXE=; b=j/f33NSTVDRARs3bXK4Bv5Iu3Q
 0N3IZ1dRqaQGGO+N5sGOZI+CtkVbEmTwfnm8Vw5996LJM9UQNooIQH99Xr220UFlMdth9cJJXD6T4
 DyR7riwxtpc+VGpBF0HJQHQrMagkIvhyNx/4B/t/SM0ymUcltVVRWUGII9fae/oDsIqwQfWMyqcah
 14ETDZRmMiVns+HNTdMiFK2VmS8IrmScxRCDEg0M0qBQSd1xiSO13VGkjBqxJJv383YnWZzIiaxHj
 1bvWARRg2Ca7sKpxGb1/L7VO/uOIlp+KNtWhx/U8LJdqBml70QpPkKSmFdVcDnTFMxyLNJpyigLSh
 /o3ZV9cg==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=j/f33NST
Subject: Re: [Buildroot] [PATCH v7 5/5] package/libgtk3: fix
 update-icon-cache on empty directory
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: multipart/mixed; boundary="===============8784261229657414848=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============8784261229657414848==
Content-Type: multipart/signed; boundary="v2dMeECS5Emp/wBl"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--v2dMeECS5Emp/wBl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gRnJpLCAyOCBBcHIgMjAyMyAwOTo1OToyMCArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IElmIGJvdGgsIGhpY29sb3ItaWNvbi10aGVtZSAoc2Vs
ZWN0ZWQgYnkgbGliZ3RrMy1kZW1vKSBhbmQKPiBhZHdhaXRhLWljb24tdGhlbWUgaXMgbm90IHNl
bGVjdGVkLCB0aGVuIHRoZSAvdXNyL3NoYXJlL2ljb25zCj4gZm9sZGVyIGlzIGVtcHR5LCBjYXVz
aW5nIGZpbmQgdG8gZmFpbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRo
b21hcy5kZXZvb2dkdEBiYXJjby5jb20+Cj4gVGVzdGVkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2Fz
dHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KClJldmlld2VkLWJ5OiBBZHJpYW4gUGVyZXogZGUgQ2Fz
dHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KCj4gLS0tCj4gdjU6IAo+ICAtIEZpeGVkIGluZGVudGF0
aW9uLgo+ICAtIEdyb3VwZWQgcGF0Y2hlcy4KPiB2Njogbm8gY2hhbmdlCj4gdjc6IG5vIGNoYW5n
ZQo+IC0tLQo+ICBwYWNrYWdlL2xpYmd0azMvbGliZ3RrMy5tayB8IDUgKysrLS0KPiAgMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0
IGEvcGFja2FnZS9saWJndGszL2xpYmd0azMubWsgYi9wYWNrYWdlL2xpYmd0azMvbGliZ3RrMy5t
awo+IGluZGV4IGJkZDU0ZGNkYzguLmVhYzU2OWZkNDEgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9s
aWJndGszL2xpYmd0azMubWsKPiArKysgYi9wYWNrYWdlL2xpYmd0azMvbGliZ3RrMy5tawo+IEBA
IC0xNDYsOCArMTQ2LDkgQEAgZW5kZWYKPiAgIyBDcmVhdGUgaWNvbi10aGVtZS5jYWNoZSBmb3Ig
ZWFjaCBvZiB0aGUgaWNvbiBkaXJlY3Rvcmllcy90aGVtZXMKPiAgIyBJdCdzIG5vdCBzdHJpY3Rs
eSBuZWNlc3NhcnkgYnV0IHNwZWVkcyB1cCBsb29rdXBzCj4gIGRlZmluZSBMSUJHVEszX1VQREFU
RV9JQ09OX0NBQ0hFCj4gLQlmaW5kICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ljb25zIC1tYXhk
ZXB0aCAxIC1taW5kZXB0aCAxIC10eXBlIGQgXAo+IC0JCS1leGVjICQoSE9TVF9ESVIpL2Jpbi9n
dGstdXBkYXRlLWljb24tY2FjaGUge30gXDsKPiArCVsgISAtZCAkKFRBUkdFVF9ESVIpL3Vzci9z
aGFyZS9pY29ucyBdIHx8IFwKPiArCQlmaW5kICQoVEFSR0VUX0RJUikvdXNyL3NoYXJlL2ljb25z
IC1tYXhkZXB0aCAxIC1taW5kZXB0aCAxIC10eXBlIGQgXAo+ICsJCQktZXhlYyAkKEhPU1RfRElS
KS9iaW4vZ3RrLXVwZGF0ZS1pY29uLWNhY2hlIHt9IFw7Cj4gIGVuZGVmCj4gIExJQkdUSzNfVEFS
R0VUX0ZJTkFMSVpFX0hPT0tTICs9IExJQkdUSzNfVVBEQVRFX0lDT05fQ0FDSEUKPiAgCj4gLS0g
Cj4gMi4zNC4xCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcK
PiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
PiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--v2dMeECS5Emp/wBl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZFTvIgAKCRCRxVnb5MkS
O27FAJ4orjr3I2L4TkfBvo3Yy6lW9SRvugCeN7TKraShqj9bKI2taHOlF+FNtZ8=
=Y7gd
-----END PGP SIGNATURE-----

--v2dMeECS5Emp/wBl--

--===============8784261229657414848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8784261229657414848==--
