Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6279FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Jul 2022 13:23:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 192EE83F14;
	Sun, 17 Jul 2022 13:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 192EE83F14
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n_426w7pS4LY; Sun, 17 Jul 2022 13:23:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E219D83EF7;
	Sun, 17 Jul 2022 13:23:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E219D83EF7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0BA4A1BF3D5
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8EFB400F2
 for <buildroot@lists.busybox.net>; Sun, 17 Jul 2022 13:21:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D8EFB400F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lpL8_BYjm6Pr for <buildroot@lists.busybox.net>;
 Sun, 17 Jul 2022 13:21:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEECF400DD
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEECF400DD
 for <buildroot@buildroot.org>; Sun, 17 Jul 2022 13:21:48 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 087FF780506;
 Sun, 17 Jul 2022 15:21:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 15:21:43 +0200
Date: Sun, 17 Jul 2022 15:21:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20220717132143.GF2249625@scaer>
References: <20220712114510.1434413-1-titouanchristophe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220712114510.1434413-1-titouanchristophe@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658064107;
 bh=B/Sa4sjZIw9m9uPzlqtoGOdDabsRiAKMeFDRaJWofoU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a7IMWNbh0flyjvvPINJ4gnfM2AP0wvmgIckv4gPkjp5ahkCdHPSclAkFcZzoOm3tz
 CJpD29eda0z1pCAsoKdpVAXHepGzqBmtlY4xMo4r4kq3JaIZ75IZiCuxESii3A8RWQ
 MMRA0bp0BzQTyjgnlJKYOmEj+fAn4Nvgy5BhyEFiZ0pUOTbDvky2j5E4uHi4f0upvt
 4InUW39FxuMucDq9tWbADzCR0D+zUm/xhW6OWr9MC36T9kbhgyUBqaLreowMcfS8SF
 PGD2DXyzdalw0mQq89ZBDhiIVY8fWpPcgY1Nq979NUWndvonrnxu8f4hL4crOvZFh3
 khzesN7X3wzzQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a7IMWNbh
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: bump to v7.0.3
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
Cc: Daniel Price <daniel.price@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Titoua, All,

On 2022-07-12 13:45 +0200, Titouan Christophe spake thusly:
> Signed-off-by: Titouan Christophe <titouanchristophe@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/redis/redis.hash | 2 +-
>  package/redis/redis.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/redis/redis.hash b/package/redis/redis.hash
> index 582c3afa03..bff478fe7c 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  284d8bd1fd85d6a55a05ee4e7c31c31977ad56cbf344ed83790beeb148baa720  redis-7.0.0.tar.gz
> +sha256  2cde7d17214ffe305953da9fff12333e8a72caa57fd4923e4872f6362a208e73  redis-7.0.3.tar.gz
>  
>  # Locally calculated
>  sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 3b91fbf8c8..b292782acf 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 7.0.0
> +REDIS_VERSION = 7.0.3
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
> -- 
> 2.36.1
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
