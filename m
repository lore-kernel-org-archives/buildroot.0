Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17BBDCA0EE9
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E030A615B5;
	Sat, 16 Aug 2025 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TSfeRwif4_AP; Sat, 16 Aug 2025 20:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7BD0B61558
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7BD0B61558;
	Sat, 16 Aug 2025 20:55:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B9B9E196
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B739C83F61
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cBeh69arLBQx for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:55:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.178.235;
 helo=relay15.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BD52783F5F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BD52783F5F
Received: from relay15.mail.gandi.net (relay15.mail.gandi.net [217.70.178.235])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BD52783F5F
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:55:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 707BD442B8;
 Sat, 16 Aug 2025 20:55:32 +0000 (UTC)
Date: Sat, 16 Aug 2025 22:55:32 +0200
To: Titouan Christophe via buildroot <buildroot@buildroot.org>
Cc: Titouan Christophe <titouan.christophe@mind.be>
Message-ID: <20250816225532.5aea07e4@windsurf>
In-Reply-To: <20250812100148.717381-1-titouan.christophe@mind.be>
References: <20250812100148.717381-1-titouan.christophe@mind.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -110
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddugeejkeeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfghrlhcuvffnffculddquddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgeefffetleevgeelfeeggefgfeekffejfeffveeiueduueehhfekgeeugeejveeunecuffhomhgrihhnpehnihhsthdrghhovhdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehtihhtohhurghnrdgth
 hhrihhsthhophhhvgesmhhinhgurdgsvg
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1755377733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gT7YsO4T9kwMNyc4J4Q4oF3lqYa4/K0hQ9VYyBGozOc=;
 b=M9hfj36dAMZYhLG6oJhDwK/64FfWKHsPRi/z6QrEsyXdlXj8prc15Ti/coLo0QEHvBV8jQ
 J3ONiuskysQ96pR2Dec7TOYYQsamZdO6W0NC5bv69IF4urUEbo0jBcWf/Hu97FbPNh6aCn
 vpZnnPdT1XpIs667u7KBnDWbrf9+dv4EgGsq+BaTZSKIuJVIUb1U6tvRmHros3mRycNbps
 TziA389Ja/UCA+qtb8eKJ6VphOHoFIWkLLo0BrTXoWPVAgLNMd0Rc7DR8xkej5HfOSgG/x
 78A1ViczQ2dHJWElbviLW0aQASSTbmUijN77TtRSX4uRQiiqiBIIiaj1ybaszQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=M9hfj36d
Subject: Re: [Buildroot] [PATCH 1/4] package/openconnect: add CPE vendor
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Aug 2025 12:01:45 +0200
Titouan Christophe via buildroot <buildroot@buildroot.org> wrote:

> infradead is a valid CPE vendor for openconnect, see
> https://nvd.nist.gov/products/cpe/detail/2877E5FD-6361-465D-81D7-AE1EBB3E059F
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
> ---
>  package/openconnect/openconnect.mk | 1 +
>  1 file changed, 1 insertion(+)

Entire series of 4 patches applied, thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
