Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2196EB64DC
	for <buildroot@archiver.kernel.org>; Sat, 24 Jun 2023 14:03:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 87D1860B05;
	Sat, 24 Jun 2023 14:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87D1860B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1GGyL9mhlmO5; Sat, 24 Jun 2023 14:03:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6680060B2B;
	Sat, 24 Jun 2023 14:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6680060B2B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7D84B1BF31F
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:03:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6288581F53
 for <buildroot@lists.busybox.net>; Sat, 24 Jun 2023 14:03:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6288581F53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 19Boa5sGOv3C for <buildroot@lists.busybox.net>;
 Sat, 24 Jun 2023 14:03:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 364CA81F4F
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 364CA81F4F
 for <buildroot@buildroot.org>; Sat, 24 Jun 2023 14:03:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5f8:72e0:30f9:5d41])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id B1C56B0051E;
 Sat, 24 Jun 2023 16:03:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 24 Jun 2023 16:03:00 +0200
Date: Sat, 24 Jun 2023 16:03:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230624140300.GP24952@scaer>
References: <20230624081007.19409-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230624081007.19409-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687615384;
 bh=/rMYFOSKfswyzikoYqSrM2E5StaBy8XaeNovFbJoyWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uoNFn+L6nOVjdvd9U6F4ekSfNovRnqTfb8HmBHQ3BODxfXHD5rR1da5Vxd51IDIWu
 591gFRNqYcNa0pyteSG5b36YID8qdDDgVcmBWEZBDtJKpYX650ovNch4FyVFZgjUmb
 fV9WqEfA1b3fKFOn5BLM6/79JnwAHMD1kKE8cF+b1o7sGeaY3TMEBeEDPMB2l+2uV9
 yX1jNpAUmLDIkrPJCez/+XYF3wzAy8N/mRkcvHxr7h1vLbPUVuWOLUdmS2jijsZONN
 Rsrzw0p7VjAolptXBuk6zBaiZcbAN5+DwJ3GeRMoEDLdMNKNXS4FIWSwjw0mkc3xeR
 EnE/SbI1hdhWA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uoNFn+L6
Subject: Re: [Buildroot] [PATCH v1] package/mesa3d: fix
 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
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
Cc: Bernd Kuhls <bernd@kuhls.net>, Romain Naour <romain.naour@gmail.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-06-24 10:10 +0200, Peter Seiderer spake thusly:
> Update 002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch to
> fix an syntax error introduced by commit 'package/{mesa3d, mesa3d-headers}:
> bump version to 23.1.0' ([1])
> 
> Fixes:
> 
>   .../build/mesa3d-23.1.2/src/gallium/drivers/vc4/meson.build:87:76: ERROR:
>   Trying to compare values of different types (UserFeatureOption, str) using !=.
>   This was deprecated and undefined behavior previously and is as of 0.60.0 a hard error.
> 
> [1] https://git.buildroot.net/buildroot/commit/?id=e6203db11ed40122a2d9f29012db5683a7eb10d0
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...tion-to-disable-optional-neon-suppor.patch | 22 ++++++++++---------
>  1 file changed, 12 insertions(+), 10 deletions(-)
> 
> diff --git a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> index a5564fcf3a..430bd3b4b9 100644
> --- a/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> +++ b/package/mesa3d/0002-vc4-add-meson-option-to-disable-optional-neon-suppor.patch
> @@ -1,4 +1,4 @@
> -From e3b47c1b84964c62b3e1fa782f1ffa4be0ae62f9 Mon Sep 17 00:00:00 2001
> +From f719e942dde0a46a9ff0080001cb3466012ffcc0 Mon Sep 17 00:00:00 2001
>  From: Peter Seiderer <ps.report@gmx.net>
>  Date: Mon, 9 Mar 2020 13:01:14 +0100
>  Subject: [PATCH] vc4: add meson option to disable optional neon support
> @@ -11,6 +11,8 @@ Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/4114
>  Signed-off-by: Peter Seiderer <ps.report@gmx.net>
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  [rebased for 20.2.0, 20.3.0, 21.1.0 & 23.1.0]
> +Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> +[fix syntax error after previous rebases]
>  ---
>   meson_options.txt                    | 7 +++++++
>   src/gallium/drivers/vc4/meson.build  | 4 ++--
> @@ -18,25 +20,25 @@ Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>   3 files changed, 11 insertions(+), 4 deletions(-)
>  
>  diff --git a/meson_options.txt b/meson_options.txt
> -index a39596a6f19..0f6b6c62b55 100644
> +index 8e0bf2a..1cf0e07 100644
>  --- a/meson_options.txt
>  +++ b/meson_options.txt
> -@@ -117,6 +117,13 @@
> +@@ -116,6 +116,13 @@ option(
> +   description : 'enable gallium va frontend.',
>   )
>   
> - option(
> ++option(
>  +  'gallium-vc4-neon',
>  +  type : 'feature',
>  +  deprecated: {'true': 'enabled', 'false': 'disabled'},
>  +  description : 'enable gallium vc4 optional neon support.',
>  +)
>  +
> -+option(
> + option(
>     'va-libs-path',
>     type : 'string',
> -   value : '',
>  diff --git a/src/gallium/drivers/vc4/meson.build b/src/gallium/drivers/vc4/meson.build
> -index 5ce5af5f6b4..e3f7d8d62ae 100644
> +index 84da951..7f950de 100644
>  --- a/src/gallium/drivers/vc4/meson.build
>  +++ b/src/gallium/drivers/vc4/meson.build
>  @@ -84,7 +84,7 @@ files_libvc4 = files(
> @@ -44,7 +46,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
>   
>   libvc4_neon = []
>  -if host_machine.cpu_family() == 'arm'
> -+if host_machine.cpu_family() == 'arm' and get_option('gallium-vc4-neon') != 'disabled'
> ++if host_machine.cpu_family() == 'arm' and not get_option('gallium-vc4-neon').disabled()
>     libvc4_neon = static_library(
>       'vc4_neon',
>       'vc4_tiling_lt_neon.c',
> @@ -58,7 +60,7 @@ index 5ce5af5f6b4..e3f7d8d62ae 100644
>   
>   if dep_simpenrose.found()
>  diff --git a/src/gallium/drivers/vc4/vc4_tiling.h b/src/gallium/drivers/vc4/vc4_tiling.h
> -index 66767e7f1f8..7446f1c3d0c 100644
> +index 5afe329..919b299 100644
>  --- a/src/gallium/drivers/vc4/vc4_tiling.h
>  +++ b/src/gallium/drivers/vc4/vc4_tiling.h
>  @@ -89,7 +89,7 @@ vc4_load_lt_image(void *dst, uint32_t dst_stride,
> @@ -80,5 +82,5 @@ index 66767e7f1f8..7446f1c3d0c 100644
>                   vc4_store_lt_image_neon(dst, dst_stride, src, src_stride,
>                                           cpp, box);
>  -- 
> -2.25.1
> +2.41.0
>  
> -- 
> 2.41.0
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
