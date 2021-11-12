Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A4BBC433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 16:12:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3417360E8B
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 16:12:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3417360E8B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kaod.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C97C7403C2;
	Fri, 12 Nov 2021 16:12:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7KKEwqUX0u2Y; Fri, 12 Nov 2021 16:12:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBA55401B6;
	Fri, 12 Nov 2021 16:12:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8791BF3BF
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 16:12:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A32C401B6
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 16:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rxyZRDdD3b7e for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 16:12:22 +0000 (UTC)
X-Greylist: delayed 00:08:02 by SQLgrey-1.8.0
Received: from 5.mo548.mail-out.ovh.net (5.mo548.mail-out.ovh.net
 [188.165.49.213])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DC06940188
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 16:12:21 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 5CAA7200F6;
 Fri, 12 Nov 2021 16:04:16 +0000 (UTC)
Received: from kaod.org (37.59.142.100) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Fri, 12 Nov
 2021 17:04:15 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R00376753eea-df2a-4692-b4ab-7b4af39b1131,
 F9CF0200ECD1631E1678AE6CCE6AA99FD507468A) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: <buildroot@buildroot.org>
Date: Fri, 12 Nov 2021 17:04:11 +0100
Message-ID: <20211112160413.2736382-1-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG7EX2.mxp5.local (172.16.2.62) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: c2e6f1be-bc6a-4ff2-be0d-5bc9aa1b6f20
X-Ovh-Tracer-Id: 10412322341548755750
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrvdefgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvffufffkofggtgfgihesthekredtredtjeenucfhrhhomhepveorughrihgtucfnvgcuifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeelkeegleegtddttdetgeelfeejuedtvddvudduffelgfdthffhgfffvefhvdettdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopegtlhhgsehkrghougdrohhrgh
Subject: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
 configuration
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
Cc: Gerome Burlats <gerome.burlats@smile.fr>,
 Romain Naour <romain.naour@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Matt Weber <matthew.weber@collins.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

