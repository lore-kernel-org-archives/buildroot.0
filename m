Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D0C636CC
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 09:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C9BF605A1;
	Mon, 20 Feb 2023 09:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C9BF605A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c-3HAcnpc9ws; Mon, 20 Feb 2023 09:29:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 218C6606ED;
	Mon, 20 Feb 2023 09:29:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 218C6606ED
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECD361BF403
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C66CD81BCB
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 09:29:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C66CD81BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6Lqkr-W1_CvZ for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 09:29:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84542813B6
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 84542813B6
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 09:29:49 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.lan) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pU2US-008eZf-Uq; Mon, 20 Feb 2023 10:29:45 +0100
Received: from localhost (momiji.lan [local])
 by momiji.lan (OpenSMTPD) with ESMTPA id 7f0c5d67;
 Mon, 20 Feb 2023 09:29:43 +0000 (UTC)
Date: Mon, 20 Feb 2023 11:29:39 +0200
Message-ID: <20230220112939.GB446957@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20230220090923.2155635-3-thomas.devoogdt@barco.com>
References: <20230220090923.2155635-1-thomas.devoogdt@barco.com>
 <20230220090923.2155635-3-thomas.devoogdt@barco.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dd0SSKSkh0WU37LEdxNmxKDTbpKKf4/ot1anW0oW19k=; b=kDKEFtEKc/UXU6Fnn9Q92JpsUN
 RSkoCCeGf2QUd1LvoDCqw3VpKTxvMrfOQAFMPl7vCU8+rQZIxsPFiz1JARVp+TuCpK2UpipDCu2pS
 wuP9Dl+RU35hH0d+HMAGtGmvgwzuiVBMUy9yvG6pfxHlJoPmb7rEmvK1wMBZyKxzC8FF57uMO4Dcc
 2lcIXjpgc6KbwZChOSOqDRtutuerqPP2zgiZW0t+SMeHARu+PwNKrh+i4CZn+C9P7JQPphY/+z3Rt
 YGnbsrLVJ3g2wy0N1OWfhctdqSor4RhAZlg16DbNTiXqYFzhmUIQZ9Xm1si4d7tHXlx2zei7Au/LR
 5gjF+jXw==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=kDKEFtEK
Subject: Re: [Buildroot] [PATCH v1 3/3] package/webkitgtk: security bump to
 version 2.38.5
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
 Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============9179063920796365557=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============9179063920796365557==
