Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7D1C47073
	for <buildroot@archiver.kernel.org>; Sun,  7 Jan 2024 15:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7DA60760;
	Sun,  7 Jan 2024 15:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B7DA60760
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ryfmk6QFOTBV; Sun,  7 Jan 2024 15:48:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67424606CB;
	Sun,  7 Jan 2024 15:48:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67424606CB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BAD161BF3BF
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8F1A540169
 for <buildroot@lists.busybox.net>; Sun,  7 Jan 2024 15:48:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F1A540169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZKOoMND9d4HX for <buildroot@lists.busybox.net>;
 Sun,  7 Jan 2024 15:48:12 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3E918400CF
 for <buildroot@buildroot.org>; Sun,  7 Jan 2024 15:48:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E918400CF
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id DAEC8B00535;
 Sun,  7 Jan 2024 16:48:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 Jan 2024 16:48:06 +0100
Date: Sun, 7 Jan 2024 16:48:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZrHtio9hrWSwB16@landeda>
References: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240107132346.3161192-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704642490;
 bh=zbHllNbO2sLGSnxM8jVA8z3ov6HSgeU+tcXHGG86nS0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BmStFpkMhEfqRMtEYj26AZbbBQFScfpwbim2GpN9kRok4owIKg7uD7w1NEo2ApjsO
 Sr5Bzi21sFliXtjY+c6AHsJmID2MhKLebRDzZje9FZYnstO2bpVdx8Rv6i3A22IySR
 EU66LPKq5S90hBk9sNo/oHZi99e8aylzY0RC62SaybSV/ZCi9ePRbcBlJ6UXgXFOxu
 qjdX7Mg4Yf/Ip9v1t7yEXHm6FVsH1rDalDXa/svFYiAzjlpneP8njWrGSBgp9Fv81v
 IP94pFdvtCXYQ//SghNBUEFXHtZYRyQZh8p1C99e7L4jRsGZnpqIIsxAO60AXYVfem
 axxhJ2X5IwWBw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BmStFpkM
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix build without
 neon
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
Cc: Guillaume William Brs <guillaume.bressaix@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-07 14:23 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure without neon raised since bump to
> version 1.4.0 in commit 2f7f8f381394207bfb029ec395f5ced5695a0a2e and
> https://github.com/jgaeddert/liquid-dsp/commit/c821187dd9af2758c8e3c82e95eaf041b8ac81a0:
> 
> /home/peko/autobuild/instance-0/output-1/host/bin/arm-none-linux-gnueabi-gcc -std=gnu11 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O2 -g0 -D_FORTIFY_SOURCE=2  -ffast-math -mcpu=cortex-a7 -mfloat-abi=hard -mfpu=neon-vfpv4  -Wall -fPIC -Wno-deprecated -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -I. -Iinclude  -c -o src/audio/src/cvsd.o src/audio/src/cvsd.c
> In file included from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/features.h:388:0,
>                  from /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/stdlib.h:24,
>                  from src/libliquid.c:25:
> /home/peko/autobuild/instance-0/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/gnu/stubs.h:10:29: fatal error: gnu/stubs-hard.h: No such file or directory
>  # include <gnu/stubs-hard.h>
>                              ^
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/36b3c2220c462e7a20262fd1b9064d9aeb6c9ec4
>  - http://autobuild.buildroot.org/results/881826b4b6c141e59a0da2d7d1ad55d3709fdb95
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index e9788eb144..a96d4cab79 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -40,6 +40,10 @@ ifeq ($(BR2_powerpc)$(BR2_powerpc64)$(BR2_powerpc64le),y)
>  LIQUID_DSP_CONF_OPTS += --enable-simdoverride
>  endif
>  
> +ifeq ($(BR2_arm):$(BR2_ARM_FPU_NEON),y:)
> +LIQUID_DSP_CONF_OPTS += --enable-simdoverride

Usually, we add an explicit --disable. Any reason why it was not added
here?

Regards,
Yann E. MORIN.

> +endif
> +
>  LIQUID_DSP_CONF_OPTS += \
>  	CFLAGS="$(LIQUID_DSP_CFLAGS)" \
>  	LDFLAGS="$(LIQUID_DSP_LDFLAGS)"
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
