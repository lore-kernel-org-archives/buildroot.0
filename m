Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEA9DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A14D812FD;
	Thu, 17 Feb 2022 21:43:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NgOsYeSwVvBG; Thu, 17 Feb 2022 21:43:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94FC5812E5;
	Thu, 17 Feb 2022 21:43:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 71A101BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D68D812A5
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id og9VSda2r6EP for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:43:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5DBAE81248
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:43:36 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d44f:202d:8a3e:695f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C8C8913F880;
 Thu, 17 Feb 2022 22:43:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645134214;
 bh=QF3sa9vsRorr5x7eNqsozMw1AcbYR/uSUg8fev6eU4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=unYL51PRE+eFmpce0HT90RIWsBhu677P1aEC9+CBGz1BcYpYEY5MIlnUAf6dDT2aO
 32DeUwyoI/dv3RiqJlBWaEGdRB2B+wysnSYrdJbGmGILG2LZCAyiWfS0+Ln/qLeAp9
 uaSG1r3+RkVWEIuCmb629VKPUje7lwvfULT5TUqUsvG5GmH2bCOqXU5o3k137I6Ihj
 VfAHq9G3SIYslnXjJM5Vusj8ObZ07ltna7ICtKbc1HxOUPnLvyXDQqRkWbgrDzfxbr
 zUNzVOu5ot+2lEnNAofgR3/6ZXmoWMok9lsIyfZrIVE/RdG78ZzBwx5jXjlwiR6Oyd
 glx8XKRQKJdow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 17 Feb 2022 22:43:31 +0100
Date: Thu, 17 Feb 2022 22:43:31 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220217214331.GM522310@scaer>
References: <20220217201001.1859113-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220217201001.1859113-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] configs/kontron_bl_imx8mm_defconfig: U-Boot
 requires OpenSSL
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-02-17 21:10 +0100, Giulio Benetti spake thusly:
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784267
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  configs/kontron_bl_imx8mm_defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/configs/kontron_bl_imx8mm_defconfig b/configs/kontron_bl_imx8mm_defconfig
> index 57e7e9683d..2b7e121e25 100644
> --- a/configs/kontron_bl_imx8mm_defconfig
> +++ b/configs/kontron_bl_imx8mm_defconfig
> @@ -45,6 +45,7 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron-sl-mx8mm"
>  BR2_TARGET_UBOOT_NEEDS_DTC=y
>  BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
>  BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
> +BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
>  BR2_TARGET_UBOOT_NEEDS_ATF_BL31_BIN=y
>  BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
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
