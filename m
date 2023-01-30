Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2565AC54EAA
	for <buildroot@archiver.kernel.org>; Mon, 30 Jan 2023 16:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1C303404D4;
	Mon, 30 Jan 2023 16:13:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C303404D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pyVC6lBh4AL2; Mon, 30 Jan 2023 16:13:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0222440A83;
	Mon, 30 Jan 2023 16:13:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0222440A83
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 31A7D1BF32C
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 16:12:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 02FF940A83
 for <buildroot@lists.busybox.net>; Mon, 30 Jan 2023 16:12:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 02FF940A83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyKDko_scHps for <buildroot@lists.busybox.net>;
 Mon, 30 Jan 2023 16:12:53 +0000 (UTC)
X-Greylist: delayed 01:10:01 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D359404D4
Received: from 4.mo550.mail-out.ovh.net (4.mo550.mail-out.ovh.net
 [46.105.76.26])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D359404D4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 16:12:53 +0000 (UTC)
Received: from director8.ghost.mail-out.ovh.net (unknown [10.108.20.96])
 by mo550.mail-out.ovh.net (Postfix) with ESMTP id 98420244E4
 for <buildroot@buildroot.org>; Mon, 30 Jan 2023 14:54:11 +0000 (UTC)
Received: from ghost-submission-6684bf9d7b-t8lm2 (unknown [10.110.208.67])
 by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 523C21FD44;
 Mon, 30 Jan 2023 14:54:11 +0000 (UTC)
Received: from dopsi.ch ([37.59.142.96])
 by ghost-submission-6684bf9d7b-t8lm2 with ESMTPSA
 id yiScEhPa12MKoR4AckRQtg
 (envelope-from <dopsi@dopsi.ch>); Mon, 30 Jan 2023 14:54:11 +0000
X-OVh-ClientIp: 192.26.37.52
Message-ID: <1349e0d6ec9b6276a76371b29260432890ad680e.camel@dopsi.ch>
From: Simon Doppler <dopsi@dopsi.ch>
To: Ra C <rcrichlow9000@gmail.com>, buildroot@buildroot.org
Date: Mon, 30 Jan 2023 15:54:04 +0100
In-Reply-To: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
References: <CACHw65JhmQX27SkN0jSMAD-P=UuwOizZc+sG+WatprbH_PFFyQ@mail.gmail.com>
User-Agent: Evolution 3.44.4-0ubuntu1 
MIME-Version: 1.0
X-Ovh-Tracer-Id: 15713903526054836341
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvhedrudefvddgjedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucenucfjughrpefkuffhvfffjghftgfgfgggsehtqhertddtreejnecuhfhrohhmpefuihhmohhnucffohhpphhlvghruceoughophhsihesughophhsihdrtghhqeenucggtffrrghtthgvrhhnpedtveehgefggeekueegkedvieetfedvteelueduffffueeghfdujedvjeevtefgveenucffohhmrghinhepghhithhhuhgsrdgtohhmnecukfhppeduvdejrddtrddtrddupdefjedrheelrddugedvrdelieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeduvdejrddtrddtrddupdhmrghilhhfrhhomhepoeguohhpshhiseguohhpshhirdgthheqpdhnsggprhgtphhtthhopedupdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdpoffvtefjohhsthepmhhoheehtddpmhhouggvpehsmhhtphhouhht
X-Mailman-Original-Authentication-Results: garm.ovh; auth=pass
 (GARM-96R0011d900777-fc16-4582-a793-50f2709d6304,
 EA3082E3B340370E95E0D8AE8FE4B574AE42AF78) smtp.auth=dopsi@dopsi.ch
Subject: Re: [Buildroot] stm32mp1 kernel won't boot on custom board
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gUmFtb24sCgpPbiBTYXQsIDIwMjMtMDEtMjggYXQgMTQ6NTIgLTA2MDAsIFJhIEMgd3Jv
dGU6Cj4gSSBoYXZlIGEgY3VzdG9tIHN0bTMybXAxNTdhIGJvYXJkIHdoaWNoIHJ1bnMgT0sgd2l0
aCBhIG1vZGlmaWVkIDUuNCBrZXJuZWwuCj4gSSB3YW50IHRvIG1pZ3JhdGUgdG8gdGhlIGxhdGVz
dCBzdG0gc3VwcG9ydGVkIGtlcm5lbC4KPiBJIGJ1aWx0IGEgc3RtMzJtcDE1N2FfZGsxIHRhcmdl
dCB1c2luZyB0aGUgQlIyX0VYVEVSTkFMIGZlYXR1cmUgZGVzY3JpYmVkIGhlcmU6Cj4gaHR0cHM6
Ly9naXRodWIuY29tL2Jvb3RsaW4vYnVpbGRyb290LWV4dGVybmFsLXN0IHdoaWNoIGJ1aWxkcyBh
IDUuMTUga2VybmVsLgo+IAo+IFVzaW5nIHRoZSBzYW1lIGR0YiAsIHRoZSA1LjE1IGtlcm5lbCBm
YWlscyB0byBtb3VudCB0aGUgcm9vdCBkZXZpY2UgKGEgbWljcm8gc2QgY2FyZCBvbiBTRE1NQzEp
Cj4gYW5kIGdldHMgc3R1Y2sgaW4gYSBsb29wIGxvb2tpbmcgZm9yIGEgZGV2aWNlIG1hdGNoaW5n
IHRoZSBQQVJUVVVJRCBpbsKgY2xhc3NfZmluZF9kZXZpY2UoKS7CoCBUaGUKPiBvbmx5IGRldmlj
ZXMgbGlzdGVkIGFyZSBsb29wIGFuZCByYW0uCj4gCj4gVGhlIHByb2JlIGZ1bmN0aW9uIGluIGRy
aXZlcnMvbW1jL2hvc3QvbW1jaS5jLCB3aGljaCBnZXRzIGNhbGxlZCBpbiB0aGUgd29ya2luZyBr
ZXJuZWwgcHJpb3IgdG8KPiBtb3VudGluZyB0aGUgcm9vdCBkZXZpY2UgZG9lcyBub3QgZ2V0IGNh
bGxlZCB3aXRoIHRoZSA1LjE1IGtlcm5lbC4KPiAKPiBJIGRvbid0IHVuZGVyc3RhbmQgd2h5IHRo
aXMgaXMgaGFwcGVuaW5nIGdpdmVuIHRoYXQgdGhlIHNhbWUgZGV2aWNlIHRyZWUgaXMgdXNlZCBp
biBib3RoIGNhc2VzIGFuZAo+IG5vdCBzdXJlIHdoZXJlIG5leHQgdG8gbG9vay4KClNpbmNlIHRo
ZSBEVEIgaXMgdGhlIHNhbWUsIGFyZSBhbGwgdGhlIHJlcXVpcmVkIGRyaXZlcnMgcHJlc2VudCAo
bm90IGFzIG1vZHVsZXMpPyBJIGRpZG4ndCBjaGVjawp3aGljaCBkcml2ZXJzIGV4YWN0bHkgYXJl
IGJ1aWx0IGluIHdpdGggdGhlIGNvbmZpZ3MgU1QgcHJvdmlkZXMuIEkgd291bGQgZXNwZWNpYWxs
eSBjaGVjayBmb3IgdGhlCkNPTkZJR19NTUMqIHZhbHVlcyBhbmQgd2hldGhlciB0aGUgcmVxdWly
ZWQgZmlsZXN5c3RlbSBzdXBwb3J0IGlzIGJ1aWx0IGluLgoKQmVzdCwKClNpbW9uCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5n
IGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3Jn
L21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
