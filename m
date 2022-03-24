Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5D5C433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Mar 2022 23:39:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E39E6844B2;
	Thu, 24 Mar 2022 23:39:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oco308p8MSVa; Thu, 24 Mar 2022 23:39:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D4E16843F6;
	Thu, 24 Mar 2022 23:39:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A25611BF3BF
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 23:39:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BF00843F1
 for <buildroot@lists.busybox.net>; Thu, 24 Mar 2022 23:39:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id smSczScRf7nE for <buildroot@lists.busybox.net>;
 Thu, 24 Mar 2022 23:39:26 +0000 (UTC)
X-Greylist: delayed 00:06:31 by SQLgrey-1.8.0
Received: from forward107p.mail.yandex.net (forward107p.mail.yandex.net
 [IPv6:2a02:6b8:0:1472:2741:0:8b7:115])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 70735843DB
 for <buildroot@buildroot.org>; Thu, 24 Mar 2022 23:39:26 +0000 (UTC)
Received: from sas1-e8656b45f3e5.qloud-c.yandex.net
 (sas1-e8656b45f3e5.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:be91:0:640:e865:6b45])
 by forward107p.mail.yandex.net (Yandex) with ESMTP id DE9535571534;
 Fri, 25 Mar 2022 02:32:48 +0300 (MSK)
Received: from sas8-c6148047b62a.qloud-c.yandex.net
 (sas8-c6148047b62a.qloud-c.yandex.net [2a02:6b8:c1b:2a11:0:640:c614:8047])
 by sas1-e8656b45f3e5.qloud-c.yandex.net (mxback/Yandex) with ESMTP id
 Lcj9KsCaDH-WmfKSAYG; Fri, 25 Mar 2022 02:32:48 +0300
X-Yandex-Fwd: 2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=corrigendum.ru; s=mail;
 t=1648164768; bh=x3TnTF5x2ev1wTtlS4RS016x19QBnI/iSRJ6BHWeOvU=;
 h=In-Reply-To:From:To:Subject:Cc:References:Date:Message-ID;
 b=TrSHfT/dPMxZLVHMhDkI2MQTN8wzsKgIks7jXWg5c+8gz6Is3ruuaQj2CfWtT06J4
 3HrF6NXgtuGHz2oDGQxA4BycHhTxeE3HaljG0JAsQT1L7HG0sttRonCClQy7kleUWb
 37854rh8Q3v9vbxcyvPMhZCII+wMmNWHVC/Rd5/E=
Authentication-Results: sas1-e8656b45f3e5.qloud-c.yandex.net;
 dkim=pass header.i=@corrigendum.ru
Received: by sas8-c6148047b62a.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA
 id mo4RQ8Oaeq-WmKCOjPM; Fri, 25 Mar 2022 02:32:48 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Message-ID: <aa8ee173-aeef-4fb3-cb06-b05f16057687@corrigendum.ru>
Date: Fri, 25 Mar 2022 02:32:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: James Hilliard <james.hilliard1@gmail.com>
References: <20220313175615.406390-1-james.hilliard1@gmail.com>
 <5313758f-f64d-f9f8-cdf2-3ca2ab426c7e@mind.be>
 <87bd50d3-72e9-2211-b53f-4046381e7419@corrigendum.ru>
 <CADvTj4oFOfRM7cY9oxQhv4BNgMso9T7mQ7YR4go+64-Kai9rRg@mail.gmail.com>
