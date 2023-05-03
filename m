Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF01C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 20:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D55C961544;
	Wed,  3 May 2023 20:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D55C961544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LC4cdu100B4C; Wed,  3 May 2023 20:29:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C197261555;
	Wed,  3 May 2023 20:29:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C197261555
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC2D81BF3E0
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 821E461555
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 20:29:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 821E461555
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bz01ByJ8ycIj for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 20:29:23 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6DF9E61544
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6DF9E61544
 for <buildroot@buildroot.org>; Wed,  3 May 2023 20:29:22 +0000 (UTC)
Received: from 91-152-140-132.elisa-laajakaista.fi ([91.152.140.132]
 helo=momiji.home) by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1puJ6F-000gt7-0r; Wed, 03 May 2023 22:29:19 +0200
Received: from localhost (momiji.home [local])
 by momiji.home (OpenSMTPD) with ESMTPA id 102ca158;
 Wed, 3 May 2023 20:29:17 +0000 (UTC)
Date: Wed, 3 May 2023 23:29:13 +0300
Message-ID: <20230503232913.GC3101739@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <E63916C7-FFFA-4C6E-B684-02CE35739EB8@benettiengineering.com>
References: <20230503145825.GB1907630@igalia.com>
 <E63916C7-FFFA-4C6E-B684-02CE35739EB8@benettiengineering.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:Cc:To:
 From:Message-ID:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a5gZc3imF47fU5zBiBzNVxuwEI7Kl7yzxy5oUlhvYic=; b=eEsC6DInYLxiR7IsUcp9gfz1pQ
 DvnFlGJyJcpy7n0pRIGhro3vuCgKdH3l9itUuYM6DBwdUTlv9cTJoO26I7cS8OHxllok1CjdOfq7I
 9xYMbasIkDMKnnW5eqVDy+gsyMS6iLTIQFdRmlaOmAOfPk+PUmBVc5fRX+fXfwZs5DDqntqXeyNaR
 JYiGFu5FC4Vf0ekYdk286tmTB1YWBeQYUUEXbZt91zkbElXz9F/6Cef5kaadIdNbhD5zQdCXovm7p
 XOImrSVkYjEAGRaDn+GuyAaICFyvfY7hQrgiLUB04R3LKAJP+30m33cnBTIrCky0w496AV9NfwBGU
 aEBAJqIg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=eEsC6DIn
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1494582126147650730=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1494582126147650730==
Content-Type: multipart/signed; boundary="GIMk9OIPIPprrzIb"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--GIMk9OIPIPprrzIb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

