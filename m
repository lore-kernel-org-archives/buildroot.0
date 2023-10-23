Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752BEC004C0
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 16:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 109A4417EE;
	Mon, 23 Oct 2023 16:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 109A4417EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ecHmW7Coe4Y2; Mon, 23 Oct 2023 16:51:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD3E0417DD;
	Mon, 23 Oct 2023 16:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD3E0417DD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 004C81BF325
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DA0E142176
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 16:51:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA0E142176
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id enwDJ-KwG9Ux for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 16:51:12 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B6EC142171
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 16:51:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B6EC142171
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:8ed0:8cf1:4440:5c7b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 8B25D2003F6;
 Mon, 23 Oct 2023 18:51:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 23 Oct 2023 18:51:05 +0200
Date: Mon, 23 Oct 2023 18:51:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Titouan Christophe <titouanchristophe@gmail.com>
Message-ID: <20231023165105.GW2607@scaer>
References: <20231023135251.63644-1-titouanchristophe@gmail.com>
 <20231023135251.63644-2-titouanchristophe@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023135251.63644-2-titouanchristophe@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1698079868;
 bh=E4UNwqod3y0xyJBWrzm+VliGuTxaT2V7e2BOd6hzSBE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pb7/Fsl3QsT8B/sQH7h5b/xT+n0np7UrHuVF5xz/2uCkPsC+leepUgeRUSffjxxic
 RYfdaeShzg5hAFP5a1Bkdd0Jo+jNB4wWUzDJeWjOTzwfTnb7+icGtZE/oaTM+NRFLq
 43A1tBnPkLc4UbAtTytRaE+c9Fu5UHmiS9OgysamfG1I3+UMx2ixwiXlzRyQlDPjpy
 MJEgaKYcyx5MnU9cVm+6u58FnFTgyzEtSUBr7wpSOwXgQIdX5xsRzNZl8ocQZOGVVD
 /fu0bN3vtu0hFLV9hgdyIaHWTCIM6xD5BAsBBWd2Ct3TivGucLnaJTNraprL1dVw7E
 d7S6epi/GRxDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pb7/Fsl3
Subject: Re: [Buildroot] [PATCH 1/1] package/redis: security bump to v7.2.2
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

Titouan, All,

On 2023-10-23 15:52 +0200, Titouan Christophe spake thusly:
> This fixes CVE-2023-45145, see the release notes:
> https://raw.githubusercontent.com/redis/redis/7.2.2/00-RELEASENOTES
> 
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
> index b73df17790..d1874d026a 100644
> --- a/package/redis/redis.hash
> +++ b/package/redis/redis.hash
> @@ -1,5 +1,5 @@
>  # From https://github.com/redis/redis-hashes/blob/master/README
> -sha256  5c76d990a1b1c5f949bcd1eed90d0c8a4f70369bdbdcb40288c561ddf88967a4  redis-7.2.1.tar.gz
> +sha256  ca999be08800edc6d265379c4c7aafad92f0ee400692e4e2d69829ab4b4c3d08  redis-7.2.2.tar.gz
>  
>  # Locally calculated
>  sha256  97f0a15b7bbae580d2609dad2e11f1956ae167be296ab60f4691ab9c30ee9828  COPYING
> diff --git a/package/redis/redis.mk b/package/redis/redis.mk
> index 04f4697e7d..a6b58148d2 100644
> --- a/package/redis/redis.mk
> +++ b/package/redis/redis.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -REDIS_VERSION = 7.2.1
> +REDIS_VERSION = 7.2.2
>  REDIS_SITE = http://download.redis.io/releases
>  REDIS_LICENSE = BSD-3-Clause (core); MIT and BSD family licenses (Bundled components)
>  REDIS_LICENSE_FILES = COPYING
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
