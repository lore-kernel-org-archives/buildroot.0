Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2911C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 08:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72B6670425;
	Sun, 29 Oct 2023 08:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72B6670425
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a7RfsAZThDl9; Sun, 29 Oct 2023 08:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5D1170411;
	Sun, 29 Oct 2023 08:42:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5D1170411
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 384551BF41A
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1192E84C18
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 08:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1192E84C18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WVm4bZev9XWe for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 08:42:29 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 12F8C84C14
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 08:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12F8C84C14
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:de1f:355b:eff2:ec6])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 259F6200410;
 Sun, 29 Oct 2023 09:42:23 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 29 Oct 2023 09:42:22 +0100
Date: Sun, 29 Oct 2023 09:42:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20231029084222.GJ687180@scaer>
References: <b0e4b3f0059d978aaa662b56826d66f737770c96.1698421556.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b0e4b3f0059d978aaa662b56826d66f737770c96.1698421556.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698568947;
 bh=1t0eWd8lvl1uABySUd2yDW98FXrMlUF09zf34JYbqnA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=df7CG8VSyLZDlKU6+BsRfwBR/kpR2LEWUjAvThwW72NGu8JT9tzqOOGObVBS1Rr1g
 iYZW0EEZEgFOwLugobUL1mEJK0Hb32XGTU/X7kQ9KgrcZY5thaaQZQxU0y1hJv4aMx
 MZQmWX8USoQsHkb0uoPoGVDiQacHSjcpVtAwRPXJlP3o79NZy0UqzXuNFdT/7Im4aQ
 WMSbpZFqJWAlZ6G0qAcHWr8glY5NWs43SpEsXP6YMRALJaCWVFP/WeqWDagMCoG4rT
 WXmBcbL5V8cG9TMZvjfeahCgURbEzgvzf10t9LnOrVoHmpUWkwkLkgSlSqGjAzkvaN
 f6uHpcy/z1w7w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=df7CG8VS
Subject: Re: [Buildroot] [PATCH 1/2] package/docker-engine: bump version to
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

+Peter for backports

On 2023-10-27 17:46 +0200, Stefan Agner spake thusly:
> The overlay2 layers metadata are now written atomically. Many other
> bugfixes and hardening against security issues around the power capping
> framework.
> 
> https://github.com/moby/moby/releases/tag/v24.0.7
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/docker-engine/docker-engine.hash | 2 +-
>  package/docker-engine/docker-engine.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
> index 7a8b17d3f3..931d6529e1 100644
> --- a/package/docker-engine/docker-engine.hash
> +++ b/package/docker-engine/docker-engine.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  29a8ee54e9ea008b40eebca42dec8b67ab257eb8ac175f67e79c110e4187d7d2  docker-engine-24.0.6.tar.gz
> +sha256  16a2cb4cf4d314a070085e0df06e3a6bd9ec678d28715b64060af694fc9051d5  docker-engine-24.0.7.tar.gz
>  sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
> diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
> index a8f47254a4..34e74c09c6 100644
> --- a/package/docker-engine/docker-engine.mk
> +++ b/package/docker-engine/docker-engine.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DOCKER_ENGINE_VERSION = 24.0.6
> +DOCKER_ENGINE_VERSION = 24.0.7
>  DOCKER_ENGINE_SITE = $(call github,moby,moby,v$(DOCKER_ENGINE_VERSION))
>  
>  DOCKER_ENGINE_LICENSE = Apache-2.0
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
