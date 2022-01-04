Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8668DC433F5
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 09:23:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBA68408E8;
	Tue,  4 Jan 2022 09:23:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4U4kTPySM6-b; Tue,  4 Jan 2022 09:23:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B8EB408E0;
	Tue,  4 Jan 2022 09:23:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 411811BF31D
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 09:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2DA334048F
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 09:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hoygYHBLiFYs for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 09:23:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 10.mo552.mail-out.ovh.net (10.mo552.mail-out.ovh.net
 [87.98.187.244])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 674FA400E9
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 09:23:12 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.188])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 874E321A3C;
 Tue,  4 Jan 2022 09:05:10 +0000 (UTC)
Received: from kaod.org (37.59.142.95) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 4 Jan
 2022 10:05:10 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G00147d13faa-78a5-4114-9752-77e29da9fb25,
 DC41CA294A1AC0AE13D8E7EBC58C249E9ADF812E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <20b2bd43-9fe6-f174-e437-7595ea5864d8@kaod.org>
Date: Tue, 4 Jan 2022 10:05:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Romain Naour <romain.naour@gmail.com>, <buildroot@buildroot.org>
References: <20220103165805.3697636-1-clg@kaod.org>
 <5da6fe27-bf22-7bd9-fcb5-c43551f1ed5c@gmail.com>
 <5aba2002-9e94-4683-b79d-5443f2852ffc@kaod.org>
 <d71851fe-f814-8e1f-104b-bdf5b802b083@gmail.com>
 <16687956-3831-261a-cdf1-2b02ce463602@kaod.org>
 <1b60df77-a795-f328-6651-4e3b5c4b0757@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <1b60df77-a795-f328-6651-4e3b5c4b0757@gmail.com>
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG9EX2.mxp5.local (172.16.2.82) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 4b25bd43-ec7a-4788-a582-993c29d8e383
X-Ovh-Tracer-Id: 992480770841938842
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudefvddguddvgecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvjeejiefgvefgudfgfffgteeuvefhueehfefhheefffehveefgfetffeiudegkeenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhg
Subject: Re: [Buildroot] [PATCH] package/qemu: bump to version 6.2.0
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

SGVsbG8sCgpPbiAxLzMvMjIgMjM6NDMsIFJvbWFpbiBOYW91ciB3cm90ZToKPiBMZSAwMy8wMS8y
MDIyIMOgIDIzOjIwLCBDw6lkcmljIExlIEdvYXRlciBhIMOpY3JpdMKgOgo+PiBIZWxsbywKPj4+
IFVubGlrZSBhbGwgb3RoZXIgZGVmY29uZmlnLCBxZW11IGRlZmNvbmZpZ3MgYXJlIHJ1bnRpbWUg
dGVzdGVkIGluIGdpdGxhYi4KPj4+Cj4+PiBDcmVhdGUgYSB0ZXN0IGJyYW5jaCBuYW1lZDogcWVt
dS02LjIuMC1kZWZjb25maWdzLXFlbXUKPj4+Cj4+PiBXaGVyZTogInFlbXUtNi4yLjAiIGlzIGEg
cHJlZml4LCAiLWRlZmNvbmZpZ3MtIiB0cmlnZ2VyIGEgcGlwZWxpbmUgZm9yIHRlc3RpbmcKPj4+
IEJ1aWxkcm9vdCBkZWZjb25maXMgYW5kICJxZW11IiBpcyBhIHBhdHRlcm4uCj4+Pgo+Pj4gU2Vl
Ogo+Pj4gaHR0cHM6Ly9naXRsYWIuY29tL2J1aWxkcm9vdC5vcmcvYnVpbGRyb290Ly0vY29tbWl0
LzY1ZDJmMDRjMDEyYWY0OTJhOWI5ZGEwNGRmYTNiM2NiZDIwMzQ3ZjEKPj4+Cj4+Pgo+Pj4gInB1
c2hpbmcgYSBicmFuY2ggY2FsbGVkICI8Zm9vPi1kZWZjb25maWdzLTxwYXR0ZXJuPiIgd2hpY2gg
d2lsbCB0ZXN0IGFsbAo+Pj4gZGVmY29uZmlncyB3aG9zZSBuYW1lIHN0YXJ0IHdpdGggdGhlIHBh
dHRlcm4uIgo+Pgo+PiBUaGF0IGxvb2tzIHNpbXBsZSBlbm91Z2guIFNvbWV0aGluZyBpcyBnb2lu
ZyB3cm9uZyB0aG91Z2ggOgo+Pgo+PiAgwqAgaHR0cHM6Ly9naXRsYWIuY29tL2xlZ29hdGVyL2J1
aWxkcm9vdC8tL2pvYnMvMTkzNzc1MjM1Mwo+Pgo+PiBBbSBJIG1pc3Npbmcgc29tZXRoaW5nID8K
PiAKPiBodW1tLCBtYXliZSB0aGVyZSBpcyB3ZWFrbmVzcyBpbiB0aGUgc2NyaXB0IHdoZW4gZm9v
IGlzICJxZW11LTYuMi4wIgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXgo+IFRyeSBhZ2FpbiB3aXRoIHNvbWV0aGluZyBlbHNl
IGxpa2UgcWVtdV82LjIuMC1kZWZjb25maWdzLXFlbXUKClllcy4gVGhhdCB3YXMgaXQuCgpUaGFu
a3MsCgpDLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpi
dWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlz
dHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
