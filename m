Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C5C433EF
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9611C60E5D;
	Mon, 10 Jan 2022 21:04:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RwDYJgmr-Dy2; Mon, 10 Jan 2022 21:04:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCE4A60E5A;
	Mon, 10 Jan 2022 21:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB2AD1BF2AB
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:04:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D0AC360E5A
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:04:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LxSdBuUZzzLe for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:04:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from 8.mo548.mail-out.ovh.net (8.mo548.mail-out.ovh.net
 [46.105.45.231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9A20160E52
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:04:07 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.108.20.235])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id B8BD220B13;
 Mon, 10 Jan 2022 21:04:04 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Mon, 10 Jan
 2022 22:04:03 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R006be03b4fa-e1c3-48eb-bad7-95ba69dcfd1e,
 BF6F17FB45C67FCD004F592EBF28FE1306A73352) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <bf295c3e-b244-97a2-ddef-dd671ceb43fc@kaod.org>
Date: Mon, 10 Jan 2022 22:04:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: <buildroot@buildroot.org>
References: <20220110210235.817082-1-clg@kaod.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20220110210235.817082-1-clg@kaod.org>
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG7EX1.mxp5.local (172.16.2.61) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 3d8894f7-c48c-4107-885c-0be078d7dc8e
X-Ovh-Tracer-Id: 11476297752910728157
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddrudehuddguddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfhfhfgjtgfgihesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedvleekledtgeeifeelgfdvkefgjeffudffvefhudeifffgudehudeiteeifefhueenucffohhmrghinhepghhithhhuhgsrdgtohhmpdhrvggrughthhgvughotghsrdhiohenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv8
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
 Romain Naour <romain.naour@gmail.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

