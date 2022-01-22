Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4843C433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 19:57:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49D3F60BCE;
	Sat, 22 Jan 2022 19:57:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhT6pKaDWoaJ; Sat, 22 Jan 2022 19:57:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 616CD60BBF;
	Sat, 22 Jan 2022 19:57:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DF4CA1BF574
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:57:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DB9EC410C7
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 19:57:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9CbE0WjxsPiY for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 19:57:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DE45840996
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 19:57:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8038:e8ec:605a:7149])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id E84CAB0051B;
 Sat, 22 Jan 2022 20:57:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642881453;
 bh=SyB2tj68SbDaaNGKJL4+LrMwgdLGDGPVG0FdLIHqfCk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HSOdBCxD32atCMegbhUjwceLq04/yBK14D0MpZ5lOCzpnDljwLa4ZEi5sHee5Omlx
 EY2uorers+g20WPJbB+SZmmwmgrAN01wDgSued05iUlGD8+FgigOjbW7NDH71tev3m
 8otjCUP89n9Dh0EIwAfOfG5/9U++9Uj+Or6oF0Rg0+uO3WgE27w7Bq+jmMEXSV/bVV
 +21isUgNZI5hH1nHVbJCQ+Uk1pwnJjxRn91M1C2bS5D1SsrztqxgVN2/4decWWpdq2
 o1/HD6lLmE07xpqVpDi1ZQc2jCUwhGUJoq6jLXHy28IePA8ZHK+NEZ1O1UR2XSPCut
 oa7+xLONVqkRQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 22 Jan 2022 20:57:29 +0100
Date: Sat, 22 Jan 2022 20:57:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20220122195729.GD3621364@scaer>
References: <20220122153441.1377553-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220122153441.1377553-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 21.3.4
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2022-01-22 16:34 +0100, Bernd Kuhls spake thusly:
> Release notes:
> https://lists.freedesktop.org/archives/mesa-announce/2022-January/000659.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mesa3d-headers/mesa3d-headers.mk | 2 +-
>  package/mesa3d/mesa3d.hash               | 6 +++---
>  package/mesa3d/mesa3d.mk                 | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
> index 1cdfff50c9..09640a903c 100644
> --- a/package/mesa3d-headers/mesa3d-headers.mk
> +++ b/package/mesa3d-headers/mesa3d-headers.mk
> @@ -12,7 +12,7 @@ endif
>  
>  # Not possible to directly refer to mesa3d variables, because of
>  # first/second expansion trickery...
> -MESA3D_HEADERS_VERSION = 21.3.3
> +MESA3D_HEADERS_VERSION = 21.3.4

Do you know why we have patches in mesa3d but not in mesa3d-headers? I
would have expected that we would have the same set of patches for
both...

>  MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
>  MESA3D_HEADERS_SITE = https://archive.mesa3d.org
>  MESA3D_HEADERS_DL_SUBDIR = mesa3d
> diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
> index 235a1b55bb..0f373e29a6 100644
> --- a/package/mesa3d/mesa3d.hash
> +++ b/package/mesa3d/mesa3d.hash
> @@ -1,6 +1,6 @@
> -# From https://lists.freedesktop.org/archives/mesa-announce/2021-December/000658.html
> -sha256  ad7f4613ea7c5d08d9fcb5025270199e6ceb9aa99fd72ee572b70342240a8121  mesa-21.3.3.tar.xz
> -sha512  0263d75435f8c16d40eba3eae29bf372e8994816718deec153c582a17c4dd6ef1c67b3236ed31e63f98bf4e1089fac5cfafae9fb84d3e1fa919b274f43e7e673  mesa-21.3.3.tar.xz
> +# From https://lists.freedesktop.org/archives/mesa-announce/2022-January/000659.html
> +sha256 77104fd4a93bce69da3b0982f8ee88ba7c4fb98cfc491a669894339cdcd4a67d  mesa-21.3.4.tar.xz
> +sha512 7aeea3dba0d39f4ac9f23c54aa0e6853d48000f50c4dd484618c28debe705cdd765ae8fafb5ddea0773976f7189849d9128be3f2282fea74394b59019cb786b9  mesa-21.3.4.tar.xz

There were two spaces between hash type and hash, but your update uses a
single space, which triggers a check-package warning:

    $ ./utils/check-package -q package/mesa3d/mesa3d.hash
    package/mesa3d/mesa3d.hash:2: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)
    package/mesa3d/mesa3d.hash:3: separation does not match expectation (http://nightly.buildroot.org/#adding-packages-hash)

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  # License
>  sha256  998437f3f75f0c542046f83c1cb349408122268168fb13eb4ae6967aa18b7d98  docs/license.rst
> diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> index c4e213088e..0d80813d01 100644
> --- a/package/mesa3d/mesa3d.mk
> +++ b/package/mesa3d/mesa3d.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  # When updating the version, please also update mesa3d-headers
> -MESA3D_VERSION = 21.3.3
> +MESA3D_VERSION = 21.3.4
>  MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
>  MESA3D_SITE = https://archive.mesa3d.org
>  MESA3D_LICENSE = MIT, SGI, Khronos
> -- 
> 2.30.2
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
