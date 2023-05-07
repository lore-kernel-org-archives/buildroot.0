Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D8CFC77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1666E82212;
	Sun,  7 May 2023 12:28:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1666E82212
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afqxFRqVbDzp; Sun,  7 May 2023 12:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2EFE382199;
	Sun,  7 May 2023 12:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2EFE382199
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B57F11BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DBAD418BE
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:28:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DBAD418BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GPH2HuBX6cWs for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:28:06 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509754176F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 509754176F
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:28:06 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 79DF919F5A7;
 Sun,  7 May 2023 14:28:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:28:00 +0200
Date: Sun, 7 May 2023 14:28:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507122800.GK252090@scaer>
References: <20230507112525.3575289-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507112525.3575289-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683462483;
 bh=2y3+CwpwmYnh0ePZ3DT2Xem+UncZyhun97/tP4VoMuo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bZohleSDWBv/+v6PNgDSsy8L+m+L6d+ez75B3FmvCpr+Cv1W5Lxvvg5ZBDtd4GWYz
 3eMxgLCBWOV3oQY1Nn/LlOLFQe5d+Hk6hhVbR7drrvg3kWv5YfhRFo9LknV7e7LxSq
 NwUvgnZgw27CertPlPheSGVgnvh5unGs75aZA40TnHyY5FCwuy+OFaRItWTucXZ06c
 j6D2O6TywFR2HUNMtQpjAQu8TyRYwWEDYq8x2OfKlsAyrN3TqOJJ6yrqbMbcKTI4+w
 uBIA/yNxfTURv82zOKsEl3/+Fz3qCFSdRPilfg0ZwsFIETxDZUuNTfM5lgqKbQAxGg
 NvtUlMUsMHUKg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bZohleSD
Subject: Re: [Buildroot] [PATCH 1/1] package/kodi: update patch status
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

Bernd, All,

On 2023-05-07 13:25 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .checkpackageignore                                             | 1 -
>  ...1-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch | 2 +-
>  package/kodi/0002-cmake-modules-fix-python-detection.patch      | 2 +-
>  3 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index aef67e3403..949f92b4bf 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -704,7 +704,6 @@ package/keyutils/0002-cifs.patch Sob Upstream
>  package/kmod/0001-fix-O_CLOEXEC.patch Upstream
>  package/kodi-texturepacker/0001-texturepacker.patch Upstream
>  package/kodi-texturepacker/0002-fix-texture-packer-cmake-source-dir.patch Upstream
> -package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch Upstream
>  package/kodi/S50kodi Shellcheck Variables
>  package/latencytop/0001-makefile.patch Upstream
>  package/lbase64/0001-retro-compatible-with-Lua-5.1.patch Upstream
> diff --git a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> index 057d2254bc..d564a3e2be 100644
> --- a/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> +++ b/package/kodi/0001-kodi-config.cmake-use-CMAKE_FIND_ROOT_PATH-to-fix-cr.patch
> @@ -8,7 +8,7 @@ When cross-compiling, the location at build time of the libraries is
>  not the same as the one at run-time. The CMAKE_FIND_ROOT_PATH variable
>  is here to handle this difference, so use it in kodi-config.cmake.
>  
> -Upstream status: Reverted (PR 17616)
> +Upstream: Reverted (PR 17616)

I've also added 18680 as a reference, as it was the PR that actually did
the revert, and the information there is important.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>  (rebased and simplified for Kodi 17.0-Krypton)
> diff --git a/package/kodi/0002-cmake-modules-fix-python-detection.patch b/package/kodi/0002-cmake-modules-fix-python-detection.patch
> index 92a4ac904d..fcf35b25b2 100644
> --- a/package/kodi/0002-cmake-modules-fix-python-detection.patch
> +++ b/package/kodi/0002-cmake-modules-fix-python-detection.patch
> @@ -5,7 +5,7 @@ Subject: [PATCH] cmake/modules: fix python detection
>  
>  Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
>  Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> -Upstream: unknown
> +Upstream: https://github.com/xbmc/xbmc/pull/23230
>  ---
>   cmake/modules/FindPython.cmake | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
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
