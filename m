Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F399C369C7
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 21:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E8CF81E0A;
	Wed, 16 Apr 2025 21:25:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d__v4CKIoeWf; Wed, 16 Apr 2025 21:25:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 421B281E88
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 421B281E88;
	Wed, 16 Apr 2025 21:25:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DDBE011B
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C39BB40AED
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:25:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tjhUb6Sr233e for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 21:25:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=79.99.201.11;
 helo=mail1.nubo.coop; envelope-from=arnout@rnout.be; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 698A0400BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 698A0400BD
Received: from mail1.nubo.coop (mail1.nubo.coop [79.99.201.11])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 698A0400BD
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 21:25:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id BFE381C0083; Wed, 16 Apr 2025 23:25:28 +0200 (CEST)
Message-ID: <a6164b45-7c23-4325-b8c1-3e643d238f22@rnout.be>
Date: Wed, 16 Apr 2025 23:25:27 +0200
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
 t=1744838728; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=s4OPdyEAfXOnaCsOqfpQz08dYFapgEbnh8Hn2cnq51E=;
 b=VqTZX5IvN2ySaGd+Rb9LEzcMis7yFj7oK5Foz+16laAYkDHZqwqlFhYMfwVFQ5MfbkMAE8
 FV+u+L5jSIihFm5BMkhELJgOn155VV1crIkaDO2vGe1W6eSiVk+7fhEAmju6r0eGvi84dl
 o4EbBmWuS+gWJkAXZ1UNh64ZFOnlmwz8kNwgMXy43/TzR/3e+HEZIO2jtn4MQQdIWW9T65
 As9Zmg0En7sPfNGTopvnr8JUCXlKQXJniS597tA7PAVQdgejjyoN5lDrxzdI0ZcVWbUMum
 9v4ey/sTdXQiBMhciLF7hhN9MZJ/Nk1wya0YylMYz+lQ71h9pAbSTHP8t9GWPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
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
dHRlQG1pbmQuYmU+CgogwqBBcHBsaWVkIHRvwqAyMDI1LjAyLngsIDIwMjQuMTEueCBhbmQgMjAy
NC4wMi54LCB0aGFua3MuCgogwqBSZWdhcmRzLAogwqBBcm5vdXQKCj4gLS0tCj4gICAuLi4tbWVt
b3J5LWxlYWstdGhhdC1oYXBwZW5zLXVwb24tZXJyb3IucGF0Y2ggfCA1NCArKysrKysrKysrKysr
KysrKysrCj4gICBwYWNrYWdlL211cGRmL211cGRmLm1rICAgICAgICAgICAgICAgICAgICAgICAg
fCAgNSArKwo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA1OSBpbnNlcnRpb25zKCspCj4gICBjcmVhdGUg
bW9kZSAxMDA2NDQgcGFja2FnZS9saWJmcmVlZ2x1dC8wMDAxLVBsdWctbWVtb3J5LWxlYWstdGhh
dC1oYXBwZW5zLXVwb24tZXJyb3IucGF0Y2gKPgo+IGRpZmYgLS1naXQgYS9wYWNrYWdlL2xpYmZy
ZWVnbHV0LzAwMDEtUGx1Zy1tZW1vcnktbGVhay10aGF0LWhhcHBlbnMtdXBvbi1lcnJvci5wYXRj
aCBiL3BhY2thZ2UvbGliZnJlZWdsdXQvMDAwMS1QbHVnLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVu
cy11cG9uLWVycm9yLnBhdGNoCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAw
MDAwLi5kMDllOWJlZmIzCj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL3BhY2thZ2UvbGliZnJlZWds
dXQvMDAwMS1QbHVnLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11cG9uLWVycm9yLnBhdGNoCj4g
QEAgLTAsMCArMSw1NCBAQAo+ICtGcm9tIDlhZDMyMGMxYWQxYTI1NTU4OTk4ZGRmZTQ3Njc0NTEx
NTY3ZmVjNTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCj4gK0Zyb206IFNlYmFzdGlhbiBSYXNt
dXNzZW4gPHNlYnJhc0BnbWFpbC5jb20+Cj4gK0RhdGU6IE1vbiwgMTIgRmViIDIwMjQgMTQ6NDY6
MjIgKzA4MDAKPiArU3ViamVjdDogW1BBVENIXSBQbHVnIG1lbW9yeSBsZWFrIHRoYXQgaGFwcGVu
cyB1cG9uIGVycm9yLgo+ICsKPiArSWYgZmdTdHJ1Y3R1cmUuQ3VycmVudE1lbnUgaXMgc2V0IHdo
ZW4gZ2x1dEFkZE1lbnVFbnRyeSgpIG9yCj4gK2dsdXRBZGRTdWJNZW51KCkgaXMgY2FsbGVkIHRo
ZSBhbGxvY2F0ZWQgbWVudUVudHJ5IHZhcmlhYmxlIHdpbGwKPiArbGVhay4gVGhpcyBjb21taXQg
cG9zdHBvbmVzIGFsbG9jYXRpbmcgbWVudUVudHJ5IHVudGlsIGFmdGVyIHRoZQo+ICtlcnJvciBj
aGVja3MsIHRoZXJlYnkgcGx1Z2dpbmcgdGhlIG1lbW9yeSBsZWFrLgo+ICsKPiArVGhpcyBmaXhl
cyBDVkUtMjAyNC0yNDI1OCBhbmQgQ1ZFLTIwMjQtMjQyNTkuCj4gK1Vwc3RyZWFtOiBodHRwczov
L2dpdGh1Yi5jb20vZnJlZWdsdXQvZnJlZWdsdXQvY29tbWl0LzlhZDMyMGMxYWQxYTI1NTU4OTk4
ZGRmZTQ3Njc0NTExNTY3ZmVjNTcKPiArU2lnbmVkLW9mZi1ieTogUmFwaGHDq2wgTcOpbG90dGUg
PHJhcGhhZWwubWVsb3R0ZUBtaW5kLmJlPgo+ICstLS0KPiArIHNyYy9mZ19tZW51LmMgfCA0ICsr
LS0KPiArIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4g
Kwo+ICtkaWZmIC0tZ2l0IGEvc3JjL2ZnX21lbnUuYyBiL3NyYy9mZ19tZW51LmMKPiAraW5kZXgg
NTMxMTJkYzIuLjBkYTg4OTAxIDEwMDY0NAo+ICstLS0gYS9zcmMvZmdfbWVudS5jCj4gKysrKyBi
L3NyYy9mZ19tZW51LmMKPiArQEAgLTg2NCwxMiArODY0LDEyIEBAIHZvaWQgRkdBUElFTlRSWSBn
bHV0QWRkTWVudUVudHJ5KCBjb25zdCBjaGFyKiBsYWJlbCwgaW50IHZhbHVlICkKPiArIHsKPiAr
ICAgICBTRkdfTWVudUVudHJ5KiBtZW51RW50cnk7Cj4gKyAgICAgRlJFRUdMVVRfRVhJVF9JRl9O
T1RfSU5JVElBTElTRUQgKCAiZ2x1dEFkZE1lbnVFbnRyeSIgKTsKPiArLSAgICBtZW51RW50cnkg
PSAoU0ZHX01lbnVFbnRyeSAqKWNhbGxvYyggc2l6ZW9mKFNGR19NZW51RW50cnkpLCAxICk7Cj4g
Kwo+ICsgICAgIGZyZWVnbHV0X3JldHVybl9pZl9mYWlsKCBmZ1N0cnVjdHVyZS5DdXJyZW50TWVu
dSApOwo+ICsgICAgIGlmIChmZ1N0YXRlLkFjdGl2ZU1lbnVzKQo+ICsgICAgICAgICBmZ0Vycm9y
KCJNZW51IG1hbmlwdWxhdGlvbiBub3QgYWxsb3dlZCB3aGlsZSBtZW51cyBpbiB1c2UuIik7Cj4g
Kwo+ICsrICAgIG1lbnVFbnRyeSA9IChTRkdfTWVudUVudHJ5ICopY2FsbG9jKCBzaXplb2YoU0ZH
X01lbnVFbnRyeSksIDEgKTsKPiArICAgICBtZW51RW50cnktPlRleHQgPSBzdHJkdXAoIGxhYmVs
ICk7Cj4gKyAgICAgbWVudUVudHJ5LT5JRCAgID0gdmFsdWU7Cj4gKwo+ICtAQCAtODg4LDcgKzg4
OCw2IEBAIHZvaWQgRkdBUElFTlRSWSBnbHV0QWRkU3ViTWVudSggY29uc3QgY2hhciAqbGFiZWws
IGludCBzdWJNZW51SUQgKQo+ICsgICAgIFNGR19NZW51ICpzdWJNZW51Owo+ICsKPiArICAgICBG
UkVFR0xVVF9FWElUX0lGX05PVF9JTklUSUFMSVNFRCAoICJnbHV0QWRkU3ViTWVudSIgKTsKPiAr
LSAgICBtZW51RW50cnkgPSAoIFNGR19NZW51RW50cnkgKiApY2FsbG9jKCBzaXplb2YoIFNGR19N
ZW51RW50cnkgKSwgMSApOwo+ICsgICAgIHN1Yk1lbnUgPSBmZ01lbnVCeUlEKCBzdWJNZW51SUQg
KTsKPiArCj4gKyAgICAgZnJlZWdsdXRfcmV0dXJuX2lmX2ZhaWwoIGZnU3RydWN0dXJlLkN1cnJl
bnRNZW51ICk7Cj4gK0BAIC04OTcsNiArODk2LDcgQEAgdm9pZCBGR0FQSUVOVFJZIGdsdXRBZGRT
dWJNZW51KCBjb25zdCBjaGFyICpsYWJlbCwgaW50IHN1Yk1lbnVJRCApCj4gKwo+ICsgICAgIGZy
ZWVnbHV0X3JldHVybl9pZl9mYWlsKCBzdWJNZW51ICk7Cj4gKwo+ICsrICAgIG1lbnVFbnRyeSA9
ICggU0ZHX01lbnVFbnRyeSAqICljYWxsb2MoIHNpemVvZiggU0ZHX01lbnVFbnRyeSApLCAxICk7
Cj4gKyAgICAgbWVudUVudHJ5LT5UZXh0ICAgID0gc3RyZHVwKCBsYWJlbCApOwo+ICsgICAgIG1l
bnVFbnRyeS0+U3ViTWVudSA9IHN1Yk1lbnU7Cj4gKyAgICAgbWVudUVudHJ5LT5JRCAgICAgID0g
LTE7Cj4gKy0tCj4gKzIuNDguMQo+ICsKPiBkaWZmIC0tZ2l0IGEvcGFja2FnZS9tdXBkZi9tdXBk
Zi5tayBiL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKPiBpbmRleCA5ZWVjYjg0MjMyLi5kMjgyOWQ4
YjcxIDEwMDY0NAo+IC0tLSBhL3BhY2thZ2UvbXVwZGYvbXVwZGYubWsKPiArKysgYi9wYWNrYWdl
L211cGRmL211cGRmLm1rCj4gQEAgLTIxLDYgKzIxLDExIEBAIE1VUERGX0RFUEVOREVOQ0lFUyA9
IFwKPiAgIAlsY21zMiBvcGVuanBlZyBcCj4gICAJemxpYgo+ICAgCj4gKyMgbGliZnJlZWdsdXQv
MDAwMS1QbHVnLW1lbW9yeS1sZWFrLXRoYXQtaGFwcGVucy11cG9uLWVycm9yLnBhdGNoCj4gK01V
UERGX0lHTk9SRV9DVkVTID0gXAo+ICsJQ1ZFLTIwMjQtMjQyNTggXAo+ICsJQ1ZFLTIwMjQtMjQy
NTkKPiArCj4gICAjIG11cGRmIGRvZXNuJ3QgdXNlIENGTEFHUyBhbmQgTElCUyBidXQgWENGTEFH
UyBhbmQgWExJQlMgaW5zdGVhZC4KPiAgICMgd2l0aCBVU0VfU1lTVEVNX0xJQlMgaXQgd2lsbCB0
cnkgdG8gdXNlIHN5c3RlbSBsaWJyYXJpZXMgaW5zdGVhZCBvZiB0aGUgYnVuZGxlZCBvbmVzLgo+
ICAgTVVQREZfTUFLRV9FTlYgPSAkKFRBUkdFVF9NQUtFX0VOVikgJChUQVJHRVRfQ09ORklHVVJF
X09QVFMpIFwKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
