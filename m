Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30452C77B75
	for <buildroot@archiver.kernel.org>; Wed,  3 May 2023 19:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B913161167;
	Wed,  3 May 2023 19:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B913161167
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jh4UJlKsSb5H; Wed,  3 May 2023 19:55:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E555560DCB;
	Wed,  3 May 2023 19:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E555560DCB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DEFBD1BF31F
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C34E583BCC
 for <buildroot@lists.busybox.net>; Wed,  3 May 2023 19:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34E583BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id M-IwO_AVQYCY for <buildroot@lists.busybox.net>;
 Wed,  3 May 2023 19:55:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C23F183BFB
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C23F183BFB
 for <buildroot@buildroot.org>; Wed,  3 May 2023 19:55:08 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7044:c88:9a1c:351c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A50AF5FF88;
 Wed,  3 May 2023 21:55:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 03 May 2023 21:55:03 +0200
Date: Wed, 3 May 2023 21:55:03 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Knight <james.d.knight@live.com>
Message-ID: <20230503195503.GH2696@scaer>
References: <SJ0P221MB06891584D4A1A8E230113F46A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SJ0P221MB06891584D4A1A8E230113F46A06C9@SJ0P221MB0689.NAMP221.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683143705;
 bh=xvCmVWI9cm1rwX75axvMEmaPqZrbaChtox67e7zChrk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M02ME0Dttd7SLiI20rtBEng1vgegAoJO5CFZNZvF7MuJHFw0zHFqzGX8yhY41LOJm
 Jtj/L9X/aanIzrA9axXXGW9cg+9G1yx5eCKD3Zw4xUCFmdjTfo+ZnZphVc39Mru7lG
 NFSCOqcce6W2+x6jPi5ohadFp5d6sgPZh34Wo8ifL72sZwH40X17Ys/cP2BXVHUxq8
 VAYLYYGom2M+BD3ErPDUFlbok3Cq9VKW5r5YkxAdm+a88pR7k7fSC+HIUMfOxTLxSQ
 MCbOMbX+fCFaTmoHFsbqPEffPR8kaLs/GacClHAEmATXuVOFYs58AVfqVF9TEjNQ+j
 GVMwczQLrXvzA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M02ME0Dt
Subject: Re: [Buildroot] [PATCH] package/libpqxx: bump version to 7.7.5
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

On 2023-05-03 10:55 -0400, James Knight spake thusly:
> Signed-off-by: James Knight <james.d.knight@live.com>
> ---
>  package/libpqxx/libpqxx.hash | 4 ++--
>  package/libpqxx/libpqxx.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/libpqxx/libpqxx.hash b/package/libpqxx/libpqxx.hash
> index 167b5edc9d6b4260f60ce667e5e77c65d226a72b..1c0e4c185dedb910abd911059e6ada60b436802f 100644
> --- a/package/libpqxx/libpqxx.hash
> +++ b/package/libpqxx/libpqxx.hash
> @@ -1,3 +1,3 @@
>  # Locally computed:
> -sha256  86921fdb0fe54495a79d5af2c96f2c771098c31e9b352d0834230fd2799ad362  libpqxx-6.4.5.tar.gz
> -sha256  36c48c1ca1b0a68639d919196b5d92c971858ad8e24da24385ba1c65cc5eac38  COPYING
> +sha256  c7dc3e8fa2eee656f2b6a8179d72f15db10e97a80dc4f173f806e615ea990973  libpqxx-7.7.5.tar.gz
> +sha256  91718581edafc9f722915133d75f74c82d7c2e41a1831c1e042206423e5a63b0  COPYING

You forgot to explain why COIPYING was updated.

Indeed, if we have hashes for license files, that's because we want to
notice when they change, and so we can review the new lisensing terms.

Silently updating the license hash without explanations kinda defeat the
very purpose of the hash.

In this case, the reason for the change is an update in copyright years,
so just stating that in the commit log would have been enough.

Applied to master, thanks (but I forgot to amend the commit log to
explain the license hash change).

Regards,
Yann E. MORIN.

> diff --git a/package/libpqxx/libpqxx.mk b/package/libpqxx/libpqxx.mk
> index 9de7df3ed28ba26d3d979b32d34d6c0cdae0da9a..b280f5a52a15b7c60d3da16ad326dbedac123137 100644
> --- a/package/libpqxx/libpqxx.mk
> +++ b/package/libpqxx/libpqxx.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPQXX_VERSION = 6.4.5
> +LIBPQXX_VERSION = 7.7.5
>  LIBPQXX_SITE = $(call github,jtv,libpqxx,$(LIBPQXX_VERSION))
>  LIBPQXX_INSTALL_STAGING = YES
>  LIBPQXX_DEPENDENCIES = postgresql
> -- 
> 2.40.1.windows.1
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
