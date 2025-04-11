Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DFAC36010
	for <buildroot@archiver.kernel.org>; Fri, 11 Apr 2025 14:32:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3ADE84923;
	Fri, 11 Apr 2025 14:32:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A8n1QsQsaV3z; Fri, 11 Apr 2025 14:32:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF4C58476F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF4C58476F;
	Fri, 11 Apr 2025 14:32:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 48CF0138
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:32:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37FD6847E6
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:32:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v67mR8UQQXOz for <buildroot@buildroot.org>;
 Fri, 11 Apr 2025 14:32:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=178.60.130.6;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C589A84757
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C589A84757
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C589A84757
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:32:07 +0000 (UTC)
Received: from [91.116.116.48] (helo=momiji)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1u3FQK-00FA1t-2Y
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 16:32:04 +0200
Received: from localhost (momiji [local])
 by momiji (OpenSMTPD) with ESMTPA id 973131da
 for <buildroot@buildroot.org>; Fri, 11 Apr 2025 14:32:00 +0000 (UTC)
Date: Fri, 11 Apr 2025 17:32:00 +0300
Message-ID: <20250411173200.GB2424943@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20250320172543.2490556-1-aperez@igalia.com>
References: <20250320172543.2490556-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rEj+q595ES9suxFbvBfK07nAxBhqDvjMtqG/pP12Qpo=; b=rM6wkrXzZ4efPpJrluoALek9KS
 PjNEIM6mci5CbVUjoHwOGKlX5mEGhS+BWNsFPJWX1HA/m2+YYpKtE7Q4xvA5ZlyE7y1bZO9I8wsss
 OlkfLijuBw2iFLCHAK3wN1II2fdIi0DB2JY0bFHDFCY6p+YADv7hb9Ng3LyWs10TfcetZoo8jP7BN
 /IJXPI7Xq5mBeN+U0OEGG24UPZbwIoZ9O78TDU65Ijt71+GAhi4VZXleQteoWjqpYo+0M12/+hpm3
 X9GMOazq1+VxAzPYH9SFL7aEdEJfgHZhKtIBDc0DuxAfVdG52sgNSWauWQtt2NWB02v3Y4I8PSWbR
 9u05+g1g==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=rM6wkrXz
