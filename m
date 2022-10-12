Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 312A0C4332F
	for <buildroot@archiver.kernel.org>; Wed, 12 Oct 2022 16:32:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FECB41977;
	Wed, 12 Oct 2022 16:32:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FECB41977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JZEsq_uRd8CJ; Wed, 12 Oct 2022 16:32:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F6DB41974;
	Wed, 12 Oct 2022 16:32:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F6DB41974
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 937831BF5A9
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 16:32:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7574741974
 for <buildroot@lists.busybox.net>; Wed, 12 Oct 2022 16:32:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7574741974
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r43qeLot-bVF for <buildroot@lists.busybox.net>;
 Wed, 12 Oct 2022 16:32:20 +0000 (UTC)
X-Greylist: delayed 00:10:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ABFCD41972
Received: from 3.mo575.mail-out.ovh.net (3.mo575.mail-out.ovh.net
 [46.105.58.60])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ABFCD41972
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 16:32:19 +0000 (UTC)
Received: from player687.ha.ovh.net (unknown [10.110.171.54])
 by mo575.mail-out.ovh.net (Postfix) with ESMTP id 8479724B79
 for <buildroot@buildroot.org>; Wed, 12 Oct 2022 16:14:19 +0000 (UTC)
Received: from armadeus.com (lfbn-str-1-84-188.w92-140.abo.wanadoo.fr
 [92.140.211.188])
 (Authenticated sender: sebastien.szymanski@armadeus.com)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id ACC562F974059;
 Wed, 12 Oct 2022 16:14:17 +0000 (UTC)
X-OVh-ClientIp: 92.140.211.188
Message-ID: <0f695802-d4d9-fba5-f87a-e036ff1c6253@armadeus.com>
Date: Wed, 12 Oct 2022 18:11:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Content-Language: en-US
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20221012144310.28145-1-sebastien.szymanski@armadeus.com>
 <c4bd88f1-de26-8141-672c-96f69d8df8cb@benettiengineering.com>
From: =?UTF-8?Q?S=c3=a9bastien_Szymanski?= <sebastien.szymanski@armadeus.com>
In-Reply-To: <c4bd88f1-de26-8141-672c-96f69d8df8cb@benettiengineering.com>
X-Ovh-Tracer-Id: 16706665771497810805
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejkedgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfvfhfhffujggtgfesthekredttdefjeenucfhrhhomhepuforsggrshhtihgvnhgpufiihihmrghnshhkihcuoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqnecuggftrfgrthhtvghrnhepkeevudelvdevueejlefgffeitedtheeggeejtdekgeekkeevheefgfeiteeggfefnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghuihhlughrohhothdrnhgvthdpohiilhgrsghsrdhorhhgnecukfhppeduvdejrddtrddtrddupdelvddrudegtddrvdduuddrudekkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoehsvggsrghsthhivghnrdhsiiihmhgrnhhskhhisegrrhhmrgguvghushdrtghomheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheejhedpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R001cc579907-eb8d-42df-a893-d0113e680a45,
 FE9F4EF6251822EA91E95D070B5353786FA8A9F2)
 smtp.auth=sebastien.szymanski@armadeus.com
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to version
 dfc3b6ecda84d21418fb4408b39c5c71db4c6458
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

