Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7B8C369AB
	for <buildroot@archiver.kernel.org>; Fri, 18 Apr 2025 10:37:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 015AE4129E;
	Fri, 18 Apr 2025 10:37:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LpYAD2hmeh71; Fri, 18 Apr 2025 10:37:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3916241304
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3916241304;
	Fri, 18 Apr 2025 10:37:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 74230228
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7116783FE7
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnTrMS-UShVZ for <buildroot@buildroot.org>;
 Fri, 18 Apr 2025 10:37:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.194;
 helo=relay2-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47DC584020
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47DC584020
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47DC584020
 for <buildroot@buildroot.org>; Fri, 18 Apr 2025 10:37:47 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8D75A43156;
 Fri, 18 Apr 2025 10:37:44 +0000 (UTC)
Date: Fri, 18 Apr 2025 12:37:43 +0200
To: Alexis =?UTF-8?B?TG90aG9yw6k=?= <alexis.lothore@bootlin.com>
Cc: "Julien Olivain" <ju.o@free.fr>, <buildroot@buildroot.org>, "Francis
 Laniel" <flaniel@linux.microsoft.com>, Thomas Perale
 <thomas.perale@mind.be>
Message-ID: <20250418123743.51192de0@windsurf>
In-Reply-To: <D97IPBMKJNQL.1EF4TZDMMBRCA@bootlin.com>
References: <20250415-bump_pahole-v1-1-6c6df3ff497f@bootlin.com>
 <51a49e9cb3753181d544641efbf14880@free.fr>
 <D97IPBMKJNQL.1EF4TZDMMBRCA@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtqhertdertdejnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepheduteeufeekieevieegueegiefgvdevhefggfdutdeiuedvtdfgledvgeevleeinecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecukfhppeelvddrudefgedrvddtkedrudefgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeelvddrudefgedrvddtkedrudefgedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegrlhgvgihishdrlhhothhhohhrvgessghoohhtlhhinhdrtghomhdprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepfhhlrghnihgvlheslhhinhhugidrmhhitghrohhsohhfthdrtghom
 hdprhgtphhtthhopehthhhomhgrshdrphgvrhgrlhgvsehmihhnugdrsggv
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1744972664;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sHgejIzgPH/naZzIz6P370q+YAYSZyJ080eKFpwiYgw=;
 b=eSQiwn4YLKZBDCSmmxNHFF/cYLnxqL+R/7Gwb/q+F7hUJCZ6IQR8/G3FML3JlgsbblESuR
 Vj+po6KrHUY3Ao0fTLVELHCzqpXV7AxW6rBh2jJ8fm99I77J8W+U4gLoNiHr8Ev9Lw18V0
 xO4iUrrVsUOFvmbIZvXaPMIUtlkzG3VAE8l4qqbo4N6/ub/1xFSNNxYalch4FJqBTeH6U8
 5cGcDIwF69AeOtXAibdViRqUmnaedRlS97qBQEG4ACyd+KR7XUnQ5f/b9nGLesrDHInxVw
 EkwVRnpjy/BfZ1/DQnEQfsNd2dWdrKMpDjkz2cw+6dwZuJUecW+wSIo7AN68Mg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=eSQiwn4Y
Subject: Re: [Buildroot] [PATCH] package/pahole: bump to version 1.28
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gVHVlLCAxNSBBcHIgMjAyNSAyMzowNzozOSArMDIwMApBbGV4aXMgTG90aG9yw6kgPGFsZXhp
cy5sb3Rob3JlQGJvb3RsaW4uY29tPiB3cm90ZToKCj4gSW4gY2FzZSBpdCBoYXMgc2xpcHBlZCB0
aHJvdWdoOiBhcyB0aGUgaXNzdWUgYWxzbyBleGlzdHMgb24gdGhlIGN1cnJlbnQKPiByZWxlYXNl
IGJyYW5jaCwgZG8geW91IHdhbnQgbWUgdG8gc2VuZCBhIHBhdGNoIHRhcmdldGluZyB0aGUgMjAy
NS4wMi54Cj4gYnJhbmNoIHRvIGJhY2twb3J0IHRoZSB1cHN0cmVhbSBwYXRjaCBmaXhpbmcgdGhl
IGlzc3VlID8gKGJlY2F1c2UgSSBndWVzcwo+IGJ1bXBpbmcgdGhlIHBhY2thZ2UgdmVyc2lvbiBv
biB0aGUgcmVsZWFzZSBicmFuY2ggaXMgbm90IGFuIG9wdGlvbiA/KQoKSW4gZmFjdCBpZGVhbGx5
IGluIHRoaXMgc2l0dWF0aW9uIG15IHBlcnNvbmFsIHByZWZlcmVuY2UgaXMgdGhhdCBmcm9tCnRo
ZSBzdGFydCB0aGUgdGhpbmcgZ2V0cyBzdWJtaXR0ZWQgYXMgdHdvIHBhdGNoZXM6CgoxLiBPbmUg
ZG9pbmcgdGhlIGJhY2twb3J0IG9mIHRoZSBmaXgsIHdpdGhvdXQgYnVtcGluZyB0aGUgdmVyc2lv
bgoKMi4gT25lIGRvaW5nIHRoZSB2ZXJzaW9uIGJ1bXAsIGRyb3BwaW5nIHRoZSBmaXggYmFja3Bv
cnQgYWxvbmcgdGhlIHdheQoKVGhpcyB3YXksIHdlIGNhbiBlYXNpbHkgYmFja3BvcnQgKDEpIHRv
IG91ciBjdXJyZW50IExUUy9zdGFibGUgYnJhbmNoLgoKQmVzdCByZWdhcmRzLAoKVGhvbWFzCi0t
IApUaG9tYXMgUGV0YXp6b25pLCBjby1vd25lciBhbmQgQ0VPLCBCb290bGluCkVtYmVkZGVkIExp
bnV4IGFuZCBLZXJuZWwgZW5naW5lZXJpbmcgYW5kIHRyYWluaW5nCmh0dHBzOi8vYm9vdGxpbi5j
b20KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYnVpbGRy
b290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRwczovL2xpc3RzLmJ1
aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
