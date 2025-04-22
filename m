Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D365C369D7
	for <buildroot@archiver.kernel.org>; Tue, 22 Apr 2025 07:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FAFF60D50;
	Tue, 22 Apr 2025 07:55:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9wwe-esv4pX; Tue, 22 Apr 2025 07:55:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB1DB6067F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1DB6067F;
	Tue, 22 Apr 2025 07:55:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6239368
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:55:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 455A240F82
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:55:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xXMSnULeZKWG for <buildroot@buildroot.org>;
 Tue, 22 Apr 2025 07:55:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2848B40F51
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2848B40F51
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2848B40F51
 for <buildroot@buildroot.org>; Tue, 22 Apr 2025 07:55:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id C21B043B68;
 Tue, 22 Apr 2025 07:55:29 +0000 (UTC)
Date: Tue, 22 Apr 2025 09:55:28 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20250422095528.0006b78b@windsurf>
In-Reply-To: <CACXRmJh1modbu_ODmUs8_iqMUw1tRwr3h4LC8EERgCjTZrsz+A@mail.gmail.com>
References: <Z-QAExADR8rp0Afq@waldemar-brodkorb.de>
 <20250402082625.599501-1-thomas@devoogdt.com>
 <Z-0auN0f7ln-1IJH@waldemar-brodkorb.de>
 <CACXRmJhEJ9RnLpiAjfp+mSZD-okUg8+-hY6zJ-i9Qt_zbNFYOg@mail.gmail.com>
 <Z-2IR5Zbzs7zwT5x@waldemar-brodkorb.de>
 <CACXRmJioVq7PUwBkCPNj0k-47hrJ_vtgVYtzp+_84ZgimDe9CA@mail.gmail.com>
 <20250421233159.792b17e7@windsurf>
 <CACXRmJh1modbu_ODmUs8_iqMUw1tRwr3h4LC8EERgCjTZrsz+A@mail.gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefudelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeeutdefudehhfeugfelhffhveeitdetteeugfdtuedufffhgfetheekteejueetnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpuhgtlhhisggtqdhnghdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepthhhohhmrghsseguvghvohhoghguthdrtghomhdprhgtphhtthhopeifsgigsehophgvnhgrughkr
 dhorhhgpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdruggvvhhoohhgughtsegsrghrtghordgtohhm
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745308530;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=poqTFWpMYAxFu+/4NuLV/EPIETupUddURzrfxvya0eQ=;
 b=eEjPOe/OaSyp/JHTFh+6wPc1cQDAfX5qwYeQDZIx33bcvFawnYeDSiigeS003fgAsg6KzM
 PWrSOS8IhuXHIUX2GwlZRRfAC5/HMcshpGtoJ9gNCbHqH204viz69TZpCTpCGm9QTBmoxm
 kUTzrFBNj/XhlOGHnx1jXhbrU6RFuNnPyhZXE2fEw9whZ7EkyUDLBLXaFqMcfolCA4A5Hq
 pHfxJUe2IoHlSsVSpxOLByMFN6NSEGYjbWmeRti5bcKYCMqUGVZtwj+zj3fzTdw1nEaElN
 /fHRxuHYa25FbOcAhzpdnXUPKmqY0VJIGyfBwOTakovO+QideLFaG4bB9Q1rQQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eEjPOe/O
Subject: Re: [Buildroot] [PATCH v2] package/util-linux: bump to 2.41
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGVsbG8gVGhvbWFzLAoKT24gVHVlLCAyMiBBcHIgMjAyNSAwOTozMjo1NSArMDIwMApUaG9tYXMg
RGV2b29nZHQgPHRob21hc0BkZXZvb2dkdC5jb20+IHdyb3RlOgoKPiBUaGUgZmlyc3QgaXNzdWUs
Cj4gKFJlcG9ydGVkIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL3V0aWwtbGludXgvdXRpbC1saW51
eC9pc3N1ZXMvMzUwMSkKPiAKPiBlcnJvcjogZXhwZWN0ZWQgaWRlbnRpZmllciBiZWZvcmUgbnVt
ZXJpYyBjb25zdGFudAo+ICAgIDM1IHwgICBNU19SRE9OTFkgPSAxLCAgICAgICAgICAgICAgICAv
KiBNb3VudCByZWFkLW9ubHkuICAqLwo+ICAgICAgIHwgICBefn5+fn5+fn4KPiAKPiBoYXMgYmVl
biBmaXhlZCBieSBpbiB1Q2xpYmMgaW4gY29tbWl0Cj4gaHR0cHM6Ly9jZ2l0LnVjbGliYy1uZy5v
cmcvY2dpL2NnaXQvdWNsaWJjLW5nLmdpdC9jb21taXQvP2lkPTk2YWY2ZGIzYTQzMGEyMmQ1ZThh
NDVmNmU3Mjg0MzYyODY2YjM5ODAuCgpUaGlzIG9uZSBpcyBpbiB1Q2xpYmMtbmcgMS4wLjUyLCBz
byBpdCBtZWFucyBpdCB3aWxsIGZvciBub3cgY29udGludWUKdG8gY2F1c2UgaXNzdWVzIHdpdGgg
Qm9vdGxpbiB0b29sY2hhaW5zLCBhcyB0aGUgbGF0ZXN0IGFyZSBiYXNlZCBvbgoxLjAuNTIuIEkg
bmVlZCB0byBoYXZlIGEgbG9vayBhdCBidWlsZGluZyBuZXcgQm9vdGxpbiB0b29sY2hhaW5zLCBi
dXQgSQp3YXMgaG9waW5nIHRvIGRvIHRoYXQgd2hlbiBnY2MgMTUueCBpcyBhdmFpbGFibGUuCgo+
IFRoZSBzZWNvbmQgaXNzdWUsCj4gKFJlcG9ydGVkIGhlcmUgaHR0cHM6Ly9naXRodWIuY29tL3V0
aWwtbGludXgvdXRpbC1saW51eC9pc3N1ZXMvMzUwMikKPiAKPiBzeXMtdXRpbHMvbHNucy5jOjU4
MDoxOTogZXJyb3I6IOKAmFNJT0NHU0tOU+KAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4KPiB0
aGlzIGZ1bmN0aW9uKQo+ICAgbnNmZCA9IGlvY3RsKHNrLCBTSU9DR1NLTlMpOwo+ICAgICAgICAg
ICAgICAgICAgICBefn5+fn5+fn4KPiAKPiBoYXMgYmVlbiBmaXhlZCBpbiBjb21taXQKPiBodHRw
czovL2dpdGh1Yi5jb20vdXRpbC1saW51eC91dGlsLWxpbnV4L2NvbW1pdC8xMGVlNjZlZDFiMDg1
ODZiZGU0MjU4MmUzNDM1NTQxOGVlZjMzZWY1Lgo+IAo+IEl0IGlzIG9ubHkgYXBwbGljYWJsZSBm
b3IgTGludXggPCA0LjEwLCBidXQgSSB3aWxsIHVwZGF0ZSB0aGlzIGJ1bXAKPiB3aXRoIGEgcGF0
Y2ggZm9yIHRoaXMuCgpUaGFua3MsIHNvdW5kcyBnb29kIQoKVGhvbWFzCi0tIApUaG9tYXMgUGV0
YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExpbnV4IGFuZCBLZXJu
ZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5jb20KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcg
bGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcv
bWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