UG93ZXJOViAoYXMgTm9uLVZpcnR1YWxpemVkKSBpcyB0aGUgImJhcmVtZXRhbCIgcGxhdGZvcm0g
dXNpbmcgdGhlCk9QQUwgWzFdIGZpcm13YXJlLiBJdCBydW5zIExpbnV4IG9uIElCTSBhbmQgT3Bl
blBPV0VSIHN5c3RlbXMgYW5kIGNhbgpiZSB1c2VkIGFzIGFuIGh5cGVydmlzb3IgT1MsIHJ1bm5p
bmcgS1ZNIGd1ZXN0cywgb3Igc2ltcGx5IGFzIGEgaG9zdApPUy4gT1BBTCBpbmNsdWRlcyBhIExp
bnV4IGtlcm5lbCBhbmQgYSBidWlsZHJvb3Qgcm9vdGZzIHdoaWNoIGFjdHMgYXMKYSBib290bG9h
ZGVyIFsyXSBmb3IgdGhlIHZhcmlvdXMgc3lzdGVtcyBpbnN0YWxsZWQgb24gZGlza3MuCgpTaW5j
ZSBRRU1VIHByb3ZpZGVzIFBvd2VyTlYgbWFjaGluZXMgZm9yIFBPV0VSOC0xMCBwcm9jZXNzb3Jz
IFszXSwgYWRkCmEgbmV3IHFlbXVfcHBjNjRsZV9wb3dlcm52IGJvYXJkIHRvIGJ1aWxkcm9vdC4K
ClsxXSBodHRwczovL2dpdGh1Yi5jb20vb3Blbi1wb3dlci9za2lib290L2Jsb2IvbWFzdGVyL2Rv
Yy9vdmVydmlldy5yc3QKWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3BldGl0Ym9v
dC8KWzNdIGh0dHBzOi8vcWVtdS5yZWFkdGhlZG9jcy5pby9lbi9sYXRlc3Qvc3lzdGVtL3BwYy9w
b3dlcm52Lmh0bWwKCkNjOiBKb2VsIFN0YW5sZXkgPGpvZWxAam1zLmlkLmF1PgpTaWduZWQtb2Zm
LWJ5OiBDw6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgotLS0KIGJvYXJkL3FlbXUvcHBj
NjRsZS1wb3dlcm52L3JlYWRtZS50eHQgIHwgIDUgKysrKysKIGNvbmZpZ3MvcWVtdV9wcGM2NGxl
X3Bvd2VybnZfZGVmY29uZmlnIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGJvYXJkL3Fl
bXUvcHBjNjRsZS1wb3dlcm52L3JlYWRtZS50eHQKIGNyZWF0ZSBtb2RlIDEwMDY0NCBjb25maWdz
L3FlbXVfcHBjNjRsZV9wb3dlcm52X2RlZmNvbmZpZwoKZGlmZiAtLWdpdCBhL2JvYXJkL3FlbXUv
cHBjNjRsZS1wb3dlcm52L3JlYWRtZS50eHQgYi9ib2FyZC9xZW11L3BwYzY0bGUtcG93ZXJudi9y
ZWFkbWUudHh0Cm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZWUxMDJh
M2Q2ODQ2Ci0tLSAvZGV2L251bGwKKysrIGIvYm9hcmQvcWVtdS9wcGM2NGxlLXBvd2VybnYvcmVh
ZG1lLnR4dApAQCAtMCwwICsxLDUgQEAKK1J1biB0aGUgZW11bGF0aW9uIHdpdGg6CisKK3FlbXUt
c3lzdGVtLXBwYzY0IC1NIHBvd2VybnY5IC1rZXJuZWwgdm1saW51eCAtYXBwZW5kICJjb25zb2xl
PWh2YzAgcm9vdHdhaXQgcm9vdD0vZGV2L252bWUwbjEiIC1kZXZpY2UgbnZtZSxidXM9cGNpZS4z
LGFkZHI9MHgwLGRyaXZlPWRyaXZlMCxzZXJpYWw9MTIzNCAtZHJpdmUgZmlsZT0uL3Jvb3Rmcy5l
eHQyLGlmPW5vbmUsaWQ9ZHJpdmUwLGZvcm1hdD1yYXcsY2FjaGU9bm9uZSAtZGV2aWNlIGUxMDAw
ZSxuZXRkZXY9bmV0MCxtYWM9QzA6RkY6RUU6MDA6MDE6MDMsYnVzPXBjaWUuMSxhZGRyPTB4MCAg
LW5ldGRldiB1c2VyLGlkPW5ldDAgLXNlcmlhbCBtb246c3RkaW8gLW5vZ3JhcGhpYyAjIHFlbXVf
cHBjNjRsZV9wb3dlcm52X2RlZmNvbmZpZworCitUaGUgbG9naW4gcHJvbXB0IHdpbGwgYXBwZWFy
IGluIHRoZSB0ZXJtaW5hbCB3aW5kb3cuCmRpZmYgLS1naXQgYS9jb25maWdzL3FlbXVfcHBjNjRs
ZV9wb3dlcm52X2RlZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnZfZGVmY29u
ZmlnCm5ldyBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IDAwMDAwMDAwMDAwMC4uZDhlYTY2NTVmY2Uw
Ci0tLSAvZGV2L251bGwKKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudl9kZWZjb25m
aWcKQEAgLTAsMCArMSwyOSBAQAorIyBBcmNoaXRlY3R1cmUKK0JSMl9wb3dlcnBjNjRsZT15CitC
UjJfcG93ZXJwY19wb3dlcjg9eQorCisjIFN5c3RlbQorQlIyX1RBUkdFVF9HRU5FUklDX0dFVFRZ
X1BPUlQ9Imh2YzAiCitCUjJfU1lTVEVNX0RIQ1A9ImV0aDAiCisKKyMgRmlsZXN5c3RlbQorQlIy
X1RBUkdFVF9ST09URlNfRVhUMj15CisjIEJSMl9UQVJHRVRfUk9PVEZTX1RBUiBpcyBub3Qgc2V0
CisKKyMgSW1hZ2UKK0JSMl9ST09URlNfUE9TVF9JTUFHRV9TQ1JJUFQ9ImJvYXJkL3FlbXUvcG9z
dC1pbWFnZS5zaCIKK0JSMl9ST09URlNfUE9TVF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklH
KSIKKworIyBMaW51eCBoZWFkZXJzIHNhbWUgYXMga2VybmVsCitCUjJfUEFDS0FHRV9IT1NUX0xJ
TlVYX0hFQURFUlNfQ1VTVE9NXzVfMTU9eQorCisjIEtlcm5lbAorQlIyX0xJTlVYX0tFUk5FTD15
CitCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9OPXkKK0JSMl9MSU5VWF9LRVJORUxfQ1VT
VE9NX1ZFUlNJT05fVkFMVUU9IjUuMTUiCitCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0icG93
ZXJudiIKK0JSMl9MSU5VWF9LRVJORUxfVk1MSU5VWD15CisKKyMgaG9zdC1xZW11IGZvciBnaXRs
YWIgdGVzdGluZworQlIyX1BBQ0tBR0VfSE9TVF9RRU1VPXkKK0JSMl9QQUNLQUdFX0hPU1RfUUVN
VV9TWVNURU1fTU9ERT15Ci0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxk
cm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVp
bGRyb290Cg==
