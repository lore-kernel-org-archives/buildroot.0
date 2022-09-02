Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2FB4ECAAD5
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 11:30:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 821A182BE5;
	Fri,  2 Sep 2022 11:30:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 821A182BE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id haZSoeq-tAt4; Fri,  2 Sep 2022 11:30:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 986A082AC8;
	Fri,  2 Sep 2022 11:30:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 986A082AC8
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F0471BF82D
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 11:30:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A58340A5D
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 11:30:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A58340A5D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k3LC-d3Pc9fp for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 11:30:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A6940A42
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1A6940A42
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 11:30:40 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e679:ffcd:1bfc:6eba])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 7C3B313F8AE;
 Fri,  2 Sep 2022 13:30:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 02 Sep 2022 13:30:34 +0200
Date: Fri, 2 Sep 2022 13:30:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Guillaume Smaha <guillaume.smaha@gmail.com>
Message-ID: <20220902113034.GD59502@scaer>
References: <20220902103434.3768420-1-guillaume.smaha@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220902103434.3768420-1-guillaume.smaha@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662118237;
 bh=uXJxfVUKYQEh17S/Nz9Q5cCW+7vnbUKwtE4+ihf13BU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vkbti351yiN+OUpBGMkG5XoRe6MT+ASmMYZTIAAgRir7YAE7Q6FmfZNj4QqbFzQUU
 5xxGpr2hVbnCJPGP0ZWsGJeTyd6R/lLhsGGz6zD6Zui9fRre82jFH/alk6B1IJKiFq
 560cvqDf5Va0m2POniOI2bTdflboB6wDXKSkmHeViuYM576T3qW/Hu7H0GUWM7t/Mf
 Fut+uh7bWY+4vSXIiRumLUInVIQ/lqOPXOqWNQCqYfNUbjD/BryiwfrXHads19xG0X
 Xi/w5Skia4xf/tcByi8XikS9GLH6PHXSDgcEvz+NwWOwpliJhLBwSIGKD7H5666CKc
 3ogM2ZzSAZuMQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vkbti351
Subject: Re: [Buildroot] [PATCH] package/glibc: fix usage of
 BR2_PACKAGE_GLIBC_KERNEL_COMPAT
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

Guillaume, All,

On 2022-09-02 12:34 +0200, Guillaume Smaha spake thusly:
> As explain in the commit 525ffc2bb17fa11fc128124d2d3a92d8698eaab8:
> "Say 'y' here if you plan on running your system on a kernel older than
> the version used for the toolchain headers."
> 
> Signed-off-by: Guillaume Smaha <guillaume.smaha@gmail.com>
> ---
>  package/glibc/glibc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 5af539ca62..4e4417b45a 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -98,7 +98,7 @@ endif
>  GLIBC_MAKE = $(BR2_MAKE)
>  GLIBC_CONF_ENV += ac_cv_prog_MAKE="$(BR2_MAKE)"
>  
> -ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),)
> +ifeq ($(BR2_PACKAGE_GLIBC_KERNEL_COMPAT),y)

You may have gotten a bit confused, but the curent situation is exactly
correct.

Indeed, when configured _without_ passing any --enable-kernel=X.Y.Z
value, then glibc will enable *all* the backward compatibility wrappers.

However, when configured with --enable-kernel=X.Y.Z, then only those
wrappers needed for being compatible with that version of the kernel
will be used.

So, indeed, we do not want to pass --enable-kernel=X.Y.Z when
BR2_PACKAGE_GLIBC_KERNEL_COMPAT is set.

For more information, see:
    https://www.gnu.org/software/libc/manual/html_mono/libc.html#Configuring-and-compiling
    https://github.com/bminor/glibc/blob/master/configure.ac#L273
    https://github.com/bminor/glibc/blob/master/sysdeps/unix/sysv/linux/configure.ac#L30

Regards,
Yann E. MORIN.

>  GLIBC_CONF_OPTS += --enable-kernel=$(call qstrip,$(BR2_TOOLCHAIN_HEADERS_AT_LEAST))
>  endif
>  
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
