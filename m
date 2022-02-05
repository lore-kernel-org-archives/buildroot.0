Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31FD0C433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 16:48:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8414E40400;
	Sat,  5 Feb 2022 16:48:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nvfOc5rRnqRl; Sat,  5 Feb 2022 16:48:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B973B4032B;
	Sat,  5 Feb 2022 16:48:42 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1E1B81BF429
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 16:48:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0AB4840546
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 16:48:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhxbU0VHNZY0 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 16:48:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DDBB94052D
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 16:48:38 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id cz16so1931935edb.8
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 08:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mpKqftsdF+aLZCY/F6PMmynbGZLBWvGSEebgWgmsaQ8=;
 b=RqRPRv5qL6W+4TH78/7vPy/ZR5DFVtZPy8Q+1QRM/Fr/2E0ked+A71Fd292t4/Kg2a
 8zkydxr/dwTMLLIZBL7bwGnxY+SlkrhMMAnbMkuhHZhkXXrPyryFe/+zBMqPVNNJTb8l
 bO7o4/JKgw+Lgs5oNE/paZdC2CK4Od/3FlhYvvNNVkTf4y365zOP50Xi1TSSDFRDwH3K
 Rv3l5GI4FSq7qsimmwweLCQPQDioSpGosOUfCecIjHJkh3vTv0Rb5Y8NYNV680KrT55t
 Tkwox67RXayRuIf894vzfrk4tEGAlabtewM1n/yhMiMrGOJElA4MIiCs6XrmHNs+g+pQ
 lq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mpKqftsdF+aLZCY/F6PMmynbGZLBWvGSEebgWgmsaQ8=;
 b=4gWopFcizmPm/NIvdicTGmrOJ5XsOJIiEfCN/bnMs9xixMWdVt8NsjmxcLtajWHEio
 YgwhXD+tKhQ5uwwS8YK9BVNLLaRIMdEUKQjrKm2RwsZuQAr/0jHTJiiSpC52IV5nL6R7
 cETJ95R3qg6FYI+hp9ShTDSB1fyYOMlV1W7ldOLVH88x4n634jG6kJUrJt6XHY1vmEeR
 49TCkeIVDxFKyaPbWcP2YibYi3TIBmg5MbyGNgRlYMwhxizk6xfhCXpNoCETeHkOVHOd
 L38rRxpMa1poWLbfvWV6To8xesU8m0KWzIxTtNmEDIIgwTIcceRyGV1IuPpbik/FbLBK
 RrNA==
X-Gm-Message-State: AOAM532vCRs/MjpBqybKadmTo41kbnQ74eca9enLA7Pb5KlUowaIGKP2
 dyi9fdsEyrEerzH5gogKtdY3syfQ72F+/Mz6kH9lch4f
X-Google-Smtp-Source: ABdhPJzykwdCD8m72ZwGYbjTc1O6BdTiitklJgrbloCi4+egIjoC8X1DCvEq/R2U9yeEDhtgfyN9YYVV2+/NqLPP1BA=
X-Received: by 2002:a05:6402:358e:: with SMTP id
 y14mr5275732edc.136.1644079716839; 
 Sat, 05 Feb 2022 08:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20220205160511.4602-1-peter.macleod.thompson@gmail.com>
In-Reply-To: <20220205160511.4602-1-peter.macleod.thompson@gmail.com>
Date: Sat, 5 Feb 2022 17:48:26 +0100
Message-ID: <CAGm1_ktiWEE3_uYRzYdBdJqTKOneDpDdNjrCj8LQAMGGUO327g@mail.gmail.com>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] bump version to 2.0.18
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On Sat, Feb 5, 2022 at 5:05 PM Peter Thompson
<peter.macleod.thompson@gmail.com> wrote:
>
> From: PeterThompson <peter.macleod.thompson@gmail.com>
>
> Signed-off-by: PeterThompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
>  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
> index 16459e4a59..a490b002b6 100644
> --- a/package/sdl2_ttf/sdl2_ttf.hash
> +++ b/package/sdl2_ttf/sdl2_ttf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  a9eceb1ad88c1f1545cd7bd28e7cbc0b2c14191d40238f531a15b01b1b22cd33  SDL2_ttf-2.0.15.tar.gz
> -sha256  f6370809c9f644760920d9945c5be07aed17664975f2e4741013d4d9a2ec696f  COPYING.txt
> +sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
> +sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
> diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
> index 326cb99366..1fe7c0a075 100644
> --- a/package/sdl2_ttf/sdl2_ttf.mk
> +++ b/package/sdl2_ttf/sdl2_ttf.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -SDL2_TTF_VERSION = 2.0.15
> +SDL2_TTF_VERSION = 2.0.18
>  SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
>  SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
>  SDL2_TTF_LICENSE = Zlib

Package name is missing from the patch subject.

Regards,
Yegor
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
