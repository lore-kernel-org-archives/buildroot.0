Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDEFE7D0A2
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 19:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84AEA81ED2;
	Thu, 21 Sep 2023 19:24:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 84AEA81ED2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6NrclVGPA04w; Thu, 21 Sep 2023 19:24:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA1C981E02;
	Thu, 21 Sep 2023 19:24:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA1C981E02
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8CE8E1BF390
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:24:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 62E67401A1
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 19:24:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62E67401A1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3WpyGq8VqyYg for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 19:24:49 +0000 (UTC)
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 893584010F
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 19:24:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 893584010F
Received: from [192.168.50.162] ([84.33.144.138])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jPI5qZbkOhgyOjPI5qmy38; Thu, 21 Sep 2023 21:24:46 +0200
Message-ID: <6cc2bc56-81a3-49c4-81fb-9912c6bacf42@benettiengineering.com>
Date: Thu, 21 Sep 2023 21:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
 <20230918081559.1025134-1-giulio.benetti@benettiengineering.com>
 <983c8224-7628-6b66-6f32-a29d398e17f8@mind.be>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <983c8224-7628-6b66-6f32-a29d398e17f8@mind.be>
X-CMAE-Envelope: MS4xfKgUYqGOhSL+8adMmgQ91Yn9ertRd1I4xHtz1DWcTzpAe4cmEFAz/2QhYANBuZH4FfaSpnbg8NP34a4c6/edPSzQ53kYAfWSltFAYppEXkUdcpArs1Fs
 L15Bs9/QBW60MjmIooFz/EAjNkmPjdHgfaiDBWvL0+KR47bn7rnMptJCZlLsvdN+LURRwTJu6godGSIIRtBK3TXkJE4/k36CiZ8xspLtLJOx8rFDPHLmUy5o
 UWZ0OtVGiHqmKL01feUfMmykP/hKu0vPN9MpJrMsmDxRtICP2yctGTa4QhsAS3jb9uj5loj2oPWPB0a2+dfv0MUNDbN6mnavOdKCKVQaf0baWQrT7WRAxdIp
 9wkvNPSoGMgJev1h7F4uSjJC5Tl7eco+ud0WPvDrD3yt/CbOxuQ27gWkjTgnu1IIzKvhp7+5JJofLN5LutkNipOFGXq1QhmmsBBZnIlGeGfbHh7k68w9oO/w
 xf+8DTL6jpCfNDjnSiVvzGJ5DQmlk5l8FYXlJQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695324286; bh=8YKi+7dUbQksf1Nb2efiz5qdTNW2juuetirgevk1rq0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=UKIgAMRJIjTP7XsIjpcyWaRxqeRGTyYszb6FTM73PWs3MvK41++utTcWSVIV0j+R1
 NGCleCEx6EWgZ+/3rmmxdpa76kng4StVK8GW7HtjOERgeL3dGKa8TCBmPXpo7uNL3/
 BliWr2AoBPCtMTLXnaE7ytjSF6RTJk3raxdMV4BxMukUd7pG4R35aHb/nfU67IHCHb
 iL7C0RGvofmRAuWebDUduuWByOpPAlA/QFvW6ynp/YqwVh61ntjdrcgSpU+73xVK7g
 KtsbD9B6ozzOtEqU9EG/zb7MtrURZqwjWPSKzhih9+6K/AN+a/mQcpEp5DxegOEIZ9
 fcMUeUGmXKIDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=UKIgAMRJ
