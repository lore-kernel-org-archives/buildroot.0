Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1A93C7EE23
	for <buildroot@archiver.kernel.org>; Sun, 21 May 2023 15:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54DD9812D8;
	Sun, 21 May 2023 15:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 54DD9812D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j8KcLqH1EDNu; Sun, 21 May 2023 15:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B65B280EBC;
	Sun, 21 May 2023 15:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B65B280EBC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DFC461BF3CD
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:23:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C53A140493
 for <buildroot@lists.busybox.net>; Sun, 21 May 2023 15:23:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C53A140493
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UXjzQ2DeYTNw for <buildroot@lists.busybox.net>;
 Sun, 21 May 2023 15:23:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C3344047D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8C3344047D
 for <buildroot@buildroot.org>; Sun, 21 May 2023 15:23:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:cc91:114a:eab6:96e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id D021FB00535;
 Sun, 21 May 2023 17:23:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 21 May 2023 17:23:20 +0200
Date: Sun, 21 May 2023 17:23:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230521152320.GD171618@scaer>
References: <20230520211246.3950131-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230520211246.3950131-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684682602;
 bh=rSmdh5uGHBgkxqrG6okKyTjGZp80d9fsXC4WccGBW4c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QbA6C7oj7qIdszGu0agLCdKIJjPHD/J1pXUYfqzjNsSSgtLW8Imx90MHVO7YqgmUs
 dpbmhbayPGwhKEO0H6KdKHb3MJB4oLbIq4xZ+l+SFyFwEEsuvQv9lXQSynTT9653+K
 OXrmHJy/7WXG5eeWDHA5OMYZObecQGAoBQvYgtDUnC8JCjLmUti0TrkH1yKuun0E3E
 MjcaHFGOYIX+OUTTTHKd6lQiHA+9mIzOoZsZEZ7lpKaFM5dI6FmcQij5mTYcvWNgRY
 irB1vJvQ1i6FLN4pWry5qO5eOwHkEo4e8zKqZVqLaVStj5q4rihpq4YaoiLtkhgesT
 reXsJFUN/k/YQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QbA6C7oj
Subject: Re: [Buildroot] [PATCH 1/1] package/ethtool: fix build failure
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

Dario, All,

On 2023-05-20 23:12 +0200, Dario Binacchi spake thusly:
> When I was fixing a build failure for the libmnl package ([1]), I got
> this error for the ethtool compilation:
> 
> netlink/rss.c: In function 'rss_reply_cb':
> netlink/rss.c:166:3: error: 'for' loop initial declarations are only allowed in C99 mode
>    for (unsigned int i = 0; i < get_count(hash_funcs); i++) {
>    ^
> netlink/rss.c:166:3: note: use option -std=c99 or -std=gnu99 to compile your code
> 
> [1] http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
>  package/ethtool/ethtool.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/ethtool/ethtool.mk b/package/ethtool/ethtool.mk
> index a35e274bc442..c72d59be3767 100644
> --- a/package/ethtool/ethtool.mk
> +++ b/package/ethtool/ethtool.mk
> @@ -20,4 +20,6 @@ else
>  ETHTOOL_CONF_OPTS += --disable-netlink
>  endif
>  
> +ETHTOOL_CONF_ENV = CFLAGS="$(TARGET_CFLAGS) -std=gnu99"

The proper solution is to add AC_PROG_CC_C99 to configure.ac, and check
that ac_cv_prog_cc_c99 is not set to 'no':

    https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/C-Compiler.html#index-AC_005fPROG_005fCC_005fC99-866

(and then needs AUTORECONF=YES)

Alternatively, if upstream does not really need a C99 compiler, maybe
move the variable declaration out of the for-loop.

Regards,
Yann E. MORIN.

>  $(eval $(autotools-package))
> -- 
> 2.32.0
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
