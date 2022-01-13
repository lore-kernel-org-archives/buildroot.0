Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF8BC433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 09:12:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29ED184B7C;
	Thu, 13 Jan 2022 09:12:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a1GpuPAGU-ga; Thu, 13 Jan 2022 09:12:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3589C84B77;
	Thu, 13 Jan 2022 09:12:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E483E1BF859
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 09:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB8BE4093B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 09:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=igalia.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 37LP_EJLtxVv for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 09:12:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9330C4000B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r1Bgxcs64Sax8tZ/lpyyp+KQR3dR49K/oFbEud5njKA=; b=N3Ts//TrlcCnwGRByDbfcv+EfX
 UQNWJuAP9HkSTMK0HHq1UDjzsGM6WZq6gECTvOlbeVNHk852+0uxSFcuRqmmKgyARdO/ZNTRF4DfT
 hs8wuHKNTk6rWYQYxXM6wd4dNl5vKGf+JOSoS67nW0r+OdccpzRu9mjs8qEMOBkLGHVNiX3z5l7N7
 V/tc598JgojP282ecaMDIG7oGCP2pyrLVIR47S2GSjjlurhEq4JmcTaXCu/C13BYTbuDXCyCL6Ltf
 5oDC5nOXvHuaRjyb+j5EmDa5ac/VSs//JZszGbHLrgFyNSVZB9cilrvF+uRB8ZTIY0FBoTfnxdIJc
 uCJPd3SA==;
Received: from 91-152-140-238.elisa-laajakaista.fi ([91.152.140.238]
 helo=momiji) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1n7wA0-00006a-6B
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 10:12:44 +0100
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 2b469126
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 09:12:34 +0000 (UTC)
Date: Thu, 13 Jan 2022 11:12:30 +0200
Message-ID: <20220113111230.GB172867@momiji>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20220113105318.GC97860@momiji>
References: <20220113071133.371F0415E6@smtp4.osuosl.org>
 <20220113105318.GC97860@momiji>
MIME-Version: 1.0
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2022-01-12
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
Content-Type: multipart/mixed; boundary="===============7978251108499151761=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7978251108499151761==
Content-Type: multipart/signed; boundary="92lA5jQYS9M5oR7+"; micalg="pgp-sha1"; protocol="application/pgp-signature"


