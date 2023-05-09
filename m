Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B499C77B7C
	for <buildroot@archiver.kernel.org>; Tue,  9 May 2023 12:33:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E6F9561109;
	Tue,  9 May 2023 12:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6F9561109
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fnGfl60ZJFWD; Tue,  9 May 2023 12:33:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D484960BEA;
	Tue,  9 May 2023 12:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D484960BEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ECF391BF300
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CEA7760BEA
 for <buildroot@lists.busybox.net>; Tue,  9 May 2023 12:33:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CEA7760BEA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P-le6yElFDJR for <buildroot@lists.busybox.net>;
 Tue,  9 May 2023 12:33:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66CCF60BE7
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 66CCF60BE7
 for <buildroot@buildroot.org>; Tue,  9 May 2023 12:33:04 +0000 (UTC)
Received: from 91-153-34-68.elisa-laajakaista.fi ([91.153.34.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA512__AES_256_GCM:256) (Exim)
 id 1pwMWc-004oNX-48
 for <buildroot@buildroot.org>; Tue, 09 May 2023 14:33:02 +0200
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id bda89692
 for <buildroot@buildroot.org>; Tue, 9 May 2023 12:33:01 +0000 (UTC)
Date: Tue, 9 May 2023 15:33:01 +0300
Message-ID: <20230509153301.GD2291742@igalia.com>
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
In-Reply-To: <20230424004642.GB1857231@igalia.com>
References: <20230423214014.2963361-1-aperez@igalia.com>
 <20230424004642.GB1857231@igalia.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; d=igalia.com; 
 s=20170329; h=Content-Type:MIME-Version:References:In-Reply-To:Subject:To:
 From:Message-ID:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjmzSaVhoGqunQxRYFs0YB7Cp83nwU/Thr+RGOFMxrs=; b=OfrwIZpsbnxp7V2bmFS+yOTbx1
 +0xMNODsl8sbHEcIvarMgz2MO7j69xd+XQ5UyhEHp0Vl2ErRqTtF4HanN5ecy0rB0hmvq32OBbyXO
 Zfts0NYDVp9AmfCrBhTZBKSl0ky4dxn/5nDoQI/bM5qIWEzn7joXlWrJiesxqj3dLDR8p1O5PUAAI
 g4auDBfCxd0pS9iXnRSsxtEaqftUPOqhFENLvdIgMbaFpq9UqtPt/Zu7KQLsgXs3up/3eVKNAU7aq
 Nd/WS5rGZ3YjbV2sQis4uwSep2LyIootywObLsOj8z44NV004oT5Rj9770cMu7JPSje0z3ZefC4S2
 ImBNRsXg==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com
 header.a=rsa-sha256 header.s=20170329 header.b=OfrwIZps
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
Content-Type: multipart/mixed; boundary="===============5669948932361486976=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============5669948932361486976==
Content-Type: multipart/signed; boundary="v6oSqsi/gnRSPFK+"; micalg="pgp-ripemd160"; protocol="application/pgp-signature"


--v6oSqsi/gnRSPFK+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: base64

T24gTW9uLCAyNCBBcHIgMjAyMyAwMDo0Njo0MiArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJv
IDxhcGVyZXpAaWdhbGlhLmNvbT4gd3JvdGU6Cj4gSGksCj4gCj4gT24gTW9uLCAyNCBBcHIgMjAy
MyAwMDo0MDoxNCArMDMwMCBBZHJpYW4gUGVyZXogZGUgQ2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNv
bT4gd3JvdGU6Cj4gPiBBZGQgYSBjaG9pY2UgdG8gYWxsb3cgdXNpbmcgdGhlIFdheWxhbmQgdmFy
aWFudCBvZiB0aGUgTWFsaSBkcml2ZXIuIFdoZW4KPiA+IHNlbGVjdGVkLCB0aGUgcGFja2FnZSBp
cyBtYXJrZWQgYXMgcHJvdmlkZXIgZm9yIGxpYmdibSBhcyBsaWJNYWxpLnNvCj4gPiBpbmNsdWRl
cyB0aGUgc3ltYm9scyBhbmQgYSBsaWJnYm0uc28gc3ltbGluayBpcyBpbnN0YWxsZWQ7IGFuZCBi
b3RoCj4gPiBCUjJfUEFDS0FHRV9IQVNfe0xJQkdCTSxMSUJFR0xfV0FZTEFORH0gYXJlIHNlbGVj
dGVkIGFjY29yZGluZ2x5Lgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBZHJpYW4gUGVyZXogZGUg
Q2FzdHJvIDxhcGVyZXpAaWdhbGlhLmNvbT4KPiAKPiBXaXRoIHRoaXMgSSBoYXZlIGJlZW4gYWJs
ZSB0byBidWlsZCBXZWJLaXRHVEssIFdQRVdlYktpdCwgYW5kIHRoZSBDYWdlCj4gY29tcG9zaXRv
ciB3aXRob3V0IHRyb3VibGUsIGJ1dCB1bmZvcnR1bmF0ZWx5IEkgZG8gbm90IGhhdmUgdGhlIGhh
cmR3YXJlCj4gdG8gdGVzdCBpdC4uLiBzbyBJIGNhbm5vdCByZWFsbHkgdGVsbCB3aGV0aGVyIHRo
aW5ncyB3b3JrIGFzIGV4cGVjdGVkLgoKSSBmb3Jnb3QgdG8gbWVudGlvbiB0aGF0IGJ1aWxkaW5n
IFdlYktpdHtHVEssV1BFfSBuZWVkcyBhIHNtYWxsIHBhdGNoCmZvciB2ZXJzaW9uIDIuMzgueCwg
d2hpY2ggd2FzIGFscmVhZHkgc3VibWl0dGVkIGEgbGl0dGxlIHdoaWxlIGFnbzoKCiAgaHR0cHM6
Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIzMDQyMzIx
MzIzMy4yOTYxNzcwLTEtYXBlcmV6QGlnYWxpYS5jb20vCgpOb3RlIHRvIHNlbGY6IHN1Ym1pdCBh
bHNvIHRoaXMgZm9yIHBhY2thZ2Uvd2Via2l0Z3RrIE86LSkKCj4gPiAtLS0KPiA+ICBwYWNrYWdl
L3N1bnhpLW1hbGktdXRnYXJkL0NvbmZpZy5pbiAgICAgICAgICAgfCAyMyArKysrKysrKysrKysr
KysrKysrCj4gPiAgLi4uL3N1bnhpLW1hbGktdXRnYXJkL3N1bnhpLW1hbGktdXRnYXJkLm1rICAg
IHwgMTggKysrKysrKysrKysrLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzOCBpbnNlcnRpb25z
KCspLCAzIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9zdW54aS1t
YWxpLXV0Z2FyZC9Db25maWcuaW4gYi9wYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL0NvbmZpZy5p
bgo+ID4gaW5kZXggNTlhYzIxZjVhYi4uMDg1NmYyMjBmZCAxMDA2NDQKPiA+IC0tLSBhL3BhY2th
Z2Uvc3VueGktbWFsaS11dGdhcmQvQ29uZmlnLmluCj4gPiArKysgYi9wYWNrYWdlL3N1bnhpLW1h
bGktdXRnYXJkL0NvbmZpZy5pbgo+ID4gQEAgLTE4LDYgKzE4LDkgQEAgY29uZmlnIEJSMl9QQUNL
QUdFX1BST1ZJREVTX0xJQkVHTAo+ID4gIGNvbmZpZyBCUjJfUEFDS0FHRV9QUk9WSURFU19MSUJH
TEVTCj4gPiAgCWRlZmF1bHQgInN1bnhpLW1hbGktdXRnYXJkIgo+ID4gIAo+ID4gK2NvbmZpZyBC
UjJfUEFDS0FHRV9QUk9WSURFU19MSUJHQk0KPiA+ICsJZGVmYXVsdCAic3VueGktbWFsaS11dGdh
cmQiIGlmIEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1dBWUxBTkQKPiA+ICsKPiA+ICBj
aG9pY2UKPiA+ICAJcHJvbXB0ICJWZXJzaW9uIgo+ID4gIAlkZWZhdWx0IEJSMl9QQUNLQUdFX1NV
TlhJX01BTElfVVRHQVJEX1I2UDIgaWYgQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9NQUlOTElORV9S
NlAyICMgbGVnYWN5Cj4gPiBAQCAtMzgsNiArNDEsMjYgQEAgY29uZmlnIEJSMl9QQUNLQUdFX1NV
TlhJX01BTElfVVRHQVJEX1JFVklTSU9OCj4gPiAgCWRlZmF1bHQgInI2cDIiCWlmIEJSMl9QQUNL
QUdFX1NVTlhJX01BTElfVVRHQVJEX1I2UDIKPiA+ICAJZGVmYXVsdCAicjhwMSIJaWYgQlIyX1BB
Q0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUjhQMQo+ID4gIAo+ID4gK2Nob2ljZQo+ID4gKwlwcm9t
cHQgIlBsYXRmb3JtIgo+ID4gKwlkZWZhdWx0IEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJE
X0ZCREVWCj4gPiArCWhlbHAKPiA+ICsJICBTZWxlY3QgdGhlIHRhcmdldCBFR0wgcGxhdGZvcm0u
Cj4gPiArCj4gPiArY29uZmlnIEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX0ZCREVWCj4g
PiArCWJvb2wgImZiZGV2Igo+ID4gK2NvbmZpZyBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FS
RF9XQVlMQU5ECj4gPiArCWJvb2wgIndheWxhbmQiCj4gPiArCXNlbGVjdCBCUjJfUEFDS0FHRV9I
QVNfTElCRUdMX1dBWUxBTkQKPiA+ICsJc2VsZWN0IEJSMl9QQUNLQUdFX0hBU19MSUJHQk0KPiA+
ICsKPiA+ICtlbmRjaG9pY2UKPiA+ICsKPiA+ICtjb25maWcgQlIyX1BBQ0tBR0VfU1VOWElfTUFM
SV9VVEdBUkRfUExBVEZPUk0KPiA+ICsJc3RyaW5nCj4gPiArCWRlZmF1bHQgImZiZGV2IiBpZiBC
UjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9GQkRFVgo+ID4gKwlkZWZhdWx0ICJ3YXlsYW5k
IiBpZiBCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9XQVlMQU5ECj4gPiArCj4gPiAgZW5k
aWYKPiA+ICAKPiA+ICBjb21tZW50ICJzdW54aS1tYWxpLXV0Z2FyZCBuZWVkcyBhbiBFQUJJaGYg
Z2xpYmMgdG9vbGNoYWluIgo+ID4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uvc3VueGktbWFsaS11dGdh
cmQvc3VueGktbWFsaS11dGdhcmQubWsgYi9wYWNrYWdlL3N1bnhpLW1hbGktdXRnYXJkL3N1bnhp
LW1hbGktdXRnYXJkLm1rCj4gPiBpbmRleCBmNjkzNjY3OTU1Li4yM2M2ZThlYzZlIDEwMDY0NAo+
ID4gLS0tIGEvcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC9zdW54aS1tYWxpLXV0Z2FyZC5tawo+
ID4gKysrIGIvcGFja2FnZS9zdW54aS1tYWxpLXV0Z2FyZC9zdW54aS1tYWxpLXV0Z2FyZC5tawo+
ID4gQEAgLTI0LDkgKzI0LDkgQEAgZW5kaWYKPiA+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRf
SU5TVEFMTF9TVEFHSU5HX0NNRFMKPiA+ICAJbWtkaXIgLXAgJChTVEFHSU5HX0RJUikvdXNyL2xp
YiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZQo+ID4gIAo+ID4gLQljcCAtcmYgJChARCkvJChT
VU5YSV9NQUxJX1VUR0FSRF9SRVYpLyQoU1VOWElfTUFMSV9VVEdBUkRfQVJDSCkvZmJkZXYvKi5z
byogXAo+ID4gKwljcCAtcmYgJChARCkvJChTVU5YSV9NQUxJX1VUR0FSRF9SRVYpLyQoU1VOWElf
TUFMSV9VVEdBUkRfQVJDSCkvJChCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9QTEFURk9S
TSkvKi5zbyogXAo+ID4gIAkJJChTVEFHSU5HX0RJUikvdXNyL2xpYi8KPiA+IC0JY3AgLXJmICQo
QEQpL2luY2x1ZGUvZmJkZXYvKiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS8KPiA+ICsJY3Ag
LXJmICQoQEQpL2luY2x1ZGUvJChCUjJfUEFDS0FHRV9TVU5YSV9NQUxJX1VUR0FSRF9QTEFURk9S
TSkvKiAkKFNUQUdJTkdfRElSKS91c3IvaW5jbHVkZS8KPiA+ICAKPiA+ICAJJChJTlNUQUxMKSAt
RCAtbSAwNjQ0IHBhY2thZ2Uvc3VueGktbWFsaS11dGdhcmQvZWdsLnBjIFwKPiA+ICAJCSQoU1RB
R0lOR19ESVIpL3Vzci9saWIvcGtnY29uZmlnL2VnbC5wYwo+ID4gQEAgLTM0LDkgKzM0LDIxIEBA
IGRlZmluZSBTVU5YSV9NQUxJX1VUR0FSRF9JTlNUQUxMX1NUQUdJTkdfQ01EUwo+ID4gIAkJJChT
VEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvZ2xlc3YyLnBjCj4gPiAgZW5kZWYKPiA+ICAK
PiA+ICtpZmVxICgkKEJSMl9QQUNLQUdFX1NVTlhJX01BTElfVVRHQVJEX1dBWUxBTkQpLHkpCj4g
PiArZGVmaW5lIFNVTlhJX01BTElfVVRHQVJEX0lOU1RBTExfRklYVVBfU1RBR0lOR19QQ19GSUxF
Uwo+ID4gKwlzZWQgLWUgJy9eQ2ZsYWdzOi9zLyQkLyAtRFdMX0VHTF9QTEFURk9STS8nIFwKPiA+
ICsJCS1lICcvXlJlcXVpcmVzOi9zLyQkLyB3YXlsYW5kLWNsaWVudCB3YXlsYW5kLXNlcnZlci8n
IFwKPiA+ICsJCS1pICQoU1RBR0lOR19ESVIpL3Vzci9saWIvcGtnY29uZmlnL2VnbC5wYwo+ID4g
KwlzZWQgLWUgJy9eUmVxdWlyZXM6L3MvJCQvIHdheWxhbmQtY2xpZW50IHdheWxhbmQtc2VydmVy
LycgXAo+ID4gKwkJLWkgJChTVEFHSU5HX0RJUikvdXNyL2xpYi9wa2djb25maWcvZ2xlc3YyLnBj
Cj4gPiArZW5kZWYKPiA+ICtTVU5YSV9NQUxJX1VUR0FSRF9QT1NUX0lOU1RBTExfVEFSR0VUX0hP
T0tTICs9IFNVTlhJX01BTElfVVRHQVJEX0lOU1RBTExfRklYVVBfU1RBR0lOR19QQ19GSUxFUwo+
ID4gK1NVTlhJX01BTElfVVRHQVJEX0RFUEVOREVOQ0lFUyArPSB3YXlsYW5kCj4gPiArZW5kaWYK
PiA+ICsKPiA+ICBkZWZpbmUgU1VOWElfTUFMSV9VVEdBUkRfSU5TVEFMTF9UQVJHRVRfQ01EUwo+
ID4gIAlta2RpciAtcCAkKFRBUkdFVF9ESVIpL3Vzci9saWIKPiA+IC0JY3AgLXJmICQoQEQpLyQo
U1VOWElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJX01BTElfVVRHQVJEX0FSQ0gpL2ZiZGV2Lyou
c28qIFwKPiA+ICsJY3AgLXJmICQoQEQpLyQoU1VOWElfTUFMSV9VVEdBUkRfUkVWKS8kKFNVTlhJ
X01BTElfVVRHQVJEX0FSQ0gpLyQoQlIyX1BBQ0tBR0VfU1VOWElfTUFMSV9VVEdBUkRfUExBVEZP
Uk0pLyouc28qIFwKPiA+ICAJCSQoVEFSR0VUX0RJUikvdXNyL2xpYi8KPiA+ICBlbmRlZgo+ID4g
IAo+ID4gLS0gCj4gPiAyLjQwLjAKPiA+IAo+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiA+IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiA+IGJ1aWxk
cm9vdEBidWlsZHJvb3Qub3JnCj4gPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1h
bi9saXN0aW5mby9idWlsZHJvb3QKPiA+IAo+IAo+IENoZWVycywKPiDigJRBZHJpw6FuCj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3Qg
bWFpbGluZyBsaXN0Cj4gYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QKCkNoZWVycywK4oCUQWRyacOh
bgo=

--v6oSqsi/gnRSPFK+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABEDAB0WIQRao7wzT9fjNp58d7KRxVnb5MkSOwUCZFo9fQAKCRCRxVnb5MkS
Oxf3AJ4htlCer2oCrMWo6lAcl9GPwd74AgCfVLoLdfxwUtP0wqtUavAs20yorHg=
=E6Uy
-----END PGP SIGNATURE-----

--v6oSqsi/gnRSPFK+--

--===============5669948932361486976==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5669948932361486976==--