Content-Type: multipart/signed; boundary="NrGCcomJnAmWy9lP"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--NrGCcomJnAmWy9lP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGkgVGhvbWFzLCBhbGwsCgpPbiBNb24sIDIwIEZlYiAyMDIzIDEwOjA5OjIzICswMTAwIFRob21h
cyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0LmNvbT4gd3JvdGU6Cj4gRnJvbTogVGhvbWFzIERl
dm9vZ2R0IDx0aG9tYXMuZGV2b29nZHRAZ21haWwuY29tPgo+IAo+IEJ1Z2ZpeCByZWxlYXNlLCB3
aXRoIG1hbnkgc2VjdXJpdHkgZml4ZXMsIGluY2x1ZGluZyAoYnV0IG5vdCBsaW1pdGVkIHRvKQo+
IGEgcGF0Y2ggZm9yIENWRS0yMDIzLTIzNTI5Lgo+IAo+IFJlbGVhc2Ugbm90ZXM6Cj4gCj4gICBo
dHRwczovL3dlYmtpdGd0ay5vcmcvMjAyMy8wMi8xNS93ZWJraXRndGsyLjM4LjUtcmVsZWFzZWQu
aHRtbAoKSGVoZSwgSSB3YXMganVzdCBhYm91dCB0byBzdWJtaXQgdGhpcyB1cGRhdGUgbXlzZWxm
IGFmdGVyIHNtb2tlLXRlc3RpbmcKYSBidWlsZC4gVGhhbmtzIGZvciBzZW5kaW5nIGl0IDotKQoK
PiBBY2NvbXBhbnlpbmcgc2VjdXJpdHkgYWR2aXNvcnk6Cj4gCj4gICBodHRwczovL3dlYmtpdGd0
ay5vcmcvc2VjdXJpdHkvV1NBLTIwMjMtMDAwMi5odG1sCj4gCj4gQWxzbyByYWlzZSB0aGUgbWlu
aW1hbCBHQ0MgdmVyc2lvbiB0byA4LjMsIHdoaWNoIHdhcyBhbHJlYWR5IHJlcXVpcmVkIHNpbmNl
IHdlYmtpdGd0ay0yLjM2LjQuCj4gU2ltaWxhciB0byBjb21taXQgZWMxZmY4MDJkZjlhMGYxN2Rk
MmI3MzRiYTUzNmE1ZTIwNmFhNWFhNCwKPiB3ZSBkbyBjaGVjayBvbiA+PSBHQ0MgOCwgYmVjYXVz
ZSB3ZSBjYW4ndCBjaGVjayBvbiA+PSBHQ0MgOC4zLgo+IAo+ICAgaHR0cHM6Ly9naXRodWIuY29t
L1dlYktpdC9XZWJLaXQvY29tbWl0L2Y4MTJjNWRiMWZmMjJiY2JlMTA3MGNhNGVkNjEzMDg1Y2Qz
NjQ5OWIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hcy5kZXZvb2dk
dEBnbWFpbC5jb20+CgpBY2tlZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGln
YWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4gICAgICB8IDQg
KystLQo+ICBwYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsuaGFzaCB8IDggKysrKy0tLS0KPiAg
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rICAgfCAyICstCj4gIDMgZmlsZXMgY2hhbmdl
ZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3dlYmtpdGd0ay9Db25maWcuaW4gYi9wYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4KPiBp
bmRleCBkYzVkNzM4ZGFlLi45NzYzNDEwOTNlIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2Uvd2Via2l0
Z3RrL0NvbmZpZy5pbgo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+IEBAIC0x
Niw3ICsxNiw3IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9XRUJLSVRHVEtfQVJDSF9TVVBQT1JUUwo+
ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQKPiAgCWRlcGVuZHMgb24gQlIy
X1BBQ0tBR0VfTElCR1BHX0VSUk9SX0FSQ0hfU1VQUE9SVFMgIyBsaWJnY3J5cHQKPiAgCj4gLWNv
bW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFuZCBhIHRvb2xjaGFpbiB3LyBDKyssIHdj
aGFyLCB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA3LCBob3N0IGdjYyA+PSA0Ljki
Cj4gK2NvbW1lbnQgIndlYmtpdGd0ayBuZWVkcyBsaWJndGszIGFuZCBhIHRvb2xjaGFpbiB3LyBD
KyssIHdjaGFyLCB0aHJlYWRzLCBkeW5hbWljIGxpYnJhcnksIGdjYyA+PSA4LCBob3N0IGdjYyA+
PSA0LjkiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dFQktJVEdUS19BUkNIX1NVUFBPUlRT
Cj4gIAlkZXBlbmRzIG9uICFCUjJfQklORk1UX0ZMQVQKPiAgCWRlcGVuZHMgb24gIUJSMl9QQUNL
QUdFX0xJQkdUSzMgfHwgIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBcCj4gQEAgLTMyLDcgKzMy
LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1dFQktJVEdUSwo+ICAJZGVwZW5kcyBvbiBCUjJfSE9T
VF9HQ0NfQVRfTEVBU1RfNF85ICMgaWN1LCBob3N0LXJ1YnkKPiAgCWRlcGVuZHMgb24gQlIyX0lO
U1RBTExfTElCU1REQ1BQCj4gIAlkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMg
IyB3YXlsYW5kLCBpY3UsIGxpYnNvdXAKPiAtCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9HQ0Nf
QVRfTEVBU1RfNwo+ICsJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF84Cj4g
IAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBpY3UsIGxpYnNvdXAKPiAgCWRlcGVuZHMgb24g
QlIyX1BBQ0tBR0VfTElCR1RLMwo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9XRUJLSVRHVEtf
QVJDSF9TVVBQT1JUUwo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
aGFzaCBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gaW5kZXggMzRmZDE5ZDNk
ZS4uYzc3MTI5N2I1YSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRndGsu
aGFzaAo+ICsrKyBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoCj4gQEAgLTEsNyAr
MSw3IEBACj4gLSMgRnJvbSBodHRwczovL3dlYmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3Rr
LTIuMzguNC50YXIueHouc3Vtcwo+IC1tZDUgIDFjOWNhODNhMGFkN2U0Y2E5ZTkzMzA5NDU3MmNi
N2Q5ICB3ZWJraXRndGstMi4zOC40LnRhci54ego+IC1zaGExICAzOGI0N2RmMmJlOWJmYjk3ZDY4
ZmNlOGM3ZmEyODE5OTY2YTc5MDM2ICB3ZWJraXRndGstMi4zOC40LnRhci54ego+IC1zaGEyNTYg
IDRmNDdlYTI5YTJkNGQ1ZjE1ZWVmM2RjOWUyZDZjNmYwNjdlOGRlODYzYTNmNjQ0NTVlMWNjZjk2
OTNjYzFkMzYgIHdlYmtpdGd0ay0yLjM4LjQudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL3dlYmtp
dGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuMzguNS50YXIueHouc3Vtcwo+ICttZDUgIGRl
MDVkMzE0YTNlY2I1ZmIzODM1ZTRkODRmOGY0NjZkICB3ZWJraXRndGstMi4zOC41LnRhci54ego+
ICtzaGExICAxNzc0MzkwYzYyOGJiM2E1MjRkNGVkNzZmMTFkZTRhODc4MDc4ZGI2ICB3ZWJraXRn
dGstMi4zOC41LnRhci54ego+ICtzaGEyNTYgIDQwYzIwYzQzMDIyMjc0ZGY1ODkzZjIyYjEwNTRm
YTg5NGMzZWVhMDU3Mzg5YmIwOGFlZTA4YzViMGJiMGMxYTcgIHdlYmtpdGd0ay0yLjM4LjUudGFy
Lnh6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxlczoKPiAgc2hhMjU2ICAwYjVkM2E3
Y2MzMjU5NDI1NjczNzNiMGVjZDc1N2QwN2MxMzJlMGViZDdjOTdiZmM2M2Y3ZTFhNzYwOTRlZGI0
ICBTb3VyY2UvV2ViQ29yZS9MSUNFTlNFLUFQUExFCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Vi
a2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tawo+IGlu
ZGV4IGE2OTc0ZGI5MjYuLjMyNjNmN2ZlYTAgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRn
dGsvd2Via2l0Z3RrLm1rCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4g
QEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMKPiAgCj4gLVdF
QktJVEdUS19WRVJTSU9OID0gMi4zOC40Cj4gK1dFQktJVEdUS19WRVJTSU9OID0gMi4zOC41Cj4g
IFdFQktJVEdUS19TSVRFID0gaHR0cHM6Ly93d3cud2Via2l0Z3RrLm9yZy9yZWxlYXNlcwo+ICBX
RUJLSVRHVEtfU09VUkNFID0gd2Via2l0Z3RrLSQoV0VCS0lUR1RLX1ZFUlNJT04pLnRhci54ego+
ICBXRUJLSVRHVEtfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gLS0gCj4gMi4zOS4yCj4gCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKPiAKCkNoZWVycywK4oCUQWRy
acOhbgo=

--NrGCcomJnAmWy9lP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCY/M9gwAKCRCRxVnb5MkS
O3JmAJ9VVb9TLTWc0gertZ4xMRrGfKIS0gCfZOwXw+jnuXQCEIHc4fNSuACTrH4=
=8yiW
-----END PGP SIGNATURE-----

--NrGCcomJnAmWy9lP--

--===============9179063920796365557==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9179063920796365557==--
