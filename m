Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63872C433EF
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 12:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F01C641946;
	Mon, 23 May 2022 12:09:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AtJSdtORArrH; Mon, 23 May 2022 12:09:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 966324193A;
	Mon, 23 May 2022 12:09:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A29021BF34E
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 12:09:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E5DF83EEF
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 12:09:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=163.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0AM1uskagGd8 for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 12:08:57 +0000 (UTC)
X-Greylist: delayed 00:15:18 by SQLgrey-1.8.0
Received: from m12-12.163.com (m12-12.163.com [220.181.12.12])
 by smtp1.osuosl.org (Postfix) with ESMTP id 56CDC83EEC
 for <buildroot@buildroot.org>; Mon, 23 May 2022 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Message-ID:Date:MIME-Version:Subject:From; bh=ZBapX
 gMDr+u3bsATdSbJqKE+Dbl/cygh2jSvVnUZ4Dk=; b=GrmR+zxmEJ+I91GRRMZqv
 kzrz8pK8IYaa4kkUSYkJoZwNhrf0PhjqT2Zem2iGPqsEPeXu+6kR6sqKlnV6pG1O
 j9ROphTxbPRBLO7Q/y9/Wbcma1IhpkPs5sUVmQ741CUMF6H9bGzniZ6u2xTK0fNK
 UfMYsFjuQivALEUcFFIFwk=
Received: from [192.168.31.190] (unknown [123.185.180.142])
 by smtp8 (Coremail) with SMTP id DMCowADHqRe2dYti4um4Dw--.5483S2;
 Mon, 23 May 2022 19:53:27 +0800 (CST)
Message-ID: <80e2a4c8-4c41-b9b7-25e3-a075b573f7f6@163.com>
Date: Mon, 23 May 2022 04:53:26 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Christian Stewart <christian@paral.in>
References: <20220517103608.3455749-1-christian@paral.in>
 <4b7583c4-5d03-60bc-4b42-4b2f18177a78@mind.be>
 <20220518202129.GX1597494@scaer>
From: TIAN Yuanhao <tianyuanhao3@163.com>
In-Reply-To: <20220518202129.GX1597494@scaer>
X-CM-TRANSID: DMCowADHqRe2dYti4um4Dw--.5483S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxuF1kCrW5JFyrKFyfGw1DAwb_yoWrWrW5pF
 n3X3yFyFy0yw1Fg3y8urn5Kr90qryDGr9rAr15Xr1UJa48Ca17Aw48t39YgF47uws7Xw4x
 XFn7XrySvr4DAaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ux739UUUUU=
