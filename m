Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E672CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 07:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6710B40148;
	Sun, 19 Dec 2021 07:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gEVkS5IO81A2; Sun, 19 Dec 2021 07:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AF444014C;
	Sun, 19 Dec 2021 07:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4D021BF2C2
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C132F60B3D
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 07:22:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=arachnodroid.de
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eC90X8DnGv14 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 07:22:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from v220200749773122244.hotsrv.de (unknown
 [IPv6:2a03:4000:47:39d:747f:15ff:fe4f:d530])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A528F60AB0
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arachnodroid.de;
 s=dkim; t=1639898551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wuwUuqE9IyCaKsxMt5ueYn9njrMKUG+2U8SWDORjVqI=;
 b=bgQXcilNjJ/7ZdZHO0U3TCEa/Y5T87vKdDwvH2a/GOJVqq5aQHadAVtJ+mWELZEs4IpXMZ
 ypegskQHTyrL8iBRTlOhY7xEF/w2UXr5Ck5xRoG6BndUAwU3eItFs83iexGVp4KdgX1Icv
 YJNlLQ9wrdTpUjN/oShqcdl84UBxM04=
Received: from [192.168.1.13] (ip4d1580a8.dynamic.kabel-deutschland.de
 [77.21.128.168])
 by v220200749773122244.hotsrv.de (OpenSMTPD) with ESMTPSA id 36b38c58
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 07:22:31 +0000 (UTC)
From: Michael Taubert <info@arachnodroid.de>
To: buildroot@buildroot.org
References: <20210612223011.26118-1-ps.report@gmx.net>
 <a9d377d8-61f7-edc1-06f6-03291c100dca@mind.be>
 <c8c49a7c-fea0-c96c-ba23-4ff17a1c0d3e@arachnodroid.de>
