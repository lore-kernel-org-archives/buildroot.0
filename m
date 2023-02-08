Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FF7C636CC
	for <buildroot@archiver.kernel.org>; Wed,  8 Feb 2023 08:58:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4491181F4E;
	Wed,  8 Feb 2023 08:58:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4491181F4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7MkERDJcOS3j; Wed,  8 Feb 2023 08:58:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 886DE81F5B;
	Wed,  8 Feb 2023 08:58:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 886DE81F5B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D85791BF8B4
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:57:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 846B6405FA
 for <buildroot@lists.busybox.net>; Wed,  8 Feb 2023 08:57:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 846B6405FA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zSQncqattrZV for <buildroot@lists.busybox.net>;
 Wed,  8 Feb 2023 08:57:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53F6B405B8
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 53F6B405B8
 for <buildroot@buildroot.org>; Wed,  8 Feb 2023 08:57:28 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A232D20013;
 Wed,  8 Feb 2023 08:57:25 +0000 (UTC)
Date: Wed, 8 Feb 2023 09:57:24 +0100
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230208095724.437f75a8@windsurf>
In-Reply-To: <20230130174339.36794-3-bernd.kuhls@t-online.de>
References: <20230130174339.36794-1-bernd.kuhls@t-online.de>
 <20230130174339.36794-3-bernd.kuhls@t-online.de>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1675846646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DIzA7nJuFWPyTT8KKBbolXxB8LIf8s8CH+sTzU+q4gw=;
 b=KkO8kPmOvKUx/8pw8qoPsOO4Xh3ctsnXyzvPIty9dmueqVepnKObrYio4UYEoDL2PgvQRJ
 r2HFdKhh0AF0P8ZDlM0OmJXIgGQh95RUuYeM0ukEzc0r3Thz4+8Ss/pm+wbGLrLnWS9SUE
 GVw8mWbwrKsnGhkSswH7Qn4Bt6iYDunVUKTdd+9rD3gJES+HfFdioGQJzbKvlyi3x41Nq1
 g8uc3kVK7FV3p9vN8XUWEtAv9a5hTE9fpGqfOTJVVqjMMGjJKBcZOxZ0LLqJ3Fg0YzXHnO
 0D+DW9k+2WCwJcd6jC7GBSCVeNiCurSXUVZcPhHeDMaicNiJhLPXYNcrcHNorQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=KkO8kPmO
Subject: Re: [Buildroot] [PATCH 3/5] package/libva-utils: bump version to
 2.17.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Louis-Paul Cordier <lpdev@cordier.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 30 Jan 2023 18:43:37 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Release notes:
> https://github.com/intel/libva-utils/blob/v2.17-branch/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libva-utils/libva-utils.hash | 2 +-
>  package/libva-utils/libva-utils.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Github has fixed their tarball generation logic so that the hashes are
now correct again, so I've applied!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
