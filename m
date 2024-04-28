Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DCF3C4345F
	for <buildroot@archiver.kernel.org>; Sun, 28 Apr 2024 18:35:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0794A605AC;
	Sun, 28 Apr 2024 18:35:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qVdCecSlC3-B; Sun, 28 Apr 2024 18:35:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D462C6066B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D462C6066B;
	Sun, 28 Apr 2024 18:35:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3A8581BF344
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2722381F71
 for <buildroot@lists.busybox.net>; Sun, 28 Apr 2024 18:35:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WiTVtTH_lfXB for <buildroot@lists.busybox.net>;
 Sun, 28 Apr 2024 18:35:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.131;
 helo=smtpcmd12131.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E725081F6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E725081F6E
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E725081F6E
 for <buildroot@buildroot.org>; Sun, 28 Apr 2024 18:35:34 +0000 (UTC)
Received: from [192.168.50.121] ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 19N5sucs6TSwm19N5smGOV; Sun, 28 Apr 2024 20:35:31 +0200
Message-ID: <05114d73-760c-4a56-b655-3d0268158ddf@benettiengineering.com>
Date: Sun, 28 Apr 2024 20:35:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20240413074923.1082313-1-giulio.benetti@benettiengineering.com>
 <6446e4c0-3501-4875-8a89-4db3fb369911@mind.be>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <6446e4c0-3501-4875-8a89-4db3fb369911@mind.be>
X-CMAE-Envelope: MS4xfBZdfDNUQPCC7Lqn8hzhDXfIac7X5WBercHhCFDmXGhQ86JghJ1sTG0H5OwUZe7cwT5Q9oGkFP5NVZqQEoDuo14VGwacdYNqHPwPDaQkU3MAprKz9Mfc
 py0G8/gZiCArsjJtCYDUzNwAU+K8q7DW3Geep5TH1+e5GCALixTnYyauTquCzWzAEUpBQ7f4g00kStZu7F3byHWk450NUizuNLumuXlYAUvCTMfatqaELjLB
 m9drPcsd7pIQPO1tctUNNpjM2LLcCqwKtFeRHLtOf3HaQcEZT2KMk5iPVnCKRlRwEpczs5WBjBNc8hucWEmLQJ2N5Xhvu4OKQ+asMzmKDNfbrksQ6AGgnsRh
 dMHsAhjafZaypqedn5JUnoMh6VEe+PEiWBkcWiXs9oU8Jwesalc=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1714329331; bh=1c89SqmkAXUbrBCX5JJeZ4cE+9dRYVe/penUTPR4fR0=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=FKBv5tSKiD2ZrnzlKsqiYwGVS5B5f9hQpYyD47Ms/BoKzCeumnvjW9IPGbtNoDSYx
 J5j9L3+nPcvWk2PiKyNHznS+BxhyiaL4uqXTUxO4GbhAdbFIt/zCY7JDjHs0BUdrZW
 0CAh1GAoKR4LB77gih2WjGiKg2FXqjG6SiH3TLEwshhxoHfOjGmy7gGFQFVuWsEINi
 H/QmnTq3zZzNv6Ej4HOFchdMZX0gXhoGRa+WYbOvpEndXWeMuKCCuKRP4HMD2V6lE0
 RHZatpSLEarbHHL9riXe8o7LBQddHtFucRy0p2d9Nr5vnsL6r/uxM+gZ46m6kfVsfl
 3rgKSeHn7Qe1Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FKBv5tSK
