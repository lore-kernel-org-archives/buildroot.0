Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E015C4332F
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 19:31:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2D8B42073;
	Sat, 28 Oct 2023 19:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2D8B42073
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IOMfoTAgmPu5; Sat, 28 Oct 2023 19:31:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34EB742064;
	Sat, 28 Oct 2023 19:31:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 34EB742064
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6ED591BF3C6
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:31:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E3F56120F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 19:31:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E3F56120F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VQC9_Le5vhrJ for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 19:30:58 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 79512611D5
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 19:30:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 79512611D5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6144B200586;
 Sat, 28 Oct 2023 21:30:52 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 Oct 2023 21:30:52 +0200
Date: Sat, 28 Oct 2023 21:30:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20231028193052.GD2582@scaer>
References: <20231027121252.1855024-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231027121252.1855024-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698521455;
 bh=pYqs4BYAbZWjAYPdqYtL41ZYqtfUAQKJRT/ipxa6kME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DYBk89H9XRGMDEy7wc69TxKYlLKi7YVAIPaoI7t1x6QhgyqTOcke//2AyKKiN4qN8
 x0uvuRLtmUuXn5DE/+YqLuY1yJQPpaW4FcwAnuaOXy8mMyYtcQJBes1Zyo+GFi0mo0
 X4NqXfbeEzuOoWx/0XmAmTs/iDOL1SFj8bB9V2d8C3/W7ZSVN6ZcQBIeYux2aT+GUC
 oER6GL4gPXepRqtrONVkCI732WaduZN8Vc9d5IIQ+zCUcRvNPfR2oFdjfi55Qpz+w7
 nQO8EI27vav8KWgYnJzLR/pwcFEVZPoqGEp0fA7som8TnurK/utYxz9WsSdWsDz18s
 A2NkM5c00+wdg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DYBk89H9
Subject: Re: [Buildroot] [PATCH] Config.in: default to HTTPS for s.b.n
 backup site
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-10-27 14:12 +0200, Peter Korsgaard spake thusly:
> Now that we have HTTPS support for sources.buildroot.net (through Lets
> encrypt / Cloudflare), it makes sense to default to it for our backup site.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Config.in b/Config.in
> index dbcca4c55a..556b6c2575 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -241,7 +241,7 @@ if !BR2_PRIMARY_SITE_ONLY
>  
>  config BR2_BACKUP_SITE
>  	string "Backup download site"
> -	default "http://sources.buildroot.net"
> +	default "https://sources.buildroot.net"
>  	help
>  	  Backup site to download from. If this option is set then
>  	  buildroot will fall back to download package sources from here
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
