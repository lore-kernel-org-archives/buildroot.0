Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DD7C369D5
	for <buildroot@archiver.kernel.org>; Mon, 21 Apr 2025 21:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28204813F9;
	Mon, 21 Apr 2025 21:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XA6jf4oxFV2V; Mon, 21 Apr 2025 21:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6B58C81412
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6B58C81412;
	Mon, 21 Apr 2025 21:29:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 241961BC
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15B8E40913
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XQmI2x79Hu0y for <buildroot@buildroot.org>;
 Mon, 21 Apr 2025 21:29:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.198;
 helo=relay6-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 1BC9D404F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BC9D404F5
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1BC9D404F5
 for <buildroot@buildroot.org>; Mon, 21 Apr 2025 21:29:33 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id CA5AE439E9;
 Mon, 21 Apr 2025 21:29:31 +0000 (UTC)
Date: Mon, 21 Apr 2025 23:29:30 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, linux-amarula@amarulasolutions.com
Message-ID: <20250421232930.70e84cab@windsurf>
In-Reply-To: <20250402074153.4038837-1-dario.binacchi@amarulasolutions.com>
References: <20250402074153.4038837-1-dario.binacchi@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeduleefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfgjfhhoofggtgfgsehtjeertdertddvnecuhfhrohhmpefvhhhomhgrshcurfgvthgriiiiohhnihcuoehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepgffhkeekgeevgfekhfeggfelffdvgfdtteduuedthfehfffgkeeileefhedvkeelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpsghoohhtlhhinhdrtghomhenucfkphepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgdukeemkeeigegumedvuddttdemrgdttdhfmeehlegsfeemgehfvdemieefuggspdhhvghlohepfihinhgushhurhhfpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeegpdhrtghpthhtohepuggrrhhiohdrsghinhgrtggthhhisegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomhdprhgtphhtthhopegsuhhilhgurhhoohhts
 egsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepghhiuhhlihhordgsvghnvghtthhisegsvghnvghtthhivghnghhinhgvvghrihhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdgrmhgrrhhulhgrsegrmhgrrhhulhgrshholhhuthhiohhnshdrtghomh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1745270972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W1AIA4OU07LO1h3GjchCVk1MrOSHBP2p0ATN5co1rbE=;
 b=KdbWTVpvHW7I495RkTnqLyWW3jIVvt8Vl7yGBNZoBE8+/8OtNVLhtNciBZMlf3xf5aFRQv
 a+a9mm2K/9zPsmVGwTgts317o34mzgwbswOyU1MkSLIX9XMdI5P/X2KPSf/4tK6t5ahEdp
 D80Ha70xtOhcOonTI0tfJ+UokynG4dBVHbH9g22Bq4TxGEzOb8VgJJBVadOWZYq9GVWF7h
 iQ/fCT29U4MsawDv7yUQLFEb/lv7hAmKypXWXYbPhmHbNwahLKi3bLZKkIBaFp7hXX1YZj
 4I2MNAkVlyGKu7+bHS9SWppmKcv5ycd1wjqdKrUbn36zVXimN5ad1eWKzpU3ZA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KdbWTVpv
Subject: Re: [Buildroot] [PATCH 1/1] package/mmc-utils: bump to 2aef4cd9a84d
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

On Wed,  2 Apr 2025 09:41:53 +0200
Dario Binacchi <dario.binacchi@amarulasolutions.com> wrote:

> Among the various changes, it's worth noting the extension of the
> register read functionality, allowing also to get its value as an
> argument [1].
> Moreover, commit [2] fixes the conditional invocation of sparse
> properly handling the corresponding 'C' option. Hence, the related
> change in the Buildroot compilation command (i.e. C=0).
> 
> [1] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=21e0fa6420736830a90e13b4a807ec3475df5e65
> [2] https://web.git.kernel.org/pub/scm/utils/mmc/mmc-utils.git/commit/?id=a89cba2a0f8c6a19aa6b804877241170f5b6bdd2
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/mmc-utils/mmc-utils.hash | 2 +-
>  package/mmc-utils/mmc-utils.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
