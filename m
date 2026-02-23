Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3180EA4FBA
	for <buildroot@archiver.kernel.org>; Mon, 23 Feb 2026 13:12:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7140B8425D;
	Mon, 23 Feb 2026 13:12:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3wcktmEGzBQr; Mon, 23 Feb 2026 13:12:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 811A184202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771852364;
	bh=4cjIUnMkLt4YGPXyIed6aI+S1IhXL9y/OdZ9OYVVUk0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=UXc6TY0XXWKU29TfYkWRcL96O+ssGpeXp+gjzuWFlw7KuPBwCDsBnOEiqMXlbkko2
	 b1zJYaMHWYwVhePRGKuUDYKmY/LsKkhk0RjMh1WKb19P+N15rm4S2NaFZZ0NUVzWmU
	 WEqsVD+o6nVUwxOujyzz3lFsHkpewM9idRZw5nZHakcnuncK4BrbTbDkOfc0AyTciO
	 +h+MXh2GD2BgMxmQPcY542r+NN+kP/iegNy4eoNb+qsBncbf81VVYnBwmnRVaYMSfI
	 RkKyiCg+2D27Ys87+b5ExPDIlq+qchjCsWEQljHHn5+Xi13MpMnxanwgUFzDF2WtLM
	 p0Uk0zu8m25OQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 811A184202;
	Mon, 23 Feb 2026 13:12:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 943DA249
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 79D6384202
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QMEU-mUz6sKT for <buildroot@buildroot.org>;
 Mon, 23 Feb 2026 13:12:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D274684201
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D274684201
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D274684201
 for <buildroot@buildroot.org>; Mon, 23 Feb 2026 13:12:38 +0000 (UTC)
Received: from 91-154-227-245.elisa-laajakaista.fi ([91.154.227.245]
 helo=kodama) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1vuVjj-004EvM-FK; Mon, 23 Feb 2026 14:12:31 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id ca51fd1a;
 Mon, 23 Feb 2026 13:12:30 +0000 (UTC)
Date: Mon, 23 Feb 2026 15:12:30 +0200
Message-ID: <20260223151230.GD2359969@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Bernd Kuhls <bernd@kuhls.net>,
 Romain Naour <romain.naour@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
In-Reply-To: <20260218063123.546067-1-james.hilliard1@gmail.com>
References: <20260218063123.546067-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LBIEfjtfVjXcdK2y77JRyAyri07i9YcI+uGMEoqvloA=; b=nbLz4k8h/AqXiOIBeM6WqiCuyq
 JZGvc/gPcB0Ph6F3DNkDAEw/KPZ95C4BCiwSGIQoXq/RHYJOeGgCSQ0M4deXsoBa+GY23MMHowj+w
 B8KbttcNt2gPE5EjXE/5CLJj9XYJ1cPEN+iN8/98A1BRQSiR8cfTZPLsywdE+osKoZ6Eix7l3cEVo
 vSpLlKaiy/2I/D42GQgYq3yJZK1l4guabKsq39s7pt8mcWbxGWS9p4qwp75ndCMFwcu19eAP97i2E
 yUZnxj23+dAVivK9s/jDHuibuPRbDEyP2/MouFN3SggQvjVyUY8PwVCxI/Py7qCafT8XsvfR5kvHR
 OiHQDHNA==;
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=igalia.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=nbLz4k8h
Subject: Re: [Buildroot] [PATCH 1/2] package/mesa3d: add
 EGL_WL_bind_wayland_display support
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
Content-Type: multipart/mixed; boundary="===============6496128227512061237=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6496128227512061237==
Content-Type: multipart/signed; boundary="KLrymaXyER2JKP0W"; micalg="pgp-sha256"; protocol="application/pgp-signature"