b29wcy4gSSBzZW50IHRoZSBwYXRjaHNldCB0d2ljZS4gU29ycnkgZm9yIHRoZSBub2lzZS4KCkMu
CgpPbiAxLzEwLzIyIDIyOjAyLCBDw6lkcmljIExlIEdvYXRlciB3cm90ZToKPiBQb3dlck5WIGlz
IHRoZSBwbGF0Zm9ybSB1c2luZyB0aGUgT1BBTCBbMV0gZmlybXdhcmUgb24gT3BlblBPV0VSCj4g
c3lzdGVtcy4gT1BBTCBmaXJzdCBsb2FkcyBhIGtlcm5lbCBhbmQgYW4gaW5pdHJhbWZzIGltYWdl
IGJhc2VkIG9uCj4gYnVpbGRyb290IGluY2x1ZGluZyBhIHNlY29uZCBib290IGxvYWRlciBwZXRp
dGJvb3QgWzJdLiBUaGUgbGF0dGVyCj4gZG9lcyBkZXZpY2UgZGlzY292ZXJ5IGFuZCBrZXhlY3Mg
YSBuZXcgTGludXggaW1hZ2UgZnJvbSBkaXNrIG9yCj4gbmV0d29yay4KPiAKPiBRRU1VIGltcGxl
bWVudHMgUG93ZXJOViBtYWNoaW5lcyBbM10gZm9yIHRoZSBQT1dFUjgsIFBPV0VSOSBhbmQKPiBQ
b3dlcjEwIHByb2Nlc3NvcnMgd2hpY2ggYXJlIHVzZWQgZm9yIGRldiBhbmQgdGVzdHMuIFBPV0VS
OCBpbWFnZXMKPiBiZWluZyBjb21wYXRpYmxlIHdpdGggUE9XRVI5IGFuZCBQb3dlcjEwLCBzaW1w
bHkgYWRkIGEgc2luZ2xlCj4gcWVtdV9wcGM2NGxlX3Bvd2VybnY4IGJvYXJkIGZvciBhbGwuCj4g
Cj4gVGhlIFFFTVUgc2NyaXB0IGJvb3RzIGRpcmVjdGx5IGZyb20gYSBudm1lIGRpc2sgYmVjYXVz
ZSBpdCBpcyBzaW1wbGUKPiBlbm91Z2ggYnV0IGEgcmVhbCBzeXN0ZW0gd291bGQgYm9vdCBmcm9t
IGEgcmFtZnMgZmlyc3QuCj4gCj4gWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3Nr
aWJvb3QvYmxvYi9tYXN0ZXIvZG9jL292ZXJ2aWV3LnJzdAo+IFsyXSBodHRwczovL2dpdGh1Yi5j
b20vb3Blbi1wb3dlci9wZXRpdGJvb3QvCj4gWzNdIGh0dHBzOi8vcWVtdS5yZWFkdGhlZG9jcy5p
by9lbi9sYXRlc3Qvc3lzdGVtL3BwYy9wb3dlcm52Lmh0bWwKPiAKPiBTaWduZWQtb2ZmLWJ5OiBD
w6lkcmljIExlIEdvYXRlciA8Y2xnQGthb2Qub3JnPgo+IC0tLQo+ICAgYm9hcmQvcWVtdS9wcGM2
NGxlLXBvd2VybnY4L3JlYWRtZS50eHQgIHwgIDUgKysrKysKPiAgIGNvbmZpZ3MvcWVtdV9wcGM2
NGxlX3Bvd2VybnY4X2RlZmNvbmZpZyB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysKPiAg
IDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKQo+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0
IGJvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52OC9yZWFkbWUudHh0Cj4gICBjcmVhdGUgbW9kZSAx
MDA2NDQgY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmlnCj4gCj4gZGlmZiAt
LWdpdCBhL2JvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52OC9yZWFkbWUudHh0IGIvYm9hcmQvcWVt
dS9wcGM2NGxlLXBvd2VybnY4L3JlYWRtZS50eHQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGlu
ZGV4IDAwMDAwMDAwMDAwMC4uMDU5ZjU1ZmJjOTE3Cj4gLS0tIC9kZXYvbnVsbAo+ICsrKyBiL2Jv
YXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52OC9yZWFkbWUudHh0Cj4gQEAgLTAsMCArMSw1IEBACj4g
K1J1biB0aGUgZW11bGF0aW9uIHdpdGg6Cj4gKwo+ICtxZW11LXN5c3RlbS1wcGM2NCAtTSBwb3dl
cm52OSAta2VybmVsIHZtbGludXggLWFwcGVuZCAiY29uc29sZT1odmMwIHJvb3R3YWl0IHJvb3Q9
L2Rldi9udm1lMG4xIiAtZGV2aWNlIG52bWUsYnVzPXBjaWUuMyxhZGRyPTB4MCxkcml2ZT1kcml2
ZTAsc2VyaWFsPTEyMzQgLWRyaXZlIGZpbGU9Li9yb290ZnMuZXh0MixpZj1ub25lLGlkPWRyaXZl
MCxmb3JtYXQ9cmF3LGNhY2hlPW5vbmUgLWRldmljZSBlMTAwMGUsbmV0ZGV2PW5ldDAsbWFjPUMw
OkZGOkVFOjAwOjAxOjAzLGJ1cz1wY2llLjEsYWRkcj0weDAgIC1uZXRkZXYgdXNlcixpZD1uZXQw
IC1zZXJpYWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgIyBxZW11X3BwYzY0bGVfcG93ZXJudjhfZGVm
Y29uZmlnCj4gKwo+ICtUaGUgbG9naW4gcHJvbXB0IHdpbGwgYXBwZWFyIGluIHRoZSB0ZXJtaW5h
bCB3aW5kb3cuCj4gZGlmZiAtLWdpdCBhL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2Rl
ZmNvbmZpZyBiL2NvbmZpZ3MvcWVtdV9wcGM2NGxlX3Bvd2VybnY4X2RlZmNvbmZpZwo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi5kOGVhNjY1NWZjZTAKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvY29uZmlncy9xZW11X3BwYzY0bGVfcG93ZXJudjhfZGVmY29uZmln
Cj4gQEAgLTAsMCArMSwyOSBAQAo+ICsjIEFyY2hpdGVjdHVyZQo+ICtCUjJfcG93ZXJwYzY0bGU9
eQo+ICtCUjJfcG93ZXJwY19wb3dlcjg9eQo+ICsKPiArIyBTeXN0ZW0KPiArQlIyX1RBUkdFVF9H
RU5FUklDX0dFVFRZX1BPUlQ9Imh2YzAiCj4gK0JSMl9TWVNURU1fREhDUD0iZXRoMCIKPiArCj4g
KyMgRmlsZXN5c3RlbQo+ICtCUjJfVEFSR0VUX1JPT1RGU19FWFQyPXkKPiArIyBCUjJfVEFSR0VU
X1JPT1RGU19UQVIgaXMgbm90IHNldAo+ICsKPiArIyBJbWFnZQo+ICtCUjJfUk9PVEZTX1BPU1Rf
SU1BR0VfU0NSSVBUPSJib2FyZC9xZW11L3Bvc3QtaW1hZ2Uuc2giCj4gK0JSMl9ST09URlNfUE9T
VF9TQ1JJUFRfQVJHUz0iJChCUjJfREVGQ09ORklHKSIKPiArCj4gKyMgTGludXggaGVhZGVycyBz
YW1lIGFzIGtlcm5lbAo+ICtCUjJfUEFDS0FHRV9IT1NUX0xJTlVYX0hFQURFUlNfQ1VTVE9NXzVf
MTU9eQo+ICsKPiArIyBLZXJuZWwKPiArQlIyX0xJTlVYX0tFUk5FTD15Cj4gK0JSMl9MSU5VWF9L
RVJORUxfQ1VTVE9NX1ZFUlNJT049eQo+ICtCUjJfTElOVVhfS0VSTkVMX0NVU1RPTV9WRVJTSU9O
X1ZBTFVFPSI1LjE1Igo+ICtCUjJfTElOVVhfS0VSTkVMX0RFRkNPTkZJRz0icG93ZXJudiIKPiAr
QlIyX0xJTlVYX0tFUk5FTF9WTUxJTlVYPXkKPiArCj4gKyMgaG9zdC1xZW11IGZvciBnaXRsYWIg
dGVzdGluZwo+ICtCUjJfUEFDS0FHRV9IT1NUX1FFTVU9eQo+ICtCUjJfUEFDS0FHRV9IT1NUX1FF
TVVfU1lTVEVNX01PREU9eQo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
