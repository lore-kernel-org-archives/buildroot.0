Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 021BFC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 14:05:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ABE384159F;
	Wed, 23 Feb 2022 14:05:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lZfY-DY-bWiV; Wed, 23 Feb 2022 14:05:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D042B4157E;
	Wed, 23 Feb 2022 14:05:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF431BF3DD
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:05:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99A5B4157E
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 14:05:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AATYytMCtV0N for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 14:05:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 648644155E
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 14:05:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f0be:eb0a:9f13:7f4d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 61D3DB0053F;
 Wed, 23 Feb 2022 15:05:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1645625147;
 bh=p85ZYrFvmYCoV/b9EJ3etI5iov9dWqf313h4DMEDgtg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qZloa6bWAbemlTAJ8aysnA4lKKKm6fIK5QhtMU3ruMN9fkSrEIW/JkEgVjOCgkdAr
 dNIxhWCUJDhTizL889So9uYpn9s8AemGR3h8KIylZ5X/XF4VcXkbHDvYLq04YgIkOQ
 o4grQbYmI5FgJ03QEqO+4lvdlE/Bgou62co6tYvcmfOJ5A3Rdmq8oGvH4gaOQE4dCu
 eRjCzvbi1QTKB0fUx33FwKzga3Vi0Nb7YqXJHIbLAixtpaId65V1ejRdHZXZhLXM8D
 r+WFECve76tdu5IE3D3YtNA5LwzpNc/2VX8IN1xQyikFHbDyFdXSJ+1S5ygPc6tIxp
 3n3dVZ3OFKYww==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 23 Feb 2022 15:05:45 +0100
Date: Wed, 23 Feb 2022 15:05:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220223140545.GA179822@scaer>
References: <20220223124109.2370215-1-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220223124109.2370215-1-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] Makefile: unexport 'DEVICE_TREE'
 environment variable
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

On 2022-02-23 13:41 +0100, Peter Korsgaard spake thusly:
> U-Boot looks for the environment variable DEVICE_TREE and uses its value if
> set instead of the CONFIG_DEFAULT_DEVICE_TREE configuration option since
> v2021.01, more specifically commit c0f1ebe9c1b9745e (binman: Allow selecting
> default FIT configuration) - So unexport it like we do for other
> "troublesome" environment variables to ensure consistent behaviour.
> 
> Reported-by: Neal Frager <nealf@xilinx.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Makefile | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Makefile b/Makefile
> index d92438166f..0ed93e600d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -426,6 +426,7 @@ unexport O
>  unexport GCC_COLORS
>  unexport PLATFORM
>  unexport OS
> +unexport DEVICE_TREE
>  
>  GNU_HOST_NAME := $(shell support/gnuconfig/config.guess)
>  
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
