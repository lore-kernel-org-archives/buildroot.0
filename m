Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E3DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 11:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CB86424E3;
	Wed,  5 Feb 2025 11:50:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XcQKuBIdVphC; Wed,  5 Feb 2025 11:50:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43739424F3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43739424F3;
	Wed,  5 Feb 2025 11:50:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2984CCD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 190394022B
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GcnklcJLbopn for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 11:50:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org C4D45404FD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4D45404FD
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4D45404FD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 11:50:16 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BFA47442E4;
 Wed,  5 Feb 2025 11:50:14 +0000 (UTC)
Date: Wed, 5 Feb 2025 12:50:14 +0100
To: Peter Korsgaard <peter@korsgaard.com>
Cc: buildroot@buildroot.org
Message-ID: <20250205125014.6c096fb0@windsurf>
In-Reply-To: <20250205104104.16072-1-peter@korsgaard.com>
References: <20250205104104.16072-1-peter@korsgaard.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeefjecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeffueejtdehgedtvdfgkeekgfegudfgiefhfedvueelgffhtddvleegveehgffgkeenucffohhmrghinhepsghuihhlughrohhothdrnhgvthdpghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvddprhgtphhtthhopehpvghtvghrsehkohhrshhgrggrrhgurdgtohhmpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrgh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738756214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BvIl1gqSOkvnuaBHcyIMWqaBziiwsToVcq6fZ6lHvWc=;
 b=Mkv2YFlpUq7MUSTCJiGWL7xg2HnCePMR52qBEQPcbbkyx7p2BZeYnx71aETpgDHHBl6odG
 cLXBkNu7TUD8wQoDniBWpJRmECFD8e5tWXTy3oMOViN882y+OWjgAFTlah0H1YpgCTOIM+
 B4xy5bsTYVZ6pBxmXmnG8rtosZboZ5mWpP9K9A2/HCzrRw4BOHn10k918kZtYXAez3M0KW
 ZJzEdEuX/BnjXS8yRU+RCN9eaeYPrVhMfZnSkY+ISAvqfHVkTQCJLQ8r1dxzNyoy9c7kMn
 ++2+Mr6rlPmsQNn8LKPt1Q+v5qzffSOvOt4K78+wfjQprDKKrisxvmkoiFMcOA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Mkv2YFlp
Subject: Re: [Buildroot] [PATCH] package/dillo: move to github
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

On Wed,  5 Feb 2025 11:41:03 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes http://autobuild.buildroot.net/results/9c33099772398ab592bf38c2f4c56c2594594695/
> 
> The tarball is no longer available on dillo.org, but has been uploaded to
> github so use that instead:
> 
> https://github.com/dillo-browser/dillo/releases/tag/v3.0.5
> 
> Also adjust the URL in the help text to the new location, which states:
> 
> "The domain dillo.org is no longer under control of Dillo developers."
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  package/dillo/Config.in | 2 +-
>  package/dillo/dillo.mk  | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

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
