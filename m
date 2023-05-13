Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92A1EC77B7A
	for <buildroot@archiver.kernel.org>; Sat, 13 May 2023 19:29:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A20C60B6C;
	Sat, 13 May 2023 19:29:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A20C60B6C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JHztfo7XdY95; Sat, 13 May 2023 19:29:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72A54614E0;
	Sat, 13 May 2023 19:29:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72A54614E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9FC6E1BF5B4
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:29:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7894040201
 for <buildroot@lists.busybox.net>; Sat, 13 May 2023 19:29:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7894040201
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knTmJIuxDVFm for <buildroot@lists.busybox.net>;
 Sat, 13 May 2023 19:29:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C6D4016F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87C6D4016F
 for <buildroot@buildroot.org>; Sat, 13 May 2023 19:29:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:b62a:d745:2556:f18])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DB31E19F5B2;
 Sat, 13 May 2023 21:29:29 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 13 May 2023 21:29:29 +0200
Date: Sat, 13 May 2023 21:29:29 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20230513192929.GB2582048@scaer>
References: <20230421183153.699758-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230421183153.699758-1-james.hilliard1@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684006171;
 bh=Ps5z6S1Zei/+B5K9JDqE2cyqDpbrWE+l4Vj5olr/6PM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JR371WAQCDhsfTQD1FWY0oYopa7rmuRzF8TEau7JpU4YEWLjx36I578HiUCQh1eBR
 yXeB7/2n5ie5WnYJYNxaGgcQ3dSU+vjTHDwTo5IzLyNgEzxAyIoxqvKfp/CWCSeDVI
 HpkVb3CqndtcYA9vi4uSxHncL+DckvrD+kP05lszKog1yFZ//6mCaHpNjdHvVNMVoT
 +HMLrZ2gE4TqhMndxQgVPPtA4Rams+qBoVArHFsMRF8YQS35avhjgDHGo1C2/2c8L/
 LOKKvMB/Qd+kndPtp1gHTRYGFEclqMRAEVQehsO/c1dbr9Bctg5AHWQ99MsG5g4Swa
 3orPVh5UZybiA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JR371WAQ
Subject: Re: [Buildroot] [PATCH 1/1] package/granite: bump to version 6.2.0
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

James, All,

On 2023-04-21 12:31 -0600, James Hilliard spake thusly:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/granite/granite.hash | 2 +-
>  package/granite/granite.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/granite/granite.hash b/package/granite/granite.hash
> index a91f468b49..7dfc008dcb 100644
> --- a/package/granite/granite.hash
> +++ b/package/granite/granite.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  c62d8d29e8bb59a5fa2d9006a9c13196aea9159410a7c86e3d51fa10d0f9dcc0  granite-6.0.0.tar.gz
> +sha256  067d31445da9808a802fca523630c3e4b84d2d7c78ae547ced017cb7f3b9c6b5  granite-6.2.0.tar.gz
>  sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
> diff --git a/package/granite/granite.mk b/package/granite/granite.mk
> index 71dfbf4c03..d5e6b9f47c 100644
> --- a/package/granite/granite.mk
> +++ b/package/granite/granite.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GRANITE_VERSION = 6.0.0
> +GRANITE_VERSION = 6.2.0
>  GRANITE_SITE = $(call github,elementary,granite,$(GRANITE_VERSION))
>  GRANITE_DEPENDENCIES = \
>  	host-pkgconf \
> -- 
> 2.34.1
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
