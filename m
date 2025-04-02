Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDAB2C28B20
	for <buildroot@archiver.kernel.org>; Wed,  2 Apr 2025 19:14:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C31980CA6;
	Wed,  2 Apr 2025 19:14:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xaQ6xn_xa2yY; Wed,  2 Apr 2025 19:14:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EEC681E5D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7EEC681E5D;
	Wed,  2 Apr 2025 19:14:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7C720123
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:14:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D2744094B
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:14:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yI28exhW44KK for <buildroot@buildroot.org>;
 Wed,  2 Apr 2025 19:14:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EBD604090D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBD604090D
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EBD604090D
 for <buildroot@buildroot.org>; Wed,  2 Apr 2025 19:14:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id B101C1C0FCC; Wed,  2 Apr 2025 21:14:43 +0200 (CEST)
Message-ID: <6c69acf8-7aa1-4d5b-9ff7-e09842fc45e6@rnout.be>
Date: Wed, 2 Apr 2025 21:14:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: =?UTF-8?B?UmFwaGHDq2wgTcOpbG90dGU=?= <raphael.melotte@mind.be>,
 buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>
References: <20250219204255.202762-1-raphael.melotte@mind.be>
Content-Language: en-GB
In-Reply-To: <20250219204255.202762-1-raphael.melotte@mind.be>
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rnout.be; s=dkim; 
 t=1743621283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=3ngDAEB8bzb9obo6PqHP34v7slHbnZ9Q1/YXvYu5Rqg=;
 b=NZLRNaJp/Z9KVYhq+ECF2J3fW6CIAPwLwGuLPyOo3n9PBCedPDV1/5goXnFMX/ckHQyDuh
 GOQysnDsLcu0msV4srYGGyj8+AqzyOMJRi7UgE4gIhfvqhGM04P1n+LEkwVge/7HWx0eI4
 Pg0WfSI6lkeSb2F87jLzMu9uWNVzXcg0CfTJ2jXW/9OSYrOxdMvzmcJ7Xa+SS75n+cHmIr
 ugrnnQJrK9J2P7atlrxDX/1bD/Gh6d0UFBLZswcAYVIzu/y88ZF9v+vdpNTMMxaJwg5PIN
 o8xGsVZ1xfLJvHsQ2zRngeE/kV7A5o85dfS3H22WQCGy/3B4Iv126lO8jaJEdQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=rnout.be
