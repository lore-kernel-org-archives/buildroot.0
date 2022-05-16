Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21F8CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB8C241932;
	Mon, 16 May 2022 21:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ixeqvFAGPiSN; Mon, 16 May 2022 21:48:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98C6041924;
	Mon, 16 May 2022 21:48:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AB7151BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9986F4048F
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id U4OaixjtTcZa for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:47:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A392F4010C
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:47:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 6AEADB00535;
 Mon, 16 May 2022 23:47:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652737675;
 bh=KkEawUFpAybFO4qsz2Zr0eD8F9y6dRCSPHd4vfYB1rw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tUAw2sKA9vwiQr+j98UNXtdowFy9AXxizBdmd4EJURVOHIi8xIeTPEUX4pnG2nJF1
 RdBGeH2II8KSxx8Z5soMcF6d9AAtgIUzkxEr4YH2d6xfqRwssjmmQ0bfR5zPPS1oFL
 /jpmQO3sBBVqoEYMzLdHWiocyB5UtaPThY1v7RSkPoJ7gFr/qaFtmEjHX2s7twrLYN
 IjOm1TgghOlQaSKdUFNyiCXMOMekQEwB0IJ3FfXymMAHN8AAFJQSyizuRa9EYnEdLa
 nnK7mXlBTo3MJ7DCsbiG3ld3TS3QGgcYtgtxUXRBFjiC6/F/Qh8rP+3dtGa7kAopEM
 Z98pnqOM5FA+g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 May 2022 23:47:52 +0200
Date: Mon, 16 May 2022 23:47:52 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220516214752.GM1597494@scaer>
References: <20220515090229.395668-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220515090229.395668-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/2] package/glibc: can't be built with Optimize for fast
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-05-15 11:02 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> In file included from <command-line>:
> ./../include/libc-symbols.h:82:3: error: #error "glibc must not be compiled with -ffast-math"
>    82 | # error "glibc must not be compiled with -ffast-math"
>       |   ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/3d91f3685ae6c3e1f765d419ea2c0da4cb0eb3be
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Force -O2 instead of disabling gcc
> 
>  package/glibc/glibc.mk | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 7b46ad42c3..45155fdc28 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -118,6 +118,11 @@ ifeq ($(BR2_nios2),y)
>  GLIBC_CFLAGS += -O2
>  endif
>  
> +# glibc can't be built with Optimize for fast
> +ifeq ($(BR2_OPTIMIZE_FAST),y)
> +GLIBC_CFLAGS += -O2
> +endif
> +
>  define GLIBC_CONFIGURE_CMDS
>  	mkdir -p $(@D)/build
>  	# Do the configuration
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