SGkgR3VpbGlvLAoKT24gMTAvMTIvMjIgMTc6MzgsIEdpdWxpbyBCZW5ldHRpIHdyb3RlOgo+IEhp
IFPDqWJhc3RpZW4sCj4gCj4gT24gMTIvMTAvMjIgMTY6NDMsIFPDqWJhc3RpZW4gU3p5bWFuc2tp
IHdyb3RlOgo+PiBEcm9wIGZpcnN0IHBhdGNoLCB1cHN0cmVhbWVkOgo+PiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvbW1jL21tYy11dGlscy5naXQvY29tbWl0Lz9pZD01MjBm
NTRlYjk0ODQ1ZTU5NzgzN2FlOTA4YTAzYjkxYWU4Yzg3NThmCj4+Cj4+IEZpeGVzOiAKPj4gaHR0
cDovL2F1dG9idWlsZC5idWlsZHJvb3QubmV0L3Jlc3VsdHMvMDFmNzgwODFhNTA3NDNkMWZhYTUw
YTA5MGMwMGI3ZTkwYTE3ZmEzOQo+IAo+IFdpdGggdGhpcyBidW1wIG15IHBhdGNoIGJlY29tZXMg
dXNlbGVzcyBzaW5jZSBteSBwYXRjaCBoYXMgYmVlbiAKPiB1cHN0cmVhbWVkIHRvbzoKPiBodHRw
czovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vdXRpbHMvbW1jL21tYy11dGlscy5naXQvY29tbWl0
Lz9pZD01MDg2ZTdjMGRlNGQwMDk0Zjg2NzQzNjhhODhkOTMxYjI3NTg5ZDUzCj4gYW5kIHNvIHdl
IGNhbiBkcm9wIGl0Ogo+IGh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJvamVjdC9idWls
ZHJvb3QvcGF0Y2gvMjAyMjA5MTgxNjMxNDcuMTEzMzg0Mi0xLWdpdWxpby5iZW5ldHRpQGJlbmV0
dGllbmdpbmVlcmluZy5jb20vCj4gCgpZb3VyIHBhdGNoIGhhcyBuZXZlciBiZWVuIG1lcmdlZCBp
bnRvIEJ1aWxkcm9vdC4gKE90aGVyd2lzZSB0aGVyZSB3b3VsZCAKYmUgbm8gYnVpbGQgZmFpbHVy
ZSA7KSkKCj4gQnV0IHRoZXJlIGlzIGFuIGVycm9yIGFyaXNpbmcgd2hpbGUgYnVpbGRpbmcgd2l0
aCBzb3VyY2VyeS1hcm0gdXNpbmcKPiAkIGJ1aWxkcm9vdC91dGlscy90ZXN0LXBrZyAtcCBtbWMt
dXRpbHMKPiBgYGAKPiBtbWNfY21kcy5jOiBJbiBmdW5jdGlvbiAnZXJhc2UnOgo+IG1tY19jbWRz
LmM6MjYzMzozMTogZXJyb3I6IGludmFsaWQgYXBwbGljYXRpb24gb2YgJ3NpemVvZicgdG8gaW5j
b21wbGV0ZSAKPiB0eXBlICdzdHJ1Y3QgbW1jX2lvY19tdWx0aV9jCj4gIMKgIG11bHRpX2NtZCA9
IGNhbGxvYygxLCBzaXplb2Yoc3RydWN0IG1tY19pb2NfbXVsdGlfY21kKSArCj4gIMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBeCj4g
bW1jX2NtZHMuYzoyNjQwOjExOiBlcnJvcjogZGVyZWZlcmVuY2luZyBwb2ludGVyIHRvIGluY29t
cGxldGUgdHlwZQo+ICDCoCBtdWx0aV9jbWQtPm51bV9vZl9jbWRzID0gMzsKPiAgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgXgo+IG1tY19jbWRzLmM6MjY0MjoxMTogZXJyb3I6IGRlcmVmZXJlbmNpbmcg
cG9pbnRlciB0byBpbmNvbXBsZXRlIHR5cGUKPiAgwqAgbXVsdGlfY21kLT5jbWRzWzBdLm9wY29k
ZSA9IE1NQ19FUkFTRV9HUk9VUF9TVEFSVDsKPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXgo+IG1t
Y19jbWRzLmM6MjY0MzoxMTogZXJyb3I6IGRlcmVmZXJlbmNpbmcgcG9pbnRlciB0byBpbmNvbXBs
ZXRlIHR5cGUKPiAgwqAgbXVsdGlfY21kLT5jbWRzWzBdLmFyZyA9IHN0YXJ0Owo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBeCj4gbW1jX2NtZHMuYzoyNjQ0OjExOiBlcnJvcjogZGVyZWZlcmVuY2lu
ZyBwb2ludGVyIHRvIGluY29tcGxldGUgdHlwZQo+ICDCoCBtdWx0aV9jbWQtPmNtZHNbMF0uZmxh
Z3MgPSBNTUNfUlNQX1NQSV9SMSB8IE1NQ19SU1BfUjEgfCBNTUNfQ01EX0FDOwo+ICDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBeCj4gLi4uCj4gYGBgCj4gCj4gSGF2ZSB5b3UgZ2l2ZW4gYSB0cnkgd2l0
aCB0aGF0IHNjcmlwdD8gQ291bGQgeW91IHBsZWFzZSBwcm92aWRlIGEgcGF0Y2gKPiB0byBmaXgg
dGhhdCBidWcgdG9vPyBPciBJIGNhbiBwcm92aWRlIGl0IGxhdGVyLgpJIGRpZCBub3cgKGFuZCBq
dXN0IGZvdW5kIGEgYnVnIGluIGl0IDspKQoKVGhlIGZpeCBpcyB0aGF0IHdlIG5lZWQgdG8gaGF2
ZSBtbWMtdXRpbHMgZGVwZW5kIG9uIHRoZSByaWdodCAKbGludXgtaGVhZGVycyAoPj0gNC40KSwg
aXNuJ3QgaXQgPwoKQmVzdCByZWdhcmRzLAoKPiAKPiBUaGFuayB5b3UKPiAKPiBCZXN0IHJlZ2Fy
ZHMKCi0tIApTw6liYXN0aWVuIFN6eW1hbnNraSwgQXJtYWRldXMgU3lzdGVtcwpTb2Z0d2FyZSBl
bmdpbmVlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xp
c3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
