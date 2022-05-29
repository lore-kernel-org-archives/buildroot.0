Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB76AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 29 May 2022 20:29:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 765DA40B29;
	Sun, 29 May 2022 20:29:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b3FKy_snnk7H; Sun, 29 May 2022 20:29:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9736140B08;
	Sun, 29 May 2022 20:29:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1F4FA1BF3D7
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:29:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DC0540B08
 for <buildroot@lists.busybox.net>; Sun, 29 May 2022 20:29:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id peF9RH-DtJSy for <buildroot@lists.busybox.net>;
 Sun, 29 May 2022 20:29:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E1B7A40128
 for <buildroot@buildroot.org>; Sun, 29 May 2022 20:29:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c90:582e:b0d5:b1ff])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id C81CA7802C5;
 Sun, 29 May 2022 22:29:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653856170;
 bh=Ycj9H5kIVbKXIt6M6jE0Xzdk+JCxiTHU0cgJybkkS7E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gHbyoqCt/2gCH8xieWvybB4Rn55fDlEGaXcnJusT6Og79BQFxFC0PyD31AnSQPK4Z
 LhEDsHZ0WmNnl0QY2/FaKR2e23er5CAMmkyyrDcSt5K8gJ1s+1D1wpgdg7i8ntksng
 YF1IoxjvQX6rq/7GHKt+oitNaWozXVzv2p0qSMG2RENNBY+6pW2MTbaqj3LqcJyHZ8
 uQpvakpKEZ+/fV/eR/Enq1S9XDxy/AvoEb55BUl42N13i7ad6bQUM8zedseGMwlnjf
 92ZwvJFxra8AHZOAn0NC8UBjHGO89f3NDZ1+LMz/+AmKY00vkS8s1pvanfumh/5F9r
 AbMe+PQWli0Dg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 May 2022 22:29:28 +0200
Date: Sun, 29 May 2022 22:29:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220529202928.GC993669@scaer>
References: <20220529191922.2349752-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220529191922.2349752-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] fs/squashfs: fix
 BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
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

Fabrice, All,

On 2022-05-29 21:19 +0200, Fabrice Fontaine spake thusly:
> Fix typo BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
> -> BR2_TARGET_ROOTFS_SQUASHFS_BS_8K added by commit
> 555f8dfd6ef893463ce19d5ee242afd6b83cb450 and raising the following build
> failure:
> 
> /nvmedata/autobuild/instance-0/output-1/host/bin/mksquashfs: -b invalid block size
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/927f070dfc1a800e57ca6619f062940641837db9
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  fs/squashfs/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/fs/squashfs/Config.in b/fs/squashfs/Config.in
> index 0e8de2fd3a..21322a2246 100644
> --- a/fs/squashfs/Config.in
> +++ b/fs/squashfs/Config.in
> @@ -46,7 +46,7 @@ endchoice
>  config BR2_TARGET_ROOTFS_SQUASHFS_BS
>  	string
>  	default "4K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_4K
> -	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_84K
> +	default "8K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_8K
>  	default "16K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_16K
>  	default "32K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_32K
>  	default "64K" if BR2_TARGET_ROOTFS_SQUASHFS_BS_64K
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
