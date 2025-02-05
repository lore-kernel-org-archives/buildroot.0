Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C618C02198
	for <buildroot@archiver.kernel.org>; Wed,  5 Feb 2025 15:45:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4FA11425A6;
	Wed,  5 Feb 2025 15:45:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AAjnmW6rs7CK; Wed,  5 Feb 2025 15:45:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C84C42511
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C84C42511;
	Wed,  5 Feb 2025 15:45:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 62FF61A8
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8374B40BBC
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:45:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NHcSGc72GoOR for <buildroot@buildroot.org>;
 Wed,  5 Feb 2025 15:45:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2ED6C40FA1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2ED6C40FA1
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2ED6C40FA1
 for <buildroot@buildroot.org>; Wed,  5 Feb 2025 15:45:01 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E501A4429F;
 Wed,  5 Feb 2025 15:44:58 +0000 (UTC)
Date: Wed, 5 Feb 2025 16:44:58 +0100
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org, "Yann E . MORIN" <yann.morin.1998@free.fr>
Message-ID: <20250205164458.4dde2f0c@windsurf>
In-Reply-To: <20241117165641.751301-1-ju.o@free.fr>
References: <20241117165641.751301-1-ju.o@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvfeekiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkjghfohfogggtgfesthejredtredtvdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpedvieevvdffkeeigeegtddtledvjedvgeeltefgkeeutdeifefgteejtedvfefhieenucffohhmrghinhepfhhrvggvuggvshhkthhophdrohhrghdpghhithhlrggsrdgtohhmpdgsohhothhlihhnrdgtohhmnecukfhppedutdelrdekledrvdefvddrheehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepuddtledrkeelrddvfedvrdehhedphhgvlhhopeifihhnughsuhhrfhdpmhgrihhlfhhrohhmpehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedprhgtphhtthhopehjuhdrohesfhhrvggvrdhfrhdprhgtphhtthhopegsuhhilhgurhhoohhtsegsuhhilhgurhhoohhtrdhorhhgpdhrtghpthhtohephigrnhhnrdhmohhrihhnrdduleelkeesfhhrvggvrdhfrh
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1738770299;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtkEqtlG5/skxJhW6pKU1EhVc8qrd/iS4AOkvUEXLoU=;
 b=jiCHo7LSc7YbTfxmoN63o15gFx2hImUidZ06U1KLr869kXoJ485m4l5l7Y7fsS8UUYOcge
 r0jRtMZM8wVMpY6JmDRfGIeZlX/EeoGgyaqOOjj2qW5BpX5C5YoKQBGUmqAPRPDLM93ulY
 ZizLEMJf5YJMJnQNc+OvhcAbhZmzLWk2Wt8GeOzfi4qTyZko5iUmWYvOQO3I/igWldf7LR
 3z4d+5dQMe1wpAsVIRca2MH16EyOXHskJYrnPTUwfyW+wbZKARgKPGHc0YmDmpH+3ewQR1
 +hnG9BX4JlN0YgixKqfMb4/bmfPUw5SuD9MtjEMgC1TsOTvkTiTN1xvTxaBMMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=jiCHo7LS
Subject: Re: [Buildroot] [PATCH next 1/1] package/spice: bump version to
 0.15.2
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

On Sun, 17 Nov 2024 17:56:41 +0100
Julien Olivain <ju.o@free.fr> wrote:

> For change log since 0.15.0, see:
> https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.1
> https://gitlab.freedesktop.org/spice/spice/-/releases/v0.15.2
> 
> This commit also adds a comment in the hash file that the sha256 is
> taken from upstream.
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
> Patch tested in:
> https://gitlab.com/jolivain/buildroot/-/pipelines/1547982049
> ---
>  package/spice/spice.hash | 3 ++-
>  package/spice/spice.mk   | 2 +-
>  2 files changed, 3 insertions(+), 2 deletions(-)

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
