Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C30EC61DA4
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 10:02:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9518C607F0;
	Mon,  6 Feb 2023 10:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9518C607F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4LOJucbUmfYI; Mon,  6 Feb 2023 10:02:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D765D605AF;
	Mon,  6 Feb 2023 10:02:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D765D605AF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F053A1BF4E3
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CACC940328
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 10:02:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CACC940328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UMoVX87a_fsM for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 10:02:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C6550402E4
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C6550402E4
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 10:02:14 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4D9782000E;
 Mon,  6 Feb 2023 10:02:12 +0000 (UTC)
Date: Mon, 6 Feb 2023 11:02:10 +0100
To: Angelo Compagnucci <angelo@amarulasolutions.com>
Message-ID: <20230206110210.235520f6@windsurf>
In-Reply-To: <20220925160320.80027-1-angelo@amarulasolutions.com>
References: <20220925160320.80027-1-angelo@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675677733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Wu2dfVUFBL5+aQ1gl1vLGSZNVctiBTqJHxl6X070RM=;
 b=iW9C09Uad+5gqoWLn0XSr/cZBU3IFqsg8W1uZ6I60UCydmaSoAjSsCSjFUrGfBZ276wRSe
 gUMsZ0bPI9xgM6QKPSLW9VxHhghAHDXSv/5eJL3TTR4qjSLfrUKWv05ium0rhcG6RSaFLA
 fjX837zOoUmWW2uQv21sbuHkMQGVKycLKV/K5M97RNpV8VQNAeLJi7Df/4t3Mb7o1bXA53
 5HznTQogmxZkfoI9fvj1PtaNdXnL7Q4p3S95EGgjQ75NkubBDbqRqAuhnhrww5fqCA7CB1
 9rklJ3EkW+sP1ykegMKR4mQpYLRVzfGQ9dwKYrBSr5kEuRNf6dufvuK+O6ZPeQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=iW9C09Ua
Subject: Re: [Buildroot] [PATCH] docs/website: fixing js for the new feed
 source
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

On Sun, 25 Sep 2022 18:03:20 +0200
Angelo Compagnucci <angelo@amarulasolutions.com> wrote:

> Feed source is moved to a local atom file available on the web server to
> remove further problems with unreliable feed sources.
> Moving the feed required a bit of refactor of the load_activity function
> so it won't download two times te same url.
> 
> This change requires a cron job like this enabled on the website:
> * * * * * wget -O new.atom https://lore.kernel.org/buildroot/new.atom
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
>  docs/website/js/buildroot.js | 70 ++++++++++++++++++++----------------
>  1 file changed, 40 insertions(+), 30 deletions(-)

Finally applied, now that the cronjob is in place on the server! Thanks
a lot for your contribution and patience!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
