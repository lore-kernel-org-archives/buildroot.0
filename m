Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DB1C6FD18
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 21:46:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA88360E33;
	Sun, 23 Apr 2023 21:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA88360E33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pJ3W3BWLQBnj; Sun, 23 Apr 2023 21:46:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DD36460A6D;
	Sun, 23 Apr 2023 21:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD36460A6D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A17E61C2B11
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7ACDE60A6D
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 21:46:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7ACDE60A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HoRj121wFTtk for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 21:46:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54FFA60736
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54FFA60736
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 21:46:47 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pqhXf-00AYqf-LD; Sun, 23 Apr 2023 23:46:43 +0200
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 4c553b4b;
 Sun, 23 Apr 2023 21:46:42 +0000 (UTC)
Date: Mon, 24 Apr 2023 00:46:42 +0300
Message-ID: <20230424004642.GB1857231@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230423214014.2963361-1-aperez@igalia.com>
References: <20230423214014.2963361-1-aperez@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JajMRw6AUTLuKoMV17MQZPELpcgYJUPSCGqkCvjsV7A=; b=pnq5i9jTzv+1xvSvSOY4VPjlGX
 ChsU0UANmu6tNz5fa9cq5S/9VxZcZ3tCDpQtheGw5eMcL3F7YVeF6apyCGLrnnMzh59KPIC9W43C3
 5xJ7J2XUMWj9JxcshicMIkIBvSKXFHFj1gsQ5PON6mocHX9Yhsq0Wra7w897ngqszblbKYnLCT6Sl
 1KqY5fE4r0Qbd5EFQmWh5RlJ0DKTobPMR3fdbhmpoH2c+eKVhMLGbE9Kn5GwqO/pQ+uIhJ0ShR+ys
 v7EQzP6g/Pa0GoOApYFLAESrVkNNay4Q3jyBHT/9JQjGtb3cSVSkG6l88rFk2HGcGobftoyVl7XAD
 Mv6RK7Xw==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=pnq5i9jT
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard: support the
 wayland driver
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: multipart/mixed; boundary="===============0233647481564202406=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0233647481564202406==
Content-Type: multipart/signed; boundary="Xt115vatud5xQlbu"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--Xt115vatud5xQlbu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGksCgpPbiBNb24sIDI0IEFwciAyMDIzIDAwOjQwOjE0ICswMzAwIEFkcmlhbiBQZXJleiBkZSBD
YXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPiB3cm90ZToKPiBBZGQgYSBjaG9pY2UgdG8gYWxsb3cg
dXNpbmcgdGhlIFdheWxhbmQgdmFyaWFudCBvZiB0aGUgTWFsaSBkcml2ZXIuIFdoZW4KPiBzZWxl
Y3RlZCwgdGhlIHBhY2thZ2UgaXMgbWFya2VkIGFzIHByb3ZpZGVyIGZvciBsaWJnYm0gYXMgbGli
TWFsaS5zbwo+IGluY2x1ZGVzIHRoZSBzeW1ib2xzIGFuZCBhIGxpYmdibS5zbyBzeW1saW5rIGlz
IGluc3RhbGxlZDsgYW5kIGJvdGgKPiBCUjJfUEFDS0FHRV9IQVNfe0xJQkdCTSxMSUJFR0xfV0FZ
TEFORH0gYXJlIHNlbGVjdGVkIGFjY29yZGluZ2x5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlh
biBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgoKV2l0aCB0aGlzIEkgaGF2ZSBi
ZWVuIGFibGUgdG8gYnVpbGQgV2ViS2l0R1RLLCBXUEVXZWJLaXQsIGFuZCB0aGUgQ2FnZQpjb21w
b3NpdG9yIHdpdGhvdXQgdHJvdWJsZSwgYnV0IHVuZm9ydHVuYXRlbHkgSSBkbyBub3QgaGF2ZSB0
aGUgaGFyZHdhcmUKdG8gdGVzdCBpdC4uLiBzbyBJIGNhbm5vdCByZWFsbHkgdGVsbCB3aGV0aGVy
IHRoaW5ncyB3b3JrIGFzIGV4cGVjdGVkLgoKPiAtLS0KPiAgcGFja2FnZS9zdW54aS1tYWxpLXV0
Z2FyZC9Db25maWcuaW4gICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysrKysrKwo+ICAuLi4v
c3VueGktbWFsaS11dGdhcmQvc3VueGktbWFsaS11dGdhcmQubWsgICAgfCAxOCArKysrKysrKysr
KystLS0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+IAo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL0NvbmZpZy5pbiBi
L3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvQ29uZmlnLmluCj4gaW5kZXggNTlhYzIxZjVhYi4u
MDg1NmYyMjBmZCAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL0NvbmZp
Zy5pbgo+ICsrKyBiL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvQ29uZmlnLmluCj4gQEAgLTE4
LDYgKzE4LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkVHTAo+ICBjb25maWcg
QlIyX1BBQ0tBR0VfUFJPVklERVNfTElCR0xFUwo+ICAJZGVmYXVsdCAic3VueGktbWFsaS11dGdh
cmQiCj4gIAo+ICtjb25maWcgQlIyX1BBQ0tBR0VfUFJPVklERVNfTElCR0JNCj4gKwlkZWZhdWx0
ICJzdW54aS1tYWxpLXV0Z2FyZCIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfV0FZ
TEFORAo+ICsKPiAgY2hvaWNlCj4gIAlwcm9tcHQgIlZlcnNpb24iCj4gIAlkZWZhdWx0IEJSMl9Q
QUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1I2UDIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9N
QUlOTElORV9SNlAyICMgbGVnYWN5Cj4gQEAgLTM4LDYgKzQxLDI2IEBAIGNvbmZpZyBCUjJfUEFD
S0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9SRVZJU0lPTgo+ICAJZGVmYXVsdCAicjZwMiIJaWYgQlIy
X1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUjZQMgo+ICAJZGVmYXVsdCAicjhwMSIJaWYgQlIy
X1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUjhQMQo+ICAKPiArY2hvaWNlCj4gKwlwcm9tcHQg
IlBsYXRmb3JtIgo+ICsJZGVmYXVsdCBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9GQkRF
Vgo+ICsJaGVscAo+ICsJICBTZWxlY3QgdGhlIHRhcmdldCBFR0wgcGxhdGZvcm0uCj4gKwo+ICtj
b25maWcgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfRkJERVYKPiArCWJvb2wgImZiZGV2
Igo+ICtjb25maWcgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfV0FZTEFORAo+ICsJYm9v
bCAid2F5bGFuZCIKPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9IQVNfTElCRUdMX1dBWUxBTkQKPiAr
CXNlbGVjdCBCUjJfUEFDS0FHRV9IQVNfTElCR0JNCj4gKwo+ICtlbmRjaG9pY2UKPiArCj4gK2Nv
bmZpZyBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9QTEFURk9STQo+ICsJc3RyaW5nCj4g
KwlkZWZhdWx0ICJmYmRldiIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfRkJERVYK
PiArCWRlZmF1bHQgIndheWxhbmQiIGlmIEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1dB
WUxBTkQKPiArCj4gIGVuZGlmCj4gIAo+ICBjb21tZW50ICJzdW54aS1tYWxpLXV0Z2FyZCBuZWVk
cyBhbiBFQUJJaGYgZ2xpYmMgdG9vbGNoYWluIgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL3N1bnhp
LW1hbGktdXRnYXJkL3N1bnhpLW1hbGktdXRnYXJkLm1rIGIvcGFja2FnZS9zdW54aS1tYWxpLXV0
Z2FyZC9zdW54aS1tYWxpLXV0Z2FyZC5tawo+IGluZGV4IGY2OTM2Njc5NTUuLjIzYzZlOGVjNmUg
MTAwNjQ0Cj4gLS0tIGEvcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC9zdW54aS1tYWxpLXV0Z2Fy
ZC5tawo+ICsrKyBiL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvc3VueGktbWFsaS11dGdhcmQu
bWsKPiBAQCAtMjQsOSArMjQsOSBAQCBlbmRpZgo+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRf
SU5TVEFMTF9TVEFHSU5HX0NNRFMKPiAgCW1rZGlyIC1wICQoU1RBR0lOR19ESVIpL3Vzci9saWIg
JChTVEFHSU5HX0RJUikvdXNyL2luY2x1ZGUKPiAgCj4gLQljcCAtcmYgJChARCkvJChTVU5YSV9N
QUxJX1VUR0FSRF9SRVYpLyQoU1VOWElfTUFMSV9VVEdBUkRfQVJDSCkvZmJkZXYvKi5zbyogXAo+
ICsJY3AgLXJmICQoQEQpLyQoU1VOWElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJX01BTElfVVRH
QVJEX0FSQ0gpLyQoQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUExBVEZPUk0pLyouc28q
IFwKPiAgCQkkKFNUQUdJTkdfRElSKS91c3IvbGliLwo+IC0JY3AgLXJmICQoQEQpL2luY2x1ZGUv
ZmJkZXYvKiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS8KPiArCWNwIC1yZiAkKEBEKS9pbmNs
dWRlLyQoQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUExBVEZPUk0pLyogJChTVEFHSU5H
X0RJUikvdXNyL2luY2x1ZGUvCj4gIAo+ICAJJChJTlNUQUxMKSAtRCAtbSAwNjQ0IHBhY2thZ2Uv
c3VueGktbWFsaS11dGdhcmQvZWdsLnBjIFwKPiAgCQkkKFNUQUdJTkdfRElSKS91c3IvbGliL3Br
Z2NvbmZpZy9lZ2wucGMKPiBAQCAtMzQsOSArMzQsMjEgQEAgZGVmaW5lIFNVTlhJX01BTElfVVRH
QVJEX0lOU1RBTExfU1RBR0lOR19DTURTCj4gIAkJJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2dj
b25maWcvZ2xlc3YyLnBjCj4gIGVuZGVmCj4gIAo+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NVTlhJ
X01BTElfVVRHQVJEX1dBWUxBTkQpLHkpCj4gK2RlZmluZSBTVU5YSV9NQUxJX1VUR0FSRF9JTlNU
QUxMX0ZJWFVQX1NUQUdJTkdfUENfRklMRVMKPiArCXNlZCAtZSAnL15DZmxhZ3M6L3MvJCQvIC1E
V0xfRUdMX1BMQVRGT1JNLycgXAo+ICsJCS1lICcvXlJlcXVpcmVzOi9zLyQkLyB3YXlsYW5kLWNs
aWVudCB3YXlsYW5kLXNlcnZlci8nIFwKPiArCQktaSAkKFNUQUdJTkdfRElSKS91c3IvbGliL3Br
Z2NvbmZpZy9lZ2wucGMKPiArCXNlZCAtZSAnL15SZXF1aXJlczovcy8kJC8gd2F5bGFuZC1jbGll
bnQgd2F5bGFuZC1zZXJ2ZXIvJyBcCj4gKwkJLWkgJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2dj
b25maWcvZ2xlc3YyLnBjCj4gK2VuZGVmCj4gK1NVTlhJX01BTElfVVRHQVJEX1BPU1RfSU5TVEFM
TF9UQVJHRVRfSE9PS1MgKz0gU1VOWElfTUFMSV9VVEdBUkRfSU5TVEFMTF9GSVhVUF9TVEFHSU5H
X1BDX0ZJTEVTCj4gK1NVTlhJX01BTElfVVRHQVJEX0RFUEVOREVOQ0lFUyArPSB3YXlsYW5kCj4g
K2VuZGlmCj4gKwo+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRfSU5TVEFMTF9UQVJHRVRfQ01E
Uwo+ICAJbWtkaXIgLXAgJChUQVJHRVRfRElSKS91c3IvbGliCj4gLQljcCAtcmYgJChARCkvJChT
VU5YSV9NQUxJX1VUR0FSRF9SRVYpLyQoU1VOWElfTUFMSV9VVEdBUkRfQVJDSCkvZmJkZXYvKi5z
byogXAo+ICsJY3AgLXJmICQoQEQpLyQoU1VOWElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJX01B
TElfVVRHQVJEX0FSQ0gpLyQoQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUExBVEZPUk0p
Lyouc28qIFwKPiAgCQkkKFRBUkdFVF9ESVIpL3Vzci9saWIvCj4gIGVuZGVmCj4gIAo+IC0tIAo+
IDIuNDAuMAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4g
aHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4g
CgpDaGVlcnMsCuKAlEFkcmnDoW4K

--Xt115vatud5xQlbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZEWnQgAKCRCRxVnb5MkS
OyWPAJsHeLp70Za4nWpkvDVZldpeaw8ppgCfYc0xUhXvSxrHWAGFsyN61lGItlQ=
=Mm0k
-----END PGP SIGNATURE-----

--Xt115vatud5xQlbu--

--===============0233647481564202406==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0233647481564202406==--
