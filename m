Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF93C19F2A
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 21:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C3BF82B08;
	Sat, 30 Jul 2022 21:26:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5C3BF82B08
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qR0MzlrCJ2kn; Sat, 30 Jul 2022 21:26:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 489AB827A9;
	Sat, 30 Jul 2022 21:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 489AB827A9
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 197CE1BF3A9
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 21:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6D29827A9
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 21:26:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6D29827A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a3TTIKFOlP0y for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 21:26:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 95906827A0
Received: from 3.mo548.mail-out.ovh.net (3.mo548.mail-out.ovh.net
 [188.165.32.156])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 95906827A0
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 21:26:39 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.1.10])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id DD475203E0;
 Sat, 30 Jul 2022 21:18:03 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX2.mxp5.local (172.16.2.32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Sat, 30 Jul
 2022 23:18:03 +0200
X-OVh-ClientIp: 90.89.72.120
Message-ID: <5ba970ce-7cd0-acb3-c6be-7ddeafbad876@kaod.org>
Date: Sat, 30 Jul 2022 23:18:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220729000904.1295295-1-joel@jms.id.au>
 <20220729000904.1295295-4-joel@jms.id.au>
 <b1b0b11a-6c49-9d7c-5d1b-b6ec8e6a2966@kaod.org>
 <20220729213721.GH1554632@scaer>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220729213721.GH1554632@scaer>
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX2.mxp5.local
 (172.16.2.32)
X-Ovh-Tracer-GUID: 2b3af380-e9dd-4965-8565-03c06a23ec94
X-Ovh-Tracer-Id: 11532311273731558249
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrvdduledgudeiudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephfehieejleffgfekteduledvffeiiefgudehfedukeeijeevhfdtvefhfedtffdtnecuffhomhgrihhnpegsuhhilhgurhhoohhtrdhnvghtnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheprhhomhgrihhnrdhnrghouhhrsehgmhgrihhlrdgtohhmpdfovfetjfhoshhtpehmohehgeek
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00368052127-72f8-4b83-a30a-7836c9022b5d,
 1DC0F860CB010FCE1C63BA575B84B2D58309CB31) smtp.auth=clg@kaod.org
Subject: Re: [Buildroot] [PATCH 3/9] arch/powerpc: Enable powerpc64le only
 on CPUs that support it
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Joel Stanley <joel@jms.id.au>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gNy8yOS8yMiAyMzozNywgWWFubiBFLiBNT1JJTiB3cm90ZToKPiBDw6lkcmljLCBKb2VsLCBB
bGwsCj4gCj4gT24gMjAyMi0wNy0yOSAwODo1MiArMDIwMCwgQ8OpZHJpYyBMZSBHb2F0ZXIgc3Bh
a2UgdGh1c2x5Ogo+PiBPbiA3LzI5LzIyIDAyOjA4LCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4+PiBJ
bnZhbGlkIGNvbmZpZ3VyYXRpb25zIGxlYWQgdG8gYnVpbGQgZmFpbHVyZXMsIHN1Y2ggYXMgdHJ5
aW5nIHRvIGVuYWJsZQo+Pj4gcHBjNjRsZSBmb3IgdGhlIHBwYzk3MDoKPj4+Cj4+PiAgICBodHRw
Oi8vYXV0b2J1aWxkLmJ1aWxkcm9vdC5uZXQvcmVzdWx0cy9mZGE4ODY3NjhmY2UyNWNjZDliNTJi
NjM1ZmY1YjEzZGE3YmEyZDBjLwo+Pj4KPj4+IEluIG9yZGVyIHRvIHJ1biBhIHBwYzY0bGUgdXNl
cnNwYWNlIGEga2VybmVsIHRoYXQgcnVucyBpbiB0aGlzIG1vZGUgaXMKPj4+IHJlcXVpcmVkLiBU
aGUgb25seSBDUFUgc3VwcG9ydGVkIGluIGJ1aWxkcm9vdCB0aGF0IGNhbiBib290IGEgcHBjNjRs
ZQo+Pj4ga2VybmVsIGlzIFBvd2VyOCwgc28gbWFyayBhbGwgb2YgdGhlIG90aGVyIDY0LWJpdCBj
YXBhYmxlIENQVXMgYXMgbm90Cj4+PiBzdXBwb3J0aW5nIHBwYzY0bGUuCj4+IEkgZG9uJ3QgdGhp
bmsgd2UgY2FyZSBtdWNoIGJ1dCBQb3dlcjcgY291bGQgcnVuIGFsc28gaW4gTEUuCj4gCj4gSm9l
bCBzZWVtZWQgdG8gc3RhdGUgdGhhdCBvbmx5IHRoZSBwb3dlcjggY2FuIGJlIExFLCBzbyB3aG8n
cyByaWdodD8gOy0pCj4KPiBJbiBhbnkgY2FzZSwgaWYgbWFvcmUgdmFyaWFudHMgdHVybiBvdXQg
dG8gYmUgTEUtY29tcGF0aWJsZSwgaXQgaXMgc3RpbGwKPiBwb3NzaWJsZSB0byBlbmFibGUgaHRl
bSBpbiBmb2xsb3d1cCBwYXRjaGVzLgoKSG9uZXN0bHkgd2UgZG9uJ3QgcmVhbGx5IGNhcmUgYWJv
dXQgUG93ZXI3L0xFLiBJdCBuZXZlciBjYW1lIG91dCBvZgp0aGUgbGFiLiBQb3dlcjggd2FzIHRo
ZSBmaXJzdCByZWxlYXNlZCwgbGV0J3Mga2VlcCBpdCB0aGF0IHdheS4KCkMuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxp
c3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21h
aWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
