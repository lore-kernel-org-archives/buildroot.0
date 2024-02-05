Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575ACC4829A
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 22:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE61400F8;
	Mon,  5 Feb 2024 22:24:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE61400F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z69TQ0qXDUas; Mon,  5 Feb 2024 22:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C5A8400FB;
	Mon,  5 Feb 2024 22:24:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C5A8400FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4407A1BF319
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:24:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 29212400FB
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 22:24:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 29212400FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0dlbHAfeB9c for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 22:24:01 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 422AE400F8
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 22:24:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 422AE400F8
Received: from ymorin.is-a-geek.org (unknown [194.78.211.220])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 275C519F593;
 Mon,  5 Feb 2024 23:23:57 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 05 Feb 2024 23:23:55 +0100
Date: Mon, 5 Feb 2024 23:23:55 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Joachim Wiberg <troglobit@gmail.com>
Message-ID: <ZcFf-_BOD2MA1nsk@landeda>
References: <20240130215628.884512-1-troglobit@gmail.com>
 <20240130215628.884512-3-troglobit@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240130215628.884512-3-troglobit@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707171839;
 bh=P29IoOs9yyLp0ktzyPc1MU/X4k9SUz5We6PJfbEMs5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FuGvZesPM7E8RWcmdFwX30WlevNjARN27KLfjZEXplPD2/bnz/ODqbGtz0aGadFIF
 YwhRS5EEPV6KuD6nBGXBWTYTFELxjVLjpyakhtirI9xOzRcAv3InZ7LxT8QEDGkBzK
 /Jw276lTlzHVRxbAgvOq0RXPUleKDc/T4R3n7HpZRfAYF6I6YNzRaraZt4/c//4uG6
 nZv6ah0UM/HplCuCQian7jvbp/Lsa9QQdKzPTvDDzQQwt4CvumQvQrKnr5izn27ejK
 osrBuejroYOmRVXplEBoXCsbdJLHGVaz1kpAOWeauKStDTCXUojgcp5kpteqfm6s2t
 DgZrC1U2WZvLA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=FuGvZesP
Subject: Re: [Buildroot] [PATCH v2 2/2] package/watchdogd: add menuconfig
 support for new system monitors
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

Joachim, All,

On 2024-01-30 22:56 +0100, Joachim Wiberg spake thusly:
> Signed-off-by: Joachim Wiberg <troglobit@gmail.com>

Applied to master after dropping the explicit --without-XX I introduced
in the previous patch, thanks. (please check I did not bork anything!)

Regards,
Yann E. MORIN.

> ---
>  package/watchdogd/Config.in    | 10 ++++++++++
>  package/watchdogd/watchdogd.mk | 11 +++++++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/package/watchdogd/Config.in b/package/watchdogd/Config.in
> index 0b0480ea27..0aeaad165f 100644
> --- a/package/watchdogd/Config.in
> +++ b/package/watchdogd/Config.in
> @@ -51,4 +51,14 @@ config BR2_PACKAGE_WATCHDOGD_MEMINFO
>  	help
>  	  Enable memory leak monitor.
>  
> +config BR2_PACKAGE_WATCHDOGD_FSMON
> +	bool "File system monitor"
> +	help
> +	  Enable file system monitor.
> +
> +config BR2_PACKAGE_WATCHDOGD_TEMPMON
> +	bool "Temperature monitor"
> +	help
> +	  Enable temperature monitor.
> +
>  endif
> diff --git a/package/watchdogd/watchdogd.mk b/package/watchdogd/watchdogd.mk
> index 2e67c2847e..9d06b04bd3 100644
> --- a/package/watchdogd/watchdogd.mk
> +++ b/package/watchdogd/watchdogd.mk
> @@ -43,6 +43,17 @@ WATCHDOGD_CONF_OPTS += --without-meminfo
>  else
>  WATCHDOGD_CONF_OPTS += --with-meminfo
>  endif
> +
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_FSMON),y)
> +WATCHDOGD_CONF_OPTS += --without-fsmon
> +else
> +WATCHDOGD_CONF_OPTS += --with-fsmon
> +endif
> +
> +ifneq ($(BR2_PACKAGE_WATCHDOGD_TEMPMON),y)
> +WATCHDOGD_CONF_OPTS += --without-tempmon
> +else
> +WATCHDOGD_CONF_OPTS += --with-tempmon
>  endif
>  
>  define WATCHDOGD_INSTALL_INIT_SYSV
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