From: =?UTF-8?B?0KDQvtC80LDQvSDQlNC+0L3Rh9C10L3QutC+?= <dpb@corrigendum.ru>
In-Reply-To: <CADvTj4oFOfRM7cY9oxQhv4BNgMso9T7mQ7YR4go+64-Kai9rRg@mail.gmail.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: migrate flit to
 new bootstrapping sequence
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CgoyNS4wMy4yMDIyIDE6NDcsIEphbWVzIEhpbGxpYXJkINC/0LjRiNC10YI6Cj4gT24gVGh1LCBN
YXIgMjQsIDIwMjIgYXQgNDoyOCBQTSDQoNC+0LzQsNC9INCU0L7QvdGH0LXQvdC60L4gPGRwYkBj
b3JyaWdlbmR1bS5ydT4gd3JvdGU6Cj4+Cj4+IEhpLAo+Pgo+PiAyNC4wMy4yMDIyIDIzOjM3LCBB
cm5vdXQgVmFuZGVjYXBwZWxsZSDQv9C40YjQtdGCOgo+Pgo+Pj4+ICAgIGVsc2UKPj4+PiAgICAk
KDIpX0JBU0VfRU5WID0gJCQoSE9TVF9QS0dfUFlUSE9OX1BFUDUxN19FTlYpCj4+Pj4gLSQoMilf
QkFTRV9CVUlMRF9DTUQgPSAtbSBidWlsZCAtbiAtdwo+Pj4+IC0kKDIpX0JBU0VfSU5TVEFMTF9D
TUQgPSAkKFRPUERJUikvc3VwcG9ydC9zY3JpcHRzL3B5aW5zdGFsbGVyLnB5Cj4+Pj4gZGlzdC8q
ICQkKEhPU1RfUEtHX1BZVEhPTl9QRVA1MTdfSU5TVEFMTF9PUFRTKQo+Pj4+ICsjIFVzZSBmbGl0
IGJ1aWx0IGluIHdoZWVsIGJ1aWxkZXIgZm9yIHBhY2thZ2VzIHRoYXQgYXJlCj4+Pj4gaG9zdC1w
eXRob24tcHlwYS1idWlsZCBkZXBlbmRlbmNpZXMuCj4+Pj4gKyMgVGhpcyBpcyBuZWVkZWQgdG8g
YXZvaWQgYSBjaXJjdWxhciB3aXRoIGhvc3QtcHl0aG9uLXB5cGEtYnVpbGQgYW5kCj4+Pj4gdGhv
c2UgZGVwZW5kZW5jaWVzLgo+Pj4+ICsjCj4+Pj4gKyQoMilfQkFTRV9CVUlMRF9DTUQgPSAkJChp
ZiBcCj4+Pj4gKyAgICAgICAgJCQoZmlsdGVyIFwKPj4+PiArICAgICAgICAgICAgaG9zdC1weXRo
b24tZmxpdC1jb3JlIGhvc3QtcHl0aG9uLWluc3RhbGxlcgo+Pj4+IGhvc3QtcHl0aG9uLXBlcDUx
NyBob3N0LXB5dGhvbi10b21saSwgXAo+Pj4+ICsgICAgICAgICAgICAkKDEpKSBcCj4+Pj4gKyAg
ICAgICAgLCBcCj4+Pj4gKyAgICAgICAgLW0gZmxpdF9jb3JlLndoZWVsLCBcCj4+Pj4gKyAgICAg
ICAgLW0gYnVpbGQgLW4gLXcgXAo+Pj4KPj4+ICAgIFRoaXMgaXMgYWRkaW5nIHdheSB0b28gbXVj
aCBjb21wbGV4aXR5IHRvIHRoZSBpbmZyYSBqdXN0IHRvIHN1cHBvcnQKPj4+IHRoZXNlIGZvdXIg
cGFja2FnZXMuIEkgdGhpbmsgdGhlcmUgYSBhIGNvdXBsZSBvZiBiZXR0ZXIgb3B0aW9uczoKPj4+
Cj4+PiAtIGRvbid0IHVzZSBweXRob24gaW5mcmEgYXQgYWxsIGZvciB0aGVzZSBwYWNrYWdlczsg
b3IKPj4+IC0gc2V0IEhPU1RfUFlUSE9OX0ZMSVRfQ09SRV9CVUlMRF9DTURTIGV0Yy4gaW4gcHl0
aG9uLWZsaXQtY29yZS5tazsgb3IKPj4+IC0gYWRkIGEgZmlmdGggU0VUVVBfVFlQRSAiZ2VuZXJp
YyIgb3IgImN1c3RvbSIgb3Igc29tZXRoaW5nLCB3aGljaAo+Pj4gcmVxdWlyZXMgJCgyKV9CQVNF
XyogdG8gYmUgc2V0IGJ5IHRoZSBweXRob24tZmxpdC1jb3JlLm1rOwo+Pj4gLSBpbiB0aGUgaW5m
cmEgY2hhbmdlIGl0IHRvICQoMilfQkFTRV9CVUlMRF9DTUQgPz0sIHNldAo+Pj4gSE9TVF9QWVRI
T05fRkxJVF9DT1JFX0JBU0VfQlVJTERfQ01EIGluIHB5dGhvbi1mbGl0LWNvcmUubWs7IG9yCj4+
PiAtIGFkZCBhIGZpZnRoIFNFVFVQX1RZUEUgImZsaXQtYm9vdHN0cmFwIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0IHdoaWNoCj4+PiBvbmx5IGdldHMgdXNlZCBieSB0aGUgcHJvYmxlbWF0aWMgcGFj
a2FnZXMuCj4gCj4gSSBhZGRlZCBhIGZsaXQtYm9vdHN0cmFwIFNFVFVQX1RZUEUgYW5kIGlzb2xh
dGVkIHRoZSBzcGVjaWFsIGNhc2luZwo+IGxvZ2ljIHRvIHRoYXQ6Cj4gaHR0cHM6Ly9wYXRjaHdv
cmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8yMDIyMDMyNDIyMzcxNS4xOTYx
NDYxLTEtamFtZXMuaGlsbGlhcmQxQGdtYWlsLmNvbS8KPiAKPj4+Cj4+Pgo+Pj4gICAgVGhlIGxh
dHRlciB0d28gb3B0aW9ucyBoYXZlIG15IHByZWZlcmVuY2UgYmVjYXVzZSBJIHRoaW5rIHRoZXkg
YXJlIHRoZQo+Pj4gY2xlYW5lc3QsIGJ1dCBhbnkgb2YgdGhlbSBpcyBPSyBmb3IgbWUuIFRoZSAi
Z2VuZXJpYyIgc2V0dXAgdHlwZSBhbmQgdGhlCj4+PiBvdmVycmlkYWJsZSBfQkFTRV9CVUlMRF9D
TUQgd291bGQgYWxzbyByZXF1aXJlIGFuIHVwZGF0ZSBpbiB0aGUgbWFudWFsLgo+Pgo+PiBJTU8s
IHRoZSBzaW1wbGVzdCBpbXBsZW1lbnRhdGlvbiB3b3VsZCBiZToKPj4KPj4gMS4gRm9yIGhvc3Qt
cHl0aG9uLWZsaXQtY29yZSBhbmQgaG9zdC1weXRob24taW5zdGFsbGVyLCB1c2UKPj4gaG9zdC1n
ZW5lcmljLXBhY2thZ2UgYW5kIGRlZmluZSB0aGUgYnVpbGQgYW5kIGluc3RhbGwgY29tbWFuZHMg
bWFudWFsbHkuCj4gCj4gVGhpcyBpcyBtb3JlIGNvbXBsZXggc2luY2Ugd2Ugb25seSBuZWVkIHRv
IHNwZWNpYWwgY2FzZSBhIGZldyB0aGluZ3MuCgpJcyBpdCByZWFsbHkgdGhhdCBjb21wbGV4LCB0
aG91Z2g/IEFkbWl0dGVkbHksIEknbSBub3QgaHVnZWx5IGZhbWlsaWFyIAp3aXRoIGJ1aWxkcm9v
dCwgYnV0IEkgd3JvdGUgYSB0ZXN0IHZlcnNpb24gb2YgdGhlIG1ha2VmaWxlIGZvciAKZmxpdC1j
b3JlLCBhbmQgSSBqdXN0IGhhZCB0byBkZWZpbmUgUFlUSE9OX0ZMSVRfQ09SRV9ERVBFTkRFTkNJ
RVMgKD0gCmhvc3QtcHl0aG9uKSwgSE9TVF9QWVRIT05fRkxJVF9DT1JFX0JVSUxEX0NNRFMgYW5k
IApIT1NUX1BZVEhPTl9GTElUX0NPUkVfSU5TVEFMTF9DTURTLgpJIHRoaW5rIGl0J3MgZWFzaWVy
IHRvIHVuZGVyc3RhbmQgdGhhdCB0aGFuIHRvIHRyYWNrIGFsbCB0aGUgc3BlY2lhbCAKY2FzZXMg
aW4gcGtnLXB5dGhvbi5tay4KCj4+Cj4+IDIuIEZvciBldmVyeSBvdGhlciBwYWNrYWdlIHdob3Nl
IFNFVFVQX1RZUEUgaXMgImZsaXQiLCBoYXZlIGl0IGRlcGVuZCBvbgo+PiBqdXN0IGhvc3QtcHl0
aG9uLWZsaXQtY29yZSBhbmQgaG9zdC1weXRob24taW5zdGFsbGVyLCBhbmQgYnVpbGQgd2l0aAo+
PiAicHl0aG9uIC1tIGZsaXRfY29yZS53aGVlbCIuIEluIG90aGVyIHdvcmRzLCBkb24ndCB1c2UK
Pj4gaG9zdC1weXRob24tcHlwYS1idWlsZC4KPiAKPiBUaGlzIGlzIG5vdCByZWNvbW1lbmRlZCBi
eSB1cHN0cmVhbSBBRkFJVSwgInB5dGhvbiAtbSBmbGl0X2NvcmUud2hlZWwiIGlzCj4gb25seSBz
dXBwb3NlZCB0byBiZSB1c2VkIGZvciBpbml0aWFsIHRvb2xjaGFpbiBib290c3RyYXBwaW5nIGFz
IGl0J3MKPiBub3QgYSBnZW5lcmljCj4gcGVwNTE3IGJ1aWxkIGZyb250ZW5kLgoKWWVzLCBidXQg
d2UgZG9uJ3QgbmVlZCBhIGdlbmVyaWMgYnVpbGQgZnJvbnRlbmQuIFdlIGFscmVhZHkga25vdyB0
aGF0IAp0aGVzZSBwYWNrYWdlcyB1c2UgZmxpdCBhcyB0aGUgYmFja2VuZCwgYW5kIHRoZSBidWls
ZCBkZXBlbmRlbmNpZXMgYXJlIAppbnN0YWxsZWQgYnkgQnVpbGRyb290LCBzbyB0aGUgZnVuY3Rp
b24gb2YgdGhlIGZyb250ZW5kIGlzIHJlZHVjZWQgdG8gCmp1c3QgY2FsbGluZyB0aGUgYmFja2Vu
ZCAtIHNvIHlvdSBtaWdodCBhcyB3ZWxsIHJlbW92ZSB0aGUgZnJvbnRlbmQgYW5kIApjYWxsIHRo
ZSBiYWNrZW5kIGRpcmVjdGx5LgoKQWxzbywgeW91IGNhbiBzZWUgdGhhdCBmbGl0X2NvcmUud2hl
ZWwgdXNlcyB0aGUgc2FtZSB1bmRlcmx5aW5nIGNvZGUgYXMgCkZsaXQncyBQRVAgNTE3IGJhY2tl
bmQsIHNvIEkgZG9uJ3QgdGhpbmsgdGhlcmUgY2FuIGJlIGNhc2VzIHdoZXJlIHRoZSAKbGF0dGVy
IHdpbGwgd29yaywgYnV0IHRoZSBmb3JtZXIgd29uJ3Q6CgpodHRwczovL2dpdGh1Yi5jb20vcHlw
YS9mbGl0L2Jsb2IvMy43LjEvZmxpdF9jb3JlL2ZsaXRfY29yZS93aGVlbC5weSNMMjM1Cmh0dHBz
Oi8vZ2l0aHViLmNvbS9weXBhL2ZsaXQvYmxvYi8zLjcuMS9mbGl0X2NvcmUvZmxpdF9jb3JlL2J1
aWxkYXBpLnB5I0w3MAoKPiAKPj4KPj4gSSBkb24ndCB0aGluayB0aGVyZSBhcmUgYW55IGFkdmFu
dGFnZXMgaW4gdXNpbmcgcHlwYS1idWlsZCBvdmVyIGp1c3QKPj4gcnVubmluZyBmbGl0X2NvcmUu
d2hlZWwgZGlyZWN0bHksIGFuZCBkcm9wcGluZyBpdCB3b3VsZCByZWR1Y2UgdGhlCj4+IG51bWJl
ciBvZiBwYWNrYWdlcyB0aGF0IG5lZWQgc3BlY2lhbCBoYW5kbGluZyBhbmQgc2ltcGxpZnkgdGhl
Cj4+IGRlcGVuZGVuY3kgdHJlZS4KPiAKPiBXZSB3aWxsIG5lZWQgYSBmdWxsIHBlcDUxNyBidWls
ZCBmcm9udGVuZCBhbnl3YXlzIHNvIHRoaXMgd291bGRuJ3Qgc2ltcGxpZnkKPiBhbnl0aGluZyBJ
TU8uCgpUaGUgc2ltcGxpZmljYXRpb24gaXMgaW4gbm90IGhhdmluZyB0d28gZGlmZmVyZW50IGZs
aXQtYmFzZWQgU0VUVVBfVFlQRXMuCgotUm9tYW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1
aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8v
YnVpbGRyb290Cg==
