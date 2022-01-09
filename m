Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F07FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 15:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0AD5760B73;
	Sun,  9 Jan 2022 15:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ch01uBpFfaZ9; Sun,  9 Jan 2022 15:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 363B860B69;
	Sun,  9 Jan 2022 15:09:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9C41BF4D5
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E53580C40
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 15:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qH38seNAQSCc for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 15:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E8D1680BF7
 for <buildroot@busybox.net>; Sun,  9 Jan 2022 15:08:45 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A6EEB5FFA1;
 Sun,  9 Jan 2022 16:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641740923;
 bh=tabTEBG8XIv5Uotvbvn08Snyj5YiWgl3Nts8qF1OQ8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DVWiUvHCuqaJ4tRanAqXczxkk5HtZ35ji0F7BEula2MTALXFcmAhq+4Ap9IRxGoEl
 rhdH2nhldeUsaKW0OI4RigNvaVxKuAOId1dZ5Xk32hxfahuSuyfsIOQU4+m07weHG4
 Bp28xX9bfmpng4emHJ/2rUlDIFF8odS4aTTUxEJMHOWDH/2SI74ByNrenvldj8mAii
 YOMjwunhqjJQ2shNPC32wd3DZs6z3ccuH8RLfFPko/N4MK3pl+rUZgjYAz5IrvoxZd
 OmpWn0Is4G/oNQhAeUYEUtzbQezX+Shw4a4qKCSNl/J29k3dxnB5unI2Lms0+5FNMP
 ujnoMZdzYWmvA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 16:08:40 +0100
Date: Sun, 9 Jan 2022 16:08:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Norbert Lange <nolange79@gmail.com>
Message-ID: <20220109150840.GA1477939@scaer>
References: <20201017221743.160029-1-nolange79@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201017221743.160029-1-nolange79@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2 1/4] package/Makefile.in: use gcc
 wrappers for binutils tools
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Norbert, All,

On 2020-10-18 00:17 +0200, Norbert Lange spake thusly:
> This will use gcc-ar, gcc-nm and gcc-ranlib instead of the
> normal binutils tools. The difference is that with the
> wrappers, gcc plugins will be automatically picked up.
> 
> gcc 4.7 introduced these wrappers, to detect the prefix and
> keep gcc specifics out of Makefile.in, a new variable
> BR2_TOOLCHAIN_BUTILS_PREFIX will be used to carry the
> prefix on supported versions.
> 
> Note that binutils added some automatic loading with the
> 'bfd-plugins' directory (somewhere around 2.28), but
> the first implementation had issues, and generally depends on
> correctly setup symlinks (often broken, may point to some
> other gcc's library). The wrappers always work painless.
> 
> The original motivation (now ~2 years in use) was to add
> "-flto -ffat-lto-objects" to both BR2_TARGET_OPTIMIZATION and
> BR2_TARGET_LDFLAGS, and have target binaries lto optimized.
> 
> Not all packages will compile with this option, further work
> could white/blacklist packages (adding -fno-lto to the
> options).
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v1->v2:
> *   support older gcc versions missing those wrappers
> ---
>  package/Makefile.in | 6 +++---
>  toolchain/Config.in | 7 +++++++
>  2 files changed, 10 insertions(+), 3 deletions(-)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 51f5cbce4f..665edec539 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -198,15 +198,15 @@ TARGET_CROSS = $(HOST_DIR)/bin/$(TOOLCHAIN_EXTERNAL_PREFIX)-
>  endif
>  
>  # Define TARGET_xx variables for all common binutils/gcc
> -TARGET_AR       = $(TARGET_CROSS)ar
> +TARGET_AR       = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))ar
>  TARGET_AS       = $(TARGET_CROSS)as
>  TARGET_CC       = $(TARGET_CROSS)gcc
>  TARGET_CPP      = $(TARGET_CROSS)cpp
>  TARGET_CXX      = $(TARGET_CROSS)g++
>  TARGET_FC       = $(TARGET_CROSS)gfortran
>  TARGET_LD       = $(TARGET_CROSS)ld
> -TARGET_NM       = $(TARGET_CROSS)nm
> -TARGET_RANLIB   = $(TARGET_CROSS)ranlib
> +TARGET_NM       = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))nm
> +TARGET_RANLIB   = $(TARGET_CROSS)$(call qstrip,$(BR2_TOOLCHAIN_BUTILS_PREFIX))ranlib
>  TARGET_READELF  = $(TARGET_CROSS)readelf
>  TARGET_OBJCOPY  = $(TARGET_CROSS)objcopy
>  TARGET_OBJDUMP  = $(TARGET_CROSS)objdump
> diff --git a/toolchain/Config.in b/toolchain/Config.in
> index db2ab0f059..7a2becc09a 100644
> --- a/toolchain/Config.in
> +++ b/toolchain/Config.in
> @@ -732,4 +732,11 @@ config BR2_TOOLCHAIN_HAS_LIBQUADMATH
>  	bool
>  	default y if BR2_i386 || BR2_x86_64
>  
> +# gcc ships with wrappers that will automatically pass arguments
> +# to the binutils tools.
> +# So far, those are paths to necessary linker plugins
> +config BR2_TOOLCHAIN_BUTILS_PREFIX
> +	string
> +	default "gcc-" if BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

There was no need for a Kconfig option, so I moved that to the Makefile
side.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  endmenu
> -- 
> 2.28.0

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
