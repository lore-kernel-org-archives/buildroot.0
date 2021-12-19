Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7987EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:16:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E9387831A5;
	Sun, 19 Dec 2021 07:16:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mkU7HlmYVHoG; Sun, 19 Dec 2021 07:16:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28F1E82D12;
	Sun, 19 Dec 2021 07:16:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7D91BF2C2
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1952E82D12
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U1Y0qymUbyBn for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:16:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9142782861
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1639898184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=S1YtwK8289svJUhbro02oBQn+S9L4LtBL+eNo9R2WP4=;
 b=Q4oOXH3mqzCuj/P3bTgqHnu+15G7HUK0PZRL07KpwG/gkNjzr7Z3QTtxX2anobqawp/Ll8
 xKj2WfajNvaQMBP3dKorrUXHhZp4Hg5bvXU9tAaZwM1EX7giCWp1f3t2D8+BMBj0tHrPeB
 1QTsdPUPALdwrhottc6p5dk78FX2WD8=
Received: from [192.168.1.13] (ip4d1580a8.dynamic.kabel-deutschland.de
 [77.21.128.168])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id 8577101c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Sun, 19 Dec 2021 07:16:24 +0000 (UTC)
To: Arnout Vandecappelle <arnout@mind.be>, Peter Seiderer
 <ps.report@gmx.net>, buildroot@buildroot.org
References: <20210612223011.26118-1-ps.report@gmx.net>
 <a9d377d8-61f7-edc1-06f6-03291c100dca@mind.be>
