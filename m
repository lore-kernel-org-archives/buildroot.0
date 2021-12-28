Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E009C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 00:07:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7209681392;
	Wed, 29 Dec 2021 00:07:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZFYOlcMHPXP; Wed, 29 Dec 2021 00:07:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B73BA8139D;
	Wed, 29 Dec 2021 00:07:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 751841BF576
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 00:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 622CE40022
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 00:07:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2SzdEljl9bUf for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 00:07:06 +0000 (UTC)
X-Greylist: delayed 01:00:01 by SQLgrey-1.8.0
Received: from 3.mo552.mail-out.ovh.net (3.mo552.mail-out.ovh.net
 [178.33.254.192])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 283D74000B
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 00:07:06 +0000 (UTC)
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.186])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id F149C20AC7;
 Tue, 28 Dec 2021 22:50:30 +0000 (UTC)
Received: from kaod.org (37.59.142.106) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Tue, 28 Dec
 2021 23:50:30 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-106R00614419574-a538-4f99-8ba7-d616b662f680,
 1006F170FE58D16E01B343D7A9A748ACF56F4E88) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <f7dc4424-a38a-c448-4436-f1e06b86ffb9@kaod.org>
Date: Tue, 28 Dec 2021 23:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20211112160413.2736382-1-clg@kaod.org>
 <20211228221430.7e8cb844@windsurf>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211228221430.7e8cb844@windsurf>
