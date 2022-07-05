Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10015C43334
	for <buildroot@archiver.kernel.org>; Tue,  5 Jul 2022 08:17:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 970228125B;
	Tue,  5 Jul 2022 08:17:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970228125B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d8U97soL2TvN; Tue,  5 Jul 2022 08:17:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B4D38105C;
	Tue,  5 Jul 2022 08:17:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B4D38105C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16BBF1BF681
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 08:17:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F304C416D6
 for <buildroot@lists.busybox.net>; Tue,  5 Jul 2022 08:17:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F304C416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1j1HCnFhplvy for <buildroot@lists.busybox.net>;
 Tue,  5 Jul 2022 08:17:16 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89944168B
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A89944168B
 for <buildroot@buildroot.org>; Tue,  5 Jul 2022 08:17:15 +0000 (UTC)
Received: from 135.224.60.213.dynamic.reverse-mundo-r.com ([213.60.224.135]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1o8dk8-000d5X-S9; Tue, 05 Jul 2022 10:17:12 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 90f695e9;
 Tue, 5 Jul 2022 08:17:03 +0000 (UTC)
Date: Tue, 5 Jul 2022 10:16:59 +0200
Message-ID: <20220705101659.GB163297@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
In-Reply-To: <20220705064119.1041728-1-bernd.kuhls@t-online.de>
References: <20220705064119.1041728-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rQzCJmS6eEG9cdjkZHThZ3gQjjt0Wgv1UvFoPCdfObA=; b=DdY1Sx7evgPontBdRNsb7xJCZe
 QX5EF7gClZOoj0FNlmFV5+asn5whAkIgklrfESmv8CkxSOubjtyBlqQd04RxQ+vdTwLrtzFj+a26B
 s9JDT2gWYXVKxwSpd9XON41JXAbvZa+R10LAM8e/nhaEpbtRgH3UoiLMOiPMhgAsmpv+PosZNDCK7
 PDl64k1+wL36/nbrdmAthGdUGs6CbaARCTBgNp4gSkMwFImZkb/91SHmP2BxIn1LUksaFtVJDaYvI
 b3IBXb9U+E+EPikgs+sEwL+dKl83S/LYYxKcz4XR5/Gat1+/I6Rw7jgbqa3DAfvGZuiwDnddFLLxy
 QDECtgxQ==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=DdY1Sx7e
Subject: Re: [Buildroot] [PATCH 1/1] package/libpsl: require libiconv if
 !BR2_ENABLE_LOCALE
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5576044501472823239=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5576044501472823239==
Content-Type: multipart/signed; boundary="a/HO2iKPCvjqjoqd"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--a/HO2iKPCvjqjoqd
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAwNSBKdWwgMjAyMiAwODo0MToxOSArMDIwMCBCZXJuZCBLdWhscyA8YmVybmQua3Vo
bHNAdC1vbmxpbmUuZGU+IHdyb3RlOgo+IEZpeGVzIGJ1aWxkIGVycm9yCj4gCj4gQ2hlY2tpbmcg
Zm9yIGZ1bmN0aW9uICJpY29udl9vcGVuIiA6IE5PCj4gSGVhZGVyIDxpY29udi5oPiBoYXMgc3lt
Ym9sICJpY29udl9vcGVuIiA6IE5PCj4gCj4gb3V0cHV0L2J1aWxkL2xpYnBzbC0wLjIxLjEvbWVz
b24uYnVpbGQ6MTAxOjQ6Cj4gIEVSUk9SOiBQcm9ibGVtIGVuY291bnRlcmVkOiBpY29udiBpbXBs
ZW1lbnRhdGlvbiBub3QgZm91bmQKPiAKPiB1c2luZyB0aGlzIGRlZmNvbmZpZzoKPiAKPiBCUjJf
VE9PTENIQUlOX0JVSUxEUk9PVF9XQ0hBUj15Cj4gQlIyX1BBQ0tBR0VfTElCUFNMPXkKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBCZXJuZCBLdWhscyA8YmVybmQua3VobHNAdC1vbmxpbmUuZGU+CgpSZXZp
ZXdlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0t
LQo+ICBwYWNrYWdlL2xpYnBzbC9Db25maWcuaW4gfCAxICsKPiAgcGFja2FnZS9saWJwc2wvbGli
cHNsLm1rIHwgNCArKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspCj4gCj4g
ZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlicHNsL0NvbmZpZy5pbiBiL3BhY2thZ2UvbGlicHNsL0Nv
bmZpZy5pbgo+IGluZGV4IGE0Y2JjZTZiNDMuLjdiMDJkOTYxYzggMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS9saWJwc2wvQ29uZmlnLmluCj4gKysrIGIvcGFja2FnZS9saWJwc2wvQ29uZmlnLmluCj4g
QEAgLTEsNiArMSw3IEBACj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9MSUJQU0wKPiAgCWJvb2wgImxp
YnBzbCIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9XQ0hBUiAjIGxpYnVuaXN0cmluZywgaWN1Cj4g
KwlzZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUNPTlYgaWYgIUJSMl9FTkFCTEVfTE9DQUxFCj4gIAlz
ZWxlY3QgQlIyX1BBQ0tBR0VfTElCSUROMiBpZiAhQlIyX1BBQ0tBR0VfSUNVICYmICFCUjJfUEFD
S0FHRV9MSUJJRE4KPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJVTklTVFJJTkcgaWYgIUJSMl9Q
QUNLQUdFX0lDVQo+ICAJaGVscAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYnBzbC9saWJwc2wu
bWsgYi9wYWNrYWdlL2xpYnBzbC9saWJwc2wubWsKPiBpbmRleCA1ZGMwM2E3YzI0Li43NDIxMTdl
OGVhIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlicHNsL2xpYnBzbC5tawo+ICsrKyBiL3BhY2th
Z2UvbGlicHNsL2xpYnBzbC5tawo+IEBAIC0xMSw2ICsxMSwxMCBAQCBMSUJQU0xfTElDRU5TRV9G
SUxFUyA9IENPUFlJTkcgc3JjL0xJQ0VOU0UuY2hyb21pdW0KPiAgTElCUFNMX0RFUEVOREVOQ0lF
UyA9IGhvc3QtcGtnY29uZgo+ICBMSUJQU0xfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gIAo+ICtp
ZmVxICgkKEJSMl9FTkFCTEVfTE9DQUxFKSwpCj4gK0xJQlBTTF9ERVBFTkRFTkNJRVMgKz0gbGli
aWNvbnYKPiArZW5kaWYKPiArCj4gICMgVGhlIG9yZGVyIG9mIGNoZWNrcyBpcyB0aGUgc2FtZSBh
cyBkb25lIGJ5IGxpYnBzbCB3aGVuIGNvbmZpZ3VyZWQuCj4gIGlmZXEgKCQoQlIyX1BBQ0tBR0Vf
TElCSUROMikkKEJSMl9QQUNLQUdFX0xJQlVOSVNUUklORykseXkpCj4gIExJQlBTTF9DT05GX09Q
VFMgKz0gLURydW50aW1lPWxpYmlkbjIgLURidWlsdGluPWxpYmlkbjIKPiAtLSAKPiAyLjMwLjIK
PiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1
aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoKQ2hlZXJz
LArigJRBZHJpw6FuCg==

--a/HO2iKPCvjqjoqd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYsPzewAKCRCRxVnb5MkS
O6LbAJ4tWC8SuIYc8njmvtmNV6M1tSLmwACff7xKTsNcwDdbPKujn6jcVDGbf6M=
=fl8c
-----END PGP SIGNATURE-----

--a/HO2iKPCvjqjoqd--

--===============5576044501472823239==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5576044501472823239==--
