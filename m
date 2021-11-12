Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD25DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:37:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B7B860F36
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B7B860F36
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 361E94052C;
	Fri, 12 Nov 2021 13:37:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bm3HrA0G7q7H; Fri, 12 Nov 2021 13:37:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E2834052D;
	Fri, 12 Nov 2021 13:37:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF9081BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:37:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC6CF4052D
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:37:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hhAWxRewXVVO for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:37:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ED7154052C
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:37:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [90.1.143.61])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5AAAA19F553;
 Fri, 12 Nov 2021 14:37:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636724247;
 bh=8dHkpQdxKa+Yng+nGWfd46iUU6/yLJjqUypHkBWHEeQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UF3S+aSYArURgbvqObopHTj79pIUcQ4DEXf7Y/LtSykQHyKZJiy7Td7f7vCHGSJsL
 lgL9O/nCJbxG+laK2C3fOVwhAJ+faS2av9o/DnjEvnsIuhYfIHyzBrtVqJKFz5nt/t
 ImIDPL9KYEHmw3lqFWquQGFBqTtavgsj+EPgiXPJuDy/pNasj3ZvWZJ3HD2C4ZIzxz
 vWQSXtmCbKpwwigvA0vJiUWSwnJqjz4m+fkvmIUK0MAD97xYBAo84eNo+/ykQGWGkq
 r9b02NnM4GNrAOPSZSfdjBNtVO97sfDTq/jO7kEDsqyi324PUsKZjWqpcWDD9Re26J
 /TgnA38G2n8+Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 12 Nov 2021 14:37:21 +0100
Date: Fri, 12 Nov 2021 14:37:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211112133721.GO2609@scaer>
References: <20211106134108.3015865-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211106134108.3015865-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/pipewire: fix build on
 arm926ej-s
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-06 14:41 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since bump to version 0.3.39 in
> commit d9796f2db9866060b916487784b046bb6b76f9b6:
> 
> /tmp/ccsZ6haQ.s:467: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
> /tmp/ccsZ6haQ.s:469: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode
> /tmp/ccsZ6haQ.s:490: Error: selected processor does not support `vmrs r3,fpscr' in ARM mode
> /tmp/ccsZ6haQ.s:492: Error: selected processor does not support `vmsr fpscr,r3' in ARM mode
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/d449095c67b9477fc95ebbab5eb628e5eb4ea5c6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...u-disable-VFP-asm-when-not-available.patch | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> 
> diff --git a/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> new file mode 100644
> index 0000000000..297016edc2
> --- /dev/null
> +++ b/package/pipewire/0002-cpu-disable-VFP-asm-when-not-available.patch
> @@ -0,0 +1,30 @@
> +From 2cddd4a775c145570f4a8a30d28b57f551d43206 Mon Sep 17 00:00:00 2001
> +From: Wim Taymans <wtaymans@redhat.com>
> +Date: Mon, 25 Oct 2021 16:32:16 +0200
> +Subject: [PATCH] cpu: disable VFP asm when not available
> +
> +Fixes #1746
> +
> +[Retrieved from:
> +https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/2cddd4a775c145570f4a8a30d28b57f551d43206]
> +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> +---
> + spa/plugins/support/cpu-arm.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/spa/plugins/support/cpu-arm.c b/spa/plugins/support/cpu-arm.c
> +index c07711f70..fe6222f7c 100644
> +--- a/spa/plugins/support/cpu-arm.c
> ++++ b/spa/plugins/support/cpu-arm.c
> +@@ -143,7 +143,7 @@ static int arm_zero_denormals(void *object, bool enable)
> + 			"msr	fpcr, %0		\n"
> + 			"isb				\n"
> + 			: "=r"(cw)::"memory");
> +-#else
> ++#elif (defined(__VFP_FP__) && !defined(__SOFTFP__))
> + 	uint32_t cw;
> + 	if (enable)
> + 		__asm__ __volatile__(
> +-- 
> +GitLab
> +
> -- 
> 2.33.0
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
