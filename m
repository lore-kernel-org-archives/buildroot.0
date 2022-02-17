Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2074C433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5651981858;
	Thu, 17 Feb 2022 21:44:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ySmljnjF8YlZ; Thu, 17 Feb 2022 21:44:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D9A581470;
	Thu, 17 Feb 2022 21:44:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 164D41BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12F1D81470
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:44:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sg8PXHBpHCgn for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:44:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42B4381426
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:44:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7793D13F86E;
 Thu, 17 Feb 2022 22:44:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645134286;
 bh=kSph8m0Owhz2KCH7LmqS/Kk9g6viVd+cw3rsIS6P9Is=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kJMgua1O85V+TdaGCZrfEX1bbcsuZd+SIsPd4arWsgpVj3tHXlk0pvZ3KgMBWcS2h
 wkFjNLjUWXiQoy9ZSpQSAMtBUm0G0hwlnd7+KJOOHVp95p4J30VK8FQ8scUoSHc+jm
 sp0Ixbyu/rHYY3WDZ7NogNF17IYEMdkBTPMDUDr9H+lUhTPNEDwWCNpQgiNvpZXrVB
 rgApE6ZJIg85qAXrAvmbiFt55t7N/BJMyX1oRQ0U3Y9JnFvNgg+Oe5MplNUNkh56lm
 zZzo4kFqsUcnolIindslvYAV8kYdMrUOayTXCHuSq2z/c8doMUdG03ecv/bZ8KLQsP
 5vZG8u5naKAJA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 22:44:43 +0100
Date: Thu, 17 Feb 2022 22:44:43 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Message-ID: <20220217214443.GN522310@scaer>
References: <20220217155549.1084829-1-marcus.hoffmann@othermo.de>
 <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217155549.1084829-3-marcus.hoffmann@othermo.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 2/2]
 board/orangepi/orangepi-rk3399/genimage: fix partition types for gpt
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
Cc: Suniel Mahesh <sunil@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcus, All,

On 2022-02-17 16:55 +0100, Marcus Hoffmann spake thusly:
> Fixes the following error during image generation:
>   ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
>   for mbr and hybrid partition-table-type
> 
> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375
> 
> Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
> ---
>  board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
> index c94e0bc7cc..a02166172f 100644
> --- a/board/orangepi/orangepi-rk3399/genimage.cfg
> +++ b/board/orangepi/orangepi-rk3399/genimage.cfg
> @@ -26,14 +26,13 @@ image sdcard.img {
>  	}
>  
>  	partition boot {
> -		partition-type = 0xC
> +		partition-type-uuid = F
>  		bootable = "true"
>  		image = "boot.vfat"
>  		offset = 16M
>  	}
>  
>  	partition rootfs {
> -		partition-type = 0x83

Why don't you also switch this one to partition-type-uuid?

Regards,
Yann E. MORIN.

>  		image = "rootfs.ext4"
>  	}
>  }
> -- 
> 2.25.1
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