Subject: Re: [Buildroot] [PATCH 1/1] package/libmanette: bump to version
 0.2.11
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
Content-Type: multipart/mixed; boundary="===============2699216931191992871=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2699216931191992871==
Content-Type: multipart/signed; boundary="4t/DXLPtK71lBS1m"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--4t/DXLPtK71lBS1m
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8sCgpPbiBUaHUsIDIwIE1hciAyMDI1IDE5OjI1OjQyICswMjAwIEFkcmlhbiBQZXJleiBk
ZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBCdWdmaXggcmVsZWFzZSB3aXRo
IGEgbnVtYmVyIG9mIGZpeGVzLCBpdCBhbHNvIGFkZHMgc3VwcG9ydCBmb3IgdGhlCj4gU3RlYW0g
RGVjayBnYW1lcGFkLiBSZWxlYXNlIG5vdGVzOgo+IAo+ICAgaHR0cHM6Ly9naXRsYWIuZ25vbWUu
b3JnL0dOT01FL2xpYm1hbmV0dGUvLS9ibG9iLzFhY2I0Njk0M2Q0ZDk3MGFiZTU5NGI2MzRhMDU4
YzkzYjMwMjEyNTgvTkVXUwo+IAo+IFRoaXMgdmVyc2lvbiBpbnRyb2R1Y2VzIGEgZGVwZW5kZW5j
eSBvbiB0aGUgaGlkYXBpIHBhY2thZ2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWRyaWFuIFBlcmV6
IGRlIENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+CgpCbGlwISBBbnkgY2hhbmNlIG9mIGdldHRp
bmcgdGhpcyBtZXJnZWQ/CgpUaGFua3MgaW4gYWR2YW5jZSwKLUFkcmlhbgoKPiAtLS0KPiAgcGFj
a2FnZS9saWJtYW5ldHRlL0NvbmZpZy5pbiAgICAgICB8IDcgKysrKystLQo+ICBwYWNrYWdlL2xp
Ym1hbmV0dGUvbGlibWFuZXR0ZS5oYXNoIHwgNCArKy0tCj4gIHBhY2thZ2UvbGlibWFuZXR0ZS9s
aWJtYW5ldHRlLm1rICAgfCAzICsrLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJtYW5ldHRlL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvbGlibWFuZXR0ZS9Db25maWcuaW4KPiBpbmRleCAzMWZmZjE1Mjg2
Li5jYmY2YTUwODViIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbGlibWFuZXR0ZS9Db25maWcuaW4K
PiArKysgYi9wYWNrYWdlL2xpYm1hbmV0dGUvQ29uZmlnLmluCj4gQEAgLTIsOCArMiwxMCBAQCBj
b25maWcgQlIyX1BBQ0tBR0VfTElCTUFORVRURQo+ICAJYm9vbCAibGlibWFuZXR0ZSIKPiAgCWRl
cGVuZHMgb24gQlIyX1VTRV9NTVUgIyBsaWJnbGliMgo+ICAJZGVwZW5kcyBvbiBCUjJfVVNFX1dD
SEFSICMgbGliZ2xpYjIgLT4gZ2V0dGV4dAo+ICsJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9IQVNf
VURFVgo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19USFJFQURTICMgbGliZ2xpYjIK
PiAgCWRlcGVuZHMgb24gQlIyX1RPT0xDSEFJTl9IRUFERVJTX0FUX0xFQVNUXzRfMTYKPiArCXNl
bGVjdCBCUjJfUEFDS0FHRV9ISURBUEkKPiAgCXNlbGVjdCBCUjJfUEFDS0FHRV9MSUJFVkRFVgo+
ICAJc2VsZWN0IEJSMl9QQUNLQUdFX0xJQkdMSUIyCj4gIAloZWxwCj4gQEAgLTExLDcgKzEzLDgg
QEAgY29uZmlnIEJSMl9QQUNLQUdFX0xJQk1BTkVUVEUKPiAgCj4gIAkgIGh0dHBzOi8vZ2l0bGFi
Lmdub21lLm9yZy9HTk9NRS9saWJtYW5ldHRlCj4gIAo+IC1jb21tZW50ICJsaWJtYW5ldHRlIG5l
ZWRzIGEgdG9vbGNoYWluIHcvIHdjaGFyLCB0aHJlYWRzLCBoZWFkZXJzID49IDQuMTYiCj4gK2Nv
bW1lbnQgImxpYm1hbmV0dGUgbmVlZHMgYSB0b29sY2hhaW4gdy8gd2NoYXIsIHRocmVhZHMsIGhl
YWRlcnMgPj0gNC4xNiwgdWRldiIKPiAgCWRlcGVuZHMgb24gQlIyX1VTRV9NTVUKPiAgCWRlcGVu
ZHMgb24gIUJSMl9VU0VfV0NIQVIgfHwgIUJSMl9UT09MQ0hBSU5fSEFTX1RIUkVBRFMgfHwgXAo+
IC0JCSFCUjJfVE9PTENIQUlOX0hFQURFUlNfQVRfTEVBU1RfNF8xNgo+ICsJCSFCUjJfVE9PTENI
QUlOX0hFQURFUlNfQVRfTEVBU1RfNF8xNiB8fCBcCj4gKwkJIUJSMl9QQUNLQUdFX0hBU19VREVW
Cj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLmhhc2ggYi9wYWNr
YWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5oYXNoCj4gaW5kZXggMzY1M2Q2NzJkZS4uMGVjNjA3
N2MyYyAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL2xpYm1hbmV0dGUvbGlibWFuZXR0ZS5oYXNoCj4g
KysrIGIvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0dGUuaGFzaAo+IEBAIC0xLDUgKzEsNSBA
QAo+IC0jIEZyb20gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJtYW5ldHRl
LzAuMi9saWJtYW5ldHRlLTAuMi45LnNoYTI1NnN1bQo+IC1zaGEyNTYgIDI5MzY2YmU1NDUyZjYw
YTc0YzY1ZmM2NGZmZTJkNzRlZGRkNGU2ZTY4MjRjMmNlZmE1NjdhNDNiZDkyYjY4OGYgIGxpYm1h
bmV0dGUtMC4yLjkudGFyLnh6Cj4gKyMgRnJvbSBodHRwczovL2Rvd25sb2FkLmdub21lLm9yZy9z
b3VyY2VzL2xpYm1hbmV0dGUvMC4yL2xpYm1hbmV0dGUtMC4yLjExLnNoYTI1NnN1bQo+ICtzaGEy
NTYgIGI4MTJiOTRlMDg2MzJiYTYyYTMwOTYwYThkZTI5MjE3YTczYTJmZmY1ZGEyZjEyYWNjOGE1
ZDQ3NzFhNDlhNzAgIGxpYm1hbmV0dGUtMC4yLjExLnRhci54ego+ICAKPiAgIyBMb2NhbGx5IGNh
bGN1bGF0ZWQKPiAgc2hhMjU2ICBkYzYyNjUyMGRjZDUzYTIyZjcyN2FmM2VlNDJjNzcwZTU2Yzk3
YTY0ZmUzYWRiMDYzNzk5ZDhhYjAzMmZlNTUxICBDT1BZSU5HCj4gZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLm1rIGIvcGFja2FnZS9saWJtYW5ldHRlL2xpYm1hbmV0
dGUubWsKPiBpbmRleCA3ODcyYzhiNzk2Li40NGJlZWY4MzZmIDEwMDY0NAo+IC0tLSBhL3BhY2th
Z2UvbGlibWFuZXR0ZS9saWJtYW5ldHRlLm1rCj4gKysrIGIvcGFja2FnZS9saWJtYW5ldHRlL2xp
Ym1hbmV0dGUubWsKPiBAQCAtNSw3ICs1LDcgQEAKPiAgIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMK
PiAgCj4gIExJQk1BTkVUVEVfVkVSU0lPTl9NQUpPUiA9IDAuMgo+IC1MSUJNQU5FVFRFX1ZFUlNJ
T04gPSAkKExJQk1BTkVUVEVfVkVSU0lPTl9NQUpPUikuOQo+ICtMSUJNQU5FVFRFX1ZFUlNJT04g
PSAkKExJQk1BTkVUVEVfVkVSU0lPTl9NQUpPUikuMTEKPiAgTElCTUFORVRURV9TT1VSQ0UgPSBs
aWJtYW5ldHRlLSQoTElCTUFORVRURV9WRVJTSU9OKS50YXIueHoKPiAgTElCTUFORVRURV9TSVRF
ID0gaHR0cHM6Ly9kb3dubG9hZC5nbm9tZS5vcmcvc291cmNlcy9saWJtYW5ldHRlLyQoTElCTUFO
RVRURV9WRVJTSU9OX01BSk9SKQo+ICBMSUJNQU5FVFRFX0xJQ0VOU0UgPSBMR1BMLTIuMSsKPiBA
QCAtMTQsNiArMTQsNyBAQCBMSUJNQU5FVFRFX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+ICBMSUJN
QU5FVFRFX0RFUEVOREVOQ0lFUyA9IFwKPiAgCWxpYmV2ZGV2IFwKPiAgCWxpYmdsaWIyIFwKPiAr
CWhpZGFwaSBcCj4gIAkkKFRBUkdFVF9OTFNfREVQRU5ERU5DSUVTKQo+ICAKPiAgTElCTUFORVRU
RV9MREZMQUdTID0gJChUQVJHRVRfTERGTEFHUykgJChUQVJHRVRfTkxTX0xJQlMpCj4gLS0gCj4g
Mi40OS4wCj4gCj4gCgpDaGVlcnMsCuKAlEFkcmnDoW4K

--4t/DXLPtK71lBS1m
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZ/kn4AAKCRCRxVnb5MkS
OwUnAJ4tSb/Hc7HaOpO110osteoSakW5bQCdF53qfVPHfgx3ODey/4HWn5U/9Oc=
=CZHz
-----END PGP SIGNATURE-----

--4t/DXLPtK71lBS1m--

--===============2699216931191992871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2699216931191992871==--