X-Originating-IP: [37.59.142.106]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: fabd0da4-bde1-4964-be23-2dd985f4b886
X-Ovh-Tracer-Id: 10715752366209600294
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddvtddgtdegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepueevledvjeetgeetfeeiveeftefffedvvdeikeetveelfeeglefgueetvdefvdefnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpegtlhhgsehkrghougdrohhrghdprhgtphhtthhopehmrghtthhhvgifrdifvggsvghrsegtohhllhhinhhsrdgtohhm
Subject: Re: [Buildroot] [PATCH 1/3] configs/qemu: Add a ppc64le-powernv
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
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Joel Stanley <joel@jms.id.au>, buildroot@buildroot.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gMTIvMjgvMjEgMjI6MTQsIFRob21hcyBQZXRhenpvbmkgd3JvdGU6
Cj4gSGVsbG8gQ8OpZHJpYywKPiAKPiBPbiBGcmksIDEyIE5vdiAyMDIxIDE3OjA0OjExICswMTAw
Cj4gQ8OpZHJpYyBMZSBHb2F0ZXIgPGNsZ0BrYW9kLm9yZz4gd3JvdGU6Cj4gCj4+IFBvd2VyTlYg
KGFzIE5vbi1WaXJ0dWFsaXplZCkgaXMgdGhlICJiYXJlbWV0YWwiIHBsYXRmb3JtIHVzaW5nIHRo
ZQo+PiBPUEFMIFsxXSBmaXJtd2FyZS4gSXQgcnVucyBMaW51eCBvbiBJQk0gYW5kIE9wZW5QT1dF
UiBzeXN0ZW1zIGFuZCBjYW4KPj4gYmUgdXNlZCBhcyBhbiBoeXBlcnZpc29yIE9TLCBydW5uaW5n
IEtWTSBndWVzdHMsIG9yIHNpbXBseSBhcyBhIGhvc3QKPj4gT1MuIE9QQUwgaW5jbHVkZXMgYSBM
aW51eCBrZXJuZWwgYW5kIGEgYnVpbGRyb290IHJvb3RmcyB3aGljaCBhY3RzIGFzCj4+IGEgYm9v
dGxvYWRlciBbMl0gZm9yIHRoZSB2YXJpb3VzIHN5c3RlbXMgaW5zdGFsbGVkIG9uIGRpc2tzLgo+
IAo+IEZvciB0aGUgcGVyc29uIG5vdCBmYW1pbGlhciB3aXRoIGFsbCB0aGlzIE9wZW5QT1dFUiBz
dHVmZiwgaXQncyB2ZXJ5Cj4gY29tcGxleCB0byB1bmRlcnN0YW5kIGFsbCB0aGVzZSBmaXJtd2Fy
ZSwgdmlydHVhbGl6ZWQgc3R1ZmYsCj4gaHlwZXJ2aXNvciwgZXRjLgoKTGV0J3MgdHJ5IGRpZmZl
cmVudGx5LAoKT24gdGhlc2Ugc3lzdGVtcywgdGhlIEZXIGlzIGNvbXBhcmFibGUgdG8gVS1Cb290
IGFzIGl0IGxvYWRzIGtlcm5lbCBhbmQKaW5pdHJhbWZzIGltYWdlcyBmcm9tIGZsYXNoLiBUaGUg
aW5pdHJhbWZzIGlzIGEgYnVpbGRyb290IGVudmlyb25tZW50CndoaWNoIGluY2x1ZGVzIHRoZSBw
ZXRpdGJvb3QgWypdIGJvb3QgbG9hZGVyLiBUaGlzIHNlY29uZCBib290IGxvYWRlcgpkb2VzIHRo
ZSBkZXZpY2UgZGlzY292ZXJ5IGFuZCBrZXhlY3MgYSBuZXcgTGludXggaW1hZ2UgZnJvbSBkaXNr
IG9yCm5ldHdvcmsuCgpXaGF0IHdlIGNhcmUgYWJvdXQgaGVyZSBpcyBvbmx5IHRoZSBmaXJzdCBs
ZXZlbCB3aGljaCB1c2VzIHRoZSBidWlsZHJvb3QKaW1hZ2UuIHBldGl0Ym9vdCBpcyBhbm90aGVy
IHRvcGljLgoKQXMgZm9yIFFFTVUsIGl0IGltcGxlbWVudHMgMyBtYWNoaW5lcyBQT1dFUjgsIFBP
V0VSOSBhbmQgUG93ZXIxMApwcm9jZXNzb3JzIHRoYXQgd2UgdXNlIGZvciBkZXYgYW5kIHRlc3Rz
LiBJIGhhdmUgY2hvc2VuIGluIHRoZSBRRU1VCnNjcmlwdCB0byBib290IGRpcmVjdGx5IGZyb20g
YSBudm1lIGRpc2sgYmVjYXVzZSBpdCBpcyBzaW1wbGUgZW5vdWdoCmJ1dCB1c2luZyBhIHJhbWZz
IHdvdWxkIGJlIGNsb3NlciB0byByZWFsaXR5LgoKVGhlIGh5cGVydmlzb3IgcGFydCBpcyBzaW1w
bHkgYSBmZWF0dXJlIG9mIHRoaXMgTGludXggUFBDIHBsYXRmb3JtLAp0aGF0IGlzIGNhbGxlZCBQ
b3dlck5WLgoKWypdIGh0dHBzOi8vZ2l0aHViLmNvbS9vcGVuLXBvd2VyL3BldGl0Ym9vdC8KCj4+
IGRpZmYgLS1naXQgYS9ib2FyZC9xZW11L3BwYzY0bGUtcG93ZXJudi9yZWFkbWUudHh0IGIvYm9h
cmQvcWVtdS9wcGM2NGxlLXBvd2VybnYvcmVhZG1lLnR4dAo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0
NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLmVlMTAyYTNkNjg0Ngo+PiAtLS0gL2Rldi9udWxsCj4+
ICsrKyBiL2JvYXJkL3FlbXUvcHBjNjRsZS1wb3dlcm52L3JlYWRtZS50eHQKPj4gQEAgLTAsMCAr
MSw1IEBACj4+ICtSdW4gdGhlIGVtdWxhdGlvbiB3aXRoOgo+PiArCj4+ICtxZW11LXN5c3RlbS1w
cGM2NCAtTSBwb3dlcm52OSAta2VybmVsIHZtbGludXggLWFwcGVuZCAiY29uc29sZT1odmMwIHJv
b3R3YWl0IHJvb3Q9L2Rldi9udm1lMG4xIiAtZGV2aWNlIG52bWUsYnVzPXBjaWUuMyxhZGRyPTB4
MCxkcml2ZT1kcml2ZTAsc2VyaWFsPTEyMzQgLWRyaXZlIGZpbGU9Li9yb290ZnMuZXh0MixpZj1u
b25lLGlkPWRyaXZlMCxmb3JtYXQ9cmF3LGNhY2hlPW5vbmUgLWRldmljZSBlMTAwMGUsbmV0ZGV2
PW5ldDAsbWFjPUMwOkZGOkVFOjAwOjAxOjAzLGJ1cz1wY2llLjEsYWRkcj0weDAgIC1uZXRkZXYg
dXNlcixpZD1uZXQwIC1zZXJpYWwgbW9uOnN0ZGlvIC1ub2dyYXBoaWMgIyBxZW11X3BwYzY0bGVf
cG93ZXJudl9kZWZjb25maWcKPiAKPiBZb3UncmUgZW11bGF0aW5nIGEgcG93ZXJudjksIHNvIHdl
IGFzc3VtZSBiYXNlZCBvbiB0aGUgUG93ZXI5IHByb2Nlc3Nvci4KPiAKPj4gQEAgLTAsMCArMSwy
OSBAQAo+PiArIyBBcmNoaXRlY3R1cmUKPj4gK0JSMl9wb3dlcnBjNjRsZT15Cj4+ICtCUjJfcG93
ZXJwY19wb3dlcjg9eQo+IAo+IEJ1dCB5b3UncmUgdGFyZ2V0aW5nIFBvd2VyOC4KCnllcyAgCj4g
Q291bGQgeW91IGNsYXJpZnk/CgpiZWNhdXNlIHRoZSBzYW1lIGltYWdlIGNhbiBiZSB1c2VkIGZv
ciB0aGUgUUVNVSBtYWNoaW5lIGltcGxlbWVudGluZwp0aGUgUE9XRVI4IHByb2Nlc3Nvciwgd2hp
Y2ggYWxzbyB3b3JrcyBmb3IgUE9XRVI5IGFuZCBQb3dlcjEwLgpUaGFua3MsCgpDLgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGlu
ZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
