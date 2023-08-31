Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F4BBC83F2B
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 03:35:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D97DD8223A;
	Thu, 31 Aug 2023 03:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D97DD8223A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qg1N25xS4F8B; Thu, 31 Aug 2023 03:35:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7EA182222;
	Thu, 31 Aug 2023 03:35:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7EA182222
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6F8C81BF295
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 03:35:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48B7D821CE
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 03:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48B7D821CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h-QOMMhsQI3r for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 03:35:18 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6F06B81D0B
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 03:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6F06B81D0B
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.8.36] ([89.144.220.251]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MZktj-1q8nxh06tD-00WonL; Thu, 31
 Aug 2023 05:35:10 +0200
Message-ID: <23950456-990c-488b-9c91-cd3f9df19d6f@gmx.at>
Date: Thu, 31 Aug 2023 05:35:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Arnout Vandecappelle <arnout@mind.be>, buildroot@buildroot.org
References: <20230812192842.135682-1-dalang@gmx.at>
 <20230812192842.135682-2-dalang@gmx.at>
 <e3f7824f-52a2-5de0-b932-1cbf66f49e70@mind.be>
Content-Language: en-US
From: Daniel Lang <dalang@gmx.at>
In-Reply-To: <e3f7824f-52a2-5de0-b932-1cbf66f49e70@mind.be>
X-Provags-ID: V03:K1:T/dC+SCG6s3ZJ9VGCctLUpdVCLt5RVVWvTxM+Js0VEwN0MXU8sm
 YqXo3Iz1qRkU+nGcPiAp8WlkaXx2XtyAmvj1DsivM4g1uX7yAYVzhGZlyLjWQQ2feRUBwow
 GCnM49korzwmFody95KiN12RerUKJgrwhMbxzIldkzALPG+Ys7xui9xjozedzAjCUTsWSLo
 8R6bXtUhksly25LTM4aAw==
UI-OutboundReport: notjunk:1;M01:P0:QybeKuRkdpw=;1NY/kXIT6/kxfhtqWIRLq4Rf74u
 lH3g+BB78EtdAqR5Gs7M1k7xRSoYZOsSuYWb5qkRH1bbPwfMRAmZLiCAuUO2dqvm+ER/qfPmb
 EcXlplQsSxdW7FMEGrHf2UwfQaj018iCKJMMAc9PMbEhVJzya5ceanLaWxuoeIvnr3hiFvmka
 eFkOEdmhS8+Ns2NIyl5zgV8Q/I/AmhMxYqk8/j1IHkBS46Pm4RlqP7I8NvAtScCI70x0KQzEx
 3cjCbaVsgX+TJiImlf0jArx8hUcWMtXN8bAlgZYyAJT1ypTj3bPYoLmNt4LTbmIVbgqDrYoO3
 xF14EeIiRdt4mFjY7DiJzQeZLa4WArxuSfHGk3jfRnrGGJV1uCi8Me8HhZmjim+ibHqA6M5ZQ
 NfNAp9s73aIp+Cjgpqwog6b1zttJ/kmEmx5T000bZmdnE7R0CvkdJ6EP2BKEDkRgfalOMNr2l
 m/R6f+J+TLiwjmyKZ4s4bd8R0SuJ25SCamITmcA3su/sGbgNZz0N15O17aHfmExYPQh/UMWRa
 vKIuBX6nRnPLhBneZ32hO0UrQhG7r92qGF47/K8kPJm3aJUITPCgAXRa9qxK5dbXCxiqFvfLl
 XPTFfPG5yLqG2r9Y6oZTPi0HGyNKs1HVTv0IuIoIzd2M6d5IEb2cmhcq58/TdO93gXsD4hjlY
 hzD7Lmj++rnbPzzLrDBSp2X+a1umKE92/UmYBdLqiGoBNvKB3jJm0DknTuiin+Xxowx5498WC
 UkGkvZCNFVS1gCBEtBvocOK9s0766cTtLZClNSawTWloNO+ZrZlJeTR79l3Za+021gOe7Dq0B
 d+MYEHUU97pXORq44kNas99E4depU9PQu9PUJr8eYj7SX2npCU+JJ0Tboe9IGBxZ8jJ/92Ivn
 nTn9jqNIPIgd0+ZKVKcuElxPO9n4W3S7K6OfydmcP+JbWJ8fTpccoloil0/V1z+XYeYK1wC/L
 T1Ncy4uvuHExtMMYIH1MRBD8Crg=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1693452910; x=1694057710; i=dalang@gmx.at;
 bh=OfOABDnJRv6ffk3ucbOrMB2SiKpBMMa+9v7bbouzVoo=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=BolJmTqKCvUtxoievtXWDkZ9AShEQX+i1PM9gfLTsAuW6Eevz4IET4ndHlfcq7ZGOIojMRR
 EFGo2U1FG9emRNKxdRVllHPQxqTSMy3qVa8TFS3TqTQnL2IPPMrjgGwN5h/ccXuajRmrlXtw/
 OGwKRt7yIc3rGo6vO5qg24ZenkzMP0yJcAKrmCwEJv94diBvwT4YwAwtMAX4QUaugXfHQcvBE
 Fy7FzpKnnbwjc9W8fkdtzMG791FmXy8dzLFYg96uOhOc9g2OXxmxjsfDq2KN+F4UbTlt/3BZV
 xVB5Nkd0DzSpzwXfOtwaNUI2LIO1cHob9X5KbBvBN3g0tfaL1O7g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=BolJmTqK
Subject: Re: [Buildroot] [PATCH v3 2/8] support/scripts/pkg-stats: ignore
 llvm-project.mk
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
Cc: Sen Hastings <sen@phobosdpl.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgQXJub3V0LA0KDQpPbiAzMC4wOC4yMyAyMjozMSwgQXJub3V0IFZhbmRlY2FwcGVsbGUgdmlh
IGJ1aWxkcm9vdCB3cm90ZToNCj4gDQo+IA0KPiBPbiAxMi8wOC8yMDIzIDIxOjI4LCBEYW5pZWwg
TGFuZyB3cm90ZToNCj4+IEZpeGVzOg0KPj4gZjZlYWY2MCAoInBhY2thZ2UvbGx2bS1wcm9qZWN0
OiBuZXcgZ3JvdXAgZm9yIGxsdm0gcGFja2FnZXMiKQ0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBMYW5nIDxkYWxhbmdAZ214LmF0Pg0KPj4gLS0tDQo+PiDCoCBzdXBwb3J0L3NjcmlwdHMv
cGtnLXN0YXRzIHwgMSArDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykNCj4+
DQo+PiBkaWZmIC0tZ2l0IGEvc3VwcG9ydC9zY3JpcHRzL3BrZy1zdGF0cyBiL3N1cHBvcnQvc2Ny
aXB0cy9wa2ctc3RhdHMNCj4+IGluZGV4IGVlYTkwMDEyNGMuLjFhYzUzOGY1ZjkgMTAwNzU1DQo+
PiAtLS0gYS9zdXBwb3J0L3NjcmlwdHMvcGtnLXN0YXRzDQo+PiArKysgYi9zdXBwb3J0L3Njcmlw
dHMvcGtnLXN0YXRzDQo+PiBAQCAtMzQ1LDYgKzM0NSw3IEBAIGRlZiBnZXRfcGtnbGlzdChucGFj
a2FnZXMsIHBhY2thZ2VfbGlzdCk6DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAicGFja2FnZS9nc3RyZWFtZXIvZ3N0cmVhbWVyLm1rIiwNCj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJwYWNrYWdlL2dzdHJlYW1l
cjEvZ3N0cmVhbWVyMS5tayIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAicGFja2FnZS9ndGsyLXRoZW1lcy9ndGsyLXRoZW1lcy5tayIsDQo+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAicGFja2FnZS9sbHZtLXByb2pl
Y3QvbGx2bS1wcm9qZWN0Lm1rIiwNCj4gDQo+IMKgV2h5IHRoaXMgc3BlY2lmaWMgb25lLCBhbmQg
bm90IHRoZSBJLWRvbid0LWtub3ctaG93LW1hbnkgb3RoZXJzIHRoYXQgYXJlIGluIGEgc2ltaWxh
ciBzaXR1YXRpb24/IEUuZy4gcXQ2LCBiYXJlYm94IHRvIHRha2UgdHdvIGV4YW1wbGVzLg0KDQpJ
IGNvbnRyaWJ1dGVkIHRoZSBsbHZtLXByb2plY3Qgc3ViLWRpcmVjdG9yeSBzb21lIHRpbWUgYWdv
DQphbmQgYWx3YXlzIHdvbmRlcmVkIHdoeSBpdCBzaG93ZWQgdXAgaW4gcGtnLXN0YXRzIGJ1dCBu
b3QNCnF0NSwgd2hpY2ggd2FzIG15IHJlZmVyZW5jZS4NCldvcmtpbmcgb24gdGhpcyBzZXJpZXMg
SSB0b29rIGEgY2xvc2VyIGxvb2sgYXQgdGhlIHNjcmlwdA0KYW5kIGZvdW5kIHRoZSBsaXN0IG9m
IGV4Y2x1ZGVkIHBhY2thZ2VzLCBzbyBJIGFkZGVkIGxsdm0tcHJvamVjdC4NCkkgd2lsbCBjaGVj
ayBhbGwgcGFja2FnZXMgdGhhdCBhcmUgaW4gYSBzaW1pbGFyIHNpdHVhdGlvbg0KZm9yIHY0Lg0K
DQo+IA0KPiDCoFJlZ2FyZHMsDQo+IMKgQXJub3V0DQo+IA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBhY2thZ2UvbWF0Y2hib3gvbWF0Y2hib3gubWsi
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInBhY2th
Z2Uvb3BlbmdsL29wZW5nbC5tayIsDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCAicGFja2FnZS9xdDUvcXQ1Lm1rIiwNCg0KUmVnYXJkcw0KRGFuaWVsDQoN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9v
dCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWls
ZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