SGVsbG8gR2l1bGlvLgoKT24gV2VkLCAwMyBNYXkgMjAyMyAyMTo0NzowNiArMDIwMCBHaXVsaW8g
QmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6Cgo+
ID4gSWwgZ2lvcm5vIDMgbWFnIDIwMjMsIGFsbGUgb3JlIDEzOjU4LCBBZHJpYW4gUGVyZXogZGUg
Q2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4gaGEgc2NyaXR0bzoKPiA+IAo+ID4g77u/SGVsbG8g
R2l1bGlvLAo+ID4gCj4gPj4gT24gU3VuLCAzMCBBcHIgMjAyMyAyMzozNTowMyArMDIwMCBHaXVs
aW8gQmVuZXR0aSA8Z2l1bGlvLmJlbmV0dGlAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4gd3JvdGU6
Cj4gPj4gSGkgQWRyaWFuLAo+ID4+IAo+ID4+PiBPbiAyMy8wNC8yMyAyMzo0NiwgQWRyaWFuIFBl
cmV6IGRlIENhc3RybyB3cm90ZToKPiA+Pj4gSGksCj4gPj4+IAo+ID4+PiBPbiBNb24sIDI0IEFw
ciAyMDIzIDAwOjQwOjE0ICswMzAwIEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2Fs
aWEuY29tPiB3cm90ZToKPiA+Pj4+IEFkZCBhIGNob2ljZSB0byBhbGxvdyB1c2luZyB0aGUgV2F5
bGFuZCB2YXJpYW50IG9mIHRoZSBNYWxpIGRyaXZlci4gV2hlbgo+ID4+Pj4gc2VsZWN0ZWQsIHRo
ZSBwYWNrYWdlIGlzIG1hcmtlZCBhcyBwcm92aWRlciBmb3IgbGliZ2JtIGFzIGxpYk1hbGkuc28K
PiA+Pj4+IGluY2x1ZGVzIHRoZSBzeW1ib2xzIGFuZCBhIGxpYmdibS5zbyBzeW1saW5rIGlzIGlu
c3RhbGxlZDsgYW5kIGJvdGgKPiA+Pj4+IEJSMl9QQUNLQUdFX0hBU197TElCR0JNLExJQkVHTF9X
QVlMQU5EfSBhcmUgc2VsZWN0ZWQgYWNjb3JkaW5nbHkuCj4gPj4+PiAKPiA+Pj4+IFNpZ25lZC1v
ZmYtYnk6IEFkcmlhbiBQZXJleiBkZSBDYXN0cm8gPGFwZXJlekBpZ2FsaWEuY29tPgo+ID4+PiAK
PiA+Pj4gV2l0aCB0aGlzIEkgaGF2ZSBiZWVuIGFibGUgdG8gYnVpbGQgV2ViS2l0R1RLLCBXUEVX
ZWJLaXQsIGFuZCB0aGUgQ2FnZQo+ID4+PiBjb21wb3NpdG9yIHdpdGhvdXQgdHJvdWJsZSwgYnV0
IHVuZm9ydHVuYXRlbHkgSSBkbyBub3QgaGF2ZSB0aGUgaGFyZHdhcmUKPiA+Pj4gdG8gdGVzdCBp
dC4uLiBzbyBJIGNhbm5vdCByZWFsbHkgdGVsbCB3aGV0aGVyIHRoaW5ncyB3b3JrIGFzIGV4cGVj
dGVkLgo+ID4+IAo+ID4+IENhbiB5b3UgcGxlYXNlIHBhc3RlYmluIG9yIHBhc3RlIGhlcmUgdGhl
IGRlZmNvbmZpZyB5b3UndmUgdXNlZCB0bwo+ID4+IGJ1aWxkPyBJJ20gZW5jb3VudGVyaW5nIHNv
bWUgaXNzdWVzIHdoaWxlIGJ1aWxkaW5nIGJ1dCBJIHdvdWxkIGxpa2UgdG8KPiA+PiB0ZXN0IG9u
IGEgYm9hcmQgdGhpcyBwYXRjaC4KPiA+IAo+ID4gSSBhbSBhdHRhY2hpbmcgdGhlIGNvbmZpZ3Vy
YXRpb24gZmlsZSB0byB0aGlzIG1haWwsIGl0J3MgYmFzZWQgb24KPiA+IG9saW1leF9hMjBfb2xp
bnV4aW5vX2xpbWUyX2RlZmNvbmZpZyBhbmQgSSBoYXZlIHRlc3RlZCBidWlsZGluZyB3cGV3ZWJr
aXQKPiA+IHdpdGggdGhlIHBhdGNoIGFwcGxpZWQgYW5kIGl0IHdvcmtlZCBoZXJlLiBJIGhvcGUg
dGhpcyBoZWxwcywgYW5kIGxldCBtZQo+ID4ga25vdyBpZiBJIGNhbiBoZWxwIG91dCBpbiBhbnkg
b3RoZXIgd2F5IDotKQo+IAo+IFRoYW5rcyBhIGxvdC4gQ2FuIHlvdSBhbHNvIHBvaW50IG1lIHRo
ZSBTSEExIGNvbW1pdCB5b3Ugd2VyZSB1c2luZyB0byBidWlsZD8KPiBUaGlzIGlzIGJlY2F1c2Ug
YnVpbGQgZmFpbHMgYXQgbWUgbm90IGR1ZSB0byBob3N0IHByb2JsZW1zLgoKWWVzLCBJIGp1c3Qg
dHJpZWQgYSBidWlsZCB0b2RheSBvbiA5YTA4NTdkNzM0YzVmY2E3NDkxNWIxY2Q4NWI5MjU1NWZl
MTVmYjkzCmJlZm9yZSBzZW5kaW5nIHRoZSAuY29uZmlnIGZpbGUgZWFybGllci4KIAo+ID4+IFRo
YW5rIHlvdSEKPiA+PiAKPiA+PiBCZXN0IHJlZ2FyZHMKPiA+PiAtLSAKPiA+PiBHaXVsaW8gQmVu
ZXR0aQo+ID4+IEJlbmV0dGkgRW5naW5lZXJpbmcgc2FzCj4gPj4gCj4gPj4+PiAtLS0KPiA+Pj4+
ICBwYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL0NvbmZpZy5pbiAgICAgICAgICAgfCAyMyArKysr
KysrKysrKysrKysrKysrCj4gPj4+PiAgLi4uL3N1bnhpLW1hbGktdXRnYXJkL3N1bnhpLW1hbGkt
dXRnYXJkLm1rICAgIHwgMTggKysrKysrKysrKysrLS0tCj4gPj4+PiAgMiBmaWxlcyBjaGFuZ2Vk
LCAzOCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4+Pj4gCj4gPj4+PiBkaWZmIC0t
Z2l0IGEvcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC9Db25maWcuaW4gYi9wYWNrYWdlL3N1bnhp
LW1hbGktdXRnYXJkL0NvbmZpZy5pbgo+ID4+Pj4gaW5kZXggNTlhYzIxZjVhYi4uMDg1NmYyMjBm
ZCAxMDA2NDQKPiA+Pj4+IC0tLSBhL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvQ29uZmlnLmlu
Cj4gPj4+PiArKysgYi9wYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL0NvbmZpZy5pbgo+ID4+Pj4g
QEAgLTE4LDYgKzE4LDkgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1BST1ZJREVTX0xJQkVHTAo+ID4+
Pj4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJHTEVTCj4gPj4+PiAgICAgIGRlZmF1
bHQgInN1bnhpLW1hbGktdXRnYXJkIgo+ID4+Pj4gCj4gPj4+PiArY29uZmlnIEJSMl9QQUNLQUdF
X1BST1ZJREVTX0xJQkdCTQo+ID4+Pj4gKyAgICBkZWZhdWx0ICJzdW54aS1tYWxpLXV0Z2FyZCIg
aWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfV0FZTEFORAo+ID4+Pj4gKwo+ID4+Pj4g
IGNob2ljZQo+ID4+Pj4gICAgICBwcm9tcHQgIlZlcnNpb24iCj4gPj4+PiAgICAgIGRlZmF1bHQg
QlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUjZQMiBpZiBCUjJfUEFDS0FHRV9TVU5YSV9N
QUxJX01BSU5MSU5FX1I2UDIgIyBsZWdhY3kKPiA+Pj4+IEBAIC0zOCw2ICs0MSwyNiBAQCBjb25m
aWcgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUkVWSVNJT04KPiA+Pj4+ICAgICAgZGVm
YXVsdCAicjZwMiIgICAgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUjZQMgo+ID4+
Pj4gICAgICBkZWZhdWx0ICJyOHAxIiAgICBpZiBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FS
RF9SOFAxCj4gPj4+PiAKPiA+Pj4+ICtjaG9pY2UKPiA+Pj4+ICsgICAgcHJvbXB0ICJQbGF0Zm9y
bSIKPiA+Pj4+ICsgICAgZGVmYXVsdCBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9GQkRF
Vgo+ID4+Pj4gKyAgICBoZWxwCj4gPj4+PiArICAgICAgU2VsZWN0IHRoZSB0YXJnZXQgRUdMIHBs
YXRmb3JtLgo+ID4+Pj4gKwo+ID4+Pj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VU
R0FSRF9GQkRFVgo+ID4+Pj4gKyAgICBib29sICJmYmRldiIKPiA+Pj4+ICtjb25maWcgQlIyX1BB
Q0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfV0FZTEFORAo+ID4+Pj4gKyAgICBib29sICJ3YXlsYW5k
Igo+ID4+Pj4gKyAgICBzZWxlY3QgQlIyX1BBQ0tBR0VfSEFTX0xJQkVHTF9XQVlMQU5ECj4gPj4+
PiArICAgIHNlbGVjdCBCUjJfUEFDS0FHRV9IQVNfTElCR0JNCj4gPj4+PiArCj4gPj4+PiArZW5k
Y2hvaWNlCj4gPj4+PiArCj4gPj4+PiArY29uZmlnIEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRH
QVJEX1BMQVRGT1JNCj4gPj4+PiArICAgIHN0cmluZwo+ID4+Pj4gKyAgICBkZWZhdWx0ICJmYmRl
diIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfRkJERVYKPiA+Pj4+ICsgICAgZGVm
YXVsdCAid2F5bGFuZCIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfV0FZTEFORAo+
ID4+Pj4gKwo+ID4+Pj4gIGVuZGlmCj4gPj4+PiAKPiA+Pj4+ICBjb21tZW50ICJzdW54aS1tYWxp
LXV0Z2FyZCBuZWVkcyBhbiBFQUJJaGYgZ2xpYmMgdG9vbGNoYWluIgo+ID4+Pj4gZGlmZiAtLWdp
dCBhL3BhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvc3VueGktbWFsaS11dGdhcmQubWsgYi9wYWNr
YWdlL3N1bnhpLW1hbGktdXRnYXJkL3N1bnhpLW1hbGktdXRnYXJkLm1rCj4gPj4+PiBpbmRleCBm
NjkzNjY3OTU1Li4yM2M2ZThlYzZlIDEwMDY0NAo+ID4+Pj4gLS0tIGEvcGFja2FnZS9zdW54aS1t
YWxpLXV0Z2FyZC9zdW54aS1tYWxpLXV0Z2FyZC5tawo+ID4+Pj4gKysrIGIvcGFja2FnZS9zdW54
aS1tYWxpLXV0Z2FyZC9zdW54aS1tYWxpLXV0Z2FyZC5tawo+ID4+Pj4gQEAgLTI0LDkgKzI0LDkg
QEAgZW5kaWYKPiA+Pj4+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRfSU5TVEFMTF9TVEFHSU5H
X0NNRFMKPiA+Pj4+ICAgICAgbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL2xpYiAkKFNUQUdJ
TkdfRElSKS91c3IvaW5jbHVkZQo+ID4+Pj4gCj4gPj4+PiAtICAgIGNwIC1yZiAkKEBEKS8kKFNV
TlhJX01BTElfVVRHQVJEX1JFVikvJChTVU5YSV9NQUxJX1VUR0FSRF9BUkNIKS9mYmRldi8qLnNv
KiBcCj4gPj4+PiArICAgIGNwIC1yZiAkKEBEKS8kKFNVTlhJX01BTElfVVRHQVJEX1JFVikvJChT
VU5YSV9NQUxJX1VUR0FSRF9BUkNIKS8kKEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1BM
QVRGT1JNKS8qLnNvKiBcCj4gPj4+PiAgICAgICAgICAkKFNUQUdJTkdfRElSKS91c3IvbGliLwo+
ID4+Pj4gLSAgICBjcCAtcmYgJChARCkvaW5jbHVkZS9mYmRldi8qICQoU1RBR0lOR19ESVIpL3Vz
ci9pbmNsdWRlLwo+ID4+Pj4gKyAgICBjcCAtcmYgJChARCkvaW5jbHVkZS8kKEJSMl9QQUNLQUdF
X1NVTlhJX01BTElfVVRHQVJEX1BMQVRGT1JNKS8qICQoU1RBR0lOR19ESVIpL3Vzci9pbmNsdWRl
Lwo+ID4+Pj4gCj4gPj4+PiAgICAgICQoSU5TVEFMTCkgLUQgLW0gMDY0NCBwYWNrYWdlL3N1bnhp
LW1hbGktdXRnYXJkL2VnbC5wYyBcCj4gPj4+PiAgICAgICAgICAkKFNUQUdJTkdfRElSKS91c3Iv
bGliL3BrZ2NvbmZpZy9lZ2wucGMKPiA+Pj4+IEBAIC0zNCw5ICszNCwyMSBAQCBkZWZpbmUgU1VO
WElfTUFMSV9VVEdBUkRfSU5TVEFMTF9TVEFHSU5HX0NNRFMKPiA+Pj4+ICAgICAgICAgICQoU1RB
R0lOR19ESVIpL3Vzci9saWIvcGtnY29uZmlnL2dsZXN2Mi5wYwo+ID4+Pj4gIGVuZGVmCj4gPj4+
PiAKPiA+Pj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1dBWUxBTkQp
LHkpCj4gPj4+PiArZGVmaW5lIFNVTlhJX01BTElfVVRHQVJEX0lOU1RBTExfRklYVVBfU1RBR0lO
R19QQ19GSUxFUwo+ID4+Pj4gKyAgICBzZWQgLWUgJy9eQ2ZsYWdzOi9zLyQkLyAtRFdMX0VHTF9Q
TEFURk9STS8nIFwKPiA+Pj4+ICsgICAgICAgIC1lICcvXlJlcXVpcmVzOi9zLyQkLyB3YXlsYW5k
LWNsaWVudCB3YXlsYW5kLXNlcnZlci8nIFwKPiA+Pj4+ICsgICAgICAgIC1pICQoU1RBR0lOR19E
SVIpL3Vzci9saWIvcGtnY29uZmlnL2VnbC5wYwo+ID4+Pj4gKyAgICBzZWQgLWUgJy9eUmVxdWly
ZXM6L3MvJCQvIHdheWxhbmQtY2xpZW50IHdheWxhbmQtc2VydmVyLycgXAo+ID4+Pj4gKyAgICAg
ICAgLWkgJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvZ2xlc3YyLnBjCj4gPj4+PiAr
ZW5kZWYKPiA+Pj4+ICtTVU5YSV9NQUxJX1VUR0FSRF9QT1NUX0lOU1RBTExfVEFSR0VUX0hPT0tT
ICs9IFNVTlhJX01BTElfVVRHQVJEX0lOU1RBTExfRklYVVBfU1RBR0lOR19QQ19GSUxFUwo+ID4+
Pj4gK1NVTlhJX01BTElfVVRHQVJEX0RFUEVOREVOQ0lFUyArPSB3YXlsYW5kCj4gPj4+PiArZW5k
aWYKPiA+Pj4+ICsKPiA+Pj4+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRfSU5TVEFMTF9UQVJH
RVRfQ01EUwo+ID4+Pj4gICAgICBta2RpciAtcCAkKFRBUkdFVF9ESVIpL3Vzci9saWIKPiA+Pj4+
IC0gICAgY3AgLXJmICQoQEQpLyQoU1VOWElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJX01BTElf
VVRHQVJEX0FSQ0gpL2ZiZGV2Lyouc28qIFwKPiA+Pj4+ICsgICAgY3AgLXJmICQoQEQpLyQoU1VO
WElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJX01BTElfVVRHQVJEX0FSQ0gpLyQoQlIyX1BBQ0tB
R0VfU1VOWElfTUFMSV9VVEdBUkRfUExBVEZPUk0pLyouc28qIFwKPiA+Pj4+ICAgICAgICAgICQo
VEFSR0VUX0RJUikvdXNyL2xpYi8KPiA+Pj4+ICBlbmRlZgo+ID4+Pj4gCj4gPj4+PiAtLSAKPiA+
Pj4+IDIuNDAuMAo+ID4+Pj4gCj4gPj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwo+ID4+Pj4gYnVpbGRyb290IG1haWxpbmcgbGlzdAo+ID4+Pj4gYnVp
bGRyb290QGJ1aWxkcm9vdC5vcmcKPiA+Pj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4+Pj4gCj4gPj4+IAo+ID4+PiBDaGVlcnMsCj4g
Pj4+IOKAlEFkcmnDoW4KPiA+Pj4gCj4gPj4+IAo+ID4+PiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4+PiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
Pj4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo+ID4+IAo+ID4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gYnVpbGRyb290IG1haWxpbmcg
bGlzdAo+ID4+IGJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCj4gPj4gaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cj4gPiAKPiA+IENoZWVycywKPiA+
IOKAlEFkcmnDoW4KPiA+IDxsaW1lMi1tYWxpLXdsLWNvbmZpZy54ej4KPiAKPiBfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlzdHMuYnVpbGRyb290
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKQ2hlZXJzLArigJRBZHJpw6FuCg==

--GIMk9OIPIPprrzIb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZFLEGQAKCRCRxVnb5MkS
O+T6AJ9dlCprp50Mxoi43mYcdCSuSvtYHgCfVvvZUGBflc9OIyAJe7w0IKrGaCk=
=5zUT
-----END PGP SIGNATURE-----

--GIMk9OIPIPprrzIb--

--===============1494582126147650730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1494582126147650730==--
