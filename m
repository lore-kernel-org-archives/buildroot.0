Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B83AC77B7C
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 16:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B749A827B5;
	Thu,  3 Jul 2025 16:01:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6kyy3PFR17y2; Thu,  3 Jul 2025 16:01:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2F4982456
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2F4982456;
	Thu,  3 Jul 2025 16:01:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7356A128
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 16:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64DE5611A1
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 16:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoQkPelXWeBa for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 16:01:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.249;
 helo=mslow3.mail.gandi.net; envelope-from=herve.codina@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2962A611A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2962A611A0
Received: from mslow3.mail.gandi.net (mslow3.mail.gandi.net [217.70.178.249])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2962A611A0
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 16:01:46 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by mslow3.mail.gandi.net (Postfix) with ESMTP id F2D44586647
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 15:26:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E76A444CC;
 Thu,  3 Jul 2025 15:26:02 +0000 (UTC)
Date: Thu, 3 Jul 2025 17:26:00 +0200
To: Thomas Perale <thomas.perale@mind.be>
Message-ID: <20250703172600.13b90c7a@bootlin.com>
In-Reply-To: <b85d3e3b-1788-4ec0-9690-e87a20b5b18a@mind.be>
References: <20250630072423.1126928-1-thomas.perale@mind.be>
 <20250703123359.5bca4a98@bootlin.com>
 <b85d3e3b-1788-4ec0-9690-e87a20b5b18a@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddvtdeifecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthekredtredtjeenucfhrhhomhepjfgvrhhvvgcuvehoughinhgruceohhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeekledutdejgeelgffffffhvefhgfeuffdvlefhgfdvkeekgfeujefgtddvjeevvdenucffohhmrghinhepghhithhlrggsrdgtohhmpdgsuhhilhgurhhoohhtrdhorhhgnecukfhppedvrgdtudemvgdtrgemvdekheemsgelkedtmegvgedttgemiegtgeefmegshegssgemrgegvdeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegvtdgrmedvkeehmegsleektdemvgegtdgtmeeitgegfeemsgehsggsmegrgedvkedphhgvlhhopehlohgtrghlhhhoshhtpdhmrghilhhfrhhomhephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepthhhohhmrghsrdhpvghrrghlvgesmhhinhgurdgsvgdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepnhhitghol
 hgrshdrtggrrhhrihgvrhesohhrohhlihgrrdgtohhm
X-GND-Sasl: herve.codina@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1751556362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9Q43WpWBLAGKi768ftmFYeRiAkWgtBVPVIQGq+Ob/xQ=;
 b=DG0SwQ4NYLQmWXb9DtmN/oe5Z2guSu7e3ZfkQvBJhLgLI7YymK7WOgdRLoPHDRCbPZkacx
 4yZH0GgN6Xxok/9KkMGRUybCyw5KTE+zcQg6wzzFJRJecTEYBpqJRWD8nT6oVd8MJf7Ygd
 I39jWzizqdoh5rlsMWM771KRS6cXEnEJtJRYnxCsJBhT5HJWoLKtRMSJUDPIkQ8hRQx7hg
 mvFPnSGq1+lwIpQgeDb9Zxz6AEyzwJ07p4moD05uo5DaYMUd7fJvhwaLZS3KfJXAn89uOA
 hSCbCjKt4jTBLmYKi6DsyUgTykP81aRkE6oMWC9b3RnID7nJO0nyC9sarG4nLg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=DG0SwQ4N
Subject: Re: [Buildroot] [PATCH] package/modsecurity2: security bump to
 v2.9.10
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
From: Herve Codina via buildroot <buildroot@buildroot.org>
Reply-To: Herve Codina <herve.codina@bootlin.com>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGkgVGhvbWFzLAoKT24gVGh1LCAzIEp1bCAyMDI1IDE2OjM4OjIxICswMjAwClRob21hcyBQZXJh
bGUgPHRob21hcy5wZXJhbGVAbWluZC5iZT4gd3JvdGU6Cgo+IEhpIEhlcnbDqSwKPiAKPiBKdWxp
ZW4gYWxyZWFkeSB0b29rIGNhcmUgb2YgZml4aW5nIG15IG1pc3Rha2Ugd2hlbiBjb21taXRpbmcg
KHNlZSAKPiBodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJvb3QvLS9jb21t
aXQvM2Q1OTNhODE0NGFkODg5MGRhZTRhYjZmZDIzNWVlZjcwMGQzYzE0NCkuCgpQZXJmZWN0LCBJ
IGhhdmUgbWlzc2VkIEp1bGllbidzIHVwZGF0ZS4KClNvcnJ5IGZvciB0aGUgbm9pc2UuCgpCZXN0
IHJlZ2FyZHMsCkhlcnbDqQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpidWlsZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0
dHBzOi8vbGlzdHMuYnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
