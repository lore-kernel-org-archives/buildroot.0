Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2321BC021B8
	for <buildroot@archiver.kernel.org>; Wed, 26 Feb 2025 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8551E4122C;
	Wed, 26 Feb 2025 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g8bEupxAXVMT; Wed, 26 Feb 2025 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B83C4122E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B83C4122E;
	Wed, 26 Feb 2025 17:46:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D427494F
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B47D840109
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uEfX2V8pYCBM for <buildroot@buildroot.org>;
 Wed, 26 Feb 2025 17:46:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5341A40187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5341A40187
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5341A40187
 for <buildroot@buildroot.org>; Wed, 26 Feb 2025 17:46:40 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A6A944400;
 Wed, 26 Feb 2025 17:46:37 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tnLUS-007pZ5-2h;
 Wed, 26 Feb 2025 18:46:36 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Kory Maincent via buildroot <buildroot@buildroot.org>
Cc: Kory Maincent <kory.maincent@bootlin.com>,  Romain Naour
 <romain.naour@smile.fr>,  thomas.petazzoni@bootlin.com
References: <20250221-fixes_octavo-v2-0-0bb2012512eb@bootlin.com>
 <20250221-fixes_octavo-v2-2-0bb2012512eb@bootlin.com>
Date: Wed, 26 Feb 2025 18:46:36 +0100
In-Reply-To: <20250221-fixes_octavo-v2-2-0bb2012512eb@bootlin.com> (Kory
 Maincent via buildroot's message of "Fri, 21 Feb 2025 10:30:25 +0100")
Message-ID: <87zfi8ppj7.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekhedvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufhffjgfkfgggtgfgsehtqhdttddtreejnecuhfhrohhmpefrvghtvghrucfmohhrshhgrggrrhguuceophgvthgvrheskhhorhhsghgrrghrugdrtghomheqnecuggftrfgrthhtvghrnhepgeefjeduleeikeelteejfffgfffflefgiefgffffieejjefhudfhleeuhedvvdeunecukfhppedujeekrdduudelrddurddufeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepudejkedrudduledruddrudefjedphhgvlhhopeguvghllhdrsggvrdegkegvrhhsrdgukhdpmhgrihhlfhhrohhmpehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesshhmihhlvgdrfhhrpdhrtghpthhtohepkhhorhihrdhmrghinhgtvghnthessghoohhtlhhinhdrtghomhdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomh
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 2/3] board/octavo: Fix Linux compilation
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

Pj4+Pj4gIktvcnkiID09IEtvcnkgTWFpbmNlbnQgdmlhIGJ1aWxkcm9vdCA8YnVpbGRyb290QGJ1
aWxkcm9vdC5vcmc+IHdyaXRlczoKCiA+IFNpbmNlIGNvbW1pdCBkYzBmNzIxNWM2MDRlICgicGFj
a2FnZS9nY2M6IHN3aXRjaCB0byAxMy54IGFzIGRlZmF1bHQiKSwKID4gdGhlIExpbnV4IGtlcm5l
bCBpcyBmYWlsaW5nIHRvIGJ1aWxkIHdpdGggdGhpcyBvdXRwdXQ6CgogPiBJbiBmaWxlIGluY2x1
ZGVkIGZyb20gLi9pbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjEwLAogPiAgICAgICAgICAgICAgICAg
IGZyb20gZHJpdmVycy9hdGEvbGliYWhjaS5jOjM1OgogPiBkcml2ZXJzL2F0YS9saWJhaGNpLmM6
IEluIGZ1bmN0aW9uIOKAmGFoY2lfbGVkX3N0b3Jl4oCZOgogPiAuL2luY2x1ZGUvbGludXgvY29t
cGlsZXIuaDozNDg6NDU6IGVycm9yOiBjYWxsIHRvIOKAmF9fY29tcGlsZXRpbWVfYXNzZXJ0XzEx
NTTigJkgZGVjbGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEJVSUxEX0JVR19PTiBmYWlsZWQ6
IHNpemVvZihfcykgPiBzaXplb2YobG9uZykKID4gICAgMzQ4IHwgICAgICAgICBfY29tcGlsZXRp
bWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1lX2Fzc2VydF8sIF9fTElORV9f
KQoKID4gRml4IGl0IGJ5IGltcG9ydGluZyBMaW51eCB1cHN0cmVhbSBwYXRjaC4KCiA+IFNpZ25l
ZC1vZmYtYnk6IEtvcnkgTWFpbmNlbnQgPGtvcnkubWFpbmNlbnRAYm9vdGxpbi5jb20+CgpDb21t
aXR0ZWQsIHRoYW5rcy4KCi0tIApCeWUsIFBldGVyIEtvcnNnYWFyZApfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1
aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2J1aWxkcm9vdAo=
