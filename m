Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057A1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 08:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 803F7408D9;
	Sat,  1 Jan 2022 08:42:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EL9eUDYvWJua; Sat,  1 Jan 2022 08:42:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEC67408CC;
	Sat,  1 Jan 2022 08:42:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5C111BF5A7
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9416160E24
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 08:42:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5nOoE2NGF0K9 for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 08:42:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C67E60E22
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 08:42:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b440:9a6c:7abd:86f8])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 6B7605FFA8;
 Sat,  1 Jan 2022 09:42:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641026535;
 bh=nJA8thWdAsN0+Jb2EBwcZI+xU6lNoi13rfqAmKixWg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KrKLHvaFvCB4kzw6/GDahzYOgXGb6ee2q880yS3MD2BREfLrDdtaZpsqWX4Wk3Q1a
 KBLDJr20uZANr+Hj0IL1ULlN5zVf9EomB2zAVqsNuiFwdjZyEiyW4Bpx+CJuI0iHT3
 yp14QGn7UXZNOddI34GkIo+8Js47TNDGYOd+bYLzv63S/xiek72rpvmBGN/uu6FrPg
 BVCB72vFaRXwCzzIiBv9z2d+hnXUAhAl+2YuzZ4bb7idNxwzSOPP65nmsRo8uv8Pgu
 QA0JpLC1XLgD2YqQxRMnBGYCk2vnDI22Lm1ZYeuA7f0Y8dyLyUQWwULMKkw9NTrliy
 xuc74xDW6AyCA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Jan 2022 09:42:11 +0100
Date: Sat, 1 Jan 2022 09:42:11 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220101084211.GP3390456@scaer>
References: <20211231124728.1692301-1-romain.naour@gmail.com>
 <20211231124728.1692301-3-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211231124728.1692301-3-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 3/3] flare-{engine,
 game}: bump to version 1.12
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

Romain, All,

On 2021-12-31 13:47 +0100, Romain Naour spake thusly:
> See:
> https://flarerpg.org/2021/08/02/flare-1-12/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flare-engine/flare-engine.hash | 2 +-
>  package/flare-engine/flare-engine.mk   | 2 +-
>  package/flare-game/flare-game.hash     | 2 +-
>  package/flare-game/flare-game.mk       | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/flare-engine/flare-engine.hash b/package/flare-engine/flare-engine.hash
> index 0e37a71922..7f6169381c 100644
> --- a/package/flare-engine/flare-engine.hash
> +++ b/package/flare-engine/flare-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  035ffd936d9e120dc2eb792779a0b7ff64574d4a29a1124946deaf7946d1059d  flare-engine-1.11.tar.gz
> +sha256  287a08532972fa3ac56ce7cb213d21be8be35b529339f61d4eeadbd501c78a8e  flare-engine-1.12.tar.gz
>  sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
> diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
> index d722a42208..cbb7add4bb 100644
> --- a/package/flare-engine/flare-engine.mk
> +++ b/package/flare-engine/flare-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLARE_ENGINE_VERSION = 1.11
> +FLARE_ENGINE_VERSION = 1.12
>  FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
>  FLARE_ENGINE_LICENSE = GPL-3.0+
>  FLARE_ENGINE_LICENSE_FILES = COPYING
> diff --git a/package/flare-game/flare-game.hash b/package/flare-game/flare-game.hash
> index 983c23200f..3d6d678c94 100644
> --- a/package/flare-game/flare-game.hash
> +++ b/package/flare-game/flare-game.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  c13231c7dd021252487f6cf117f7f2bb24bbda40af0a2b2902d72b5e2d4c242a  flare-game-1.11.tar.gz
> +sha256  19a909f2c6e0868baae823bb491e8840d5fb3e0454f00201de8da119772e5160  flare-game-1.12.tar.gz
>  sha256  3f941b3b89cf7b8370ceb83cc76d2120d471b58735d8ca60238a751a48d7f72f  LICENSE.txt
> diff --git a/package/flare-game/flare-game.mk b/package/flare-game/flare-game.mk
> index 2845dc9714..41f02bec93 100644
> --- a/package/flare-game/flare-game.mk
> +++ b/package/flare-game/flare-game.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLARE_GAME_VERSION = 1.11
> +FLARE_GAME_VERSION = 1.12
>  FLARE_GAME_SITE = $(call github,flareteam,flare-game,v$(FLARE_GAME_VERSION))
>  FLARE_GAME_LICENSE = CC-BY-SA-3.0 (data files), GPL-2.0 (GNU Unifont), \
>  	OFL-1.1 (Liberation Sans)
> -- 
> 2.31.1
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
