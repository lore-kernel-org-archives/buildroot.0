Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90054ECAAD1
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 20:28:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2F7D0405D2;
	Sat, 27 Aug 2022 20:28:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F7D0405D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUFYiEKhzGlf; Sat, 27 Aug 2022 20:28:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3F73A405C4;
	Sat, 27 Aug 2022 20:28:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F73A405C4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AF1321BF95D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:28:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 970658267C
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 20:28:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 970658267C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GJEDuHZxI4uv for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 20:28:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0041182612
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0041182612
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 20:28:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id DAE307804FE;
 Sat, 27 Aug 2022 22:28:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 22:28:07 +0200
Date: Sat, 27 Aug 2022 22:28:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220827202807.GB37358@scaer>
References: <20220823212219.5066-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220823212219.5066-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661632092;
 bh=c62oeh+NB2saZrDqh68fcX4tJAKQOXNXeGRfj7v4VII=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YD1Qdsrjh8oLQgRlsoFu1P5oqSiqWksZrutAlKLHJwHj8rvcFfsWXuKWrhsm2NyVG
 h/pDEkZEAhBpBaUqjIFo+rN3iceoHIDxc9kmGu3uiubdpf2XpUyQ3wT9yfLgdgJiNv
 so4vimmHq/EPxB5xviF7vxqp2pN5XUunCfjb3DxrZ2mmxc5yaxgQgiMiT+eIPvS47Q
 otc1RWb0XX7sRG62RoyXVxIPFbCpKHZpiCeiBgw5+z9xJG55U8ZKWidAKYsLO+1wD3
 PIopKG6xbHgRxE4MJ2lwSoBujNQcZYw4Lyc3DVr4XlxvjHIlKpNq2SJywNJpyJ1wla
 88rnVyyrlsheg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YD1Qdsrj
Subject: Re: [Buildroot] [PATCH 1/1] package/ffmpeg: altivec needs VSX with
 little endian
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-08-23 23:22 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure:
> 
> In file included from libavcodec/ppc/audiodsp.c:31:
> libavcodec/ppc/audiodsp.c: In function 'scalarproduct_int16_altivec':
> ./libavutil/ppc/util_altivec.h:123:5: error: implicit declaration of function 'vec_vsx_ld'; did you mean 'vec_vslh'? [-Werror=implicit-function-declaration]
>   123 |     vec_vsx_ld(offset, b)
>       |     ^~~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/b772d285f978ff9bc3b07872d009633c943f20b1
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ffmpeg/ffmpeg.mk | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index 82d229903f..7038f4f5f7 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -511,7 +511,9 @@ endif
>  FFMPEG_CONF_OPTS += --disable-asm
>  endif # MIPS
>  
> -ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
> +ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC):$(BR2_powerpc64le),y:)
> +FFMPEG_CONF_OPTS += --enable-altivec
> +else ifeq ($(BR2_POWERPC_CPU_HAS_VSX):$(BR2_powerpc64le),y:y)
>  FFMPEG_CONF_OPTS += --enable-altivec

So, this means you enable AltiVec when VSX support is available, which
is a bit confusing. VSX is indeed a further extension to AltiVec [0].

However, in ffpmpeg, VSX is driven by its own --enable-vsx flag to, so
not seeing it here is also a bit confusing.

So, I've added a cmment in the .mk and extended the commit log.

Applied to master, thanks.

[0] https://en.wikipedia.org/wiki/AltiVec#VSX_(Vector_Scalar_Extension)
This means that VSX implies AltiVec, but this is not accounted for in
arch/Config.in.powerpc, and maybe we would need something like:

    config BR2_POWERPC_CPU_HAS_VSX
        bool
        select BR2_POWERPC_CPU_HAS_ALTIVEC

Which would allow to simplify the entries for BR2_powerpc_power7 and
BR2_powerpc_power8, so they would just need to select BR2_POWERPC_CPU_HAS_VSX
But that is for a separate patch, of course...

Regards,
Yann E. MORIN.

>  else
>  FFMPEG_CONF_OPTS += --disable-altivec
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
