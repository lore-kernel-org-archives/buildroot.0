Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7A4CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 21 Nov 2022 21:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DF9860F69;
	Mon, 21 Nov 2022 21:45:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4DF9860F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WqkeeT8OPXRx; Mon, 21 Nov 2022 21:45:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8299060F54;
	Mon, 21 Nov 2022 21:45:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8299060F54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8921BF34D
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:45:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 25331405BE
 for <buildroot@lists.busybox.net>; Mon, 21 Nov 2022 21:45:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 25331405BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ml_Arwo192t1 for <buildroot@lists.busybox.net>;
 Mon, 21 Nov 2022 21:45:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 228D740179
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 228D740179
 for <buildroot@buildroot.org>; Mon, 21 Nov 2022 21:45:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:187b:ecdb:c1bc:94df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 6DD8513F85F;
 Mon, 21 Nov 2022 22:45:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 21 Nov 2022 22:45:30 +0100
Date: Mon, 21 Nov 2022 22:45:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Thompson <peter.macleod.thompson@gmail.com>
Message-ID: <20221121214530.GQ2516@scaer>
References: <20221119001357.27940-1-peter.macleod.thompson@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221119001357.27940-1-peter.macleod.thompson@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1669067132;
 bh=i6opZlLSQoyjS5q88APw1l3o3Y6FFI0QEIvjjHqo56M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AiuEH00aeCblvuOKfYHOtYXW3lDVV3ew2mBhA97WXAGKuXJKJVfj4E5XdKY3hSgYE
 SpbQGY3WmY07wMhWbul4n2ZG+oMoxATIYC5GMaiAn1xGp7e83OAYGKAPDN7ydMzSYz
 5Z4cyZ+Xxs6OdcZY8bj7H0PQ/l+e4TlJcBy6ZGMoZGEDrICtc5pDawthYlM7YF2JRZ
 lnDR2yuJgUFVHp8BNY7qcztxJ/qDTYv4ym8Q8QvOqxwZIkb2Y16q1GmOT0pEF41lLQ
 bzwo+Kn25EIlJUBeABeaENRBf+Z1xsGT+nq1YZlJW4iRDK/zfZ9L5pRFzxnqpJLbJz
 91cQ40nXdvnzg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AiuEH00a
Subject: Re: [Buildroot] [PATCH 1/1] package/sdl2_ttf: bump version to 2.20.1
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

Peter, All,

On 2022-11-18 17:13 -0700, Peter Thompson spake thusly:
> Signed-off-by: Peter Thompson <peter.macleod.thompson@gmail.com>
> ---
>  package/sdl2_ttf/sdl2_ttf.hash | 4 ++--
>  package/sdl2_ttf/sdl2_ttf.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/sdl2_ttf/sdl2_ttf.hash b/package/sdl2_ttf/sdl2_ttf.hash
> index a490b002b6..937dba13e7 100644
> --- a/package/sdl2_ttf/sdl2_ttf.hash
> +++ b/package/sdl2_ttf/sdl2_ttf.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  7234eb8883514e019e7747c703e4a774575b18d435c22a4a29d068cb768a2251  SDL2_ttf-2.0.18.tar.gz
> -sha256  e211dfe7e2c36e64048be886fe3f2bbba8732ce4dd77b596a355d3abbec775a4  COPYING.txt
> +sha256 78cdad51f3cc3ada6932b1bb6e914b33798ab970a1e817763f22ddbfd97d0c57  SDL2_ttf-2.20.1.tar.gz
> +sha256 28aabfed22b3cb0b7e23ef40385e4f66297c960082f029c96d073cc1d4e008d5  LICENSE.txt

Two spaces between hash type and hash:

    $ make check-package
    WARNING: package/sdl2_ttf/sdl2_ttf.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)
    WARNING: package/sdl2_ttf/sdl2_ttf.hash:3: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

> diff --git a/package/sdl2_ttf/sdl2_ttf.mk b/package/sdl2_ttf/sdl2_ttf.mk
> index 054e327fac..4b44b0fc41 100644
> --- a/package/sdl2_ttf/sdl2_ttf.mk
> +++ b/package/sdl2_ttf/sdl2_ttf.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -SDL2_TTF_VERSION = 2.0.18
> +SDL2_TTF_VERSION = 2.20.1

That looks like quite the bump, but in fact, since 2.0.18 was released
2022-01-11, and then nothing until 2.20.1 in 2022-08-19...

Applied to next, with the fix in the hash file, thanks.

Regards,
Yann E. MORIN.

>  SDL2_TTF_SOURCE = SDL2_ttf-$(SDL2_TTF_VERSION).tar.gz
>  SDL2_TTF_SITE = http://www.libsdl.org/projects/SDL_ttf/release
>  SDL2_TTF_LICENSE = Zlib
> -- 
> 2.20.1
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
