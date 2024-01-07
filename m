Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907CCC47074
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 17:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A7C7414C6;
	Sun,  7 Jan 2024 17:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A7C7414C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ggI_wfoMEpC4; Sun,  7 Jan 2024 17:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99880413D3;
	Sun,  7 Jan 2024 17:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 99880413D3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ABFB71BF863
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 82EEF413D3
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 17:01:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82EEF413D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tUzjEJxARYaP for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 17:01:24 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 82308402D1
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 17:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82308402D1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7DFAEB0055E;
 Sun,  7 Jan 2024 18:01:20 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 18:01:20 +0100
Date: Sun, 7 Jan 2024 18:01:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <ZZrY4LsW6tPagJvI@landeda>
References: <20240102083643.3055484-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102083643.3055484-1-thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704646882;
 bh=2E7bBI8Z2Qiz9wEzSmtw4m5BvaoRTksiouHLmswAJ8o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qgREPBLSCaHeUVhXR61mTLINBi71aboUFhMSp19YXCJeYwxNdtgT9Pfv54uc8QfBd
 n6QYcJGesZqwS8bWH5MO8AlmJtfMgXFLGbRfuBKq2f3i3WFR5/P9Nx1Umk6lwXMTHF
 ZOx44oMa3B94a2pB1xrWgKLxRiJrHTSOGbFLzjRbiD89xjioLSHgNNnVUe0J+4v8sG
 wIcYX7PFCzONxgVAMOIgBh4sY77Sjo14OR0M3Va76/pAbzaE08JlACokmggKFeBe1m
 rmKh2AWqFTDkm+6rhBJSER6JvnNT/bekpTCPIzP9m7bLqv35JGoKFjAR2uGvpnzzdP
 eb7j37PBb2G4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qgREPBLS
Subject: Re: [Buildroot] [PATCH v3] Config.in: change default optimization
 level from -Os to -O2
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
Cc: Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2024-01-02 09:36 +0100, Thomas Petazzoni via buildroot spake thusly:
> Historically, Buildroot has defaulted to -Os as the gcc optimization
> flags. However, this default is probably not the most appropriate
> anymore, and this commit therefore changes the default to -O2.
> 
> Here are some arguments in favor of this change:
> 
> - Most Buildroot users use Buildroot for platforms that have a
>   reasonable amount of storage, and the difference between -Os and -O2
>   in terms of code size is no longer as significant compared to the
>   size of storage available on average embedded Linux devices
>   typically found these days.
> 
> - -Os can have a pretty bad performance impact, compared to -O2.
> 
> - -Os is much less widely tested than -O2. For example, with recent
>    versions of gcc, there are parts of Qt5 that segfault when compiled
>    with -Os and work perfectly fine with -O2. Yes, it's a compiler bug
>    that should be fixed, but in the mean time, having a default that's
>    more widely used/tested makes sense.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in b/Config.in
> index 554b4062eb..bd4bf872aa 100644
> --- a/Config.in
> +++ b/Config.in
> @@ -474,7 +474,7 @@ config BR2_STRIP_EXCLUDE_DIRS
>  
>  choice
>  	prompt "gcc optimization level"
> -	default BR2_OPTIMIZE_S
> +	default BR2_OPTIMIZE_2
>  	help
>  	  Set the optimization level for gcc
>  
> @@ -520,6 +520,7 @@ config BR2_OPTIMIZE_2
>  	  -falign-loops -falign-labels -ftree-vrp -ftree-pre. Please
>  	  note the warning under -fgcse about invoking -O2 on programs
>  	  that use computed gotos.
> +	  This is the default.
>  
>  config BR2_OPTIMIZE_3
>  	bool "optimization level 3"
> @@ -548,7 +549,6 @@ config BR2_OPTIMIZE_S
>  	  -falign-loops -falign-labels -freorder-blocks
>  	  -freorder-blocks-and-partition -fprefetch-loop-arrays
>  	  -ftree-vect-loop-version
> -	  This is the default.
>  
>  config BR2_OPTIMIZE_FAST
>  	bool "optimize for fast (may break packages!)"
> -- 
> 2.43.0
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
