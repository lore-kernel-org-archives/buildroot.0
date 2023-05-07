Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AE4C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 12:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5F3E82184;
	Sun,  7 May 2023 12:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C5F3E82184
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RS-n7N8b9AS1; Sun,  7 May 2023 12:29:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4B1481E43;
	Sun,  7 May 2023 12:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4B1481E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D2DC41BF391
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:29:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAB8E417B3
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 12:29:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AAB8E417B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gcDeF425FH9F for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 12:29:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49B8A417A3
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49B8A417A3
 for <buildroot@buildroot.org>; Sun,  7 May 2023 12:29:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 97A2B19F54D;
 Sun,  7 May 2023 14:29:40 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 14:29:40 +0200
Date: Sun, 7 May 2023 14:29:40 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230507122940.GL252090@scaer>
References: <20230507114224.3774853-1-bernd.kuhls@t-online.de>
 <20230507114224.3774853-3-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230507114224.3774853-3-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683462582;
 bh=z3qQsBfxGrmtW8WnzVuP4VZmb57D12CMbnPisyAW2JQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=aK/O8IjILaUfyptC6sLp8MxiebphPFKEs0XweYx1jD7GG2hYUcFHzE8PYQ74G4uey
 wNqK78cehYGQFqwhZJo+ZKNotrj/S6hRuQvpxyED2m/YakFKnLn47gsSjv+Gj+nOHz
 z9OjQF9+ZJ7Vsf0L4fvROM1uRxd2T9UIeyq5h/yX93/ZOYkl5JbwIUiDlBAQK0eJ0z
 FcvQKEvZOcCRDVp8G1fTOywU6EXs7FUzmWnXXj8lqoMdGANobfLOo5DqrbdIUbjnp1
 pBfEgVFJkFOumKlhNRmH9pyKwOCr3vdbM+RDvrXaq/5NGq7+Tm6bm3a2C2uF+tC7AQ
 x6T5xzU2gMGIw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=aK/O8IjI
Subject: Re: [Buildroot] [PATCH 3/3] package/kodi-inputstream-adaptive:
 update license info
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

On 2023-05-07 13:42 +0200, Bernd Kuhls spake thusly:
> Include all licenses mentioned in LICENSES/README.md and update the
> deprecated SPDX identifier for the GPL-2.0 license:
> https://spdx.org/licenses/GPL-2.0+.html
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../kodi-inputstream-adaptive.hash                       | 1 +
>  .../kodi-inputstream-adaptive.mk                         | 9 +++++++--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> index 4c5eafc4b6..f562fe193c 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.hash
> @@ -1,3 +1,4 @@
>  # Locally computed
>  sha256  6454f40c6e89e7ce2a9492197954bbef856ee83e242ef610c905d42aed7484d7  kodi-inputstream-adaptive-20.3.7-Nexus.tar.gz
>  sha256  48632d57fbb6ab8f50cbf4deced5c91e733fa7ff292687c4816b77f28e483df9  LICENSE.md
> +sha256  02f864f3e07456785625968022ce811c5640301bfd2ae70963efea89d306790a  LICENSES/README.md
> diff --git a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> index 6d97f1766b..b58047b899 100644
> --- a/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> +++ b/package/kodi-inputstream-adaptive/kodi-inputstream-adaptive.mk
> @@ -6,8 +6,13 @@
>  
>  KODI_INPUTSTREAM_ADAPTIVE_VERSION = 20.3.7-Nexus
>  KODI_INPUTSTREAM_ADAPTIVE_SITE = $(call github,xbmc,inputstream.adaptive,$(KODI_INPUTSTREAM_ADAPTIVE_VERSION))
> -KODI_INPUTSTREAM_ADAPTIVE_LICENSE = GPL-2.0+
> -KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md
> +KODI_INPUTSTREAM_ADAPTIVE_LICENSE = \
> +	BSD-2-Clause-Views \
> +	BSD-3-Clause \
> +	google-patent-license-webm \
> +	GPL-2.0-or-later \
> +	RSA-MD5
> +KODI_INPUTSTREAM_ADAPTIVE_LICENSE_FILES = LICENSE.md LICENSES/README.md

That was not enough: you also need to add the individual license files
to the list, and add a hash for them.

Applied to master with the list updated.

And damned, I forgot to git ammend the hash file... Grr.. I'll push a
fixup shortly...

Regards,
Yann E. MORIN.

>  KODI_INPUTSTREAM_ADAPTIVE_DEPENDENCIES = bento4 expat kodi
>  
>  $(eval $(cmake-package))
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
