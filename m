Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33815C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 21:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9C18827C6;
	Mon,  8 Jan 2024 21:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9C18827C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3txfn2hdx8GZ; Mon,  8 Jan 2024 21:06:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E04F828B3;
	Mon,  8 Jan 2024 21:06:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E04F828B3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DCBA01BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B328C418E2
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:06:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B328C418E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZSmQIXCf4Nh for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 21:05:59 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6062141860
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 21:05:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6062141860
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5B2C560135;
 Mon,  8 Jan 2024 22:05:54 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 22:05:54 +0100
Date: Mon, 8 Jan 2024 22:05:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZxjsqX7RoYImDyL@landeda>
References: <20240108173249.12872-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108173249.12872-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704747957;
 bh=vD5wRng3QBeJuUeUlpK1nFuZJJQ5oTrEeVW5aPMwCFs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UnEuhSlJTcl4Pqx5pQNtFhQ52EfZQAtSJIg4N9zfWLkMn93ajdLp3H+m+CstmRumF
 jJ9w3D0hriugBlgZmqcdra2lP0rRO8WLE2mQ5NslH1kj8iVc/Ife4ms2McLRPGkNM5
 wQ/1KTA/0zy2cKNWsQLIl9M5ZKILjH5OmP2eZdpS0Y7OdqYs2mPtR40ooVMxfZZqb8
 WE5FHwhkRfyd/EUbRCGvtwTKv7F0VMN3kUlI93PVs80IhlWpAbYMw3zAEbfZAYqoIz
 d8PTqmQ3u+1J2BvokEJxdM9nKnPWfyqQerA9CQut4kmz7CIhHCiWgxB4nIjAVrckMr
 pDUfDPVODHXkw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UnEuhSlJ
Subject: Re: [Buildroot] [PATCH 1/1] package/liquid-dsp: fix x86 builds
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

On 2024-01-08 18:32 +0100, Fabrice Fontaine spake thusly:
> HAVE_{MMX,SSE2,...} are not defined if ax_cv_have_{i}_cpu_ext is not set
> resulting in the following build failure raised since bump to version
> 1.5.0 in commit c2aaa0fbe2fdf6e599c68169aa7b2e55237190c7 and
> https://github.com/jgaeddert/liquid-dsp/commit/02c4e8b99b11d9f1615b8840f243b08a85b86563:
> 
> src/dotprod/src/dotprod_cccf.sse.c: In function 'dotprod_cccf_execute_sse':
> src/dotprod/src/dotprod_cccf.sse.c:258:5: error: unknown type name '__m128'; did you mean '__int128'?
>   258 |     __m128 v;   // input vector
>       |     ^~~~~~
>       |     __int128
> 
> or
> 
> src/dotprod/src/dotprod_cccf.mmx.c: In function 'dotprod_cccf_execute_mmx':
> src/dotprod/src/dotprod_cccf.mmx.c:262:5: error: unknown type name '__m128'; did you mean '__int128'?
>   262 |     __m128 v;   // input vector
>       |     ^~~~~~
>       |     __int128
> 
> While at it, add AVX2 support and drop options which had no effect
> (MMX, SSE, SSE42 and SSSE3)
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
>  - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/liquid-dsp/liquid-dsp.mk | 40 ++++++++++++++++++++++++--------
>  1 file changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index eb4cda67a5..0e7653cb3f 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -11,19 +11,39 @@ LIQUID_DSP_LICENSE_FILES = LICENSE
>  LIQUID_DSP_INSTALL_STAGING = YES
>  LIQUID_DSP_AUTORECONF = YES
>  
> -LIQUID_DSP_CONF_ENV = \
> -	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
> -	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
> -	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
> -	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
> -	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
> -	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
> -	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
> -	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)

Why don't you just update this list in the same format? We do have that
kind of formatting elsewhere (eg. opencv3 and opencv4) and it is less
verbose than the alternative...

Regards,
Yann E. MORIN.

>  LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
>  LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
>  
> +ifeq ($(BR2_X86_CPU_HAS_AVX),y)
> +LIQUID_DSP_CONF_ENV += ax_cv_have_avx_ext=yes ax_cv_have_avx_cpu_ext=yes
> +else
> +LIQUID_DSP_CONF_ENV += ax_cv_have_avx_ext=no ax_cv_have_avx_cpu_ext=no
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_AVX2),y)
> +LIQUID_DSP_CONF_ENV += ax_cv_have_avx2_ext=yes ax_cv_have_avx2_cpu_ext=yes
> +else
> +LIQUID_DSP_CONF_ENV += ax_cv_have_avx2_ext=no ax_cv_have_avx2_cpu_ext=no
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE2),y)
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse2_ext=yes ax_cv_have_sse2_cpu_ext=yes
> +else
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse2_ext=no ax_cv_have_sse2_cpu_ext=no
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE3),y)
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse3_ext=yes ax_cv_have_sse3_cpu_ext=yes
> +else
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse3_ext=no ax_cv_have_sse3_cpu_ext=no
> +endif
> +
> +ifeq ($(BR2_X86_CPU_HAS_SSE4),y)
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=yes ax_cv_have_sse41_cpu_ext=yes
> +else
> +LIQUID_DSP_CONF_ENV += ax_cv_have_sse41_ext=no ax_cv_have_sse41_cpu_ext=no
> +endif
> +
>  # Speed over accuracy trade off
>  ifeq ($(BR2_PACKAGE_LIQUID_DSP_FAST),y)
>  LIQUID_DSP_CFLAGS += -ffast-math
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
