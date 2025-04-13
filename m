Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6323BC3601E
	for <buildroot@archiver.kernel.org>; Sun, 13 Apr 2025 22:51:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1D5460C0A;
	Sun, 13 Apr 2025 22:51:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fTwU9nndbwYt; Sun, 13 Apr 2025 22:51:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7638260A99
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7638260A99;
	Sun, 13 Apr 2025 22:51:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A876E250
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 22:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E6304023C
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 22:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g08Inm6EafNP for <buildroot@buildroot.org>;
 Sun, 13 Apr 2025 22:51:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D72A64029F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D72A64029F
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D72A64029F
 for <buildroot@buildroot.org>; Sun, 13 Apr 2025 22:51:29 +0000 (UTC)
Received: from [91.116.116.48] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u46Af-00G7oT-50; Mon, 14 Apr 2025 00:51:25 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 716122bd;
 Sun, 13 Apr 2025 22:51:23 +0000 (UTC)
Date: Mon, 14 Apr 2025 01:51:18 +0300
Message-ID: <20250414015118.GK2424943@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
Cc: buildroot@buildroot.org, Thomas Devoogdt <thomas@devoogdt.com>
In-Reply-To: <20250407100446.400994-1-thomas@devoogdt.com>
References: <20250407100446.400994-1-thomas@devoogdt.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0qB2VeO6Oq9Zf9RQRavXCNLZXkkBpZMBVAwVrU5ricU=; b=gz/KF/fbuuTOa+nLDLrC0GNZBj
 LCXnBLOcDLWvMs/gZ0k+RM5FAYyHioI7OuAL7W9Y2CN0WirSf/e3637Ixh7JLbBoh3Ur4GRgc2gyJ
 tHvOyO0QF3XJZGovjFtQxvhqKK8XgKGgoZBWsoB4fb7IijQmZTwu/m8KwCDTbO1EEwRXMJX8QauYs
 2Q55HZEg9joiwKYPNQkpznTs+2e3jRN8Qf+Mzuqy2IlBejEMxsW0QImQT5WySSsjDAfut6R0yYpp3
 /akCMEz635/+wbIONTd9ij7/DGv3YAnG0VJosuBQP/rhPeEsOV6akk8Sgq8orK3d3AWqvyY/QxP7p
 1ikqDr0g==;
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=gz/KF/fb
Subject: Re: [Buildroot] [PATCH v1] package/webkitgtk: bump to 2.48.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4341958264595929033=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4341958264595929033==
Content-Type: multipart/signed; boundary="erS4nCyZ36rOZcA4"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--erS4nCyZ36rOZcA4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAwNyBBcHIgMjAyNSAxMjowNDo0NiArMDIwMCBUaG9tYXMgRGV2b29nZHQgPHRob21h
c0BkZXZvb2dkdC5jb20+IHdyb3RlOgo+IFRoaXMgYnVtcHMgd2Via2l0IHRvIHRoZSAyLjQ4IHN0
YWJsZSBzZXJpZXMuCj4gCj4gTmV3czoKPiAtIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy8yMDI1LzAz
LzE0L3dlYmtpdGd0azIuNDguMC1yZWxlYXNlZC5odG1sCj4gLSBodHRwczovL3dlYmtpdGd0ay5v
cmcvMjAyNS8wNC8wMi93ZWJraXRndGsyLjQ4LjEtcmVsZWFzZWQuaHRtbAo+IAo+IEFuZCBicmlu
Z3Mgc29tZSBzZWN1cml0eSBmaXhlczoKPiAtIGh0dHBzOi8vd2Via2l0Z3RrLm9yZy9zZWN1cml0
eS9XU0EtMjAyNS0wMDAyLmh0bWwKPiAKPiBBbHNvLAo+IAo+IC0gUmFpc2UgdGhlIG1pbmltYWwg
R0NDIHJlcXVpcmVtZW50IFsxXSwKPiB3aGljaCBzaG91bGQgaGF2ZSBiZWVuIHJhaXNlZCBieSB0
aGUgMi40Ni40IGJ1bXAuCj4gCj4gLSBIYW5kbGUgU1BFRUNIX1NZTlRIRVNJUywgd2hpY2ggaGFz
IGJlZW4gZW5hYmxlZAo+IGJ5IGRlZmF1bHQgaW4gY29tbWl0IFsyXS4KPiAKPiBbMV0gaHR0cHM6
Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQvY29tbWl0LzY4MmFjNGJhNzRjNTNkMGNkNDg4Yzdh
NTk1MDk2MjI0YTlhYmIwMzYKPiBbMl0gaHR0cHM6Ly9naXRodWIuY29tL1dlYktpdC9XZWJLaXQv
Y29tbWl0LzEwMzgxYThkZTkzODAyNGYzMTkzNTE4NGFmNDcwY2NiY2UwYjIyZDkKPiAKPiBTaWdu
ZWQtb2ZmLWJ5OiBUaG9tYXMgRGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+CgpSZXZpZXdl
ZC1ieTogQWRyaWFuIFBlcmV6IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+
ICBwYWNrYWdlL3dlYmtpdGd0ay9Db25maWcuaW4gICAgICB8IDYgKysrLS0tCj4gIHBhY2thZ2Uv
d2Via2l0Z3RrL3dlYmtpdGd0ay5oYXNoIHwgNiArKystLS0KPiAgcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLm1rICAgfCA5ICsrKysrKysrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDE0IGluc2Vy
dGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvd2Via2l0
Z3RrL0NvbmZpZy5pbiBiL3BhY2thZ2Uvd2Via2l0Z3RrL0NvbmZpZy5pbgo+IGluZGV4IDM1OTQy
OTkzMTQuLmJjYjRiMTJmYTMgMTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS93ZWJraXRndGsvQ29uZmln
LmluCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsvQ29uZmlnLmluCj4gQEAgLTE2LDEyICsxNiwx
MiBAQCBjb25maWcgQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FSQ0hfU1VQUE9SVFMKPiAgCWRlcGVu
ZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfU1lOQ180Cj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdF
X0xJQkdQR19FUlJPUl9BUkNIX1NVUFBPUlRTICMgbGliZ2NyeXB0Cj4gIAo+IC1jb21tZW50ICJ3
ZWJraXRndGsgbmVlZHMgbGliZ3RrMyBhbmQgYSB0b29sY2hhaW4gdy8gQysrLCB3Y2hhciwgTlBU
TCwgZHluYW1pYyBsaWJyYXJ5LCBnY2MgPj0gMTAsIGhvc3QgZ2NjID49IDQuOSIKPiArY29tbWVu
dCAid2Via2l0Z3RrIG5lZWRzIGxpYmd0azMgYW5kIGEgdG9vbGNoYWluIHcvIEMrKywgd2NoYXIs
IE5QVEwsIGR5bmFtaWMgbGlicmFyeSwgZ2NjID49IDExLCBob3N0IGdjYyA+PSA0LjkiCj4gIAlk
ZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dFQktJVEdUS19BUkNIX1NVUFBPUlRTCj4gIAlkZXBlbmRz
IG9uICFCUjJfQklORk1UX0ZMQVQKPiAgCWRlcGVuZHMgb24gIUJSMl9QQUNLQUdFX0xJQkdUSzMg
fHwgIUJSMl9JTlNUQUxMX0xJQlNURENQUCB8fCBcCj4gIAkJIUJSMl9VU0VfV0NIQVIgfHwgIUJS
Ml9UT09MQ0hBSU5fSEFTX1RIUkVBRFNfTlBUTCB8fCBCUjJfU1RBVElDX0xJQlMgfHwgXAo+IC0J
CSFCUjJfVE9PTENIQUlOX0dDQ19BVF9MRUFTVF8xMCB8fCBcCj4gKwkJIUJSMl9UT09MQ0hBSU5f
R0NDX0FUX0xFQVNUXzExIHx8IFwKPiAgCQkhQlIyX0hPU1RfR0NDX0FUX0xFQVNUXzRfOQo+ICAJ
ZGVwZW5kcyBvbiBCUjJfVVNFX01NVQo+ICAKPiBAQCAtMzMsNyArMzMsNyBAQCBjb25maWcgQlIy
X1BBQ0tBR0VfV0VCS0lUR1RLCj4gIAlkZXBlbmRzIG9uIEJSMl9IT1NUX0dDQ19BVF9MRUFTVF80
XzkgIyBpY3UsIGhvc3QtcnVieQo+ICAJZGVwZW5kcyBvbiBCUjJfSU5TVEFMTF9MSUJTVERDUFAK
PiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IQVNfVEhSRUFEU19OUFRMCj4gLQlkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEwCj4gKwlkZXBlbmRzIG9uIEJSMl9UT09M
Q0hBSU5fR0NDX0FUX0xFQVNUXzExCj4gIAlkZXBlbmRzIG9uIEJSMl9VU0VfV0NIQVIgIyBpY3Us
IGxpYnNvdXAzCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xJQkdUSzMKPiAgCWRlcGVuZHMg
b24gQlIyX1BBQ0tBR0VfV0VCS0lUR1RLX0FSQ0hfU1VQUE9SVFMKPiBkaWZmIC0tZ2l0IGEvcGFj
a2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2ggYi9wYWNrYWdlL3dlYmtpdGd0ay93ZWJraXRn
dGsuaGFzaAo+IGluZGV4IDk2MTAwZDRjN2MuLmZkOTQyMGJhZDkgMTAwNjQ0Cj4gLS0tIGEvcGFj
a2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLmhhc2gKPiArKysgYi9wYWNrYWdlL3dlYmtpdGd0ay93
ZWJraXRndGsuaGFzaAo+IEBAIC0xLDYgKzEsNiBAQAo+IC0jIEZyb20gaHR0cHM6Ly93d3cud2Vi
a2l0Z3RrLm9yZy9yZWxlYXNlcy93ZWJraXRndGstMi40Ni40LnRhci54ei5zdW1zCj4gLXNoYTEg
IDEwZDRkYmQyMjJhY2VjMzBiMWQyMGVlM2I3ZDAyYzBkOTcyN2M1YTkgIHdlYmtpdGd0ay0yLjQ2
LjQudGFyLnh6Cj4gLXNoYTI1NiAgMGVmZjVmMGFiMGEyODcyZWM4N2RmNjJiYzMyZTMyODljOGFm
NjI1NzE2YWM3MWU5NGIyOThkNzRlMDM3NDE3NiAgd2Via2l0Z3RrLTIuNDYuNC50YXIueHoKPiAr
IyBGcm9tIGh0dHBzOi8vd3d3LndlYmtpdGd0ay5vcmcvcmVsZWFzZXMvd2Via2l0Z3RrLTIuNDgu
MS50YXIueHouc3Vtcwo+ICtzaGExICBmNzkzOWY5MjBmOTJmNmIxMzk1Yjg1NzNmMDY5ZDNmYjlj
MDg1YjNmICB3ZWJraXRndGstMi40OC4xLnRhci54ego+ICtzaGEyNTYgIDk4ZWZkZjIxYzRjZGNh
MGZlMGI3M2FiNWE4Y2I1MjA5M2I1YWE1MmQ5YjFiMDE2YTkzZjcxZGJmYTFlYjI1OGYgIHdlYmtp
dGd0ay0yLjQ4LjEudGFyLnh6Cj4gIAo+ICAjIEhhc2hlcyBmb3IgbGljZW5zZSBmaWxlczoKPiAg
c2hhMjU2ICAwYjVkM2E3Y2MzMjU5NDI1NjczNzNiMGVjZDc1N2QwN2MxMzJlMGViZDdjOTdiZmM2
M2Y3ZTFhNzYwOTRlZGI0ICBTb3VyY2UvV2ViQ29yZS9MSUNFTlNFLUFQUExFCj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvd2Via2l0Z3RrL3dlYmtpdGd0ay5tayBiL3BhY2thZ2Uvd2Via2l0Z3RrL3dl
YmtpdGd0ay5tawo+IGluZGV4IGVjNjNkMDkzYjcuLjJjMjJiZmI2MDcgMTAwNjQ0Cj4gLS0tIGEv
cGFja2FnZS93ZWJraXRndGsvd2Via2l0Z3RrLm1rCj4gKysrIGIvcGFja2FnZS93ZWJraXRndGsv
d2Via2l0Z3RrLm1rCj4gQEAgLTQsNyArNCw3IEBACj4gICMKPiAgIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMKPiAgCj4gLVdFQktJVEdUS19WRVJTSU9OID0gMi40Ni40Cj4gK1dFQktJVEdUS19WRVJT
SU9OID0gMi40OC4xCj4gIFdFQktJVEdUS19TSVRFID0gaHR0cHM6Ly93d3cud2Via2l0Z3RrLm9y
Zy9yZWxlYXNlcwo+ICBXRUJLSVRHVEtfU09VUkNFID0gd2Via2l0Z3RrLSQoV0VCS0lUR1RLX1ZF
UlNJT04pLnRhci54ego+ICBXRUJLSVRHVEtfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4gQEAgLTcz
LDYgKzczLDEzIEBAIGVsc2UKPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAtREVOQUJMRV9NSU5J
QlJPV1NFUj1PRkYKPiAgZW5kaWYKPiAgCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfRkxJVEUpLHkp
Cj4gK1dFQktJVEdUS19DT05GX09QVFMgKz0gLURFTkFCTEVfU1BFRUNIX1NZTlRIRVNJUz1PTgo+
ICtXRUJLSVRHVEtfREVQRU5ERU5DSUVTICs9IGZsaXRlCj4gK2Vsc2UKPiArV0VCS0lUR1RLX0NP
TkZfT1BUUyArPSAtREVOQUJMRV9TUEVFQ0hfU1lOVEhFU0lTPU9GRgo+ICtlbmRpZgo+ICsKPiAg
aWZlcSAoJChCUjJfUEFDS0FHRV9MQ01TMikseSkKPiAgV0VCS0lUR1RLX0NPTkZfT1BUUyArPSAt
RFVTRV9MQ01TPU9OCj4gIFdFQktJVEdUS19ERVBFTkRFTkNJRVMgKz0gbGNtczIKPiAtLSAKPiAy
LjQzLjAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+IAoK
Q2hlZXJzLArigJRBZHJpw6FuCg==

--erS4nCyZ36rOZcA4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZ/w/5gAKCRCRxVnb5MkS
O37bAJ9gtSgDXPtj7cf+lgjKMBPCoupNDwCfTI96wC8qfKLMjOclAaaBLSLJDiA=
=Gq3F
-----END PGP SIGNATURE-----

--erS4nCyZ36rOZcA4--

--===============4341958264595929033==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4341958264595929033==--