--KLrymaXyER2JKP0W
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gVHVlLCAxNyBGZWIgMjAyNiAyMzozMToyMiAtMDcwMCBKYW1lcyBIaWxsaWFyZCA8amFtZXMu
aGlsbGlhcmQxQGdtYWlsLmNvbT4gd3JvdGU6Cj4gVGhpcyBmZWF0dXJlIHdhcyBtYWRlIG9wdGlv
bmFsIGluIG1lc2EzZCAyNS4yLjAgYXMgaXQgaXMgZGVwcmVjYXRlZCwKPiBob3dldmVyIHNvbWUg
cGFja2FnZXMgc3RpbGwgcmVxdWlyZSBpdCBzbyBsZXRzIGFkZCBhIG5ldyBjb25maWcKPiBvcHRp
b24gdGhhdCB0aG9zZSBwYWNrYWdlcyBjYW4gc2VsZWN0IHVudGlsIHRoZXkgbm8gbG9uZ2VyIHJl
cXVpcmUKPiB0aGlzIGZlYXR1cmUuCj4gCj4gU2lnbmVkLW9mZi1ieTogSmFtZXMgSGlsbGlhcmQg
PGphbWVzLmhpbGxpYXJkMUBnbWFpbC5jb20+CgpSZXZpZXdlZC1ieTogQWRyaWFuIFBlcmV6IGRl
IENhc3RybyA8YXBlcmV6QGlnYWxpYS5jb20+Cgo+IC0tLQo+ICBwYWNrYWdlL21lc2EzZC9Db25m
aWcuaW4gfCA2ICsrKysrKwo+ICBwYWNrYWdlL21lc2EzZC9tZXNhM2QubWsgfCAzICsrKwo+ICAy
IGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdl
L21lc2EzZC9Db25maWcuaW4gYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPiBpbmRleCBlMWZh
ZWE5NWQ1Li44YTc4MTFiNmE1IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5p
bgo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbgo+IEBAIC01MCw2ICs1MCwxMiBAQCBj
b21tZW50ICJsbHZtIHN1cHBvcnQgbmVlZHMgYSB0b29sY2hhaW4gbm90IGFmZmVjdGVkIGJ5IEdD
QyBidWcgNjQ3MzUiCj4gIAlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX0xMVk1fQVJDSF9TVVBQT1JU
Uwo+ICAJZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlOX0hBU19HQ0NfQlVHXzY0NzM1Cj4gIAo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfTUVTQTNEX0xFR0FDWV9CSU5EX1dBWUxBTkRfRElTUExBWQo+ICsJ
Ym9vbCAiTGVnYWN5IFdheWxhbmQgRUdMX1dMX2JpbmRfd2F5bGFuZF9kaXNwbGF5IHN1cHBvcnQi
Cj4gKwlkZXBlbmRzIG9uIEJSMl9QQUNLQUdFX1dBWUxBTkQKPiArCWhlbHAKPiArCSAgTGVnYWN5
IFdheWxhbmQgRUdMX1dMX2JpbmRfd2F5bGFuZF9kaXNwbGF5IHN1cHBvcnQuCj4gKwo+ICBtZW51
Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9PUEVOQ0wKPiAgCWJvb2wgIk9wZW5DTCBzdXBwb3J0
Igo+ICAJZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9NRVNBM0RfTExWTQo+IGRpZmYgLS1naXQgYS9w
YWNrYWdlL21lc2EzZC9tZXNhM2QubWsgYi9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPiBpbmRl
eCA0MjY5M2NlOTI4Li45YzBlNWQ3MjU2IDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21l
c2EzZC5tawo+ICsrKyBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+IEBAIC0yMDksNiArMjA5
LDkgQEAgZW5kaWYKPiAgaWZlcSAoJChCUjJfUEFDS0FHRV9XQVlMQU5EKSx5KQo+ICBNRVNBM0Rf
REVQRU5ERU5DSUVTICs9IHdheWxhbmQgd2F5bGFuZC1wcm90b2NvbHMKPiAgTUVTQTNEX1BMQVRG
T1JNUyArPSB3YXlsYW5kCj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTUVTQTNEX0xFR0FDWV9CSU5E
X1dBWUxBTkRfRElTUExBWSkseSkKPiArTUVTQTNEX0NPTkZfT1BUUyArPSAtRGxlZ2FjeS13YXls
YW5kPWJpbmQtd2F5bGFuZC1kaXNwbGF5Cj4gK2VuZGlmCj4gIGVuZGlmCj4gIAo+ICBNRVNBM0Rf
Q09ORl9PUFRTICs9IFwKPiAtLSAKPiAyLjQzLjAKPiAKPiAKCkNoZWVycywK4oCUQWRyacOhbgo=

--KLrymaXyER2JKP0W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEIAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCaZxSPgAKCRCRxVnb5MkS
OyN2AJ4yLI4u+R/U7etB8D1NJSp6u8tgyACfR3v00hTG0VqcPjUOTG47y2CLRcc=
=pYFK
-----END PGP SIGNATURE-----

--KLrymaXyER2JKP0W--

--===============6496128227512061237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6496128227512061237==--