Message-ID: <63b4baee-8e6f-ac56-8c4d-1508bedc7f37@arachnodroid.de>
Date: Sun, 19 Dec 2021 08:22:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <c8c49a7c-fea0-c96c-ba23-4ff17a1c0d3e@arachnodroid.de>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkhCgpHb3QgYmFjayB0byB0aGlzIHRvcGljIHRoaXMgbW9ybmluZy4KCkFjY29yZGluZyB0byB0
aGlzIGxpbmUgZm9yIFYzRC9WQzQ6CgpzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0RSSTMgaWYg
QlIyX1BBQ0tBR0VfWE9SRzcKCk1lc2EzRCB3aWxsIGJlIGJ1aWx0IHdpdGggRFJJMyBzdXBwb3J0
IG9ubHkgaWYgeG9yZyBpcyBnb2luZyB0byBiZSB1c2VkCnRvby4gVGhvdWdoIEknbSBhY3R1YWxs
eSB1c2luZyB4b3JnLCBhbmQgY2FuIGNvbmZpcm0gdGhhdCBpcyBjb21waWxpbmcKcHJvcGVybHkg
d2l0aCBYLCBJIG1heSBoYXZlIGEgc3dpdGNoIHRvIHdheWxhbmQgYW55dGltZSBzb29uLiBJcyB4
b3JnCnJlYWxseSByZXF1aXJlZD8KCkkgbXVzdCBhZG1pdCB0aGF0IHRoZSBidWlsZCBkaWQgbm90
IGNvbXBsZXRlLCBkdWUgdG8gYW4gZXJyb3Igd2l0aApsaWJuc3MuIFNvIGl0J3MganVzdCB3aGF0
IEkgZ290IGZyb20gdGhlIGJ1aWxkIGxvZ3MuCgpSZWdhcmRzLApNaWNoYWVsCgpwLnMuIFRodW5k
ZXJiaXJkIGNhdXNlZCBhIG1lc3Mgd2l0aCB0aGUgbGFzdCBtYWlsLCBzb21laG93LiBTb3JyeS4K
CkFtIDEyLzE5LzIxIHVtIDg6MTQgQU0gc2NocmllYiBNaWNoYWVsIFRhdWJlcnQ6Cj4gSGkhCj4g
Cj4gR290IGJhY2sgdG8gdGhpcyB0b3BpYyB0aGlzIG1vcm5pbmcuCj4gCj4gQWNjb3JkaW5nIHRv
IHRoaXMgbGluZToKPiAKPiBzZWxlY3QgQlIyX1BBQ0tBR0VfTUVTQTNEX0RSSTMgaWYgQlIyX1BB
Q0tBR0VfWE9SRzcKPiAKPiBNZXNhM0Qgd2lsbCBiZSBidWlsdCB3aXRoIERSSTMgc3VwcG9ydCBv
bmx5IGlmIHhvcmcgaXMgZ29pbmcgdG8gYmUgdXNlZCAKPiB0b28uIFRob3VnaCBJJ20gYWN0dWFs
bHkgdXNpbmcgeG9yZywgYW5kIGNhbiBjb25maXJtIHRoYXQgaXMgY29tcGlsaW5nIAo+IHByb3Bl
cmx5IHdpdGggWCwgSSBtYXkgaGF2ZSBhIHN3aXRjaCB0byB3YXlsYW5kIGFueXRpbWUgc29vbi4g
SXMgeG9yZyAKPiByZWFsbHkgcmVxdWlyZWQ/Cj4gCj4gSSBtdXN0IGFkbWl0IHRoYXQgaXQKPiAK
PiBSZWdhcmRzLAo+IE1pY2hhZWwKPiAKPiBBbSAxMi8xNy8yMSB1bSAxMDowMCBQTSBzY2hyaWVi
IEFybm91dCBWYW5kZWNhcHBlbGxlOgo+Pgo+Pgo+PiBPbiAxMy8wNi8yMDIxIDAwOjMwLCBQZXRl
ciBTZWlkZXJlciB3cm90ZToKPj4+IEFkZCBjb25maWcgb3B0aW9uIGZvciBEUkkzIHN1cHBvcnQg
YW5kIHVzZSBpdCBpbnN0ZWFkCj4+PiBvZiBEUkkzIGVuYWJsZS9kaXNhYmxlIGxvZ2ljIGluICou
bWsgZmlsZS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBQZXRlciBTZWlkZXJlciA8cHMucmVwb3J0
QGdteC5uZXQ+Cj4+Cj4+IMKgwqBBcyBkaXNjdXNzZWQgaW4gYW5vdGhlciB0aHJlYWQsIEkgYXBw
bGllZCBhIGhlYXZpbHkgbW9kaWZpZWQgdmVyc2lvbiAKPj4gb2YgYm90aCBwYXRjaGVzIHRvIG1h
c3RlciwgdGhhbmtzLiBQbGVhc2UgdHJ5IGFnYWluIGlmIG1hc3RlciB3b3JrcyAKPj4gZm9yIHlv
dS4KPj4KPj4gwqDCoFJlZ2FyZHMsCj4+IMKgwqBBcm5vdXQKPj4KPj4+IC0tLQo+Pj4gwqAgcGFj
a2FnZS9tZXNhM2QvQ29uZmlnLmluIHzCoCA4ICsrKysrKysrCj4+PiDCoCBwYWNrYWdlL21lc2Ez
ZC9tZXNhM2QubWsgfCAxMiArKysrKysrLS0tLS0KPj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMTUg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9tZXNhM2QvQ29uZmlnLmluIGIvcGFja2FnZS9tZXNhM2QvQ29uZmlnLmluCj4+PiBpbmRleCBk
MWIzYWYyMDU0Li4zNmFjZDk3NThjIDEwMDY0NAo+Pj4gLS0tIGEvcGFja2FnZS9tZXNhM2QvQ29u
ZmlnLmluCj4+PiArKysgYi9wYWNrYWdlL21lc2EzZC9Db25maWcuaW4KPj4+IEBAIC0xNiw2ICsx
NiwxMSBAQCBtZW51Y29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRAo+Pj4gwqAgaWYgQlIyX1BBQ0tB
R0VfTUVTQTNECj4+PiArY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzCj4+PiArwqDCoMKg
IGJvb2wgIkVuYWJsZSBEUkkzIHN1cHBvcnQiCj4+PiArwqDCoMKgIGhlbHAKPj4+ICvCoMKgwqDC
oMKgIEVuYWJsZSBEUkkzIHN1cHBvcnQuCj4+PiArCj4+PiDCoCAjIFNvbWUgR2FsbGl1bSBkcml2
ZXIgbmVlZHMgbGliZWxmIHdoZW4gYnVpbHQgd2l0aCBMTFZNIHN1cHBvcnQKPj4+IMKgIGNvbmZp
ZyBCUjJfUEFDS0FHRV9NRVNBM0RfTkVFRFNfRUxGVVRJTFMKPj4+IMKgwqDCoMKgwqAgYm9vbAo+
Pj4gQEAgLTY1LDYgKzcwLDggQEAgY29uZmlnIEJSMl9QQUNLQUdFX01FU0EzRF9EUklfRFJJVkVS
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgIUJSMl9QQUNLQUdFX01FU0EzRF9PUEVOR0xfR0xYICYm
IFwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCAhQlIyX1BBQ0tBR0VfTUVTQTNEX09QRU5HTF9FR0wg
JiYgXAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgICFCUjJfUEFDS0FHRV9NRVNBM0RfT1NNRVNBX0dB
TExJVU0KPj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzIGlmIFwKPj4+
ICvCoMKgwqDCoMKgwqDCoCAoQlIyX1BBQ0tBR0VfWE9SRzcgJiYgQlIyX1RPT0xDSEFJTl9IQVNf
U1lOQ180KQo+Pj4gwqDCoMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfWExJQl9MSUJYU0hNRkVO
Q0UgaWYgXAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIChCUjJfUEFDS0FHRV9YT1JHNyAmJiBCUjJf
VE9PTENIQUlOX0hBU19TWU5DXzQpCj4+PiBAQCAtMzU5LDYgKzM2Niw3IEBAIGNvbmZpZyBCUjJf
UEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUl9JTlRFTAo+Pj4gwqDCoMKgwqDCoCBkZXBlbmRz
IG9uIEJSMl9UT09MQ0hBSU5fSEVBREVSU19BVF9MRUFTVF8zXzE3ICMgbWVtZmQuaAo+Pj4gwqDC
oMKgwqDCoCBkZXBlbmRzIG9uIEJSMl9UT09MQ0hBSU5fVVNFU19HTElCQyAjIGlmdW5jLCBzdGF0
aWNfYXNzZXJ0Cj4+PiDCoMKgwqDCoMKgIGRlcGVuZHMgb24gQlIyX1BBQ0tBR0VfWE9SRzcgIyB4
b3JncHJvdG8KPj4+ICvCoMKgwqAgc2VsZWN0IEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzCj4+PiDC
oMKgwqDCoMKgIHNlbGVjdCBCUjJfUEFDS0FHRV9NRVNBM0RfVlVMS0FOX0RSSVZFUgo+Pj4gwqDC
oMKgwqDCoCBzZWxlY3QgQlIyX1BBQ0tBR0VfWE9SR1BST1RPCj4+PiDCoMKgwqDCoMKgIHNlbGVj
dCBCUjJfUEFDS0FHRV9YTElCX0xJQlhTSE1GRU5DRQo+Pj4gZGlmZiAtLWdpdCBhL3BhY2thZ2Uv
bWVzYTNkL21lc2EzZC5tayBiL3BhY2thZ2UvbWVzYTNkL21lc2EzZC5tawo+Pj4gaW5kZXggNWM1
ZjhhMzNmMy4uZGE2ZTU1YmY5MyAxMDA2NDQKPj4+IC0tLSBhL3BhY2thZ2UvbWVzYTNkL21lc2Ez
ZC5tawo+Pj4gKysrIGIvcGFja2FnZS9tZXNhM2QvbWVzYTNkLm1rCj4+PiBAQCAtMzUsNiArMzUs
MTIgQEAgaWZlcSAoJChCUjJfVE9PTENIQUlOX0VYVEVSTkFMX0NPREVTT1VSQ0VSWV9BUk0pLHkp
Cj4+PiDCoCBNRVNBM0RfQ09ORl9PUFRTICs9IC1EYl9hc25lZWRlZD1mYWxzZQo+Pj4gwqAgZW5k
aWYKPj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9EUkkzKSx5KQo+Pj4gK01FU0EzRF9D
T05GX09QVFMgKz0gLURkcmkzPWVuYWJsZWQKPj4+ICtlbHNlCj4+PiArTUVTQTNEX0NPTkZfT1BU
UyArPSAtRGRyaTM9ZGlzYWJsZWQKPj4+ICtlbmRpZgo+Pj4gKwo+Pj4gwqAgaWZlcSAoJChCUjJf
UEFDS0FHRV9NRVNBM0RfTExWTSkseSkKPj4+IMKgIE1FU0EzRF9ERVBFTkRFTkNJRVMgKz0gaG9z
dC1sbHZtIGxsdm0KPj4+IMKgIE1FU0EzRF9NRVNPTl9FWFRSQV9CSU5BUklFUyArPSAKPj4+IGxs
dm0tY29uZmlnPSckKFNUQUdJTkdfRElSKS91c3IvYmluL2xsdm0tY29uZmlnJwo+Pj4gQEAgLTEy
MiwxMyArMTI4LDEwIEBAIGVuZGlmCj4+PiDCoCBpZmVxICgkKEJSMl9QQUNLQUdFX01FU0EzRF9E
UklfRFJJVkVSKSwpCj4+PiDCoCBNRVNBM0RfQ09ORl9PUFRTICs9IFwKPj4+IC3CoMKgwqAgLURk
cmktZHJpdmVycz0gLURkcmkzPWRpc2FibGVkCj4+PiArwqDCoMKgIC1EZHJpLWRyaXZlcnM9Cj4+
PiDCoCBlbHNlCj4+PiDCoCBpZmVxICgkKEJSMl9QQUNLQUdFX1hMSUJfTElCWFNITUZFTkNFKSx5
KQo+Pj4gwqAgTUVTQTNEX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYnhzaG1mZW5jZQo+Pj4gLU1F
U0EzRF9DT05GX09QVFMgKz0gLURkcmkzPWVuYWJsZWQKPj4+IC1lbHNlCj4+PiAtTUVTQTNEX0NP
TkZfT1BUUyArPSAtRGRyaTM9ZGlzYWJsZWQKPj4+IMKgIGVuZGlmCj4+PiDCoCBNRVNBM0RfQ09O
Rl9PUFRTICs9IFwKPj4+IMKgwqDCoMKgwqAgLURzaGFyZWQtZ2xhcGk9ZW5hYmxlZCBcCj4+PiBA
QCAtMTQyLDcgKzE0NSw2IEBAIE1FU0EzRF9DT05GX09QVFMgKz0gXAo+Pj4gwqAgZWxzZQo+Pj4g
wqAgTUVTQTNEX0RFUEVOREVOQ0lFUyArPSB4bGliX2xpYnhzaG1mZW5jZQo+Pj4gwqAgTUVTQTNE
X0NPTkZfT1BUUyArPSBcCj4+PiAtwqDCoMKgIC1EZHJpMz1lbmFibGVkIFwKPj4+IMKgwqDCoMKg
wqAgLUR2dWxrYW4tZHJpdmVycz0kKHN1YnN0IAo+Pj4gJChzcGFjZSksJChjb21tYSksJChNRVNB
M0RfVlVMS0FOX0RSSVZFUlMteSkpCj4+PiDCoCBlbmRpZgo+Pj4KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWls
ZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9idWlsZHJvb3QK
