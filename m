Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77FA8C47073
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 22:10:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 310184192C;
	Mon,  8 Jan 2024 22:10:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 310184192C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GFFJqMK_NyaZ; Mon,  8 Jan 2024 22:10:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 621FA41932;
	Mon,  8 Jan 2024 22:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 621FA41932
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5B6601BF421
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:10:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AAFE8145E
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 22:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AAFE8145E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWX_l7tYQLSf for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 22:10:11 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE5FF81779
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 22:10:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE5FF81779
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 82253B00548;
 Mon,  8 Jan 2024 23:10:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 23:10:03 +0100
Date: Mon, 8 Jan 2024 23:10:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZxyux9Op5erxfKi@landeda>
References: <20240108211420.360412-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108211420.360412-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704751807;
 bh=huRGTuePIvvNAi5AkA8N5BFo+LdZYSuYSSlT+Ri0wSc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PI1zFgVJLf1TCqlzKIsExULH+rv/0m1DshOMYWHxyfeauUEFNkxjhqTfmU27V3Yxc
 H/oEr6TNQr3JUuuI9gC8TREaey7VR4Qs7qmnm7VwHz8qx76b5pqNENh9/SmNMgo2eR
 WEPOV/L4B9+s7sJIU415goZo1mwo9fuQER7DsbMCeUELwo5F5M203Rse6ncl4mBMHp
 I0JOg3b/nifS1Te8B6DkIw4VW0UmT/dAwcAz2XnR/uOWNJwgYfPQFtG2ICb2AYnS1D
 CjYHhj+aKuj1ApLmEfVqxepl0vwXS6jUNamV/uLNtUK90oDGJCBIQbL5RWusMA/Sya
 QC0Vme4CWbJig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PI1zFgVJ
Subject: Re: [Buildroot] [PATCH v3,1/1] package/liquid-dsp: fix x86 builds
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

On 2024-01-08 22:14 +0100, Fabrice Fontaine spake thusly:
> HAVE_{MMX,SSE2,...} are not defined if ax_cv_have_{i}_cpu_ext is not set

From a quick glance at upstream, it seems that there are two set of
variables:
  - ax_cv_have_{i}_ext
  - ax_cv_have_{i}_cpu_ext

The first is about whether said extension is available in the OS
(whatever that means), while the second is about whether the CPU
actually support that externsion.

As I understand it, we should only be concerned with the latter, but the
liquid-dsp configure.ac confuses the two and still checks the former.

So we still need to set both.

Applied to master, thanks.

Regards,
Yann E. MORIN.

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
> While at it, add AVX2 support
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/738ce9d3dc74ec165391f21256c955e5524f1632
>  - http://autobuild.buildroot.org/results/a2d150c724ab6787aeabaf31f65116f802e8584e
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3 (after review of Yann E. Morin):
>  - Keep current list format
> 
> Changes v1 -> v2:
>  - Keep old options (mmx, etc.) as they seem to be still used somewhere
>    in the code
> 
>  package/liquid-dsp/liquid-dsp.mk | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/liquid-dsp/liquid-dsp.mk b/package/liquid-dsp/liquid-dsp.mk
> index eb4cda67a5..ce4cd5a7a7 100644
> --- a/package/liquid-dsp/liquid-dsp.mk
> +++ b/package/liquid-dsp/liquid-dsp.mk
> @@ -13,13 +13,23 @@ LIQUID_DSP_AUTORECONF = YES
>  
>  LIQUID_DSP_CONF_ENV = \
>  	ax_cv_have_mmx_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
> +	ax_cv_have_mmx_cpu_ext=$(if $(BR2_X86_CPU_HAS_MMX),yes,no) \
>  	ax_cv_have_sse_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
> +	ax_cv_have_sse_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE),yes,no) \
>  	ax_cv_have_sse2_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
> +	ax_cv_have_sse2_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE2),yes,no) \
>  	ax_cv_have_sse3_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
> +	ax_cv_have_sse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE3),yes,no) \
>  	ax_cv_have_ssse3_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
> +	ax_cv_have_ssse3_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSSE3),yes,no) \
>  	ax_cv_have_sse41_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
> +	ax_cv_have_sse41_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE4),yes,no) \
>  	ax_cv_have_sse42_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
> -	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no)
> +	ax_cv_have_sse42_cpu_ext=$(if $(BR2_X86_CPU_HAS_SSE42),yes,no) \
> +	ax_cv_have_avx_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
> +	ax_cv_have_avx_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX),yes,no) \
> +	ax_cv_have_avx2_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no) \
> +	ax_cv_have_avx2_cpu_ext=$(if $(BR2_X86_CPU_HAS_AVX2),yes,no)
>  
>  LIQUID_DSP_CFLAGS = $(TARGET_CFLAGS)
>  LIQUID_DSP_LDFLAGS = $(TARGET_LDFLAGS)
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
