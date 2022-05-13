Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFCDEC433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:36:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9CFC540ABD;
	Fri, 13 May 2022 16:36:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 38TZlkFrxNLt; Fri, 13 May 2022 16:36:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AAF7A40AAB;
	Fri, 13 May 2022 16:36:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E2BB31BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D1779813DB
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iR4_EZzEQ57b for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:36:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EFFB0813CA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:36:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6049413F899;
 Fri, 13 May 2022 18:36:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652459801;
 bh=jwhebvRPyadoEat2N3XtNBYsJtO+Nd+KQUfl16UDq3k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=m2w0IU+UKi1C8cdjrhvTbjsCvyIlqFgqddMoKbzm2Ti2pOJB9j+xIBhKvjbF9pk/9
 Gfc9M3Wm9m5FFA8Y06ofPf/7YEI+xTrOJkUvKGvxr8GqNrvff71qg4havWJml1cC6G
 pvmb4osiNBXDWN0Ojp3nqaHjFPRXSFvcK6nTj1/u5E+Q8cJnkWvQF5K7ZTQE0QLVet
 dFIvwwxEJONEAsd+McbTI4dcOFROL+mMUHXjjARir7BITYrWIN7u/JfRR3y869qd5R
 4yGngXTuw6u6DAHDBcgzr3dD25weQB1hcv6vn0gQzbvojjxIRKLkYoW4eShL3sg79a
 0gKORbAb9gcBw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 18:36:39 +0200
Date: Fri, 13 May 2022 18:36:39 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220513163639.GR1597494@scaer>
References: <20220513144215.2598981-1-peter@korsgaard.com>
 <20220513144215.2598981-3-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513144215.2598981-3-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/4] package/linux-headers: drop 5.16.x
 option
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

On 2022-05-13 16:42 +0200, Peter Korsgaard spake thusly:
> The 5.16.x series is now EOL upstream, so drop the linux-headers option and
> add legacy handling for it.

See my review of the next patch.

Both this one and the next I marked as changes-requested in patchwork.

Regards,
Yann E. MORIN.

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  Config.in.legacy | 7 +++++++
>  linux/linux.hash | 1 -
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 806e995bd1..95b9d784d3 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,13 @@ endif
>  
>  comment "Legacy options removed in 2022.05"
>  
> +config BR2_KERNEL_HEADERS_5_16
> +	bool "kernel headers version 5.16.x are no longer supported"
> +	select BR2_LEGACY
> +	help
> +	  Version 5.16.x of the Linux kernel headers are no longer
> +	  maintained upstream and are now removed.
> +
>  config BR2_KERNEL_HEADERS_4_4
>  	bool "kernel headers version 4.4.x are no longer supported"
>  	select BR2_LEGACY
> diff --git a/linux/linux.hash b/linux/linux.hash
> index 2a96eef8d3..3190813a0c 100644
> --- a/linux/linux.hash
> +++ b/linux/linux.hash
> @@ -1,6 +1,5 @@
>  # From https://www.kernel.org/pub/linux/kernel/v5.x/sha256sums.asc
>  sha256  22f67ef6b12ef6c0c0353be4b90b4bf4b9b18b858c16c346fa495b67ec718c99  linux-5.17.7.tar.xz
> -sha256  d8060dc88f862baaae66b42a2dbc12298ed667c698eb5c55617a7786ee47bf25  linux-5.16.20.tar.xz
>  sha256  888641634f9e0e38cd0efcfec92ea3c126d381b24a514740d3fe3dc9988fd7ad  linux-5.15.39.tar.xz
>  sha256  f5e417b32f89318b6d0a230109a592ffd68997817463dc4692fa49ec7fe42f71  linux-5.10.115.tar.xz
>  sha256  0d16d343956d311e3f4ab3f032fd626d8e6b67c0db94edd32f561407d374f2a0  linux-5.4.193.tar.xz
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
