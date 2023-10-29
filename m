Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FAC7C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 260B560A80;
	Sun, 29 Oct 2023 08:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 260B560A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9iI5uTYCIQGc; Sun, 29 Oct 2023 08:42:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A0B8360AF1;
	Sun, 29 Oct 2023 08:42:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0B8360AF1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E9E671BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:42:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D03204ECD6
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:42:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D03204ECD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Yv4843pepSO for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:42:41 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9B604ECD2
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:42:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B604ECD2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id CE6C12003DA;
 Sun, 29 Oct 2023 09:42:36 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:42:36 +0100
Date: Sun, 29 Oct 2023 09:42:36 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20231029084236.GK687180@scaer>
References: <b0e4b3f0059d978aaa662b56826d66f737770c96.1698421556.git.stefan@agner.ch>
 <e3bc2a06143633266e9c8dae5e6bc397cb7748eb.1698421556.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e3bc2a06143633266e9c8dae5e6bc397cb7748eb.1698421556.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698568959;
 bh=cH2ByE8MWPdgzWv6jvahaksiWW6llGGlFm/kqpUFReA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SsIKyg6fdtldsi/YSZI1YH38ZeW7DY5jCYEWGl1vixKKf7/VNQrZTPFSW4pjINtj8
 VO/AezuRrHeTle3XkEdu1VU0NXnZKqUOqEyDyvicTgs9LE0EJ419hIeqmGLGKrCTMo
 K6YMnPy/DmNRMoHzgUlzgyAOe/BgEURgZBOO6DMK+pVG0ItJFHVTmPnii9RhRBcSVQ
 zF9iaM4UCJ6L2Fy2QHAk5ajA1nwuiqZ2F3TY+b3YV3evRBG0Ak/QLkHq+4LJCIep4D
 L4sF9WSW8g6CBW5Kzpb4v79X6gvvuHeIeJhpjd4d9pGOfdBGA5GUbBkZV2kBus0qjm
 bR4YLN9h9DNaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SsIKyg6f
Subject: Re: [Buildroot] [PATCH 2/2] package/docker-cli: bump version to
 v24.0.7
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
Cc: christian@aperture.us, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Stefan, All,

On 2023-10-27 17:46 +0200, Stefan Agner spake thusly:
> Minor bugfix in docker ps status description.
> 
> https://github.com/moby/moby/releases/tag/v24.0.7
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-cli/docker-cli.hash | 2 +-
>  package/docker-cli/docker-cli.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
> index 5d8c1b0f59..9c8d08bba5 100644
> --- a/package/docker-cli/docker-cli.hash
> +++ b/package/docker-cli/docker-cli.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  c1a4a580ced3633e489c5c9869a20198415da44df7023fdc200d425cdf5fa652  docker-cli-24.0.6.tar.gz
> +sha256  72a54d131c28938221c81bd08364459fed9c71c093d4d615d324aaf31de6db1d  docker-cli-24.0.7.tar.gz
>  sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
> diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
> index 53c9ddb6b8..95fce27ffb 100644
> --- a/package/docker-cli/docker-cli.mk
> +++ b/package/docker-cli/docker-cli.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_CLI_VERSION = 24.0.6
> +DOCKER_CLI_VERSION = 24.0.7
>  DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
>  
>  DOCKER_CLI_LICENSE = Apache-2.0
> -- 
> 2.42.0
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
