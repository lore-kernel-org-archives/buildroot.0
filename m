Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D9C433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 20:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D483F40004;
	Wed,  1 Dec 2021 20:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Ta2o7ZgA94Y; Wed,  1 Dec 2021 20:37:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D799D40274;
	Wed,  1 Dec 2021 20:37:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A93B31BF34C
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 20:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A455340545
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 20:37:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t7SRYKqXw0qh for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 20:37:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 62C704056E
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 20:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1638391020;
 bh=cfjqOta6UEXIi+eFAMLc5Bek3oQCz/Iux6Ow8iISp4E=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=dIfBQxWCgKEtCLjKSa6mD8sNojbeSOHfcxDDWZqvDO3MMgjZ4Jr3tfbrYA7ZSc9Bv
 Ez8R7hZwK4HpH3jD/t05iPOFTOcAds2jxq/ELPKmlc9OdFrg/4/ZJB77VwBkdfMfu5
 3iURtQZJwhpOUvQ7I/Jre5E8PbP0j7PIsSsGH47c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.208.65]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MuUj2-1maAPu2gLK-00rXCL; Wed, 01
 Dec 2021 21:37:00 +0100
Date: Wed, 1 Dec 2021 21:36:59 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211201213659.2bc3b6ed@gmx.net>
In-Reply-To: <20211201095225.90511-1-james.hilliard1@gmail.com>
References: <20211201095225.90511-1-james.hilliard1@gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:biu+ZuLDZbqey8A706vOgsWu3d7th+zXhz9R0BzgiJBmJdD+Etw
 DNYYRG/dfAKkR1+LZYMPhwVKOjjG6l2J7Wsg4m5zio+iuIQ0SJ6gTixI2krnZii6ifZ6R43
 n0H41V/Iaof/ULcZZg0Yk60jj6UyZilH9ncYEOyk7dWA4qOjCo1xSYQcyPpHMyWts4vTsAZ
 /X/aJ4jlWkfB1jKjkMsFw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o+0+0V/JhfE=:WT1LrTtp/CA1CbDnq8jmPu
 mwsY3wC8dqWN6PvRN9WXp+fjDtEkaxy83TIgUkfbKcvTv5o++zrsxn/1skEGGXrvemjsvJFyM
 5Twj0xi8WntLx+yrpkpOa3yBBiu4lCap7vuG5IZSMSUecaqZZk+jAMMlgJ9f3J9jg7SM7ymus
 lqHDt7P36we/UURc/VMeoCRVXu00LN1lGlqppyC6IsgP4ObsS9Wef45opsxh6WL48vdshUPvD
 xtMpuBs6VZfOpaZdnH6W1p+HtgBNZ80scEBa24FAXIU1a9It8uYUSkxJ/ugbvkokpP4SOpWsG
 tHhaFujwLvs31w0iMgvhUdyhX/kkDPw0NqFXOmcuZbCoUhEfIS37DeRNfv6hs8EwGrzr3ZAZB
 AWxI4K+JC5giAoBLY7rag46doo3yehlguGvcRL8xOFiE3XW4qJl5FFby72deGJiycQE81PYvS
 TFoNHmDddkG/25UGjHmzJledadCIuxQvjquIQFaBtJvkBPJ5vE0EJkRSyDTsAexJgx/s6pPeA
 mRWfum0dSAHuf/WGJOsNSsE7olG0zqpKSbdSBmuLlzlQnkcEbnXO4JVBICBxF20R73+gA/WsM
 u4F4YrFsk8QvdMvQLOn+HV7JilJgRTuYnnt2quzF2KKEla111wablsAjdxUjc4yMvFTON3mZe
 M1NBK06I1IP6uFHnkGq9EyPY9YFxKbPXrWByrwtYID/3X9XdLCuA0AqMFePts2z46DX1yAlcx
 Kxuefs70bjug59SdBc6wz+BfHIuwmwptC9UnifdCg9MmoPYJV9FA9ewInK/xy++FkJ8eaQ+U5
 HeVeJ2RTerrnPIBHj0hDSDIspMfvVZ5vu8tPe1xh4xP5HDcF6IjREhbNuaDVyM6t1bFAEMJWo
 1UBNkf9HrtxcRV79qeBCl93FvGFDvMtb2AWnHaBrm+C1rYrUYilT3I357HVk9Nw83QOx2PYmC
 IZzTFvkg1X34VvyAyqpEIXeTmaGWoks1Qkwqe9agenSgLFh0dqfHDBqhh9cmqxxqRPm8T7p59
 Z2vHCfr7bsbdGR3lI0RLAex+YaBuvwNC37PjAfpZlIuEyT2xAd27Ezn61veyIATsIO3h1TE5q
 oJGKy7IMaf4xmA=
Subject: Re: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.46
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

thanks for the update, but...

On Wed,  1 Dec 2021 02:52:24 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Changelog is a nice to have, see [3] for example...

> ---
>  package/ell/ell.hash | 2 +-
>  package/ell/ell.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/ell/ell.hash b/package/ell/ell.hash
> index 84016c0ce0..20b568dde4 100644
> --- a/package/ell/ell.hash
> +++ b/package/ell/ell.hash
> @@ -1,5 +1,5 @@
>  # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
> -sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
> +sha256  f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d  ell-0.46.tar.xz
>
>  # License files
>  sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
> diff --git a/package/ell/ell.mk b/package/ell/ell.mk
> index 47137e2530..4fad6e8d1b 100644
> --- a/package/ell/ell.mk
> +++ b/package/ell/ell.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -ELL_VERSION = 0.44
> +ELL_VERSION = 0.46
>  ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
>  ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
>  ELL_LICENSE = LGPL-2.1+

At this phase of the buildroot release schedule (see [1] and [2]) version bumps
which are not security related should be done against the next branch, which
will conflict with your patch as there are already ell/iwd version bumps applied
(see [3] and [4])...


[1] https://buildroot.org/downloads/manual/manual.html#RELENG
[2] http://lists.busybox.net/pipermail/buildroot/2021-November/629532.html
[3] https://git.buildroot.net/buildroot/commit/?h=next&id=ab4e346c52b804949c9e2da2e4374654e0abe54d
[4] https://git.buildroot.net/buildroot/commit/?h=next&id=ff0d53405157ce82f6b56c74654c75c07b9ce92d
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
