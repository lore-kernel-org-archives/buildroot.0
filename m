Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16520ECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A473D40547;
	Sat, 27 Aug 2022 13:42:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A473D40547
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NG-pnnNOP5_J; Sat, 27 Aug 2022 13:42:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 29A1A40516;
	Sat, 27 Aug 2022 13:42:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 29A1A40516
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AACA81BF588
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 84417410B7
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:42:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 84417410B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XX-92h2agaHq for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:42:38 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EC0F40AB9
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3EC0F40AB9
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:42:38 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 72058780346;
 Sat, 27 Aug 2022 15:42:33 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 15:42:33 +0200
Date: Sat, 27 Aug 2022 15:42:33 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220827134233.GZ37358@scaer>
References: <20220824131826.345495-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824131826.345495-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661607755;
 bh=xhe0EsHUaV9v7T9vCowJhxQ3/xoCulwLhIbEFgcEu7Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qcGluINbQf0nrHV6fw+04cYc6jTGNjVLbhX8VjtUyxgB3e+KPNpRvx5ncFDwtzj2l
 c4xpeV1gy821Sav1thVb+k6OrJXh5GV9A0C85lo2mOh/cmte0tKy7Az05sIC4CCgAZ
 HpYhIoK089+8eZOq/G9+AJmgQ5tiG8QK9/bv0vwAfJkz7ILeQrlbTzY9Wsf7ALhQv3
 BeQSw9fxxZFCotqME6UW6HC5kqIAm38HlOp7V4YYXQ24rMFghMKZaVP+WLlkG4H2/C
 a1QChrHk2LUi0DOXU5q3+Fu8g4AV5hd5Px6bhQUykUrlwh1PchB2O0iqPoGGdV/uCt
 1DK56OW2RnVyg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=qcGluINb
Subject: Re: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.14.0
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

Adrian, All,

On 2022-08-24 16:18 +0300, Adrian Perez de Castro spake thusly:
> This new version includes many improvements. Release notes:
> 
>   https://wpewebkit.org/release/cog-0.14.0.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cog/cog.hash | 8 ++++----
>  package/cog/cog.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/cog/cog.hash b/package/cog/cog.hash
> index 00d3a4e191..3fd480c2a8 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.12.4.tar.xz.sums
> -md5  cdb8acdc3acc9b5082e7db9c279155c3  cog-0.12.4.tar.xz
> -sha1  600b30efadf55bf94ea5062a0a1b2ea0b74053e5  cog-0.12.4.tar.xz
> -sha256  9983c621c8e14fca3792ff566cb6b86d6a1f17446eb4c083af4a5a749112982f  cog-0.12.4.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.14.0.tar.xz.sums
> +md5  2352aaba1a4ff31b1d1fb559c4941a01  cog-0.14.0.tar.xz
> +sha1  2da37ea6c25e45425aa80de4a129484ee226dd96  cog-0.14.0.tar.xz
> +sha256  e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f  cog-0.14.0.tar.xz
>  
>  # Hashes for license files:
>  sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 95b6220629..348c17c336 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -COG_VERSION = 0.12.4
> +COG_VERSION = 0.14.0
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> -- 
> 2.37.2
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
