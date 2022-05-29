Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC93EC433EF
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 08:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99A1B849ED;
	Sun, 29 May 2022 08:30:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JLLmdouZaMRc; Sun, 29 May 2022 08:30:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6290584518;
	Sun, 29 May 2022 08:30:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1126E1BF404
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F37D184518
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 08:30:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P86ntSrJ2I-g for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 08:30:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AF5B484514
 for <buildroot@buildroot.org>; Sun, 29 May 2022 08:30:11 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6CAF219F58A;
 Sun, 29 May 2022 10:30:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653813008;
 bh=jOlB1LmlPWItCKqb5tG5kWZ+Q3p7YxSL7xVdBQ98IjM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g5nSjkkafamhHQNByF85Dw9W722hPtBSlgdpnPlJmfehDCYRawbCKAsnisPj0nD2x
 Ugn5KVESOz13swfb8IMJr3AbzsVFZSP6cZJZpeE4ny2Tw3QyQBU92iD0jBUODdvwnR
 GE2m6erXQ5IMR4CyfxDXobbb8hhhDkUvLYAlC82Y6qibBEuqI4vy+MOx633Otc/nBd
 w59Qgr5ESZ+vyIuwkJb5wyPs/AYD55SjhW7Rbz3eCqE0TQJ4VUoELMvIpJtn1bkLpN
 g8EHD7pgFzYZAHsCi/mfT22hGp6UcfYk7+Nt8jPqgFgKtz1dpHbEXYSVtNV19vMAmf
 CQ/6ejvT4DusQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 10:30:05 +0200
Date: Sun, 29 May 2022 10:30:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220529083005.GR301044@scaer>
References: <20220528234125.31331-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220528234125.31331-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/rockchip-mali: fix type on
 Config.in help section
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
Cc: =?utf-8?Q?Miqu=C3=A8l?= Raynal <miquel.raynal@bootlin.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

In the title:  s/type/typo/

On 2022-05-29 01:41 +0200, Giulio Benetti spake thusly:
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rockchip-mali/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
> index 2a8cd786be..d616284911 100644
> --- a/package/rockchip-mali/Config.in
> +++ b/package/rockchip-mali/Config.in
> @@ -14,7 +14,7 @@ config BR2_PACKAGE_ROCKCHIP_MALI
>  	select BR2_PACKAGE_MALI_DRIVER if BR2_LINUX_KERNEL
>  	help
>  	  Install the binary user-space libraries for the ARM Mali GPU
> -	  suitable for Rockchip platforrms. This package requires a
> +	  suitable for Rockchip platforms. This package requires a
>  	  kernel with the ARM Mali GPU kernel driver enabled, as found
>  	  in the 'mali-driver' package.
>  
> -- 
> 2.34.1
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