Subject: Re: [Buildroot] [PATCH v2] package/apache: add option
 BR2_PACKAGE_APACHE_UTILS_ONLY
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMjEvMDkvMjMgMjA6NTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gIMKgSGkgR2l1bGlvCj4gCj4gT24gMTgvMDkvMjAyMyAxMDoxNSwg
R2l1bGlvIEJlbmV0dGkgd3JvdGU6Cj4+IEZyb206IEdpdWxpbyBCZW5ldHRpIDxnaXVsaW8uYmVu
ZXR0aSt0ZWt2b3hAYmVuZXR0aWVuZ2luZWVyaW5nLmNvbT4KPj4KPj4gV2l0aCBvcHRpb24gQlIy
X1BBQ0tBR0VfQVBBQ0hFX1VUSUxTX09OTFkgb25seSBodGRpZ2VzdCBhbmQgaHRwYXNzd2QgYXJl
Cj4+IGJ1aWx0IGFuZCBpbnN0YWxsZWQuIFRoaXMgaXMgdXNlZnVsIGZvciBNb25nb29zZSBjcmVk
ZW50aWFsIGhhbmRsaW5nLgo+Pgo+PiBDYzogSmltIFJlaW5oYXJ0IDxqaW1yQHRla3ZveC5jb20+
Cj4+IENjOiBKYW1lcyBBdXRyeSA8amF1dHJ5QHRla3ZveC5jb20+Cj4+IENjOiBNYXR0aGV3IE1h
cm9uIDxtYXR0aGV3bUB0ZWt2b3guY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHaXVsaW8gQmVuZXR0
aSAKPj4gPGdpdWxpby5iZW5ldHRpK3Rla3ZveEBiZW5ldHRpZW5naW5lZXJpbmcuY29tPgo+PiAt
LS0KPj4gVjEtPlYyOgo+PiAqIEhpZGUgIkV4dGVybmFsIEFwYWNoZSBtb2R1bGVzIiBpZiBCUjJf
UEFDS0FHRV9BUEFDSEVfVVRJTFNfT05MWSBpcyAKPj4gZW5hYmxlZAo+PiAtLS0KPj4gwqAgcGFj
a2FnZS9Db25maWcuaW7CoMKgwqDCoMKgwqDCoCB8wqAgMiArLQo+PiDCoCBwYWNrYWdlL2FwYWNo
ZS9Db25maWcuaW4gfMKgIDcgKysrKysrKwo+PiDCoCBwYWNrYWdlL2FwYWNoZS9hcGFjaGUubWsg
fCAyMyArKysrKysrKysrKysrKysrKysrKystLQo+PiDCoCAzIGZpbGVzIGNoYW5nZWQsIDI5IGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL0Nv
bmZpZy5pbiBiL3BhY2thZ2UvQ29uZmlnLmluCj4+IGluZGV4IGU4ZGJhZGFkZjMuLjZmNDg5OGUx
NWEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvQ29u
ZmlnLmluCj4+IEBAIC0yMjc4LDcgKzIyNzgsNyBAQCBtZW51ICJOZXR3b3JraW5nIGFwcGxpY2F0
aW9ucyIKPj4gwqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvYWxmcmVkL0NvbmZpZy5pbiIKPj4g
wqDCoMKgwqDCoCBzb3VyY2UgInBhY2thZ2UvYW9ldG9vbHMvQ29uZmlnLmluIgo+PiDCoMKgwqDC
oMKgIHNvdXJjZSAicGFja2FnZS9hcGFjaGUvQ29uZmlnLmluIgo+PiAtaWYgQlIyX1BBQ0tBR0Vf
QVBBQ0hFCj4+ICtpZiBCUjJfUEFDS0FHRV9BUEFDSEUgJiYgIUJSMl9QQUNLQUdFX0FQQUNIRV9V
VElMU19PTkxZCj4+IMKgIG1lbnUgIkV4dGVybmFsIEFwYWNoZSBtb2R1bGVzIgo+PiDCoMKgwqDC
oMKgIHNvdXJjZSAicGFja2FnZS9tb2RzZWN1cml0eTIvQ29uZmlnLmluIgo+PiDCoCBlbmRtZW51
Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2FwYWNoZS9Db25maWcuaW4gYi9wYWNrYWdlL2FwYWNo
ZS9Db25maWcuaW4KPj4gaW5kZXggMjcwMjk2YmNlNC4uYWFkMzVmYjVkYSAxMDA2NDQKPj4gLS0t
IGEvcGFja2FnZS9hcGFjaGUvQ29uZmlnLmluCj4+ICsrKyBiL3BhY2thZ2UvYXBhY2hlL0NvbmZp
Zy5pbgo+PiBAQCAtMTcsNiArMTcsMTIgQEAgY29uZmlnIEJSMl9QQUNLQUdFX0FQQUNIRQo+PiDC
oCBpZiBCUjJfUEFDS0FHRV9BUEFDSEUKPj4gK2NvbmZpZyBCUjJfUEFDS0FHRV9BUEFDSEVfVVRJ
TFNfT05MWQo+IAo+ICDCoCJOZWdhdGl2ZSIgb3B0aW9ucyAoaS5lLiBvcHRpb25zIHRoYXQgX2Rp
c2FibGVfIHBhcnQgb2YgYSBwYWNrYWdlKSAKPiBvZnRlbiB0dXJuIG91dCB0byBiZSBhIHBhaW4g
bGF0ZXIuIFNvIGl0J3MgYmV0dGVyIHRvIGNhbGwgaXQgCj4gIkJSMl9QQUNLQUdFX0FQQUNIRV9E
QUVNT04iIGFuZCBkZWZhdWx0IGl0IHRvIHkuCgpvaywgSSBkbyBpdCBmb3IgVjMsCgo+PiArwqDC
oMKgIGJvb2wgImFwYWNoZS11dGlscy1vbmx5Igo+PiArwqDCoMKgIGhlbHAKPj4gK8KgwqDCoMKg
wqAgUHJvdmlkZSBvbmx5IEFwYWNoZSB1dGlscyBsaWtlIGh0ZGlnZXN0IGFuZCBodHBhc3N3ZC4K
Pj4gKwo+PiAraWYgIUJSMl9QQUNLQUdFX0FQQUNIRV9VVElMU19PTkxZCj4+IMKgIGNob2ljZQo+
PiDCoMKgwqDCoMKgIHByb21wdCAiTXVsdGktUHJvY2Vzc2luZyBNb2R1bGUgKE1QTSkiCj4+IMKg
wqDCoMKgwqAgZGVmYXVsdCBCUjJfUEFDS0FHRV9BUEFDSEVfTVBNX1dPUktFUgo+PiBAQCAtNDAs
NiArNDYsNyBAQCBjb25maWcgQlIyX1BBQ0tBR0VfQVBBQ0hFX01QTV9XT1JLRVIKPj4gwqDCoMKg
wqDCoMKgwqAgSW1wbGVtZW50cyBhIGh5YnJpZCBtdWx0aS10aHJlYWRlZCBtdWx0aS1wcm9jZXNz
IHdlYiBzZXJ2ZXIKPj4gwqAgZW5kY2hvaWNlCj4+ICtlbmRpZgo+PiDCoCBlbmRpZgo+PiBkaWZm
IC0tZ2l0IGEvcGFja2FnZS9hcGFjaGUvYXBhY2hlLm1rIGIvcGFja2FnZS9hcGFjaGUvYXBhY2hl
Lm1rCj4+IGluZGV4IDMyMGE2YWQyMGUuLjQ5ZWRhYjgzOGEgMTAwNjQ0Cj4+IC0tLSBhL3BhY2th
Z2UvYXBhY2hlL2FwYWNoZS5tawo+PiArKysgYi9wYWNrYWdlL2FwYWNoZS9hcGFjaGUubWsKPj4g
QEAgLTEyLDggKzEyLDYgQEAgQVBBQ0hFX0xJQ0VOU0VfRklMRVMgPSBMSUNFTlNFCj4+IMKgIEFQ
QUNIRV9DUEVfSURfVkVORE9SID0gYXBhY2hlCj4+IMKgIEFQQUNIRV9DUEVfSURfUFJPRFVDVCA9
IGh0dHBfc2VydmVyCj4+IMKgIEFQQUNIRV9TRUxJTlVYX01PRFVMRVMgPSBhcGFjaGUKPj4gLSMg
TmVlZGVkIGZvciBtb2RfcGhwCj4+IC1BUEFDSEVfSU5TVEFMTF9TVEFHSU5HID0gWUVTCj4+IMKg
ICMgV2UgaGF2ZSBhIHBhdGNoIHRvdWNoaW5nIGNvbmZpZ3VyZS5pbiBhbmQgTWFrZWZpbGUuaW4s
Cj4+IMKgICMgc28gd2UgbmVlZCB0byBhdXRvcmVjb25mOgo+PiDCoCBBUEFDSEVfQVVUT1JFQ09O
RiA9IFlFUwo+PiBAQCAtMzEsNiArMjksMjYgQEAgZWxzZSBpZmVxICgkKEJSMl9QQUNLQUdFX0FQ
QUNIRV9NUE1fV09SS0VSKSx5KQo+PiDCoCBBUEFDSEVfTVBNID0gd29ya2VyCj4+IMKgIGVuZGlm
Cj4+ICtpZmVxICgkKEJSMl9QQUNLQUdFX0FQQUNIRV9VVElMU19PTkxZKSx5KQo+PiArQVBBQ0hF
X0NPTkZfT1BUUyA9IFwKPj4gK8KgwqDCoCAtLXdpdGgtYXByPSQoU1RBR0lOR19ESVIpL3VzciBc
Cj4+ICvCoMKgwqAgLS13aXRoLWFwci11dGlsPSQoU1RBR0lOR19ESVIpL3VzciBcCj4+ICvCoMKg
wqAgLS13aXRoLXBjcmU9JChTVEFHSU5HX0RJUikvdXNyL2Jpbi9wY3JlMi1jb25maWcgXAo+IAo+
ICDCoENhbiB3ZSBtb3ZlIHRoZSBjb21tb24gb3B0aW9ucyBvdXQgb2YgdGhlIGNvbmRpdGlvbiwg
YW5kIHVzZSArPSBpbnNpZGUgCj4gdGhlIGNvbmRpdGlvbj8KClJpZ2h0LAoKPj4gK8KgwqDCoCAt
LXdpdGgtc3RhdGljLWh0ZGlnZXN0IFwKPj4gK8KgwqDCoCAtLXdpdGgtc3RhdGljLWh0cGFzc3dk
Cj4gCj4gIMKgVGhpcyBzb3VuZHMgbGlrZSB0aGV5J3JlIGxpbmtlZCBzdGF0aWNhbGx5PyBJcyB0
aGVyZSBhIHJlYXNvbiB0byBkbyAKPiB0aGF0IChvdGhlciB0aGFuIHRoYXQgeW91IGhhdmUgdG8g
aW5zdGFsbCB0aGUgc2hhcmVkIGxpYiB0byB0YXJnZXQsIG9mIAo+IGNvdXJzZSk/CgpJIHdhcyBj
dXJpb3VzIGFib3V0IHRoaXMgdG9vIGFuZCBzbyBJJ3ZlIHRyaWVkIHRvIGdpdmUgYToKJCBmaWxl
IGh0ZGlnZXN0CmFuZCBzYW1lIHRvIGh0cGFzc3dkIGFuZCB0aGV5IHR1cm5lZCBvdXQgdG8gYmUg
c2hhcmVkIGxpbmtlZCBiaW5hcmllcywKc28gdGhhdCAtLXdpdGgtc3RhdGljLSogb3B0aW9uIGlz
IHByZXR0eSBhbWJpZ3VvdXMuCgpJJ20gZ29pbmcgdG8gc2VuZCBWMyB3aXRoIHlvdXIgc3VnZ2Vz
dGlvbnMuCgpUaGFuayB5b3UgdmVyeSBtdWNoLgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5l
dHRpCkNFTyZDVE9AQmVuZXR0aSBFbmdpbmVlcmluZyBzYXMKCj4gIMKgUmVnYXJkcywKPiAgwqBB
cm5vdXQKPiAKPj4gKwo+PiArZGVmaW5lIEFQQUNIRV9CVUlMRF9DTURTCj4+ICvCoMKgwqAgJChU
QVJHRVRfTUFLRV9FTlYpICQoTUFLRSkgLUMgJChARCkvc3VwcG9ydCBodGRpZ2VzdCBodHBhc3N3
ZAo+PiArZW5kZWYKPj4gKwo+PiArZGVmaW5lIEFQQUNIRV9JTlNUQUxMX1RBUkdFVF9DTURTCj4+
ICvCoMKgwqAgJChJTlNUQUxMKSAtbSAwNzU1IC1EICQoQEQpL3N1cHBvcnQvaHRkaWdlc3QgCj4+
ICQoVEFSR0VUX0RJUikvdXNyL2Jpbi9odGRpZ2VzdAo+PiArwqDCoMKgICQoSU5TVEFMTCkgLW0g
MDc1NSAtRCAkKEBEKS9zdXBwb3J0L2h0cGFzc3dkIAo+PiAkKFRBUkdFVF9ESVIpL3Vzci9iaW4v
aHRwYXNzd2QKPj4gK2VuZGVmCj4+ICtlbHNlCj4+ICsjIE5lZWRlZCBmb3IgbW9kX3BocAo+PiAr
QVBBQ0hFX0lOU1RBTExfU1RBR0lORyA9IFlFUwo+PiArCj4+IMKgIEFQQUNIRV9DT05GX09QVFMg
PSBcCj4+IMKgwqDCoMKgwqAgLS1zeXNjb25mZGlyPS9ldGMvYXBhY2hlMiBcCj4+IMKgwqDCoMKg
wqAgLS13aXRoLWFwcj0kKFNUQUdJTkdfRElSKS91c3IgXAo+PiBAQCAtMTIxLDUgKzEzOSw2IEBA
IGRlZmluZSBBUEFDSEVfSU5TVEFMTF9JTklUX1NZU1RFTUQKPj4gwqDCoMKgwqDCoCAkKElOU1RB
TEwpIC1EIC1tIDY0NCBwYWNrYWdlL2FwYWNoZS9hcGFjaGUuc2VydmljZSBcCj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCAkKFRBUkdFVF9ESVIpL3Vzci9saWIvc3lzdGVtZC9zeXN0ZW0vYXBhY2hlLnNl
cnZpY2UKPj4gwqAgZW5kZWYKPj4gK2VuZGlmCj4+IMKgICQoZXZhbCAkKGF1dG90b29scy1wYWNr
YWdlKSkKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IGJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBz
Oi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxp
bmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5v
cmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