X-Originating-IP: [123.185.180.142]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbB2A8KjWBHKnIKQQAAsk
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-utils: prevent
 kconfig_enable_opt from changing =m to =y
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QWxsLAoKT24gNS8xOC8yMiAxMzoyMSwgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBDaHJpc3RpYW4s
IEFybm91dCwgQWxsLAo+Cj4gT24gMjAyMi0wNS0xOCAyMDowMSArMDIwMCwgQXJub3V0IFZhbmRl
Y2FwcGVsbGUgc3Bha2UgdGh1c2x5Ogo+PiBPbiAxNy8wNS8yMDIyIDEyOjM2LCBDaHJpc3RpYW4g
U3Rld2FydCB2aWEgYnVpbGRyb290IHdyb3RlOgo+Pj4gVGhpcyBwYXRjaCBjaGFuZ2VzIEtDT05G
SUdfTVVOR0VfRE9UX0NPTkZJRyB0byBwcmV2ZW50IGNoYW5naW5nIGA9bWAgdG8gYD15YC4KPj4g
ICBHb29kIGNhdGNoIQo+PiAgIFBhdGNoIGlzIGEgYml0IG92ZXItY29tcGxpY2F0ZWQsIGJ1dCBJ
IGRvbid0IGtub3cgaG93IHRvIGRvIGJldHRlci4KPiBbLS1TTklQLS1dCj4+PiBAQCAtMjEsOCAr
MjEsMTQgQEAgS0NPTkZJR19ET1RfQ09ORklHID0gJChzdHJpcCBcCj4+PiAgICkKPj4+ICAgIyBL
Q09ORklHX01VTkdFX0RPVF9DT05GSUcgKG9wdGlvbiwgbmV3bGluZSBbLCBmaWxlXSkKPj4+ICsj
IElmIHNldHRpbmcgdG8gPXkgYW5kIHRoZSBvcHRpb24gaXMgYWxyZWFkeSBzZXQgdG8gPW0sIGln
bm9yZS4KPj4+ICAgZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRwo+Pj4gLQkkKFNFRCkg
Ii9cXDwkKHN0cmlwICQoMSkpXFw+L2QiICQoY2FsbCBLQ09ORklHX0RPVF9DT05GSUcsJCgzKSkK
Pj4+ICsJaWYgW1sgIiQobGFzdHdvcmQgJChzdWJzdCA9LCAsJChzdHJpcCAkKDIpKSkpIiA9PSAi
eSIgXV07IHRoZW4gXAo+PiAgIFRoaXMgcGFydCB3ZSBjb3VsZCBhdm9pZCBieSBhZGRpbmcgYSA0
dGggb3B0aW9uIGFuZCBzZXR0aW5nIGl0IG9ubHkgb24KPj4gS0NPTkZJR19FTkFCTEVfT1BULgo+
Pgo+Pj4gKwkJaWYgZ3JlcCAtcSAiJChzdHJpcCAkKDEpKT1tIiAkKGNhbGwgS0NPTkZJR19ET1Rf
Q09ORklHLCQoMykpOyB0aGVuIFwKPj4+ICsJCQlleGl0IDA7IFwKPj4gICBUaGlzIGlzIGEga2lu
ZCBvZiBoYXJkLXRvLWZvbGxvdyBjb250cm9sIHN0cnVjdHVyZSAtIGJldHRlciB0dXJuIGFyb3Vu
ZCB0aGUKPj4gY29uZGl0aW9uIGFuZCBkbyB0aGUgcmVwbGFjZW1lbnQgaW5zaWRlIGl0LiBTbywg
Y29tYmluZWQgd2l0aCB0aGUgYWJvdmU6Cj4+Cj4+IAlpZiAkKGlmICQoNCksZ3JlcCAtcSAuLi4s
dHJ1ZSk7IHRoZW4gXAo+PiAJCXNlZCAuLi47IFwKPj4gCQllY2hvIC4uLjsgXAo+PiAJZmkKPiBB
Y3R1YWxseSwgSSB0aGluayB0aGUgY2hlY2sgc2hvdWxkIG5vdCBiZSBpbiBLQ09ORklHX01VTkdF
X0RPVF9DT05GSUcsCj4gYXMgaXQgcmVhbGx5IGJlbG9uZ3MgdG8gS0NPTkZJR19FTkFCTEVfT1BU
Lgo+Cj4gTWF5YmUgc29tZXRoaW5nIGxpa2U6Cj4KPiAgICAgIGRpZmYgLS1naXQgYS9wYWNrYWdl
L3BrZy11dGlscy5tayBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gICAgICBpbmRleCA3ZDFhZWE3
NzEwLi41NmNkNzJhOWE5IDEwMDY0NAo+ICAgICAgLS0tIGEvcGFja2FnZS9wa2ctdXRpbHMubWsK
PiAgICAgICsrKyBiL3BhY2thZ2UvcGtnLXV0aWxzLm1rCj4gICAgICBAQCAtMjIsMTIgKzIyLDE2
IEBAIEtDT05GSUdfRE9UX0NPTkZJRyA9ICQoc3RyaXAgXAo+ICAgICAgIAo+ICAgICAgICMgS0NP
TkZJR19NVU5HRV9ET1RfQ09ORklHIChvcHRpb24sIG5ld2xpbmUgWywgZmlsZV0pCj4gICAgICAg
ZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRwo+ICAgICAgLQkkKFNFRCkgIi9cXDwkKHN0
cmlwICQoMSkpXFw+L2QiICQoY2FsbCBLQ09ORklHX0RPVF9DT05GSUcsJCgzKSkKPiAgICAgICsJ
JChTRUQpICIvXFw8JChzdHJpcCAkKDEpKVxcPi9kIiAkKGNhbGwgS0NPTkZJR19ET1RfQ09ORklH
LCQoMykpICYmIFwKPiAgICAgICAJZWNobyAnJChzdHJpcCAkKDIpKScgPj4gJChjYWxsIEtDT05G
SUdfRE9UX0NPTkZJRywkKDMpKQo+ICAgICAgIGVuZGVmCj4gICAgICAgCj4gICAgICAgIyBLQ09O
RklHX0VOQUJMRV9PUFQgKG9wdGlvbiBbLCBmaWxlXSkKPiAgICAgIC1LQ09ORklHX0VOQUJMRV9P
UFQgID0gJChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgxKSwgJCgxKT15LCAkKDIp
KQo+ICAgICAgK2RlZmluZSBLQ09ORklHX0VOQUJMRV9PUFQKPiAgICAgICsJaWYgISBncmVwIC1x
IC1FICdeJCgxKT0nICQoY2FsbCBLQ09ORklHX0RPVF9DT05GSUcsJCgyKSk7IHRoZW4gXAo+ICAg
ICAgKwkJJChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgxKSwgJCgxKT15LCAkKDIp
KSB8fCBleGl0IDE7IFwKPiAgICAgICsJZmkKPiAgICAgICtlbmRpZgo+ICAgICAgICMgS0NPTkZJ
R19TRVRfT1BUIChvcHRpb24sIHZhbHVlIFssIGZpbGVdKQo+ICAgICAgIEtDT05GSUdfU0VUX09Q
VCAgICAgPSAkKGNhbGwgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHLCAkKDEpLCAkKDEpPSQoMiks
ICQoMykpCj4gICAgICAgIyBLQ09ORklHX0RJU0FCTEVfT1BUICAob3B0aW9uIFssIGZpbGVdKQpJ
IHByZWZlciB0aGlzOgoKIMKgIyBLQ09ORklHX01VTkdFX0RPVF9DT05GSUcgKG9wdGlvbiwgbmV3
bGluZSBbLCBmaWxlXSkKIMKgZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRwotwqDCoMKg
ICQoU0VEKSAiL1xcPCQoc3RyaXAgJCgxKSlcXD4vZCIgJChjYWxsIEtDT05GSUdfRE9UX0NPTkZJ
RywkKDMpKQorwqDCoMKgICQoU0VEKSAnL15cKCMgXClcPyQoc3RyaXAgJCgxKSlcPi9kJyAkKGNh
bGwgCktDT05GSUdfRE9UX0NPTkZJRywkKDMpKSAmJiBcCiDCoMKgwqDCoCBlY2hvICckKHN0cmlw
ICQoMikpJyA+PiAkKGNhbGwgS0NPTkZJR19ET1RfQ09ORklHLCQoMykpCiDCoGVuZGVmCgogwqAj
IEtDT05GSUdfRU5BQkxFX09QVCAob3B0aW9uIFssIGZpbGVdKQotS0NPTkZJR19FTkFCTEVfT1BU
wqAgPSAkKGNhbGwgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHLCAkKDEpLCAkKDEpPXksICQoMikp
CitkZWZpbmUgS0NPTkZJR19FTkFCTEVfT1BUCivCoMKgwqAgJChRKWlmICEgZ3JlcCAtcSAnXiQo
c3RyaXAgJCgxKSk9W215XScgJChjYWxsIApLQ09ORklHX0RPVF9DT05GSUcsJCgyKSk7IHRoZW4g
XAorwqDCoMKgIMKgwqDCoCAkKGNhbGwgS0NPTkZJR19NVU5HRV9ET1RfQ09ORklHLCAkKDEpLCAk
KDEpPXksICQoMikpIHx8IGV4aXQgMTsgXAorwqDCoMKgIGZpCitlbmRlZgoKUmVnYXJkcywKWXVh
bmhhbwo+Cj4gT3IgbWF5YmUganVzdCB0aGF0Ogo+Cj4gICAgICBkaWZmIC0tZ2l0IGEvcGFja2Fn
ZS9wa2ctdXRpbHMubWsgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+ICAgICAgaW5kZXggN2QxYWVh
NzcxMC4uOGFlYmQxNDExNCAxMDA2NDQKPiAgICAgIC0tLSBhL3BhY2thZ2UvcGtnLXV0aWxzLm1r
Cj4gICAgICArKysgYi9wYWNrYWdlL3BrZy11dGlscy5tawo+ICAgICAgQEAgLTI3LDcgKzI3LDcg
QEAgZGVmaW5lIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRwo+ICAgICAgIGVuZGVmCj4gICAgICAg
Cj4gICAgICAgIyBLQ09ORklHX0VOQUJMRV9PUFQgKG9wdGlvbiBbLCBmaWxlXSkKPiAgICAgIC1L
Q09ORklHX0VOQUJMRV9PUFQgID0gJChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgx
KSwgJCgxKT15LCAkKDIpKQo+ICAgICAgK0tDT05GSUdfRU5BQkxFX09QVCAgPSAkKGNhbGwgS0NP
TkZJR19NVU5HRV9ET1RfQ09ORklHLCAkKDEpIGlzIG5vdCBzZXQsICQoMSk9eSwgJCgyKSkKPiAg
ICAgICAjIEtDT05GSUdfU0VUX09QVCAob3B0aW9uLCB2YWx1ZSBbLCBmaWxlXSkKPiAgICAgICBL
Q09ORklHX1NFVF9PUFQgICAgID0gJChjYWxsIEtDT05GSUdfTVVOR0VfRE9UX0NPTkZJRywgJCgx
KSwgJCgxKT0kKDIpLCAkKDMpKQo+ICAgICAgICMgS0NPTkZJR19ESVNBQkxFX09QVCAgKG9wdGlv
biBbLCBmaWxlXSkKPgo+IEFsc28sIEkgbm90aWNlIG5vdyB0aGF0IHRoaXMgS0NPTkZJR19NVU5H
RV9ET1RfQ09ORklHIGlzIHByZXR0eSBmcmFnaWxlLgo+IEdpdmVuIGEgLmNvbmZpZyB3aXRoOgo+
Cj4gICAgICBGT089IjEyMzQiCj4gICAgICBCQVI9IiQoRk9PKSIKPgo+IGFuZCB0aGVuOgo+Cj4g
ICAgICAkKGNhbGwgS0NPTkZJR19TRVRfT1BULEZPTyxhemVydHkpCj4KPiB3b3VsZCB5aWVsZCBh
IC5jb25maWcgd2l0aCBqdXN0Ogo+Cj4gICAgICBGT089ImF6ZXJ0eSIKPgo+IGJlY2F1c2UgXDxG
T09cPiB3b3VsZCBtYXRjaCB0aGUgYXNzaWduZW1lbnQgdG8gQkFSLgo+Cj4gU28gd2UgbWF5IG5l
ZWQgdG8gcmV2aXNpdCB0aGF0IG1lc3Mgb2YgbWluZS4uLgo+Cj4gUmVnYXJkcywKPiBZYW5uIEUu
IE1PUklOLgo+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8v
bGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
