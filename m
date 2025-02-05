Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E90DC02192
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBCB60830;
	Wed,  5 Feb 2025 15:21:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Hwvy5J4_QvT; Wed,  5 Feb 2025 15:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 675E160B0C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 675E160B0C;
	Wed,  5 Feb 2025 15:21:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A1E28CD
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DBE883F4C
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BLhwwenhInwf for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:21:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 300B283EE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 300B283EE7
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 300B283EE7
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:21:35 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2598E443ED;
 Wed,  5 Feb 2025 15:21:33 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:21:33 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, Steve Kenton <skenton@ou.edu>
Message-ID: <20250205162133.04e70761@windsurf>
In-Reply-To: <20241112210531.14735-1-ju.o@free.fr>
References: <20241112210531.14735-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeektdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejvdejvdfgffevteeiffdugeeiveeliefgffetfeehhfethfeuleefkeejgfefvdenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohepshhkvghnthhonhesohhurdgvughu
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738768894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Nx6242OUXrdArlzgWp8smgnlQwGn0QExI+tvoseLu6E=;
 b=GI0emVpkF7uD3bN2L9LsFHxxUNyioYaN2LUkj0Rxf+E7UefC/7e81YWQBbGHvtfrnylkGK
 agG5gJRmB2Aib34MPI5lsQGmzgY7uxuicTI/J8JqPGZWD26A/KH61E8lb0g+jpjeQ11AW5
 keR4Yf57vf5kiL7bfaXNImpoKniPSjI7RheSHibQhetOy+Fodl+F6ZTpwezRRokGtgE3sw
 Rw5BEMuxw4i1lUFpgAbTixPDEIu6HGOM0MY5PmaBcufkWhzVqslyv7gAP2L8FZttspbw5b
 DW1yf+5iPqBjdDGJPqUpN0nhygxsOxr+z3QiAupoQpHQs/A/eSN/QNRss5VgwA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=GI0emVpk
Subject: Re: [Buildroot] [PATCH 1/1] package/memtest86: bump version to 7.20
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, 12 Nov 2024 22:05:31 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 6.20, see:
> https://github.com/memtest86plus/memtest86plus/releases/tag/v7.20
> https://github.com/memtest86plus/memtest86plus/releases/tag/v7.00
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested by running the built memtest.efi on a real x86_64 pc.
> ---
>  package/memtest86/memtest86.hash | 2 +-
>  package/memtest86/memtest86.mk   | 2 +-
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
