Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44CCC4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D026810D7;
	Wed,  1 Nov 2023 17:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D026810D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0IJ13_EN7Usq; Wed,  1 Nov 2023 17:30:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD5E80E9C;
	Wed,  1 Nov 2023 17:30:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FD5E80E9C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 795E11BF2F1
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:30:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F64780E76
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:30:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F64780E76
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dwL2GKnLkJno for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:29:59 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 80D0D80E67
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:29:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80D0D80E67
Received: by mail.gandi.net (Postfix) with ESMTPSA id A8DF6E0005;
 Wed,  1 Nov 2023 17:29:56 +0000 (UTC)
Date: Wed, 1 Nov 2023 18:29:55 +0100
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20231101182955.23131725@windsurf>
In-Reply-To: <20231019065715.1892348-1-br015@umbiko.net>
References: <20231019065715.1892348-1-br015@umbiko.net>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1698859796;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iU2SqWVahUsTuiwsKMvhJiGM6LNqJO3/TvuAKdleiVI=;
 b=cCIuIdxFR2GQG15ZTLfSqdCvrFYKwk3HfLzOe7F487oGZBJXttlTeGYU6yXs98brqJ5Lmq
 mdfeVsu4vajn7W8NV9fm0RQV4jJfpwbP+I9NIyKmK2C+C95+a9PghdO3Y+t5NPZpJOd7Pt
 bsyXbA+voH8jpfGOtNXzLGXWjcqUd77nsecqIrtbRIj5WROeZrAuoUPcWXPue2uCvoZ0/4
 xUzUFI3l1QDiC4akHsKT8gd4T3vdrcFYgBEfhhqkRoM9PBQSuAOY/NB4wMWTawRGHW05eq
 AEd8XKZIIV+BRm8AfK6Q2QzCTQx2owhXWiOUiZf8iK7Gao61YpcJVDS8cDCksg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=cCIuIdxF
Subject: Re: [Buildroot] [PATCH] package/mpd: update to version 0.23.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, 19 Oct 2023 08:57:15 +0200
Andreas Ziegler <br015@umbiko.net> wrote:

> Bug fixes in decoder (flac, mad), mixer (wasapi),
> libfmt, systemd detection
> 
> Change log:
> 	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.14/NEWS
> 
> Tested on:
> 	i386 (build, run)
> 	x86_64 (build)
> 	Aarch64 (build, run)
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>
> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
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
