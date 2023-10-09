Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B288CD610E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 17:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E282981F8B;
	Mon,  9 Oct 2023 17:25:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E282981F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DvYQ9RCWovZl; Mon,  9 Oct 2023 17:25:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3151481F8F;
	Mon,  9 Oct 2023 17:25:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3151481F8F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9961BF2A1
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0641781F8B
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 17:25:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0641781F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DsOgdNo62IO for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 17:25:25 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B410C81F8F
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 17:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B410C81F8F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 7A31560132;
 Mon,  9 Oct 2023 19:25:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 19:25:19 +0200
Date: Mon, 9 Oct 2023 19:25:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009172519.GF14234@scaer>
References: <20231009170428.2836853-1-adam.duskett@amarulasolutions.com>
 <20231009170428.2836853-2-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009170428.2836853-2-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696872322;
 bh=aJl9Xr1Mf5XroUPRDLXejkdhgson3hQPGtBhUsfiG/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CxGc2/zxRkW2+Gyh2JWXMs5rj6k2lgSOUKmo/fbxCHJwLvoM6ATUyRs1anYI6M3uz
 9Pbe79+L6wEZPXxpxoHJnTRJ7rz4i+Weupxar+HlFsgaj3L8GiW2Hc3k2Sy5WkNGHG
 cXlso0ccsTq3A1p1EwqQyPdGTRVisNI0OO1a3xWifJHMf7iIgMsQjNLL8V92ItATcW
 QbFtNLx5oQIztW02GjzZDQ9vzx6GSEQIULwppu9rCkFgYtz+aKzGQJ+SeQsAlo/l8c
 AgYLZKoEWMN/3PBK6SuvR2iDoRJFABAWWEEwZIYNLwucINOCr/Nxh9rJdNg4JJXw0K
 D7NpxxocSsdLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CxGc2/zx
Subject: Re: [Buildroot] [PATCH v4 2/2] package/refpolicy/Config.in: depend
 on merged usr when selecting upstream
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
Cc: Antoine Tenart <atenart@kernel.org>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-10-09 19:04 +0200, Adam Duskett spake thusly:
> Refpolicy contexts expect a merged /usr file system. In fact, there
> are no references to /bin, /sbin, /lib, or /lib64 at all.

There is a file in the refpolicy upstream tree, 


which cntains (abbreviated)

    # This file can is used to configure base path aliases as in:
    # /aliased_path /original_path_as_configured_in_file_contexts
    # where original_path_as_configured_in_file_contexts is a base
    # path being used in the main file_contexts configuration file.
    /bin /usr/bin
    /lib /usr/lib
    [...]

So, to me, it looks like it means something like:  treat paths that
starts with /lib as if they were starting with /sur/lib, and then check
the context associated with the new path.

But maybe that no longer works? Or maybe we need to take action to make
that work?

Matter for more thoughts...

> However, if a user
> wants to go through the trouble of creating a policy that works with a
> non-merged system, they should be free to do so. As such, only select
> BR2_ROOTFS_MERGED_USR if using BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION.

This last sentence is still incorrect now: not seelct, but depends on.
;-)

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
> v3 -> v4: Remove accidental removal of upstream patch in this patch.
> 
>  package/refpolicy/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
> index 0e72b895df..d2fe391d8d 100644
> --- a/package/refpolicy/Config.in
> +++ b/package/refpolicy/Config.in
> @@ -36,9 +36,13 @@ choice
>  
>  config BR2_PACKAGE_REFPOLICY_UPSTREAM_VERSION
>  	bool "Upstream version"
> +	depends on BR2_ROOTFS_MERGED_USR
>  	help
>  	  Use the refpolicy as provided by Buildroot.
>  
> +comment "Upstream refpolicy requires a merged /usr filesystem"
> +	depends on !BR2_ROOTFS_MERGED_USR
> +
>  config BR2_PACKAGE_REFPOLICY_CUSTOM_GIT
>  	bool "Custom git repository"
>  	help
> -- 
> 2.41.0
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
