Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9C9C02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 15:48:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935E1608FC;
	Mon,  3 Feb 2025 15:48:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QQuH3eWr20aI; Mon,  3 Feb 2025 15:48:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C741605E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C741605E5;
	Mon,  3 Feb 2025 15:48:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id EDCE412A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:48:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD36880E57
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:48:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nI8SYDNRrSI8 for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 15:48:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 51F6D81A4E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51F6D81A4E
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51F6D81A4E
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 15:48:35 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.121.178]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4zAy-1tFR1Z2Fe8-01031D; Mon, 03
 Feb 2025 16:48:17 +0100
Message-ID: <1c7e531a-e549-4893-b8fd-d7e9cb01f319@gmx.de>
Date: Mon, 3 Feb 2025 16:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Romain Naour <romain.naour@smile.fr>, Edgar Bonet
 <bonet@grenoble.cnrs.fr>, Buildroot development <buildroot@buildroot.org>
Cc: Michael Walle <mwalle@kernel.org>, Chris Packham
 <judge.packham@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
References: <035d6d78-0a31-4083-8fa1-65f5be5f74b5@grenoble.cnrs.fr>
 <3ea35c40-07d1-41d3-b4f9-08bbb0336d24@smile.fr>
 <4e691513-04a1-4f6f-ad3a-df18f653a6b7@grenoble.cnrs.fr>
 <f6d14b70-cf74-4a03-80fd-5e4fc4325a47@gmx.de>
 <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <d01683ed-cc7e-4c0d-a807-7a76ce7129ba@smile.fr>
X-Provags-ID: V03:K1:JB9X09QtLmrETj5IIIntwouGYt+3ZYTjStdUHa+aVAZFK2IQ1Z2
 jDyusufl5k2ODPTEu6pHqEFm2Hcfvqcx7cgLcVvraCl+AdXVs+mO1hd/IoERYMcVneGf3JR
 0UxIp/Ij5Xs2jvn6aE3LnlqsYoXPdogK/UhxJ2z4mzSnd8jGQRzwooN+g6TZj7I4js+zRjV
 Eld+n28NdSwIFeVjnhuBw==
