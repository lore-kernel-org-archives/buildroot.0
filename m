Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D520E77188
	for <buildroot@archiver.kernel.org>; Tue, 24 Dec 2024 12:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7486065D;
	Tue, 24 Dec 2024 12:23:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b8nKFI4nVC2I; Tue, 24 Dec 2024 12:23:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8064D60BC3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8064D60BC3;
	Tue, 24 Dec 2024 12:23:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FE6757
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 12:23:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3F136065D
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 12:23:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Xb45B04IwRAE for <buildroot@buildroot.org>;
 Tue, 24 Dec 2024 12:23:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=147.173.1.68;
 helo=mailgw-out1.grenoble.cnrs.fr; envelope-from=bonet@grenoble.cnrs.fr;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6842560BC3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6842560BC3
Received: from mailgw-out1.grenoble.cnrs.fr (mailgw-out1.grenoble.cnrs.fr
 [147.173.1.68])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6842560BC3
 for <buildroot@buildroot.org>; Tue, 24 Dec 2024 12:23:01 +0000 (UTC)
Received: from [IPV6:2a01:e0a:12:eba0:1aa2:48b6:81e8:4d24] (unknown
 [IPv6:2a01:e0a:12:eba0:1aa2:48b6:81e8:4d24])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailgw-out1.grenoble.cnrs.fr (Postfix) with ESMTPSA id 49642BFBE6;
 Tue, 24 Dec 2024 13:22:58 +0100 (CET)
Message-ID: <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
Date: Tue, 24 Dec 2024 13:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>,
 Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham
 <judge.packham@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
Content-Language: en-US
From: Edgar Bonet <bonet@grenoble.cnrs.fr>
In-Reply-To: <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=grenoble.cnrs.fr; 
 s=202106-grenoble.cnrs.fr; t=1735042978;
 bh=4XvK+jmrKje9rIeDYOJZZEC5NmwjdCMCF3gLtxJpkyk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lGAJLURXojxTL+wlABGHslsiylNsmIeZ/uXyD65P6YMv/1E2E724bC1kTHD9UhfPN
 HkelKAWFt5B8LGIhDVrTFID2Ku1qwsZ2BdvzlxZ6juqFUrSIRA/R4YamqMowIKgqLc
 Lvp2c0ETsLiqnn65O74N6zccS6TlsWW72yT+HKC9qPW/a9HTw/PVwvDFAtcenBvIzd
 csbHoXrAgOckelY8m3FKWywuYOo/CVgfqX4ptqMnP9iWo7XRha0UcNlSRZ1OS3a+pX
 +StCMwmWXjkjuxCeP9B4y7IwSvh1O3ePjrz2GI22dtZryjZeN/ctKsozwPEpi12nIm
 b+Q+eLLslQlgw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=grenoble.cnrs.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=grenoble.cnrs.fr header.i=@grenoble.cnrs.fr
 header.a=rsa-sha256 header.s=202106-grenoble.cnrs.fr header.b=lGAJLURX
