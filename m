Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53AC1C77B7F
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 20:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E753342AF9;
	Sat, 13 May 2023 20:30:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E753342AF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LVtUrH7F5pHs; Sat, 13 May 2023 20:30:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76BAC428AE;
	Sat, 13 May 2023 20:30:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 76BAC428AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8EECC1BF48C
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:30:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 731F742A8B
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 20:30:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731F742A8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tuzqYaUDyPAV for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 20:30:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F5F842A67
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2F5F842A67
 for <buildroot@uclibc.org>; Sat, 13 May 2023 20:30:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 1675FB0053E;
 Sat, 13 May 2023 22:30:12 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 22:30:11 +0200
Date: Sat, 13 May 2023 22:30:11 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Luke D. Jones" <luke@ljones.dev>
Message-ID: <20230513203011.GM2582048@scaer>
References: <20230315084624.1665061-1-luke@ljones.dev>
 <20230315084624.1665061-4-luke@ljones.dev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315084624.1665061-4-luke@ljones.dev>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684009814;
 bh=889KGgGZAWhLehUlrpmnEwBYLhXWpy4bT1B8XrwT2ac=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PFnj/WFj2V73J0NegJotvY7o0zr2HIY72Oh1Y4GNl9sS/OayY1E+8fvC7VwrzCdHE
 bU2jPVo2/rXSegw50fmfBp/SvqroOK4wfsOP7f/DFvOz+s0GxxvIXNj7LUt1vozcrU
 X2zcDu0EHHimNE+Ulfa3s9L5RWd1GbgsmQ9NYtWBelNDewh2JwX3tz1Y1z9c67D0aG
 PRP2CtY5+RRWAmnirJC9i5gsE4vjq7sK3rCrekki7zC+N0/tHFJkQneNasCsCeKG0u
 tm5VPJLJOo++vmh3+wZc4w9s8WPBWadReT+YXYbFdBSQpjU6a1en0MW4uuijaciunU
 j24l+CAjClA0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=PFnj/WFj
Subject: Re: [Buildroot] [PATCH 4/5] package/sdl2_net: bump version to 2.2.0
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Luke, All,

On 2023-03-15 09:46 +0100, Luke D. Jones spake thusly:
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sdl2_net/sdl2_net.hash | 2 +-
>  package/sdl2_net/sdl2_net.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sdl2_net/sdl2_net.hash b/package/sdl2_net/sdl2_net.hash
> index a58e3c96cf31..c614aee25557 100644
> --- a/package/sdl2_net/sdl2_net.hash
> +++ b/package/sdl2_net/sdl2_net.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  15ce8a7e5a23dafe8177c8df6e6c79b6749a03fff1e8196742d3571657609d21  SDL2_net-2.0.1.tar.gz
> +sha256  4e4a891988316271974ff4e9585ed1ef729a123d22c08bd473129179dc857feb  SDL2_net-2.2.0.tar.gz
>  sha256  f09845a238245402a8b8388db6634d8a5b2c3e1dc098f16f9d8c74a276ef4594  COPYING.txt
> diff --git a/package/sdl2_net/sdl2_net.mk b/package/sdl2_net/sdl2_net.mk
> index 93bf3a2eb366..6adf8eb77919 100644
> --- a/package/sdl2_net/sdl2_net.mk
> +++ b/package/sdl2_net/sdl2_net.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_NET_VERSION = 2.0.1
> +SDL2_NET_VERSION = 2.2.0
>  SDL2_NET_SOURCE = SDL2_net-$(SDL2_NET_VERSION).tar.gz
>  SDL2_NET_SITE = http://www.libsdl.org/projects/SDL_net/release
>  SDL2_NET_LICENSE = Zlib
> -- 
> 2.39.2
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