UI-OutboundReport: notjunk:1;M01:P0:2E3ApVzRxRQ=;2vuNRH6kNdxlVrAn5WLrIbHTsGK
 wwYF6yY6MDKgsnKninrH9qlsEV2NH+wCPKsT/65aE09J959dmfXVGJyucPkbpdU4odfxcc4Xb
 dAVDQ7fVhQlcl5+zmuvTnKnB1U4lHZlUdK720mGw9FvBaLuMZueQ0+7j89Ag1qvmOdm1Ngmpr
 i9DrDd1nTiA6YiQkbRpY6Smsm1n2emUkRKeKUSW1oNjG7p4fy8oeVJWqy2VJyat/ZTydz85cQ
 svyHNx0QJw2zemLKdpZaJ/+azGYb3zDZPnTdqynp9mXW72AkxT1UO+/Ngu5km+5G07haokxTE
 X6V6oCizB49tc8LCwgiOilzeC+R7IcCcAs64YBPvAIL+5WwskG3WzZZhd6QYU2tVZEeJL+T+R
 a2Y2FT6pMK2BMCzOPRe8XktZIwFXpkzNN/dWqAqPf+ilEOlYRSN28lSp46o6oW508Qsw19B5q
 Wrhk3fLGOSieY5dBlJoRED0gFFJTF26+dxPuN/tukRgi0AwNOLTWHcTv9IjFww3QGcWZMePTZ
 B0yX1TtS0ZgVZEJY/52LVsMtBX/naZwwicDjZFG5QcuHiFFrJHDVofHIxsVle9zMtCZvM/rpP
 Hze8cf0Vsz989r8HIlR14Cw/pIiduaqv5GgztYZ/CcAm4JjWkRaaYGlMply4lAaRU5o9E4Xdm
 vWe+FdOaBgHZkkbP3bW0Sr03CuUBdMj4YMKrUWsvSySlUhgfDKtaBBayE/n3nVdt2pAmagCd2
 WnowH0W9PbmWv30j+TWE9b9xcNUD3ZF2rljm561hXCHb+Qb8MjjxKxOI9IIYHpUJqsRLIKmfT
 QndtaGPKBjYU1BulrcKDMok7ZShkezkGZVoOcJjl7bU0ynRoWnOgsDkHhLdyYrzwKUqMch/P+
 8rYR+I6mk1GeA+ZfrVr55JfqMy/UZF3oE2OzxccKob9W4w64RPHuWbTHUkp7zqBzn9Syq3ZEC
 Mzme35fxk0C1JaersOxQjNjOFm6i6yjn5kqI3/YK88XyLb0xDqAjk3jYx7i+QR691aZyY0Us4
 j+j2bZ4xYbnM4+DK7SLMKsfDdqdrF/3Dc5nOJ+djuluouL3ZaBHQv07qRlC54Y84cs2duhnCQ
 gwmV4nyb7Vww9VSur4DcJ2lSGT5cwARsS8mkPWe5xwYz9IHQTwEbh7IQ/eJ6zznv+LeYBuq9l
 Fkpavgz2A2iDnxGXPBcSu1Zr/ud8OiHwZASvEftxfAYPXduJXxxMliotES0qjhQRmY9KuJdof
 m+j3XzqrpQ1GqYNxy5RFZdSJrfDFJh1Q8JXYwom0g+uuUOB/W2HpXZKU6aWc9rc7Q5MOmsKGo
 2CeNpLuxW00OQXYIl10jT2S2I311Ij9r44vGviysGapTaY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1738597697; x=1739202497; i=fiona.klute@gmx.de;
 bh=Fs6O19k0vJt10DcBlZIysJl30DtqNncXwaS5l02FfPU=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=dInia55Kx8/1Z4ZvBgqTlpuHOfOkQVnz0bYXtdsmYQrqcUeDoJboGzEPZXZHNV1K
 VVd1yxMor+e5kD0F/kCgITtwniTl2if7CURiK8F6GWe9Ham75YxOI2cB9pgrFw1Ki
 VNc3PGWXeG9vzraqADE5XJ0Zzt585HyemK2uH/Ir6lZhZA2rnhzEslPNdh66TmfMf
 zbVSs316FRmIq551sS4HbnGslBem0ao6tWoXg43a+DWBgz4HuxeQ2AUqovNP/icnG
 UUz69kF9zptF6Ghq6nsUH5SuduSqqfdT9eITAT6xJqxvBAzfueIVcFa3eH6p1ddvO
 Z+1gowxbUathXwbbYw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=dInia55K
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

