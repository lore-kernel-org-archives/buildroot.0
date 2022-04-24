Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81197C433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 08:56:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4166481DBF;
	Sun, 24 Apr 2022 08:56:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jgUZ7_WUwOYV; Sun, 24 Apr 2022 08:56:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BBE281D70;
	Sun, 24 Apr 2022 08:56:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45CC61BF3C1
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3391D60B94
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 08:56:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id baREPFuE3EFj for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 08:56:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 318D160706
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 08:56:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:657d:21bd:cb37:8719])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 9328978035E;
 Sun, 24 Apr 2022 10:56:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1650790577;
 bh=zemUc8z3vaPsmQ0zcdRn4FSnDE0kMmF6Vu+uK4kwDBk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X6Tfl7iYxCdM7NrnAdd1BgI990HAzcqCphILyiufrOrpn3Fnt5EksTMHFEWM1BH8G
 PJl7+En103HFw5edUfSIjYc/q5ijxVX9Y3JZTupANw7YVxQljaWYLr8JC71RQAn6/e
 2KFiEsjHnsPkJr4gA7KotU3oafK0Wz65EjyFsGRlAwGXnGI0QDaVNkqNFL5bVA+qPY
 scAcajCwatY3MjWNEBU59QWTmknWuhIvkiW7R4GD6SvHQoHWzKqigGFWHiZ5Aijeeb
 t3XWCfPhoVebysKt684iDmukHG4CuXFyom3XNYoT0ldaYGHMEh5P+1BAjBWsZXaVRM
 rYINg9W7ja4WA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Apr 2022 10:56:14 +0200
Date: Sun, 24 Apr 2022 10:56:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220424085614.GT2730@scaer>
References: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220419213450.887728-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/5] arch/Config.in.sh: fixup MMU selection
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-04-19 23:34 +0200, Thomas Petazzoni via buildroot spake thusly:
> BR2_sh selects BR2_ARCH_HAS_MMU_OPTIONAL, which means that it's up to
> the user to decide whether he wants to use MMU or not on SuperH
> platforms.
> 
> However:
> 
>  - On SH2A, there is no MMU at all, so being to select "Use MMU"
>    doesn't make any sense.
> 
>  - On SH4, there is no support for *not* using the MMU, so disabling
>    "Use MMU" will cause the build to fail.
> 
> In order to fix this, we move the MMU selection to arch/Config.in.sh:
> 
>  - BR2_sh2a selects nothing, so that it's always noMMU
> 
>  - BR2_sh4* select BR2_ARCH_HAS_MMU_MANDATORY so that the MMU is
>    always used.
> 
> Fixes:
> 
>  http://autobuild.buildroot.net/results/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20/ (FLAT
>  selected with sh4aeb)
> 
>  http://autobuild.buildroot.net/results/d1b1dfe449f82944bd48215da3cdffd05797e2e9/ (FLAT
>  selected with sh4a)
> 
>  http://autobuild.buildroot.net/results/45bc90fd2dde7bb201d7f999db1a8024cf889a06/ (FLAT
>  selected with sh4)
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Whole series of 5 patches applied to master.

I reorganised them to apply all the Super-H patches together, then the
ARM patches, as I thought it made more sense to group by architecture
than by "MMU fixup".

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in    | 1 -
>  arch/Config.in.sh | 4 ++++
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 98b0e40d51..e51ef60f40 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -228,7 +228,6 @@ config BR2_s390x
>  
>  config BR2_sh
>  	bool "SuperH"
> -	select BR2_ARCH_HAS_MMU_OPTIONAL
>  	help
>  	  SuperH (or SH) is a 32-bit reduced instruction set computer
>  	  (RISC) instruction set architecture (ISA) developed by
> diff --git a/arch/Config.in.sh b/arch/Config.in.sh
> index c1ba449dd5..a012cbf491 100644
> --- a/arch/Config.in.sh
> +++ b/arch/Config.in.sh
> @@ -9,12 +9,16 @@ config BR2_sh2a
>  	bool "sh2a (SH2A big endian)"
>  config BR2_sh4
>  	bool "sh4 (SH4 little endian)"
> +	select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4eb
>  	bool "sh4eb (SH4 big endian)"
> +	select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4a
>  	bool "sh4a (SH4A little endian)"
> +	select BR2_ARCH_HAS_MMU_MANDATORY
>  config BR2_sh4aeb
>  	bool "sh4aeb (SH4A big endian)"
> +	select BR2_ARCH_HAS_MMU_MANDATORY
>  endchoice
>  
>  config BR2_ARCH
> -- 
> 2.35.1
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
