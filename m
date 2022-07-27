Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42CBC04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 15:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3D00F40355;
	Wed, 27 Jul 2022 15:30:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3D00F40355
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bM9xCY2rBA7M; Wed, 27 Jul 2022 15:30:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1224340263;
	Wed, 27 Jul 2022 15:30:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1224340263
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 558BA1BF9D1
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3911540263
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 15:30:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3911540263
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BOFSWadxagq6 for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 15:30:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8133740213
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8133740213
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 15:30:30 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2464:a3b6:9580:87a1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 8EB7AB00727;
 Wed, 27 Jul 2022 17:30:25 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 17:30:25 +0200
Date: Wed, 27 Jul 2022 17:30:25 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220727153025.GB1134587@scaer>
References: <20220727140822.355859-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727140822.355859-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658935827;
 bh=kR8LwiVyw18OQXuELFQDfPcQjLe+/tT0uOu4l1dKNvo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I95fp0XtxAWAbdWB9A/QTKKyFYN0lb1tA8Diejl5bXcE1LW9VkyDjBy0ljU2QOOg0
 0mI4jS204L0LldPUJzDrtAGBRO3wA2vsdFbfLHkh8OwKzR0jWdfeHNknujv7pwbcb5
 lrEFREKzbBxVtKWhjxcofgQFjCQ/DEzOYnUsc2yHBxm2yGN4I+cL+9ej4M7YYaLyji
 yGAhhoOpVxOJ4R8AYypojXxEw4gYgrkLEEzpUmt5jZRQ4iFO+QozuBxHwSiWOtayEL
 uMXYiCrZuRIZbPKakGsGSCfiZaKaYYpyzq47Fjmyd7jqVRK0bCeeAgBQV1FK7yuqoy
 tj/8q1vPQExLQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I95fp0Xt
Subject: Re: [Buildroot] [PATCH] package/pkg-utils: refine
 KCONFIG_MUNGE_DOT_CONFIG
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

Yuanhao, All,

On 2022-07-27 07:08 -0700, TIAN Yuanhao spake thusly:
> Given a .config with:
> 
>     FOO="1234"
>     BAR="$(FOO)"
> 
> and then:
> 
>     $(call KCONFIG_SET_OPT,FOO,azerty)
> 
> would yield a .config with just:
> 
>     FOO="azerty"
> 
> because \<FOO\> would match the assignment to BAR.
> 
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> 
> I found something similar in uClibc-ng:
> 
>     TARGET_ARCH="x86_64"
>     RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
> ---
>  package/pkg-utils.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
> index e5dba2add0..6ece27baa2 100644
> --- a/package/pkg-utils.mk
> +++ b/package/pkg-utils.mk
> @@ -22,7 +22,7 @@ KCONFIG_DOT_CONFIG = $(strip \
>  
>  # KCONFIG_MUNGE_DOT_CONFIG (option, newline [, file])
>  define KCONFIG_MUNGE_DOT_CONFIG
> -	$(SED) "/\\<$(strip $(1))\\>/d" $(call KCONFIG_DOT_CONFIG,$(3)) && \
> +	$(SED) '/^\(# \)\?$(strip $(1))\>/d' $(call KCONFIG_DOT_CONFIG,$(3)) && \
>  	echo '$(strip $(2))' >> $(call KCONFIG_DOT_CONFIG,$(3))
>  endef
>  
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
