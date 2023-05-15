Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11134C7EE24
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 19:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D97241BBB;
	Mon, 15 May 2023 19:15:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D97241BBB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TfRRrYVL2We7; Mon, 15 May 2023 19:15:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2737241B7F;
	Mon, 15 May 2023 19:15:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2737241B7F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 511C11BF4D6
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 19:14:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 30B0060AA7
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 19:14:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B0060AA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wkxkvqwRtCpG for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 19:14:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CF2860585
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CF2860585
 for <buildroot@buildroot.org>; Mon, 15 May 2023 19:14:56 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d5fe:1634:1eeb:d472])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5792613FA3E;
 Mon, 15 May 2023 21:14:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 May 2023 21:14:51 +0200
Date: Mon, 15 May 2023 21:14:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230515191451.GL2582048@scaer>
References: <20230515152626.286921-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230515152626.286921-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684178093;
 bh=fqOSaBjqZJxUlVXyOPUSsEmveEtxwvqqA+SiBmrJuT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jswkgQoQYR4KwHgx4VJEDLWK6zRJ4S2svDyt6MZHuk0ZP3jdcH7qptlh4xpM9nrB/
 1L9A0o1dYACivgKc1lNcz1yxlNMR/is2GbRB45mkS+YYO3Lj+50FjJEp/atekcde4g
 Uw6/V2OA72hQtxEpjnQdpzbherRfZuX9VacYGx+VFON45r2cd/kElz0F62p1fPXjHK
 eSrpd7LZVdpinVLz0AEY2+ZOlB8nsmiskx6jMvsVFNblSd7u0uzGr76tO+FyEWqfPx
 yGeDwDOcUJhQvHMiJGTJiIlVKnHHmYHczzMC9mf/sfU/6d7bfxzrno3ZPzT/lyP57e
 oKSwU/cS2ht0w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jswkgQoQ
Subject: Re: [Buildroot] [PATCH 1/1] package/clamav: fix build on mips64el
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

Bernd, All,

On 2023-05-15 17:26 +0200, Bernd Kuhls spake thusly:
> Fixes:
> http://autobuild.buildroot.net/results/b64/b640937f35b11ddb9f1e29f0e44040eda8850f26/
> 'Could not find specification for target "mips64el-unknown-linux-gnu".'
> 
> This patch changes
>     -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnu
> to
>     -DRUST_COMPILER_TARGET=mips64el-unknown-linux-gnuabi64
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/clamav/clamav.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/clamav/clamav.mk b/package/clamav/clamav.mk
> index 977b6010b3..c3bede9ef3 100644
> --- a/package/clamav/clamav.mk
> +++ b/package/clamav/clamav.mk
> @@ -54,7 +54,7 @@ CLAMAV_CONF_OPTS = \
>  	-DENABLE_MILTER=OFF \
>  	-DENABLE_TESTS=OFF \
>  	-DHAVE_SYSTEM_LFS_FTS=ON \
> -	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(ABI) \
> +	-DRUST_COMPILER_TARGET=$(ARCH)-unknown-$(TARGET_OS)-$(LIBC)$(RUSTC_ABI) \

Why don't we use $(RUSTC_TARGET_NAME), defined in package/rustc/rustc.mk@11
instead;

    RUSTC_TARGET_NAME = $(RUSTC_ARCH)-unknown-linux-$(LIBC)$(RUSTC_ABI)

Regards,
Yann E. MORIN.

>  	-Dtest_run_result=ON \
>  	-Dtest_run_result__TRYRUN_OUTPUT=ON
>  
> -- 
> 2.39.2
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
