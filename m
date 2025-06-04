Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82D4C5B549
	for <buildroot@archiver.kernel.org>; Wed,  4 Jun 2025 17:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4803983B5B;
	Wed,  4 Jun 2025 17:04:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XvlH0MyzXFmL; Wed,  4 Jun 2025 17:04:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C800783B5C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C800783B5C;
	Wed,  4 Jun 2025 17:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 56BC81A4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:04:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4826641FC1
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:04:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pgr6G0oiFsYY for <buildroot@buildroot.org>;
 Wed,  4 Jun 2025 17:04:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::228;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org CEF8B41FB4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEF8B41FB4
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CEF8B41FB4
 for <buildroot@buildroot.org>; Wed,  4 Jun 2025 17:04:15 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DEF242FF4;
 Wed,  4 Jun 2025 17:04:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1uMrX8-00Gi1E-0r;
 Wed, 04 Jun 2025 19:04:10 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Cc: Marcus Hoffmann <buildroot@bubu1.eu>,  James Hilliard
 <james.hilliard1@gmail.com>,  Oli Vogt <oli.vogt.pub01@gmail.com>,  Marcus
 Hoffmann <bubu@bubu1.eu>
References: <20250604163348.104844-1-buildroot@bubu1.eu>
Date: Wed, 04 Jun 2025 19:04:10 +0200
In-Reply-To: <20250604163348.104844-1-buildroot@bubu1.eu> (Marcus Hoffmann via
 buildroot's message of "Wed, 4 Jun 2025 18:33:46 +0200")
Message-ID: <87y0u7fng5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddugddvgedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufhfffgjkfgfgggtgfesthhqtddttderjeenucfhrhhomheprfgvthgvrhcumfhorhhsghgrrghrugcuoehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmqeenucggtffrrghtthgvrhhnpefgfeeluefhueduueevhefhhffghfdtkefggffgtdefieeiueehheefueeltdefueenucffohhmrghinhepughjrghnghhophhrohhjvggtthdrtghomhenucfkphepudejkedrudduledruddrudefjeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedujeekrdduudelrddurddufeejpdhhvghlohepuggvlhhlrdgsvgdrgeekvghrshdrughkpdhmrghilhhfrhhomhepphgvthgvrheskhhorhhsghgrrghrugdrtghomhdpnhgspghrtghpthhtohephedprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepjhgrmhgvshdrhhhilhhlihgrrhguudesghhmrghilhdrtghomhdprhgtphhtthhopeholhhirdhvohhgthdrphhusgdtudesghhmrghilhdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhgsuhdurdgvuhdprhgtphhtthhop
 egsuhgsuhessghusghuuddrvghu
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/python-django: security bump to
 5.2.2
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Pj4+Pj4gIk1hcmN1cyIgPT0gTWFyY3VzIEhvZmZtYW5uIHZpYSBidWlsZHJvb3QgPGJ1aWxkcm9v
dEBidWlsZHJvb3Qub3JnPiB3cml0ZXM6CgogPiBEamFuZ28gNS4yLjIgZml4ZXMgYSBzZWN1cml0
eSBpc3N1ZSB3aXRoIHNldmVyaXR5IOKAnGxvd+KAnSBhbmQgc2V2ZXJhbCBidWdzIGluIDUuMi4x
LgogPiBGaXhlczogQ1ZFLTIwMjUtNDg0MzI6IFBvdGVudGlhbCBsb2cgaW5qZWN0aW9uIHZpYSB1
bmVzY2FwZWQgcmVxdWVzdCBwYXRoCgogPiBGdWxsIFJlbGVhc2Ugbm90ZXM6CiA+IGh0dHBzOi8v
ZG9jcy5kamFuZ29wcm9qZWN0LmNvbS9lbi81LjIvcmVsZWFzZXMvNS4yLjIvCgogPiBTaWduZWQt
b2ZmLWJ5OiBNYXJjdXMgSG9mZm1hbm4gPGJ1aWxkcm9vdEBidWJ1MS5ldT4KCkNvbW1pdHRlZCwg
dGhhbmtzLgoKLS0gCkJ5ZSwgUGV0ZXIgS29yc2dhYXJkCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxkcm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290
QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8vYnVpbGRyb290Cg==