Subject: Re: [Buildroot] [PATCH 1/1] package/libfreeglut: add upstream
 security fix for CVE-2024-2425{8, 9}
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ck9uIDE5LzAyLzIwMjUgMjE6NDIsIFJhcGhhw6tsIE3DqWxvdHRlIHZpYSBidWlsZHJvb3Qgd3Jv
dGU6Cj4gRml4ZXMgdGhlIGZvbGxvd2luZyBzZWN1cml0eSBpc3N1ZXM6Cj4KPiAtIENWRS0yMDI0
LTI0MjU4OiBmcmVlZ2x1dCAzLjQuMCB3YXMgZGlzY292ZXJlZCB0byBjb250YWluIGEgbWVtb3J5
IGxlYWsKPiB2aWEgdGhlIG1lbnVFbnRyeSB2YXJpYWJsZSBpbiB0aGUgZ2x1dEFkZFN1Yk1lbnUg
ZnVuY3Rpb24uCj4gLSBDVkUtMjAyNC0yNDI1OTogZnJlZWdsdXQgdGhyb3VnaCAzLjQuMCB3YXMg
ZGlzY292ZXJlZCB0byBjb250YWluIGEKPiBtZW1vcnkgbGVhayB2aWEgdGhlIG1lbnVFbnRyeSB2
YXJpYWJsZSBpbiB0aGUgZ2x1dEFkZE1lbnVFbnRyeQo+IGZ1bmN0aW9uLgo+Cj4gaHR0cHM6Ly9u
dmQubmlzdC5nb3YvdnVsbi9kZXRhaWwvQ1ZFLTIwMjQtMjQyNTgKPiBodHRwczovL252ZC5uaXN0
Lmdvdi92dWxuL2RldGFpbC9DVkUtMjAyNC0yNDI1OQo+Cj4gVGhlIENWRXMgYXJlIG5vdCB0ZWNo
bmljYWxseSByZXBvcnRlZCBmb3IgdGhlIGxpYmZyZWVnbHV0IHBhY2thZ2UKPiBpdHNlbGYgKHdo
aWNoIGRvZXNuJ3QgaGF2ZSBhIENQRSBpZGVudGlmaWVyKSBidXQgZm9yIG11cGRmLgo+Cj4gTm90
ZSB0aGF0IG11ZHBmIHByb3ZpZGVzIGl0cyBvd24gKG9sZCkgdmVyc2lvbiBvZiBmcmVlZ2x1dCwg
YnV0IG91cgo+IG11cGRmIHBhY2thZ2UgdXNlcyB0aGUgQnVpbGRyb290LXByb3ZpZGVkIGZyZWVn
bHV0ICh3aGljaCBub3cgY29udGFpbnMKPiB0aGUgZml4KS4KPgo+IEl0IGFsc28gaGFzIHRvIGJl
IG5vdGVkIHRoYXQgYSBtb3JlIHJlY2VudCByZWxlYXNlIG9mIGxpYmZyZWVnbHV0Cj4gZXhpc3Rz
IHVwc3RyZWFtLCBhbmQgaXQgZml4ZXMgdGhlIHNhbWUgQ1ZFcy4gIEJ1bXBpbmcgb3VyIHBhY2th
Z2UKPiB2ZXJzaW9uIGhvd2V2ZXIgcmVxdWlyZXMgbW9yZSB3b3JrIHRoYXQgY2FuIGJlIGRvbmUg
c2VwYXJhdGVseS4KPiBJbmNsdWRpbmcgdGhpcyBwYXRjaCBmaXJzdCBhbHNvIGhhcyB0aGUgYWR2
YW50YWdlIHRoYXQgaXQgY2FuIGVhc2lseQo+IGJlIGJhY2twb3J0ZWQgd2hlcmV2ZXIgaXQncyBu
ZWVkZWQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBSYXBoYcOrbCBNw6lsb3R0ZSA8cmFwaGFlbC5tZWxv
dHRlQG1pbmQuYmU+CgogwqBBcHBsaWVkIHRvIG1hc3RlciwgdGhhbmtzLgoKIMKgUmVnYXJkcywK
IMKgQXJub3V0Cgo+IC0tLQo+ICAgLi4uLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11cG9uLWVy
cm9yLnBhdGNoIHwgNTQgKysrKysrKysrKysrKysrKysrKwo+ICAgcGFja2FnZS9tdXBkZi9tdXBk
Zi5tayAgICAgICAgICAgICAgICAgICAgICAgIHwgIDUgKysKPiAgIDIgZmlsZXMgY2hhbmdlZCwg
NTkgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IHBhY2thZ2UvbGliZnJlZWds
dXQvMDAwMS1QbHVnLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11cG9uLWVycm9yLnBhdGNoCj4K
PiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJmcmVlZ2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWst
dGhhdC1oYXBwZW5zLXVwb24tZXJyb3IucGF0Y2ggYi9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEt
UGx1Zy1tZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaAo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMC4uZDA5ZTliZWZiMwo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9wYWNrYWdlL2xpYmZyZWVnbHV0LzAwMDEtUGx1Zy1tZW1vcnktbGVhay10aGF0
LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRjaAo+IEBAIC0wLDAgKzEsNTQgQEAKPiArRnJvbSA5YWQz
MjBjMWFkMWEyNTU1ODk5OGRkZmU0NzY3NDUxMTU2N2ZlYzU3IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQo+ICtGcm9tOiBTZWJhc3RpYW4gUmFzbXVzc2VuIDxzZWJyYXNAZ21haWwuY29tPgo+ICtE
YXRlOiBNb24sIDEyIEZlYiAyMDI0IDE0OjQ2OjIyICswODAwCj4gK1N1YmplY3Q6IFtQQVRDSF0g
UGx1ZyBtZW1vcnkgbGVhayB0aGF0IGhhcHBlbnMgdXBvbiBlcnJvci4KPiArCj4gK0lmIGZnU3Ry
dWN0dXJlLkN1cnJlbnRNZW51IGlzIHNldCB3aGVuIGdsdXRBZGRNZW51RW50cnkoKSBvcgo+ICtn
bHV0QWRkU3ViTWVudSgpIGlzIGNhbGxlZCB0aGUgYWxsb2NhdGVkIG1lbnVFbnRyeSB2YXJpYWJs
ZSB3aWxsCj4gK2xlYWsuIFRoaXMgY29tbWl0IHBvc3Rwb25lcyBhbGxvY2F0aW5nIG1lbnVFbnRy
eSB1bnRpbCBhZnRlciB0aGUKPiArZXJyb3IgY2hlY2tzLCB0aGVyZWJ5IHBsdWdnaW5nIHRoZSBt
ZW1vcnkgbGVhay4KPiArCj4gK1RoaXMgZml4ZXMgQ1ZFLTIwMjQtMjQyNTggYW5kIENWRS0yMDI0
LTI0MjU5Lgo+ICtVcHN0cmVhbTogaHR0cHM6Ly9naXRodWIuY29tL2ZyZWVnbHV0L2ZyZWVnbHV0
L2NvbW1pdC85YWQzMjBjMWFkMWEyNTU1ODk5OGRkZmU0NzY3NDUxMTU2N2ZlYzU3Cj4gK1NpZ25l
ZC1vZmYtYnk6IFJhcGhhw6tsIE3DqWxvdHRlIDxyYXBoYWVsLm1lbG90dGVAbWluZC5iZT4KPiAr
LS0tCj4gKyBzcmMvZmdfbWVudS5jIHwgNCArKy0tCj4gKyAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICsKPiArZGlmZiAtLWdpdCBhL3NyYy9mZ19tZW51
LmMgYi9zcmMvZmdfbWVudS5jCj4gK2luZGV4IDUzMTEyZGMyLi4wZGE4ODkwMSAxMDA2NDQKPiAr
LS0tIGEvc3JjL2ZnX21lbnUuYwo+ICsrKysgYi9zcmMvZmdfbWVudS5jCj4gK0BAIC04NjQsMTIg
Kzg2NCwxMiBAQCB2b2lkIEZHQVBJRU5UUlkgZ2x1dEFkZE1lbnVFbnRyeSggY29uc3QgY2hhciog
bGFiZWwsIGludCB2YWx1ZSApCj4gKyB7Cj4gKyAgICAgU0ZHX01lbnVFbnRyeSogbWVudUVudHJ5
Owo+ICsgICAgIEZSRUVHTFVUX0VYSVRfSUZfTk9UX0lOSVRJQUxJU0VEICggImdsdXRBZGRNZW51
RW50cnkiICk7Cj4gKy0gICAgbWVudUVudHJ5ID0gKFNGR19NZW51RW50cnkgKiljYWxsb2MoIHNp
emVvZihTRkdfTWVudUVudHJ5KSwgMSApOwo+ICsKPiArICAgICBmcmVlZ2x1dF9yZXR1cm5faWZf
ZmFpbCggZmdTdHJ1Y3R1cmUuQ3VycmVudE1lbnUgKTsKPiArICAgICBpZiAoZmdTdGF0ZS5BY3Rp
dmVNZW51cykKPiArICAgICAgICAgZmdFcnJvcigiTWVudSBtYW5pcHVsYXRpb24gbm90IGFsbG93
ZWQgd2hpbGUgbWVudXMgaW4gdXNlLiIpOwo+ICsKPiArKyAgICBtZW51RW50cnkgPSAoU0ZHX01l
bnVFbnRyeSAqKWNhbGxvYyggc2l6ZW9mKFNGR19NZW51RW50cnkpLCAxICk7Cj4gKyAgICAgbWVu
dUVudHJ5LT5UZXh0ID0gc3RyZHVwKCBsYWJlbCApOwo+ICsgICAgIG1lbnVFbnRyeS0+SUQgICA9
IHZhbHVlOwo+ICsKPiArQEAgLTg4OCw3ICs4ODgsNiBAQCB2b2lkIEZHQVBJRU5UUlkgZ2x1dEFk
ZFN1Yk1lbnUoIGNvbnN0IGNoYXIgKmxhYmVsLCBpbnQgc3ViTWVudUlEICkKPiArICAgICBTRkdf
TWVudSAqc3ViTWVudTsKPiArCj4gKyAgICAgRlJFRUdMVVRfRVhJVF9JRl9OT1RfSU5JVElBTElT
RUQgKCAiZ2x1dEFkZFN1Yk1lbnUiICk7Cj4gKy0gICAgbWVudUVudHJ5ID0gKCBTRkdfTWVudUVu
dHJ5ICogKWNhbGxvYyggc2l6ZW9mKCBTRkdfTWVudUVudHJ5ICksIDEgKTsKPiArICAgICBzdWJN
ZW51ID0gZmdNZW51QnlJRCggc3ViTWVudUlEICk7Cj4gKwo+ICsgICAgIGZyZWVnbHV0X3JldHVy
bl9pZl9mYWlsKCBmZ1N0cnVjdHVyZS5DdXJyZW50TWVudSApOwo+ICtAQCAtODk3LDYgKzg5Niw3
IEBAIHZvaWQgRkdBUElFTlRSWSBnbHV0QWRkU3ViTWVudSggY29uc3QgY2hhciAqbGFiZWwsIGlu
dCBzdWJNZW51SUQgKQo+ICsKPiArICAgICBmcmVlZ2x1dF9yZXR1cm5faWZfZmFpbCggc3ViTWVu
dSApOwo+ICsKPiArKyAgICBtZW51RW50cnkgPSAoIFNGR19NZW51RW50cnkgKiApY2FsbG9jKCBz
aXplb2YoIFNGR19NZW51RW50cnkgKSwgMSApOwo+ICsgICAgIG1lbnVFbnRyeS0+VGV4dCAgICA9
IHN0cmR1cCggbGFiZWwgKTsKPiArICAgICBtZW51RW50cnktPlN1Yk1lbnUgPSBzdWJNZW51Owo+
ICsgICAgIG1lbnVFbnRyeS0+SUQgICAgICA9IC0xOwo+ICstLQo+ICsyLjQ4LjEKPiArCj4gZGlm
ZiAtLWdpdCBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsgYi9wYWNrYWdlL211cGRmL211cGRmLm1r
Cj4gaW5kZXggOWVlY2I4NDIzMi4uZDI4MjlkOGI3MSAxMDA2NDQKPiAtLS0gYS9wYWNrYWdlL211
cGRmL211cGRmLm1rCj4gKysrIGIvcGFja2FnZS9tdXBkZi9tdXBkZi5tawo+IEBAIC0yMSw2ICsy
MSwxMSBAQCBNVVBERl9ERVBFTkRFTkNJRVMgPSBcCj4gICAJbGNtczIgb3BlbmpwZWcgXAo+ICAg
CXpsaWIKPiAgIAo+ICsjIGxpYmZyZWVnbHV0LzAwMDEtUGx1Zy1tZW1vcnktbGVhay10aGF0LWhh
cHBlbnMtdXBvbi1lcnJvci5wYXRjaAo+ICtNVVBERl9JR05PUkVfQ1ZFUyA9IFwKPiArCUNWRS0y
MDI0LTI0MjU4IFwKPiArCUNWRS0yMDI0LTI0MjU5Cj4gKwo+ICAgIyBtdXBkZiBkb2Vzbid0IHVz
ZSBDRkxBR1MgYW5kIExJQlMgYnV0IFhDRkxBR1MgYW5kIFhMSUJTIGluc3RlYWQuCj4gICAjIHdp
dGggVVNFX1NZU1RFTV9MSUJTIGl0IHdpbGwgdHJ5IHRvIHVzZSBzeXN0ZW0gbGlicmFyaWVzIGlu
c3RlYWQgb2YgdGhlIGJ1bmRsZWQgb25lcy4KPiAgIE1VUERGX01BS0VfRU5WID0gJChUQVJHRVRf
TUFLRV9FTlYpICQoVEFSR0VUX0NPTkZJR1VSRV9PUFRTKSBcCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRy
b290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlz
dGluZm8vYnVpbGRyb290Cg==