QW0gMjkuMDEuMjUgdW0gMTE6MTAgc2NocmllYiBSb21haW4gTmFvdXIgdmlhIGJ1aWxkcm9vdDoK
PiBIZWxsbyBGaW9uYSwgQWxsLAo+Cj4gTGUgMjgvMDEvMjAyNSDDoCAxNDozMywgRmlvbmEgS2x1
dGUgYSDDqWNyaXTCoDoKPj4gQW0gMjQuMTIuMjQgdW0gMTM6MjIgc2NocmllYiBFZGdhciBCb25l
dDoKPj4+IEhlbGxvIQo+Pj4KPj4+IE9uIDIwMjQtMTItMTgsIFJvbWFpbiBOYW91ciB3cm90ZToK
Pj4+PiBIZWxsbyBFZGdhciwKPj4+Pgo+Pj4+IExlIDE3LzEyLzIwMjQgw6AgMTA6NTUsIEVkZ2Fy
IEJvbmV0IGEgw6ljcml0wqA6Cj4+Pj4+IFNpbmNlIExpbnV4IDYuMTIgKGNvbW1pdCBlN2UyOTQx
MzAwZDIsICJrYnVpbGQ6IHNwbGl0IGRldmljZSB0cmVlIGJ1aWxkCj4+Pj4+IHJ1bGVzIGludG8g
c2NyaXB0cy9NYWtlZmlsZS5kdGJzIiksIHRoZSBrZXJuZWwgYnVpbGQgcHJvY2VzcyBkb2VzIG5v
dAo+Pj4+PiBidWlsZCB0aGUgRFRCcyBmcm9tIHRoZSBzb3VyY2UgZmlsZXMgbGlzdGVkIGluCj4+
Pj4+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRILlsxXSBUaGlzIGlzIGJlY2F1c2Ug
aXQgZXhwZWN0cyBhbGwgdGhlCj4+Pj4+IERUUyBmaWxlcyB0byBsaXZlIGluIHZlbmRvci1zcGVj
aWZpYyBzdWJkaXJlY3RvcmllcyBvZgo+Pj4+PiBhcmNoLyRBUkNIL2Jvb3QvZHRzLyAsIHdoZXJl
YXMgQnVpbGRyb290IGRyb3BzIHRoZW0gaW4gdGhlIHRvcCBkdHMKPj4+Pj4gZGlyZWN0b3J5Lgo+
Pj4+Cj4+Pj4gTWF5YmUgd2UgY291bGQgYWRkIHNvbWUgYWRkaXRpb25hbCBleHBsYW5hdGlvbjoK
Pj4+Pgo+Pj4+IEJSMl9MSU5VWF9LRVJORUxfQ1VTVE9NX0RUU19QQVRIIHdhcyBpbnRyb2R1Y2Vk
IGluIEJ1aWxkcm9vdCAyMDEyLjA4IFsxXSBhdCB0aGUKPj4+PiB0aW1lIHRoZSBrZXJuZWwgZGlk
bid0IGhhdmUgYW55IHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3RvcnkgaW4KPj4+PiBhcmNoLyRB
UkNIL2Jvb3QvZHRzLy4KPj4+Pgo+Pj4+IHZlbmRvci1zcGVjaWZpYyBzdWJkaXJlY3Rvcnkgd2Fz
IGludHJvZHVjZWQgaW4ga2VybmVsIHYzLjE5IFsyXSBmb3IgQVJNNjQgYW5kIGluCj4+Pj4ga2Vy
bmVsIHY2LjUgZm9yIEFSTSBbM10uIE5vdGUsIG90aGVyIGFyY2ggdGhhbiBBUk0gYW5kIEFSTTY0
IGRvZXNuJ3QgYWN0dWFsbHkKPj4+PiB1c2UgYSB2ZW5kb3Itc3BlY2lmaWMgc3ViZGlyZWN0b3J5
IChub3QgZXZlbiBwb3dlcnBjKS4KPj4+Cj4+PiBJIGhhZG4ndCBub3RpY2VkIHRoYXQgdGhpcyB2
YXJpZXMgYW1vbmcgYXJjaHMuIE5vdyB0aGF0IEkgbG9vayBhdCBpdCwgaXQKPj4+IGFwcGVhcnMg
bWlwcyBhbmQgcmlzY3YgYWxzbyB1c2UgdmVuZG9yLXNwZWNpZmljIHN1YmRpcmVjdG9yaWVzLgo+
Pj4KPj4+PiBZb3VyIGNvbW1lbnQgZG9lc24ndCBzZWVtcyB0byBhcHBseSBmb3Igbm9uIEFSTXss
NjR9IGFyY2g6Cj4+Pj4gIlRoaXMgaXMgYmVjYXVzZSBpdCBleHBlY3RzIGFsbCB0aGUgRFRTIGZp
bGVzIHRvIGxpdmUgaW4gdmVuZG9yLXNwZWNpZmljCj4+Pj4gc3ViZGlyZWN0b3JpZXMgb2YgYXJj
aC8kQVJDSC9ib290L2R0cy8iCj4+Pgo+Pj4gSW5kZWVkLCBpdCBpcyBhcmNoaXRlY3R1cmUtZGVw
ZW5kZW50Lgo+Pj4KPj4+PiBbMV0KPj4+PiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9y
Zy9idWlsZHJvb3QvLS8KPj4+PiBjb21taXQvNjlmYzQ5N2RmMGFlNTFiY2M4YTA2N2M4NDk0NDdh
YmRlYjNjYjJiZQo+Pj4+IFsyXQo+Pj4+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3N0YWJsZS9saW51eC5naXQvY29tbWl0Lz8KPj4+PiBpZD1jYTViMzQx
MDBjNTcxNjU4ZTYwNWM1NTU0YWFjMzc0NjQ5NTkzMzI3Cj4+Pj4gWzNdCj4+Pj4gaHR0cHM6Ly9n
aXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9j
b21taXQvPwo+Pj4+IGlkPTcyNGJhNjc1MTUzMjA1NWRiNzU5OTJmYzZhZTIxYzNlMzIyZTk0YTcK
Pj4+Pgo+Pj4+Cj4+Pj4+Cj4+Pj4+IEZ1bGZpbGxpbmcgdGhpcyBrZXJuZWwgZXhwZWN0YXRpb24g
d291bGQgcmVxdWlyZSBhIG5ldyBjb25maWd1cmF0aW9uCj4+Pj4+IHBhcmFtZXRlciBmb3IgdGhl
IG5hbWUgb2YgdGhlIGFwcHJvcHJpYXRlIHZlbmRvciBzdWJkaXJlY3RvcnkuIEl0IHdvdWxkCj4+
Pj4+IGFsc28gcmVxdWlyZSBjaGFuZ2luZyB0aGUgcmVsYXRpdmUgcGF0aHMgdG8gaW5jbHVkZWQg
LmR0c2kgZmlsZXMuCj4+Pj4+Cj4+Pj4+IExldCdzIGFkZCBpbnN0ZWFkIGEgcnVsZSB0byB0aGUg
dG9wIGR0cy9NYWtlZmlsZSBmb3IgZWFjaCBEVEIgd2Ugd2FudCB0bwo+Pj4+PiBidWlsZC4gVGhp
cyBhdm9pZHMgYnJlYWtpbmcgdXNlcidzIG91dC1vZi10cmVlIGNvbmZpZ3VyYXRpb25zLgo+Pj4+
Pgo+Pj4+PiBbMV0gaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL3BpcGVybWFpbC9idWlsZHJv
b3QvMjAyNC1PY3RvYmVyLzc2NTQ2My5odG1sCj4+Pj4KPj4+PiBOb3RlOiBZb2N0byBkb2Vzbid0
IHJlbHkgb24gdGhlIGtlcm5lbCBidWlsZCBpbmZyYXN0cnVjdHVyZSB0byBidWlsZCB1c2VyCj4+
Pj4gcHJvdmlkZWQgZGV2aWNldHJlZSBbNF0uCj4+Pj4KPj4+PiBNYXliZSB3ZSBzaG91bGQgY29u
c2lkZXIgYWRkaW5nIGEgbmV3IHBhY2thZ2UgaW5mcmFzdHJ1Y3R1cmUgbGlrZSBrZXJuZWwtbW9k
dWxlPwo+Pj4KPj4+IFRoaXMgc2VlbXMgbGlrZSBhbiBpbnRlcmVzdGluZyBvcHRpb24uIEl0IGlz
LCBob3dldmVyLCBiZXlvbmQgbXkKPj4+IGNhcGFiaWxpdGllcy4KPj4KPj4gQml0IGxhdGUgdG8g
dGhlIHBhcnR5LCBidXQ6IEkgY3VycmVudGx5IGhhdmUgYSBwYWNrYWdlIGluIGFuIGV4dGVybmFs
Cj4+IHRyZWUgdGhhdCB0YWtlcyBhIGxpc3Qgb2YgLmR0cy8uZHRzbyBmaWxlcyBmcm9tIGNvbmZp
ZyBhbmQgY2FsbHMgY3BwICYKPj4gZHRjIHRvIGJ1aWxkIC5kdGIvLmR0Ym8gZmlsZXMsIHdpdGgg
aW5jbHVkZSBwYXRocyBpbnRvIHRoZSBMaW51eCBidWlsZAo+PiBkaXIgYWRkZWQuIFRoZSBidWls
ZCBjb21tYW5kcyBhcmUgbmF0dXJhbGx5IG1vZGVsZWQgb24gaG93IHRoZSBrZXJuZWwKPj4gYnVp
bGQgYnVpbGRzIERUQnMsIGJ1dCBpdCBkb2Vzbid0IHJlbHkgb24gdGhlIGtlcm5lbCBNYWtlZmls
ZXMuCj4KPiBBRkFJSywgdGhlIGN1cnJlbnQgQlIyX0xJTlVYX0tFUk5FTF9DVVNUT01fRFRTX1BB
VEggb3B0aW9uIGRvZXNuJ3Qgc2VlbXMgdG8gdGFrZQo+IGludG8gYWNjb3VudCBhbnkgZXh0ZXJu
YWwgZGV2aWNldHJlZSBvdmVybGF5IGZpbGVzIChkdHNvKS4KPgo+IEkndmUgc2VuZCBhIG5ldyB2
ZXJzaW9uIG9mIHRoaXMgcGF0Y2ggKGJ1dCBkdHNvIGFyZSBub3Qgc3VwcG9ydGVkKToKPgo+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2J1aWxkcm9vdC8yMDI1MDEyOTA5NTcxNi4yNTExNDM0LTEt
cm9tYWluLm5hb3VyQHNtaWxlLmZyL1QvI3QKPgo+Pgo+PiBXb3VsZCBzb21ldGhpbmcgbGlrZSB0
aGF0IGJlIGludGVyZXN0aW5nIGZvciBCdWlsZHJvb3QsIHdoZXRoZXIgYXMgYQo+PiBnZW5lcmlj
IERUQiBidWlsZCBwYWNrYWdlIG9yIGluZnJhc3RydWN0dXJlPwo+Cj4gV2hpbGUgcmV2aWV3aW5n
IHRoaXMgcGF0Y2gsIEkgaGFkIHRvIHRha2UgYSBsb29rIGF0IGhvdyB0byBidWlsZCBhIGR0YiBm
aWxlCj4gb3V0c2lkZSBvZiB0aGUga2VybmVsIGJ1aWxkIGluZnJhc3RydWN0dXJlIChsaWtlIFlv
Y3RvIGRvZXMpIGJ1dCBpdCdzIG5vdCBlYXN5Lgo+IEFjdHVhbGx5IHdlIGFyZSBoYXBweSB0byBr
ZWVwIHRoaXMgYnVpbGQgcHJvY2VzcyBoaWRkZW4gaW4gdGhlIGtlcm5lbCBNYWtlZmlsZXMuCj4K
PiBTaW5jZSB0aGUgbmV4dCBCdWlsZHJvb3QgbWVldGluZyBpcyBuZXh0IHdlZWssIHRoaXMgaXMg
cHJvYmFibHkgYSB0b3BpYyB3ZSBjYW4KPiBkaXNjdXNzLiBGZWVsIGZyZWUgdG8gc2VuZCBhIHBh
dGNoIChldmVuIGEgZHJhZnQpLgpJJ3ZlIGp1c3Qgc2VudCBhIHBhdGNoLCBhbmQgd291bGQgYmUg
aGFwcHkgdG8gaGVhciB3aGF0IHlvdSB0aGluay4gSSdtCm5vdCBhdCB0aGUgbWVldGluZywgYnV0
IGF2YWlsYWJsZSBvbiBJUkMgaWYgdGhlcmUncyBhbnl0aGluZyB0byBkaXNjdXNzLiA6LSkKClNl
ZToKaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9qZWN0L2J1aWxkcm9vdC9wYXRjaC8y
MDI1MDIwMzE1NDY1MS4yNzkwNzg0LTEtZmlvbmEua2x1dGVAZ214LmRlLwoKQmVzdCByZWdhcmRz
LApGaW9uYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