--92lA5jQYS9M5oR7+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVGh1LCAxMyBKYW4gMjAyMiAxMDo1MzoxOCArMDIwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gT24gVGh1LCAxMyBKYW4gMjAyMiAwNzowNjo0
NCArMDAwMCBUaG9tYXMgUGV0YXp6b25pIDx0aG9tYXMucGV0YXp6b25pQGJvb3RsaW4uY29tPiB3
cm90ZToKPiAKPiA+IERldGFpbCBvZiBmYWlsdXJlcyBmb3IgbWFzdGVyCj4gPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gCj4gPiAgICAgYXJjaCAgICAgfCAgICAgICAgICAgICBy
ZWFzb24gICAgICAgICAgICAgfCBPSz8gfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHVybCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgb3JwaD8K
PiA+IC0tLS0tLS0tLS0tLS0rLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0rLS0tLS0r
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tKy0tLS0tLS0KPiA+Cj4gPiBbLi4uXQo+ID4KPiA+ICAg
ICBhcm0gICAgICB8ICAgICAgICAgICBnY3ItMy40MC4wICAgICAgICAgICB8IE5PSyB8IGh0dHA6
Ly9hdXRvYnVpbGQuYnVpbGRyb290Lm5ldC9yZXN1bHRzL2NkZDVjNzIxNTQ0ZDZmMDdjNTFiZTUz
NmU0MTRmYTQ3NGY0YjkwN2IgfCBPUlBICj4gPiAgIHJpc2N2NjQgICAgfCAgICAgICAgICAgZ2Ny
LTMuNDAuMCAgICAgICAgICAgfCBOT0sgfCBodHRwOi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQv
cmVzdWx0cy84Y2VjZDMzZDc3NzJiMTlkNjBmNzBhMDk3ZGNiMTYyM2JiM2VlN2RlIHwgT1JQSAo+
IAo+IEkgcmFuIGludG8gdGhlIHNhbWUgaXNzdWUgd2hpbGUgdHJ5aW5nIG91dCB0aGUgc3dpdGNo
IHRvIE5pbmphIGZvciBDTWFrZQo+IHBhY2thZ2VzLCBiZWNhdXNlIHRyeWluZyB0byBidWlsZCAi
bWlkb3JpIiBwdWxscyBpbiAiZ2NyIiBhcyBhIGRlcGVuZGVuY3kuCj4gCj4gVGhlc2UgYnVpbGQg
ZmFpbHVyZXMgaW4gImdjciIgaGF2ZSBiZWVuIGNhdXNlZCBieSB0aGUgdXBkYXRlIHRvIE1lc29u
IDAuNjE7Cj4gdGhlcmUgaXMgYW4gdXBzdHJlYW0gZml4IGhlcmU6Cj4gCj4gICBodHRwczovL2dp
dGxhYi5nbm9tZS5vcmcvR05PTUUvZ2NyLy0vbWVyZ2VfcmVxdWVzdHMvODEucGF0Y2gKPiAKPiBB
cHBseWluZyB0aGlzIHBhdGNoIGxvY2FsbHkgbWFkZSB0aGUgY29uZmlndXJlIHN0ZXAgY29tcGxl
dGUsIGJ1dCB0aGVuIHRoZQo+IGJ1aWxkIHN0ZXAgcmFuIGludG8gdGhpcyBvdGhlciBpc3N1ZToK
PiAKPiAgIFsxLzExNF0gR2VuZXJhdGluZyBnY2svZ2NrLTEudmFwaSB3aXRoIGEgY3VzdG9tIGNv
bW1hbmQKPiAgIEZBSUxFRDogZ2NrL2djay0xLnZhcGkgCj4gICBbLi4uXQo+ICAgVW5rbm93biBv
cHRpb24gLS1tZXRhZGF0ZGlyPS9ob21lL2FwZXJlei9idWlsZHJvb3Qvb3V0cHV0LWNtYWtlL2J1
aWxkL2djci0zLjQwLjAvZ2NrCj4gICBSdW4gJy9ob21lL2FwZXJlei9idWlsZHJvb3Qvb3V0cHV0
LWNtYWtlL3Blci1wYWNrYWdlL2djci9ob3N0L2Jpbi92YXBpZ2VuLTAuNTIgLS1oZWxwJyB0byBz
ZWUgYSBmdWxsIGxpc3Qgb2YgYXZhaWxhYmxlIGNvbW1hbmQgbGluZSBvcHRpb25zLgo+ICAgbmlu
amE6IGJ1aWxkIHN0b3BwZWQ6IHN1YmNvbW1hbmQgZmFpbGVkLgo+IAo+IEkgYW0gdHJ5aW5nIHRv
IGZpeCB0aGlzIG90aGVyIGlzc3VlIGJlZm9yZSBzdWJtaXR0aW5nIGEgcGF0Y2ggZm9yIHRoZSAi
Z2NyIgo+IHBhY2thZ2UuIElmIHRoaXMgc2Vjb25kIGZhaWx1cmUgcmluZ3MgYSBiZWxsIHRvIGFu
eW9uZSwgSSBhbSBhbGwgZWFyc15XIGV5ZXMuCgpGb3VuZCBpdCwgdGhpcyBzZWNvbmQgb25lIGlz
IGEgdHlwbyBpbiB0aGUgTWVzb24gc291cmNlIGNvZGUsIHRoZSBmb2xsb3dpbmcKdXBzdHJlYW0g
cGF0Y2ggZml4ZXMgdGhlIGlzc3VlIGFscmlnaHQ6CgogIGh0dHBzOi8vZ2l0aHViLmNvbS9tZXNv
bmJ1aWxkL21lc29uL3B1bGwvOTgwNgoKSSdsbCBzdWJtaXQgcGF0Y2hlcyBmb3IgYm90aCBpc3N1
ZXMgbW9tZW50YXJpbHkuCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--92lA5jQYS9M5oR7+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCYd/s/gAKCRCRxVnb5MkS
O5QuAJ9yCe75LzRueh4zzUauBVBJGrcMhQCcC915+DgWR9zIi0p9/nSp9xgMdac=
=1wPy
-----END PGP SIGNATURE-----

--92lA5jQYS9M5oR7+--

--===============7978251108499151761==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7978251108499151761==--