Subject: Re: [Buildroot] [PATCH] toolchain: remove gcc bug 90620
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LAoKT24gMjgvMDQvMjQgMTk6MTgsIEFybm91dCBWYW5kZWNhcHBlbGxlIHZpYSBi
dWlsZHJvb3Qgd3JvdGU6Cj4gCj4gCj4gT24gMTMvMDQvMjAyNCAwOTo0OSwgR2l1bGlvIEJlbmV0
dGkgd3JvdGU6Cj4+IFdoaWxlIGJ1aWxkaW5nIHBhY2thZ2VzIGFmZmVjdGVkIGJ5IGdjYyBidWcg
OTA2MjAgd2l0aCBNaWNyb2JsYXplCj4+IGFuZCBnY2MgdmVyc2lvbnMgMTEsIDEyLCAxMyBidWls
dCB3aXRoIEJ1aWxkcm9vdCBhbmQgZXh0ZXJuYWwgQm9vdGxpbgo+PiB0b29sY2hhaW5zIHdpdGhv
dXQgLU8wIHdvcmstYXJvdW5kIGl0IHR1cm5zIG91dCB0aGF0IHRoZSBidWcgaGFzIGJlZW4KPj4g
Zml4ZWQuIFNvIGxldCdzIHJlbW92ZSBnY2MgYnVnIDkwNjIwLgo+IAo+ICDCoEJ1dCBhIGN1c3Rv
bSBleHRlcm5hbCB0b29sY2hhaW4gdGhhdCB1c2VzIEdDQyA8MTAgd291bGQgc3RpbGwgYmUgCj4g
YWZmZWN0ZWQsIG5vPyAKCkJ1dCB0aGlzIGJ1ZyBpcyBNaWNyb2JsYXplIHNwZWNpZmljIGFuZCB0
aGUgb25seSAyIE1pY3JvYmxhemUgZXh0ZXJuYWwKdG9vbGNoYWlucyBhcmUgdGhlIEJvb3RsaW4n
cyBvbmVzLCB3aGVyZSB0aGUgb2xkZXN0IEdDQyB2ZXJzaW9uIGlzCjEyLjMuMCwgc28gYXMgd2Un
dmUgYWxyZWFkeSBkb25lIGluIHRoZSBwYXN0IHdpdGggdGhpcyBjb21taXQ6Cmh0dHBzOi8vZ2l0
bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC81NWZjYmEyYTdjNDFkMjlm
M2Y5M2JiMzdlZWMxMjY0YWY0YjQ1ZmIwCgpjb25zaWRlcmluZyBCdWlsZHJvb3QgZnJlZSBvZiBi
dWcgOTA2MjAuIElmIGFueW9uZSB3aWxsIHNlbmQgYSBwYXRjaApmb3IgbmV3IG1pY3JvYmxhemUg
ZXh0ZXJuYWwtdG9vbGNoYWlucyBpdCdzIHZlcnkgdW5saWtlbHkgdGhleSB3aWxsCmNvbnRhaW4g
Z2NjIDwgMTAuCgpCZXN0IHJlZ2FyZHMKLS0gCkdpdWxpbyBCZW5ldHRpCkNFTyZDVE9AQmVuZXR0
aSBFbmdpbmVlcmluZwoKPiBTbyB5b3UgY2FuJ3QgYWN0dWFsbHkgcmVtb3ZlIGl0PyBZb3UgY2Fu
IGp1c3QgcmVtb3ZlIHRoZQo+IHx8IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzExIHBhcnQu
Cj4gIMKgUmVnYXJkcywKPiAgwqBBcm5vdXQKPiAKPj4KPj4gU2lnbmVkLW9mZi1ieTogR2l1bGlv
IEJlbmV0dGkgPGdpdWxpby5iZW5ldHRpQGJlbmV0dGllbmdpbmVlcmluZy5jb20+Cj4+IC0tLQo+
PiDCoCBwYWNrYWdlL2hhcHJveHkvaGFwcm94eS5ta8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDggKy0tLS0tLS0KPj4gwqAgcGFja2FnZS9xdDUvcXQ1YmFzZS9xdDViYXNl
Lm1rwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IDUgLS0tLS0KPj4gwqAgcGFja2FnZS9x
dDUvcXQ1eG1scGF0dGVybnMvcXQ1eG1scGF0dGVybnMubWsgfCA0IC0tLS0KPj4gwqAgdG9vbGNo
YWluL0NvbmZpZy5pbsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHwgOSAtLS0tLS0tLS0KPj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMjUgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2hhcHJveHkvaGFw
cm94eS5tayBiL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lm1rCj4+IGluZGV4IDYxYTllYmViZTQu
LjY5N2RiZGY0YmYgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lm1rCj4+
ICsrKyBiL3BhY2thZ2UvaGFwcm94eS9oYXByb3h5Lm1rCj4+IEBAIC03NCwxNSArNzQsOSBAQCBl
bmRpZgo+PiDCoCBIQVBST1hZX01BS0VfT1BUUyArPSBBRERMSUI9IiQoSEFQUk9YWV9MSUJTKSIK
Pj4gLUhBUFJPWFlfQ0ZMQUdTID0gJChUQVJHRVRfQ0ZMQUdTKQo+PiAtCj4+IC1pZmVxICgkKEJS
Ml9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfOTA2MjApLHkpCj4+IC1IQVBST1hZX0NGTEFHUyArPSAt
TzAKPj4gLWVuZGlmCj4+IC0KPj4gwqAgZGVmaW5lIEhBUFJPWFlfQlVJTERfQ01EUwo+PiDCoMKg
wqDCoMKgICQoVEFSR0VUX01BS0VfRU5WKSAkKE1BS0UpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRT
KSBcCj4+IC3CoMKgwqDCoMKgwqDCoCAkKEhBUFJPWFlfTUFLRV9PUFRTKSBERUZJTkU9IiQoSEFQ
Uk9YWV9DRkxBR1MpIiAtQyAkKEBEKQo+PiArwqDCoMKgwqDCoMKgwqAgJChIQVBST1hZX01BS0Vf
T1BUUykgREVGSU5FPSIkKFRBUkdFVF9DRkxBR1MpIiAtQyAkKEBEKQo+PiDCoCBlbmRlZgo+PiDC
oCBkZWZpbmUgSEFQUk9YWV9JTlNUQUxMX1RBUkdFVF9DTURTCj4+IGRpZmYgLS1naXQgYS9wYWNr
YWdlL3F0NS9xdDViYXNlL3F0NWJhc2UubWsgCj4+IGIvcGFja2FnZS9xdDUvcXQ1YmFzZS9xdDVi
YXNlLm1rCj4+IGluZGV4IGUxNzM2MzljY2EuLmQ2NDQ1YmU5YjIgMTAwNjQ0Cj4+IC0tLSBhL3Bh
Y2thZ2UvcXQ1L3F0NWJhc2UvcXQ1YmFzZS5tawo+PiArKysgYi9wYWNrYWdlL3F0NS9xdDViYXNl
L3F0NWJhc2UubWsKPj4gQEAgLTUwLDExICs1MCw2IEBAIFFUNUJBU0VfQ09ORklHVVJFX09QVFMg
Kz0gLW5vLW9wdGltaXplLWRlYnVnCj4+IMKgIFFUNUJBU0VfQ0ZMQUdTID0gJChUQVJHRVRfQ0ZM
QUdTKQo+PiDCoCBRVDVCQVNFX0NYWEZMQUdTID0gJChUQVJHRVRfQ1hYRkxBR1MpCj4+IC1pZmVx
ICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfOTA2MjApLHkpCj4+IC1RVDVCQVNFX0NGTEFH
UyArPSAtTzAKPj4gLVFUNUJBU0VfQ1hYRkxBR1MgKz0gLU8wCj4+IC1lbmRpZgo+PiAtCj4+IMKg
IGlmZXEgKCQoQlIyX1g4Nl9DUFVfSEFTX1NTRTIpLCkKPj4gwqAgUVQ1QkFTRV9DT05GSUdVUkVf
T1BUUyArPSAtbm8tc3NlMgo+PiDCoCBlbHNlIGlmZXEgKCQoQlIyX1g4Nl9DUFVfSEFTX1NTRTMp
LCkKPj4gZGlmZiAtLWdpdCBhL3BhY2thZ2UvcXQ1L3F0NXhtbHBhdHRlcm5zL3F0NXhtbHBhdHRl
cm5zLm1rIAo+PiBiL3BhY2thZ2UvcXQ1L3F0NXhtbHBhdHRlcm5zL3F0NXhtbHBhdHRlcm5zLm1r
Cj4+IGluZGV4IDIxMjZkM2M5MTUuLmY5OWJhYTFiZTcgMTAwNjQ0Cj4+IC0tLSBhL3BhY2thZ2Uv
cXQ1L3F0NXhtbHBhdHRlcm5zL3F0NXhtbHBhdHRlcm5zLm1rCj4+ICsrKyBiL3BhY2thZ2UvcXQ1
L3F0NXhtbHBhdHRlcm5zL3F0NXhtbHBhdHRlcm5zLm1rCj4+IEBAIC0yMCw4ICsyMCw0IEBAIGlm
ZXEgKCQoQlIyX1BBQ0tBR0VfUVQ1QkFTRV9FWEFNUExFUykseSkKPj4gwqAgUVQ1WE1MUEFUVEVS
TlNfTElDRU5TRSArPSAsIEJTRC0zLUNsYXVzZSAoZXhhbXBsZXMpCj4+IMKgIGVuZGlmCj4+IC1p
ZmVxICgkKEJSMl9UT09MQ0hBSU5fSEFTX0dDQ19CVUdfOTA2MjApLHkpCj4+IC1RVDVYTUxQQVRU
RVJOU19DT05GX09QVFMgKz0gIlFNQUtFX0NYWEZMQUdTKz0tTzAiCj4+IC1lbmRpZgo+PiAtCj4+
IMKgICQoZXZhbCAkKHFtYWtlLXBhY2thZ2UpKQo+PiBkaWZmIC0tZ2l0IGEvdG9vbGNoYWluL0Nv
bmZpZy5pbiBiL3Rvb2xjaGFpbi9Db25maWcuaW4KPj4gaW5kZXggOTQ0ZTU3M2Y4Mi4uZGU1ZWY3
YTA4ZiAxMDA2NDQKPj4gLS0tIGEvdG9vbGNoYWluL0NvbmZpZy5pbgo+PiArKysgYi90b29sY2hh
aW4vQ29uZmlnLmluCj4+IEBAIC0xNzAsMTUgKzE3MCw2IEBAIGNvbmZpZyBCUjJfVE9PTENIQUlO
X0hBU19HQ0NfQlVHXzg1ODYyCj4+IMKgwqDCoMKgwqAgZGVmYXVsdCB5IGlmIEJSMl9taWNyb2Js
YXplCj4+IMKgwqDCoMKgwqAgZGVwZW5kcyBvbiAhQlIyX1RPT0xDSEFJTl9HQ0NfQVRfTEVBU1Rf
Nwo+PiAtIyBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD05MDYy
MAo+PiAtIyBJQ0U6IGluIGRvX291dHB1dF9yZWxvYWQsIGF0IHJlbG9hZDEuYzo3OTc4IG9uIG1p
Y3JvYmxhemUuCj4+IC0jIFRoaXMgYnVnIG5vIGxvbmdlciBleGlzdHMgaW4gZ2NjIDEwLnggYnV0
IHJlYXBwZWFyZWQgaW4gZ2NjIDExLngKPj4gLWNvbmZpZyBCUjJfVE9PTENIQUlOX0hBU19HQ0Nf
QlVHXzkwNjIwCj4+IC3CoMKgwqAgYm9vbAo+PiAtwqDCoMKgIGRlZmF1bHQgeSBpZiBCUjJfbWlj
cm9ibGF6ZQo+PiAtwqDCoMKgIGRlcGVuZHMgb24gIUJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNU
XzEwIFwKPj4gLcKgwqDCoMKgwqDCoMKgIHx8IEJSMl9UT09MQ0hBSU5fR0NDX0FUX0xFQVNUXzEx
Cj4+IC0KPj4gwqAgIyBodHRwczovL2djYy5nbnUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9p
ZD05Mzg0Nwo+PiDCoCAjIElDRTogY29tcGlsZXIgZXJyb3I6IFNlZ21lbnRhdGlvbiBmYXVsdCBv
biBOaW9zIElJLiBUaGlzIGJ1Zwo+PiDCoCAjIG5vIGxvbmdlciBleGlzdHMgaW4gZ2NjIDkueC4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKPiBidWlsZHJvb3RAYnVpbGRyb290Lm9yZwo+IGh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlz
dApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QK
