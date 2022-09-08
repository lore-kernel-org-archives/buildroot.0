Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9039DECAAD5
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 08:02:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78A0761224;
	Thu,  8 Sep 2022 08:01:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78A0761224
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JdztR7Xom_8N; Thu,  8 Sep 2022 08:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92D2560ADA;
	Thu,  8 Sep 2022 08:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92D2560ADA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18B571BF2AA
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 08:01:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E846D60AAF
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 08:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E846D60AAF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ghMG87Fhxz1Z for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 08:01:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 71EA660ADA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 71EA660ADA
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 08:01:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:440f:501d:7d45:a1fe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 975645FFA1;
 Thu,  8 Sep 2022 10:01:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 08 Sep 2022 10:01:44 +0200
Date: Thu, 8 Sep 2022 10:01:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220908080144.GJ1490660@scaer>
References: <20220906114435.604442-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220906114435.604442-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662624106;
 bh=dcsssopA5ok5ZD6EFAIQyYbavWFYCztlgih9U9XTiGw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CG7i7s6fYbNUpAKslou17qBXhOhzcPMbZ2vpLG5IBfnmuveQmr0cbiG9DLS7g0J+X
 7qbFTXDXHkwluopCIj5Wp6T7gTkpl4qmDgsacnhv1ULFtR28JWU+pUPmULQSTvyVaI
 Z2ch5CEg2amMwerT27+hybUwel0UlqTDmGK0y1zi6o2swa9iPLP450TSnp7EaxGwKL
 BPT90P0p7YMzECzxokiggTS2LKZyvn9UaO8WSg29uAeJqu0dia7EGcFurqtRgbUjiI
 3s7QZT8Y+xCmBpwbfn0pGf80tAFQZ+bgOVlCXEySDo9hT6rh14YvFHTJYAtLS71Vwm
 Qn5yIavq+7HqA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=CG7i7s6f
Subject: Re: [Buildroot] [PATCH/next] package/cog: bump to version 0.14.1
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

On 2022-09-06 14:44 +0300, Adrian Perez de Castro spake thusly:
> This is a small bugfix release which solves a coupld of build issues.
> Release notes:
> 
>   https://wpewebkit.org/release/cog-0.14.1.html
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
> index 3fd480c2a8..aa128d73d8 100644
> --- a/package/cog/cog.hash
> +++ b/package/cog/cog.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/cog-0.14.0.tar.xz.sums
> -md5  2352aaba1a4ff31b1d1fb559c4941a01  cog-0.14.0.tar.xz
> -sha1  2da37ea6c25e45425aa80de4a129484ee226dd96  cog-0.14.0.tar.xz
> -sha256  e23936f1ce350ea5ea6fa0709b63d34776b05709388aed9c6cf3fdc41299de9f  cog-0.14.0.tar.xz
> +# From https://wpewebkit.org/releases/cog-0.14.1.tar.xz.sums
> +md5  69d72ac046a0fc485ea7b61b96e7e7fc  cog-0.14.1.tar.xz
> +sha1  6236972b0ae0bce38a0a017610f161b349723862  cog-0.14.1.tar.xz
> +sha256  fb91104e25e1dde27189c91c70acc356e387f47acebaa8997e01ce5879c3a600  cog-0.14.1.tar.xz
>  
>  # Hashes for license files:
>  sha256  e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
> diff --git a/package/cog/cog.mk b/package/cog/cog.mk
> index 348c17c336..5f7abcab1f 100644
> --- a/package/cog/cog.mk
> +++ b/package/cog/cog.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -COG_VERSION = 0.14.0
> +COG_VERSION = 0.14.1
>  COG_SITE = https://wpewebkit.org/releases
>  COG_SOURCE = cog-$(COG_VERSION).tar.xz
>  COG_INSTALL_STAGING = YES
> -- 
> 2.37.3
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
