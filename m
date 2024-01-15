Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D75C3DA79
	for <buildroot@archiver.kernel.org>; Mon, 15 Jan 2024 21:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25C368402B;
	Mon, 15 Jan 2024 21:33:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 25C368402B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pNVvdF5-zYd0; Mon, 15 Jan 2024 21:33:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A6584020;
	Mon, 15 Jan 2024 21:33:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45A6584020
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDB691BF383
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B664C6158E
 for <buildroot@lists.busybox.net>; Mon, 15 Jan 2024 21:33:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B664C6158E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFFiuAspqyUG for <buildroot@lists.busybox.net>;
 Mon, 15 Jan 2024 21:33:07 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 88FE7615A1
 for <buildroot@buildroot.org>; Mon, 15 Jan 2024 21:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88FE7615A1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id C63B313F88F;
 Mon, 15 Jan 2024 22:33:00 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Jan 2024 22:33:00 +0100
Date: Mon, 15 Jan 2024 22:33:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <ZaWkjCjeSos7nHkf@landeda>
References: <20240114191759.3236753-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240114191759.3236753-1-bernd@kuhls.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705354384;
 bh=be5/2C2b3qEe9OLOCb+8/7FTIqmROGN98Io8OmgiLdg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ey7zuUo5ZTdUuL8l280/XbqFB6YakdkhpOM8YzmssKYlDaQqmYMgPQjFXSMOm4dd3
 kfw2qhFmZUPP5U3O0Y2veabgaFRvmLhfwzt4Uu80u/+bocrzyzx72JoMrx4W9UDz/1
 wY+RqM6XAkw6bB4bNCQk/UnyIU7tYLgXKxwHkRrXfRgmYl2K2yK3XsXCW8lSUecPEv
 EUb2ojGEgz+R3B2iQEWJ3E0CtN1vc88wgWhGt53Nk+o9fyoZrGpnhfjc/ajLc41lOr
 yASLs6GkGPdTX6f2g+kBMY7XFUGzCW6paBS68x/5Z+BroQ8hGpG6gUxZMJhVOA/GIa
 7PUbyiHFDph+g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ey7zuUo5
Subject: Re: [Buildroot] [PATCH 1/1] package/libvpl: fix libdrm dependency
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

Bernd, All,

On 2024-01-14 20:17 +0100, Bernd Kuhls spake thusly:
> Buildroot commit c50e9c21f0444b064bc257fcc0d3073fee945623 initially
> added the package onevpl (meanwhile renamed to libvpl) and forgot to
> add all dependencies of BR2_PACKAGE_LIBDRM_INTEL.
> 
> Fixes:
> http://autobuild.buildroot.org/results/8fa/8fa0f2cd7a027d3d8fae56125621b0b814e132da/
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> ---
>  package/libvpl/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libvpl/Config.in b/package/libvpl/Config.in
> index 012f31b3be..b9e9a20fd7 100644
> --- a/package/libvpl/Config.in
> +++ b/package/libvpl/Config.in
> @@ -12,7 +12,9 @@ config BR2_PACKAGE_LIBVPL
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	select BR2_PACKAGE_WAYLAND_PROTOCOLS if BR2_PACKAGE_WAYLAND
>  	# libva support needs a libdrm with intel driver
> -	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA
> +	select BR2_PACKAGE_LIBDRM_INTEL if BR2_PACKAGE_LIBVA && \
> +		(BR2_i386 || BR2_x86_64) && \
> +		BR2_PACKAGE_LIBDRM_HAS_ATOMIC

Err, I may have missed something, but how do you ensure that
BR2_PACKAGE_LIBDRM itself is enabled?

Ah, that's because libva does select libdrm. Hmm... A bit fragile, but
OK.

Still, there is a potential issue in the the .mk, even with your change.
Indeed, the condition is:

    package/libvpl/libvpl.mk
    23 ifeq ($(BR2_PACKAGE_LIBVA),y)
    24 LIBVPL_CONF_OPTS += -DENABLE_VA=ON
    25 LIBVPL_DEPENDENCIES += libva
    26 else

So, if one would interpret the conditions in the Config.in to the
letter, one would conclude that the .mk file is incorrect: indeed, on
i386 or x86_64, -DENABLE_VA=ON is always used, but there is one part of
the dependencies that is not accounted for: BR2_PACKAGE_LIBDRM_HAS_ATOMIC.

So, one could could conclude that the .mk is wrong on x86, and that the
condition should also include the atomic part in that case.

However, on x86, be it i386 or x86_64, sync-4 is always available, which
in turn means that BR2_PACKAGE_LIBDRM_HAS_ATOMIC is always true [0].

So the .mk is technically correct in practice, but a bit confusing...

Now I wonder: why is the dependency handled this way, partially in the
config.in, and partially in the .mk? Why can't we handle it all in the
.mk and drop the select from the Config.in:

    # Invert the logic and test for disabled options, so it is easier to write:
    ifeq ($(BR2_PACKAGE_LIBVA),)
    LIBVPL_CONF_OPTS += -DENABLE_VA=OFF
    else ifeq ($(BR2_i386)$(BR2_x86_64),y)
    # libva support on x86 needs libdrm-intel
    ifeq ($(BR2_PACKAGE_LIBDRM_INTEL),)
    LIBVPL_CONF_OPTS += -DENABLE_VA=OFF
    else
    LIBVPL_CONF_OPTS += -DENABLE_VA=ON
    LIBVPL_DEPENDENCIES += libva
    endif # x86
    else
    # libva support on !x86
    LIBVPL_CONF_OPTS += -DENABLE_VA=ON
    LIBVPL_DEPENDENCIES += libva
    endif

And of course, now that I wrote that, I am not too sure which way is
better or worse...

OK, so the condition in the Config.in is not too onerous, so: applied to
master, thanks.

[0] Commit e4d55d337374 (libdrm: improve atomic handling, fix SPARCv8
build) noted that the atomics were always available in that case, but
still added an explici dependency; even though this is not noted in the
commit log, I suspect that's for consistency with the rest of the code.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LIBXCB if BR2_PACKAGE_XORG7
>  	select BR2_PACKAGE_XLIB_LIBX11 if BR2_PACKAGE_XORG7
>  	help
> -- 
> 2.39.2
> 

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
