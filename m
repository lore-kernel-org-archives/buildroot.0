Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101E5C433F5
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 10:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F79B40872;
	Sun,  9 Jan 2022 10:34:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZYPfVf5M3cb5; Sun,  9 Jan 2022 10:34:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A2BBA40868;
	Sun,  9 Jan 2022 10:34:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 147EB1BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02A9C60B2F
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id urWcYca1UTsM for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 10:33:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 320A160B28
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 10:33:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 073E113F85A;
 Sun,  9 Jan 2022 11:33:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641724434;
 bh=MJTdWyRMUeLBNDKGXNkgzF2sH1iXArtf7nf5D8/RT/E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WMRPxiejL3GLEe9+wRfszfCy++1pwWssxUui1y5Q0U+FXjW0O2ExdNvszvSEbQxiE
 THBCnSPq52PrFi7F7YFiwEPyd+o2GlfEhKdTi82O9UQclZ9Kfmwvlfh0TfZGJvysVc
 I0+UGH14WUtgdfWZcSpdJy52Rc8kKh8C3UMj0O1yS2rNkUQ9a35CXsS7dwvwQvD7tU
 zNc4ab3e+ZdmBktcweZ4Qyz61zHw4xm0UiC4GBZLREFGuhIO/h5Vwrc+Sv5NrRYTje
 0gd5T6t9T0njZOhUJQ4yBpx6y7urcAaLEHTjocB0ozm4Ofk3XLCLBYy2yb54lNBLYK
 sZ8ui/FLV4sew==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 11:33:51 +0100
Date: Sun, 9 Jan 2022 11:33:51 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220109103351.GJ1881783@scaer>
References: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109080124.2271241-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] arch/Config.in.x86: add option for
 -march=x86-64
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

Thomas, All,

On 2022-01-09 09:01 +0100, Thomas Petazzoni spake thusly:
> We already have support for a wide range of x86-64 CPUs, but we don't
> have any option to build for the most generic possible x86-64 CPU, as
> made available by the -march=x86-64 GCC option.

As discussed, it only really makes sense to use them as a 64-bit CPU, so
I've added a dependency on BR2_x86_64.

> This commit makes this option available in Buildroot.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  arch/Config.in.x86 | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index 7aae3cafb7..794d808d96 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -81,6 +81,16 @@ config BR2_x86_prescott
>  	select BR2_X86_CPU_HAS_SSE
>  	select BR2_X86_CPU_HAS_SSE2
>  	select BR2_X86_CPU_HAS_SSE3
> +config BR2_x86_x86_64
> +	bool "x86-64"
> +	select BR2_X86_CPU_HAS_MMX
> +	select BR2_X86_CPU_HAS_SSE
> +	select BR2_X86_CPU_HAS_SSE2
> +	help
> +	  This option corresponds to -march=x86-64, documented as a
> +	  "Generic CPU with 64-bit extensions" by the GCC
> +	  documentation. It is a 64-bit CPU with MMX, SSE and SSE2
> +	  support.
>  config BR2_x86_nocona
>  	bool "nocona"
>  	select BR2_X86_CPU_HAS_MMX
> @@ -281,6 +291,7 @@ config BR2_GCC_TARGET_ARCH
>  	default "pentium3"	if BR2_x86_pentium3
>  	default "pentium4"	if BR2_x86_pentium4
>  	default "prescott"	if BR2_x86_prescott
> +	default "x86-64"	if BR2_x86_x86_64
>  	default "nocona"	if BR2_x86_nocona
>  	default "core2"		if BR2_x86_core2
>  	default "corei7"	if BR2_x86_corei7
> -- 
> 2.33.1
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