Subject: Re: [Buildroot] [PATCH v2 1/1] linux: make out-of-tree DTS work
 with newest kernels
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8hCgpPbiAyMDI0LTEyLTE4LCBSb21haW4gTmFvdXIgd3JvdGU6Cj4gSGVsbG8gRWRnYXIs
Cj4gCj4gTGUgMTcvMTIvMjAyNCDDoCAxMDo1NSwgRWRnYXIgQm9uZXQgYSDDqWNyaXTCoDoKPj4g
U2luY2UgTGludXggNi4xMiAoY29tbWl0IGU3ZTI5NDEzMDBkMiwgImtidWlsZDogc3BsaXQgZGV2
aWNlIHRyZWUgYnVpbGQKPj4gcnVsZXMgaW50byBzY3JpcHRzL01ha2VmaWxlLmR0YnMiKSwgdGhl
IGtlcm5lbCBidWlsZCBwcm9jZXNzIGRvZXMgbm90Cj4+IGJ1aWxkIHRoZSBEVEJzIGZyb20gdGhl
IHNvdXJjZSBmaWxlcyBsaXN0ZWQgaW4KPj4gQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BB
VEguWzFdIFRoaXMgaXMgYmVjYXVzZSBpdCBleHBlY3RzIGFsbCB0aGUKPj4gRFRTIGZpbGVzIHRv
IGxpdmUgaW4gdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVzIG9mCj4+IGFyY2gvJEFSQ0gv
Ym9vdC9kdHMvICwgd2hlcmVhcyBCdWlsZHJvb3QgZHJvcHMgdGhlbSBpbiB0aGUgdG9wIGR0cwo+
PiBkaXJlY3RvcnkuCj4gCj4gTWF5YmUgd2UgY291bGQgYWRkIHNvbWUgYWRkaXRpb25hbCBleHBs
YW5hdGlvbjoKPiAKPiBCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9EVFNfUEFUSCB3YXMgaW50cm9k
dWNlZCBpbiBCdWlsZHJvb3QgMjAxMi4wOCBbMV0gYXQgdGhlCj4gdGltZSB0aGUga2VybmVsIGRp
ZG4ndCBoYXZlIGFueSB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3J5IGluCj4gYXJjaC8kQVJD
SC9ib290L2R0cy8uCj4gCj4gdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yeSB3YXMgaW50cm9k
dWNlZCBpbiBrZXJuZWwgdjMuMTkgWzJdIGZvciBBUk02NCBhbmQgaW4KPiBrZXJuZWwgdjYuNSBm
b3IgQVJNIFszXS4gTm90ZSwgb3RoZXIgYXJjaCB0aGFuIEFSTSBhbmQgQVJNNjQgZG9lc24ndCBh
Y3R1YWxseQo+IHVzZSBhIHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3RvcnkgKG5vdCBldmVuIHBv
d2VycGMpLgoKSSBoYWRuJ3Qgbm90aWNlZCB0aGF0IHRoaXMgdmFyaWVzIGFtb25nIGFyY2hzLiBO
b3cgdGhhdCBJIGxvb2sgYXQgaXQsIGl0CmFwcGVhcnMgbWlwcyBhbmQgcmlzY3YgYWxzbyB1c2Ug
dmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVzLgoKPiBZb3VyIGNvbW1lbnQgZG9lc24ndCBz
ZWVtcyB0byBhcHBseSBmb3Igbm9uIEFSTXssNjR9IGFyY2g6Cj4gIlRoaXMgaXMgYmVjYXVzZSBp
dCBleHBlY3RzIGFsbCB0aGUgRFRTIGZpbGVzIHRvIGxpdmUgaW4gdmVuZG9yLXNwZWNpZmljCj4g
c3ViZGlyZWN0b3JpZXMgb2YgYXJjaC8kQVJDSC9ib290L2R0cy8iCgpJbmRlZWQsIGl0IGlzIGFy
Y2hpdGVjdHVyZS1kZXBlbmRlbnQuCgo+IFsxXQo+IGh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJv
b3Qub3JnL2J1aWxkcm9vdC8tL2NvbW1pdC82OWZjNDk3ZGYwYWU1MWJjYzhhMDY3Yzg0OTQ0N2Fi
ZGViM2NiMmJlCj4gWzJdCj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvP2lkPWNhNWIzNDEwMGM1NzE2NThlNjA1
YzU1NTRhYWMzNzQ2NDk1OTMzMjcKPiBbM10KPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9z
Y20vbGludXgva2VybmVsL2dpdC9zdGFibGUvbGludXguZ2l0L2NvbW1pdC8/aWQ9NzI0YmE2NzUx
NTMyMDU1ZGI3NTk5MmZjNmFlMjFjM2UzMjJlOTRhNwo+IAo+IAo+Pgo+PiBGdWxmaWxsaW5nIHRo
aXMga2VybmVsIGV4cGVjdGF0aW9uIHdvdWxkIHJlcXVpcmUgYSBuZXcgY29uZmlndXJhdGlvbgo+
PiBwYXJhbWV0ZXIgZm9yIHRoZSBuYW1lIG9mIHRoZSBhcHByb3ByaWF0ZSB2ZW5kb3Igc3ViZGly
ZWN0b3J5LiBJdCB3b3VsZAo+PiBhbHNvIHJlcXVpcmUgY2hhbmdpbmcgdGhlIHJlbGF0aXZlIHBh
dGhzIHRvIGluY2x1ZGVkIC5kdHNpIGZpbGVzLgo+Pgo+PiBMZXQncyBhZGQgaW5zdGVhZCBhIHJ1
bGUgdG8gdGhlIHRvcCBkdHMvTWFrZWZpbGUgZm9yIGVhY2ggRFRCIHdlIHdhbnQgdG8KPj4gYnVp
bGQuIFRoaXMgYXZvaWRzIGJyZWFraW5nIHVzZXIncyBvdXQtb2YtdHJlZSBjb25maWd1cmF0aW9u
cy4KPj4KPj4gWzFdIGh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9waXBlcm1haWwvYnVpbGRy
b290LzIwMjQtT2N0b2Jlci83NjU0NjMuaHRtbAo+IAo+IE5vdGU6IFlvY3RvIGRvZXNuJ3QgcmVs
eSBvbiB0aGUga2VybmVsIGJ1aWxkIGluZnJhc3RydWN0dXJlIHRvIGJ1aWxkIHVzZXIKPiBwcm92
aWRlZCBkZXZpY2V0cmVlIFs0XS4KPiAKPiBNYXliZSB3ZSBzaG91bGQgY29uc2lkZXIgYWRkaW5n
IGEgbmV3IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgbGlrZSBrZXJuZWwtbW9kdWxlPwoKVGhpcyBz
ZWVtcyBsaWtlIGFuIGludGVyZXN0aW5nIG9wdGlvbi4gSXQgaXMsIGhvd2V2ZXIsIGJleW9uZCBt
eQpjYXBhYmlsaXRpZXMuCgpTaG91bGQgSSByZXNwaW4gdGhpcyBwYXRjaCB3aXRoIGFuIHVwZGF0
ZWQgY29tbWl0IGxvZz8gT3Igc2hvdWxkIEkKaW5zdGVhZCB3YWl0IGZvciBzb21lb25lIHRvIGlt
cGxlbWVudCBhIFlvY3RvLWxpa2UgYXBwcm9hY2g/CgpSZWdhcmRzLAoKRWRnYXIgQm9uZXQuCgo+
IFs0XQo+IGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuZW1iZWRkZWQvb3BlbmVtYmVkZGVkLWNvcmUv
YmxvYi9mNjQyZWRiMDA2YThjMTZkYmU0NTY4MWFmZTU0N2VhYmZhZTE3MDczL21ldGEvY2xhc3Nl
cy1yZWNpcGUvZGV2aWNldHJlZS5iYmNsYXNzI0w1OUMxLUw1OUM5Cj4gCj4gQmVzdCByZWdhcmRz
LAo+IFJvbWFpbgo+IAo+IAo+Pgo+PiBSZXBvcnRlZC1ieTogQ2hyaXMgUGFja2hhbSA8anVkZ2Uu
cGFja2hhbUBnbWFpbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEVkZ2FyIEJvbmV0IDxib25ldEBn
cmVub2JsZS5jbnJzLmZyPgo+PiAtLS0KPj4gQ2hhbmdlcyB2MSAtPiB2MjoKPj4gICAtIGRlZmlu
ZSBhIGhvb2sgZm9yIExJTlVYX1BPU1RfUEFUQ0hfSE9PS1MgYW5kIExJTlVYX1BPU1RfUlNZTkNf
SE9PS1MKPj4gICAgIGluc3RlYWQgb2YgbW9kaWZ5aW5nIExJTlVYX0JVSUxEX0NNRFMKPj4gICAt
IHVzZSAkKHBhdHN1YnN0ICUuZHRzLCUuZHRiLCQoZHRzKSkgaW5zdGVhZCBvZiAkKGR0czolLmR0
cz0lLmR0YikKPj4gYm90aCBjaGFuZ2VzIHN1Z2dlc3RlZCBieSBBcm5vdXQgVmFuZGVjYXBwZWxs
ZS4KPj4KPj4gSSByYW4gdGhlIGZvbG93aW5nIGJ1aWxkIHRlc3RzOgo+Pgo+PiAgICAgIyBUZXN0
IHdpdGggYW4gb2xkIGtlcm5lbDogdjYuNi4zMAo+PiAgICAgbWFrZSBhY21lc3lzdGVtc19hY3F1
YV9hNV81MTJtYl9kZWZjb25maWcKPj4gICAgIG1ha2UgbGludXgKPj4KPj4gICAgICMgVGVzdCB3
aXRoIGEgbmV3IGtlcm5lbDogdjYuMTIuNQo+PiAgICAgbWFrZSBsaW51eC1kaXJjbGVhbgo+PiAg
ICAgZ2l0IGNoZXJyeS1waWNrIDA5MzgzNDZjZGUgICMgYnVtcCBBY3F1YSdzIGtlcm5lbCB0byB2
Ni4xMi41Cj4+ICAgICBtYWtlIGFjbWVzeXN0ZW1zX2FjcXVhX2E1XzUxMm1iX2RlZmNvbmZpZwo+
PiAgICAgbWFrZSBsaW51eAo+Pgo+PiAgICAgIyBUZXN0IHRoZSBPVkVSUklERV9TUkNESVIgY2Fz
ZS4KPj4gICAgIG1ha2UgbGludXgtZGlyY2xlYW4KPj4gICAgIGdpdCAtQyAkSE9NRS9zcmMvbGlu
dXggY2hlY2tvdXQgdjYuMTIuNQo+PiAgICAgZWNobyAiTElOVVhfT1ZFUlJJREVfU1JDRElSID0g
JEhPTUUvc3JjL2xpbnV4IiA+IGxvY2FsLm1rCj4+ICAgICBtYWtlIGFjbWVzeXN0ZW1zX2FjcXVh
X2E1XzUxMm1iX2RlZmNvbmZpZwo+PiAgICAgbWFrZSBsaW51eAo+Pgo+PiAgbGludXgvbGludXgu
bWsgfCAxMSArKysrKysrKysrKwo+PiAgMSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykK
Pj4KPj4gZGlmZiAtLWdpdCBhL2xpbnV4L2xpbnV4Lm1rIGIvbGludXgvbGludXgubWsKPj4gaW5k
ZXggMWQzZDhmZmZhNi4uZWI1MDlmZDc0NyAxMDA2NDQKPj4gLS0tIGEvbGludXgvbGludXgubWsK
Pj4gKysrIGIvbGludXgvbGludXgubWsKPj4gQEAgLTMyNyw2ICszMjcsMTcgQEAgZGVmaW5lIExJ
TlVYX1RSWV9QQVRDSF9USU1FQ09OU1QKPj4gIGVuZGVmCj4+ICBMSU5VWF9QT1NUX1BBVENIX0hP
T0tTICs9IExJTlVYX1RSWV9QQVRDSF9USU1FQ09OU1QKPj4gIAo+PiArIyBLZXJuZWxzIDYuMTIr
IHdvbid0IGNvbXBpbGUgdGhlIGN1c3RvbSBEVFMgZmlsZXMgd2UgZHJvcCBpbnRvCj4+ICsjIGFy
Y2gvJEFSQ0gvYm9vdC9kdHMgdW5sZXNzIHdlIGFkZCBzcGVjaWZpYyBydWxlcyB0byB0aGF0IGRp
cmVjdG9yeSdzCj4+ICsjIE1ha2VmaWxlLgo+PiArZGVmaW5lIExJTlVYX0FERF9EVEJfTUFLRV9S
VUxFUwo+PiArCSQoZm9yZWFjaCBkdHMsJChjYWxsIHFzdHJpcCwkKEJSMl9MSU5VWF9LRVJORUxf
Q1VTVE9NX0RUU19QQVRIKSksIFwKPj4gKwkJZWNobyAiZHRiLXkgKz0gJChwYXRzdWJzdCAlLmR0
cywlLmR0YiwkKG5vdGRpciAkKGR0cykpKSIgPj4gJChMSU5VWF9BUkNIX1BBVEgpL2Jvb3QvZHRz
L01ha2VmaWxlCj4+ICsJKQo+PiArZW5kZWYKPj4gK0xJTlVYX1BPU1RfUEFUQ0hfSE9PS1MgKz0g
TElOVVhfQUREX0RUQl9NQUtFX1JVTEVTCj4+ICtMSU5VWF9QT1NUX1JTWU5DX0hPT0tTICs9IExJ
TlVYX0FERF9EVEJfTUFLRV9SVUxFUwo+PiArCj4+ICBMSU5VWF9LRVJORUxfQ1VTVE9NX0xPR09f
UEFUSCA9ICQoY2FsbCBxc3RyaXAsJChCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9MT0dPX1BBVEgp
KQo+PiAgaWZuZXEgKCQoTElOVVhfS0VSTkVMX0NVU1RPTV9MT0dPX1BBVEgpLCkKPj4gIExJTlVY
X0RFUEVOREVOQ0lFUyArPSBob3N0LWltYWdlbWFnaWNrCj4gCj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBidWlsZHJvb3QgbWFpbGluZyBsaXN0Cj4g
YnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKPiBodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFp
bG1hbi9saXN0aW5mby9idWlsZHJvb3QKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9v
dC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRy
b290Cg==
