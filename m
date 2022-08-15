Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FD4C00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 10:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F2669408D0;
	Mon, 15 Aug 2022 10:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F2669408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pZWefiirIZYx; Mon, 15 Aug 2022 10:03:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B7D14010D;
	Mon, 15 Aug 2022 10:03:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B7D14010D
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 235E31BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0B6E18183D
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 10:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0B6E18183D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xmppe4WwfwA5 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 10:03:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF9EC817EB
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EF9EC817EB
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 10:03:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C1241240005;
 Mon, 15 Aug 2022 10:03:12 +0000 (UTC)
Date: Mon, 15 Aug 2022 12:03:11 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220815120311.1a02524e@windsurf>
In-Reply-To: <20220805232404.3586797-1-giulio.benetti@benettiengineering.com>
References: <20220805232404.3586797-1-giulio.benetti@benettiengineering.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1660557793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pi0Yay7cTzaK6DnytII5O7oDxFOKTwVOvdM41wwv3xc=;
 b=JKjP/1CWX+7GfuPd6vsiRGbqjbp7elAGtpFSrBq+HZktzYGaU2qetgSqrgN+fk2zyjEj+s
 KL6KR9spDxkqgcbHFBqX1wS30Nrfw6EpGpm4BlZHJxie+ZYQ8XrC/PfXgacFz0ADxNEcdx
 g0Q0aDK/pE1Xz6/TfGzUxQKIJ8rh3IOeiVkFXIEt/9ZtNeRKo5fBKAv4MfqbjTnhORTfsu
 mDqCeyOHtmVr14Y6AHaC/XNzLTasxLGMpH0dP+3tWMNQ/67H76hL4htkjX/GHG0OSI3NL3
 SkJcSiUCPcri7dZL5oIV76i9b6fM17UxgOrB8G4TizdCTEta44XPnSizdJJMag==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=JKjP/1CW
Subject: Re: [Buildroot] [PATCH] package/sunxi-mali-utgard-driver: move
 package SITE to Github giuliobenetti/sunxi-mali
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

On Sat,  6 Aug 2022 01:24:04 +0200
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> Github repository mripard/sunxi-mali states to use Lima in place of
> sunxi-mali because it's deprecated, but this package is still useful in
> Buildroot so I want to move the SITE to my Github fork of the original
> repository that already contains a patch to fix a build failure showing
> up with Linux version >= 5.15.
> 
> The upstream patch fixes missing DMA_BUF module inclusion that leads to
> build failure. The patch includes DMA_BUF by using:
> MODULE_IMPORT_NS(DMA_BUF);
> 
> My idea is to continue to maintain this package in parallel to Lima since
> it seems to be still useful.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8f25c26de737c358b3b43a10737609465b4e1398/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  .../sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.hash    | 2 +-
>  package/sunxi-mali-utgard-driver/sunxi-mali-utgard-driver.mk  | 4 ++--
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