From: Michael Taubert <info@arachnodroid.de>
Message-ID: <0fefe76e-d266-4bf4-e208-621372e42f10@arachnodroid.de>
Date: Sun, 19 Dec 2021 08:16:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <a9d377d8-61f7-edc1-06f6-03291c100dca@mind.be>
Content-Language: en-US
Subject: Re: [Buildroot] [PATCH v1 1/2] package/mesa3d: add config option
 for DRI3 support
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, Marek Kraus <gamelaster@outlook.com>,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkhCgpHb3QgYmFjayB0byB0aGlzIHRvcGljIHRoaXMgbW9ybmluZy4KCkFjY29yZGluZyB0byB0
aGlzIGxpbmUgZm9yIFYzRC9WQzQ6CgpzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0RSSTMgaWYg
QlIyX1BBQ0tBR0VfWE9SRzcKCk1lc2EzRCB3aWxsIGJlIGJ1aWx0IHdpdGggRFJJMyBzdXBwb3J0
IG9ubHkgaWYgeG9yZyBpcyBnb2luZyB0byBiZSB1c2VkIAp0b28uIFRob3VnaCBJJ20gYWN0dWFs
bHkgdXNpbmcgeG9yZywgYW5kIGNhbiBjb25maXJtIHRoYXQgaXMgY29tcGlsaW5nIApwcm9wZXJs
eSB3aXRoIFgsIEkgbWF5IGhhdmUgYSBzd2l0Y2ggdG8gd2F5bGFuZCBhbnl0aW1lIHNvb24uIElz
IHhvcmcgCnJlYWxseSByZXF1aXJlZD8KCkkgbXVzdCBhZG1pdCB0aGF0IHRoZSBidWlsZCBkaWQg
bm90IGNvbXBsZXRlLCBkdWUgdG8gYW4gZXJyb3Igd2l0aCAKbGlibnNzLiBTbyBpdCdzIGp1c3Qg
d2hhdCBJIGdvdCBmcm9tIHRoZSBidWlsZCBsb2dzLgoKUmVnYXJkcywKTWljaGFlbAoKQW0gMTIv
MTcvMjEgdW0gMTA6MDAgUE0gc2NocmllYiBBcm5vdXQgVmFuZGVjYXBwZWxsZToKPiAKPiAKPiBP
biAxMy8wNi8yMDIxIDAwOjMwLCBQZXRlciBTZWlkZXJlciB3cm90ZToKPj4gQWRkIGNvbmZpZyBv
cHRpb24gZm9yIERSSTMgc3VwcG9ydCBhbmQgdXNlIGl0IGluc3RlYWQKPj4gb2YgRFJJMyBlbmFi
bGUvZGlzYWJsZSBsb2dpYyBpbiAqLm1rIGZpbGUuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFBldGVy
IFNlaWRlcmVyIDxwcy5yZXBvcnRAZ214Lm5ldD4KPiAKPiAgwqBBcyBkaXNjdXNzZWQgaW4gYW5v
dGhlciB0aHJlYWQsIEkgYXBwbGllZCBhIGhlYXZpbHkgbW9kaWZpZWQgdmVyc2lvbiAKPiBvZiBi
b3RoIHBhdGNoZXMgdG8gbWFzdGVyLCB0aGFua3MuIFBsZWFzZSB0cnkgYWdhaW4gaWYgbWFzdGVy
IHdvcmtzIGZvciAKPiB5b3UuCj4gCj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKPiAKPj4gLS0t
Cj4+IMKgIHBhY2thZ2UvbWVzYTNkL0NvbmZpZy5pbiB8wqAgOCArKysrKysrKwo+PiDCoCBwYWNr
YWdlL21lc2EzZC9tZXNhM2QubWsgfCAxMiArKysrKysrLS0tLS0KPj4gwqAgMiBmaWxlcyBjaGFu
Z2VkLCAxNSBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
cGFja2FnZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4+IGlu
ZGV4IGQxYjNhZjIwNTQuLjM2YWNkOTc1OGMgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvbWVzYTNk
L0NvbmZpZy5pbgo+PiArKysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPj4gQEAgLTE2LDYg
KzE2LDExIEBAIG1lbnVjb25maWcgQlIyX1BBQ0tBR0VfTUVTQTNECj4+IMKgIGlmIEJSMl9QQUNL
QUdFX01FU0EzRAo+PiArY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzCj4+ICvCoMKgwqAg
Ym9vbCAiRW5hYmxlIERSSTMgc3VwcG9ydCIKPj4gK8KgwqDCoCBoZWxwCj4+ICvCoMKgwqDCoMKg
IEVuYWJsZSBEUkkzIHN1cHBvcnQuCj4+ICsKPj4gwqAgIyBTb21lIEdhbGxpdW0gZHJpdmVyIG5l
ZWRzIGxpYmVsZiB3aGVuIGJ1aWx0IHdpdGggTExWTSBzdXBwb3J0Cj4+IMKgIGNvbmZpZyBCUjJf
UEFDS0FHRV9NRVNBM0RfTkVFRFNfRUxGVVRJTFMKPj4gwqDCoMKgwqDCoCBib29sCj4+IEBAIC02
NSw2ICs3MCw4IEBAIGNvbmZpZyBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJX0RSSVZFUgo+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgIUJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYICYmIFwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgICFCUjJfUEFDS0FHRV9NRVNBM0RfT1BFTkdMX0VHTCAmJiBcCj4+IMKg
wqDCoMKgwqDCoMKgwqDCoCAhQlIyX1BBQ0tBR0VfTUVTQTNEX09TTUVTQV9HQUxMSVVNCj4+ICvC
oMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzIGlmIFwKPj4gK8KgwqDCoMKgwqDC
oMKgIChCUjJfUEFDS0FHRV9YT1JHNyAmJiBCUjJfVE9PTENIQUlOX0hBU19TWU5DXzQpCj4+IMKg
wqDCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX1hMSUJfTElCWFNITUZFTkNFIGlmIFwKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIChCUjJfUEFDS0FHRV9YT1JHNyAmJiBCUjJfVE9PTENIQUlOX0hBU19T
WU5DXzQpCj4+IEBAIC0zNTksNiArMzY2LDcgQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9W
VUxLQU5fRFJJVkVSX0lOVEVMCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiBCUjJfVE9PTENIQUlO
X0hFQURFUlNfQVRfTEVBU1RfM18xNyAjIG1lbWZkLmgKPj4gwqDCoMKgwqDCoCBkZXBlbmRzIG9u
IEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyAjIGlmdW5jLCBzdGF0aWNfYXNzZXJ0Cj4+IMKgwqDC
oMKgwqAgZGVwZW5kcyBvbiBCUjJfUEFDS0FHRV9YT1JHNyAjIHhvcmdwcm90bwo+PiArwqDCoMKg
IHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfRFJJMwo+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJf
UEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgo+PiDCoMKgwqDCoMKgIHNlbGVjdCBCUjJfUEFD
S0FHRV9YT1JHUFJPVE8KPj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfWExJQl9MSUJY
U0hNRkVOQ0UKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tayBiL3BhY2th
Z2UvbWVzYTNkL21lc2EzZC5tawo+PiBpbmRleCA1YzVmOGEzM2YzLi5kYTZlNTViZjkzIDEwMDY0
NAo+PiAtLS0gYS9wYWNrYWdlL21lc2EzZC9tZXNhM2QubWsKPj4gKysrIGIvcGFja2FnZS9tZXNh
M2QvbWVzYTNkLm1rCj4+IEBAIC0zNSw2ICszNSwxMiBAQCBpZmVxICgkKEJSMl9UT09MQ0hBSU5f
RVhURVJOQUxfQ09ERVNPVVJDRVJZX0FSTSkseSkKPj4gwqAgTUVTQTNEX0NPTkZfT1BUUyArPSAt
RGJfYXNuZWVkZWQ9ZmFsc2UKPj4gwqAgZW5kaWYKPj4gK2lmZXEgKCQoQlIyX1BBQ0tBR0VfTUVT
QTNEX0RSSTMpLHkpCj4+ICtNRVNBM0RfQ09ORl9PUFRTICs9IC1EZHJpMz1lbmFibGVkCj4+ICtl
bHNlCj4+ICtNRVNBM0RfQ09ORl9PUFRTICs9IC1EZHJpMz1kaXNhYmxlZAo+PiArZW5kaWYKPj4g
Kwo+PiDCoCBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9MTFZNKSx5KQo+PiDCoCBNRVNBM0Rf
REVQRU5ERU5DSUVTICs9IGhvc3QtbGx2bSBsbHZtCj4+IMKgIE1FU0EzRF9NRVNPTl9FWFRSQV9C
SU5BUklFUyArPSAKPj4gbGx2bS1jb25maWc9JyQoU1RBR0lOR19ESVIpL3Vzci9iaW4vbGx2bS1j
b25maWcnCj4+IEBAIC0xMjIsMTMgKzEyOCwxMCBAQCBlbmRpZgo+PiDCoCBpZmVxICgkKEJSMl9Q
QUNLQUdFX01FU0EzRF9EUklfRFJJVkVSKSwpCj4+IMKgIE1FU0EzRF9DT05GX09QVFMgKz0gXAo+
PiAtwqDCoMKgIC1EZHJpLWRyaXZlcnM9IC1EZHJpMz1kaXNhYmxlZAo+PiArwqDCoMKgIC1EZHJp
LWRyaXZlcnM9Cj4+IMKgIGVsc2UKPj4gwqAgaWZlcSAoJChCUjJfUEFDS0FHRV9YTElCX0xJQlhT
SE1GRU5DRSkseSkKPj4gwqAgTUVTQTNEX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYnhzaG1mZW5j
ZQo+PiAtTUVTQTNEX0NPTkZfT1BUUyArPSAtRGRyaTM9ZW5hYmxlZAo+PiAtZWxzZQo+PiAtTUVT
QTNEX0NPTkZfT1BUUyArPSAtRGRyaTM9ZGlzYWJsZWQKPj4gwqAgZW5kaWYKPj4gwqAgTUVTQTNE
X0NPTkZfT1BUUyArPSBcCj4+IMKgwqDCoMKgwqAgLURzaGFyZWQtZ2xhcGk9ZW5hYmxlZCBcCj4+
IEBAIC0xNDIsNyArMTQ1LDYgQEAgTUVTQTNEX0NPTkZfT1BUUyArPSBcCj4+IMKgIGVsc2UKPj4g
wqAgTUVTQTNEX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYnhzaG1mZW5jZQo+PiDCoCBNRVNBM0Rf
Q09ORl9PUFRTICs9IFwKPj4gLcKgwqDCoCAtRGRyaTM9ZW5hYmxlZCBcCj4+IMKgwqDCoMKgwqAg
LUR2dWxrYW4tZHJpdmVycz0kKHN1YnN0IAo+PiAkKHNwYWNlKSwkKGNvbW1hKSwkKE1FU0EzRF9W
VUxLQU5fRFJJVkVSUy15KSkKPj4gwqAgZW5kaWYKPj4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RA
YnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5m
by9idWlsZHJvb3QK
