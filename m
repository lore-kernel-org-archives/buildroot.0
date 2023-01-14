Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D12C3DA78
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D3C460F74;
	Sat, 14 Jan 2023 20:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D3C460F74
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMgmEexBRjWC; Sat, 14 Jan 2023 20:17:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0BAA60F6F;
	Sat, 14 Jan 2023 20:17:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0BAA60F6F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A456E1BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:17:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7EF2481E89
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:17:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7EF2481E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JYFYKGGomOnC for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:17:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F08A81E76
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F08A81E76
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:17:22 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1D3A45FF67;
 Sat, 14 Jan 2023 21:17:17 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 14 Jan 2023 21:17:16 +0100
Date: Sat, 14 Jan 2023 21:17:16 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20230114201716.GB199036@scaer>
References: <20230113075348.847446-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230113075348.847446-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673727440;
 bh=gAHja0bAdx5sUPLm1VvBifDKomo4Uv6YdtoIGUIj148=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kqWCRm6hNDdC2oftHuUO4KcEnyH3+/0nX3TKRuW9bMwxYsVD89rWhF8OxDcKNH9We
 /2GnYXhOclhAyTSx5bLOoKwDvj1LSeQ0o3Y1KylMA2Rwth9auwc7L2/kQCinIy2+Ya
 FP5+2YhGrsD9efJRU0JSZPc5aXCzHga7USbPEJKBjkSUC3gkrJWu81tqLwgoB0RhP5
 o+zfR170Ugy71H/vEy3yEu62hrBilCLOWmLSG9Fgr+fO3+Y64/8U/GIFxPrW9AF+MA
 i8LurNWrNyHmA4SI7Es3j7Kg2IfjUYG1fwbGuvLkgF6vBRjFHdqEOUUq59B7V+nDTP
 +7cm79AoYsddA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kqWCRm6h
Subject: Re: [Buildroot] [PATCH] Cleanup/simplify copyright info
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,0

On 2023-01-13 08:53 +0100, Peter Korsgaard spake thusly:
> Historically we have been (more-or-less consistently, sometimes forgetting
> some files) updating the end year of the copyright statements at the
> beginning of a new year.
> 
> We're naturally not alone in that.  Recently this was discussed in curl, and
> it turns out that copyright years are not really required:

It's not the years that are not required; it's the mere mention of
copyright that is superfluous, because copyright is automatic under
Berne:

    https://en.wikipedia.org/wiki/Copyright_symbol#Berne_Convention

    In countries party to the Berne Convention for the Protection of
    Literary and Artistic Works, including the United States, a
    copyright notice is not required to be displayed in order for
    copyright to be established; rather, the creation of the work
    automatically establishes copyright.[...]

    The majority of nations now belong to Berne, and thus do not require
    copyright notices to obtain copyright.

Yet, that same paragraph also states:

    the copyright notice remains material in one instance: a copyright
    infringer cannot claim innocent infringement as a partial defense
    to mitigate its damages where the infringer had access to a copy of
    the work that bore a copyright notice.

For us, notice or not, there is no practical difference. And since they
are already present, let's keep them 

> https://daniel.haxx.se/blog/2023/01/08/copyright-without-years/
> 
> So drop the years and simplify the copyright statements.  While we're at it,
> also ensure the same syntax (capital C, email address) is used everywhere.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile                   | 4 +---
>  docs/manual/manual.txt     | 2 +-
>  docs/website/copyright.txt | 4 ++--
>  3 files changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index efa0b2a7a0..8517d563d5 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1,8 +1,6 @@
>  # Makefile for buildroot
>  #
> -# Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
> -# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
> -# Copyright (C) 2014-2020 by the Buildroot developers <buildroot@buildroot.org>
> +# Copyright (C) the Buildroot developers <buildroot@buildroot.org>
>  #
>  # This program is free software; you can redistribute it and/or modify
>  # it under the terms of the GNU General Public License as published by
> diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
> index fab66dbda5..d6534ca295 100644
> --- a/docs/manual/manual.txt
> +++ b/docs/manual/manual.txt
> @@ -12,7 +12,7 @@ It is licensed under the GNU General Public License, version 2. Refer to the
>  http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
>  file in the Buildroot sources for the full text of this license.
>  
> -Copyright (C) 2004-2020 The Buildroot developers
> +Copyright (C) The Buildroot developers <buildroot@buildroot.org>
>  
>  image::logo.png[]
>  
> diff --git a/docs/website/copyright.txt b/docs/website/copyright.txt
> index b15ac5f919..3fe19bab8b 100644
> --- a/docs/website/copyright.txt
> +++ b/docs/website/copyright.txt
> @@ -1,7 +1,7 @@
>  
>  The code and graphics on this website (and it's mirror sites, if any) are
> -Copyright (c) 1999-2005 by Erik Andersen, 2006-2020 The Buildroot
> -developers. All rights reserved.
> +Copyright (C) The Buildroot developers <buildroot@buildroot.org>.  All
> +rights reserved.
>  
>  Documents on this Web site including their graphical elements, design, and
>  layout are protected by trade dress and other laws and MAY BE COPIED OR
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
