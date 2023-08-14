Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D9AEB64DD
	for <buildroot@archiver.kernel.org>; Mon, 14 Aug 2023 10:56:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4D51416F8;
	Mon, 14 Aug 2023 10:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4D51416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vJZyqbRl9U0k; Mon, 14 Aug 2023 10:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4814416FC;
	Mon, 14 Aug 2023 10:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4814416FC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5367A1BF3BA
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 10:56:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2CE4181D4D
 for <buildroot@lists.busybox.net>; Mon, 14 Aug 2023 10:56:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CE4181D4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZSvy02r-qkD for <buildroot@lists.busybox.net>;
 Mon, 14 Aug 2023 10:56:50 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D58F181D2D
 for <buildroot@buildroot.org>; Mon, 14 Aug 2023 10:56:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D58F181D2D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7642:bfa0:cf62:9177])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id ACD6DB00713;
 Mon, 14 Aug 2023 12:56:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 14 Aug 2023 12:56:44 +0200
Date: Mon, 14 Aug 2023 12:56:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Waldemar Brodkorb <wbx@openadk.org>
Message-ID: <20230814105644.GB421096@scaer>
References: <ZNnU4wGoYvMTOSkQ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZNnU4wGoYvMTOSkQ@waldemar-brodkorb.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692010606;
 bh=Q+CK2w+GZ6lnZvf92TXnvSStMqmmQXWroW7xH5x2LfY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BkMKIFTn2HmmXiyDSlHA0yTP3lQoo0YqaRQ0VGB+fU/ZO1sNJpato+qiKtLGo20re
 i1H5CXgxqO0wbIU2+vFyZVaH2lfg4jj7JMcBJCMVHKTJLZ47/mtPb1+0MCfeZDXOOX
 Pseb67b7dLn0NC686u72JIQBxX/uPCSGZECLprEDfMf3vtVJDUQ4zWBfDFO22hE7Tu
 iZqoNTGgg55SUqq6APlxi9S88BofbRmDbiUdbK961pNjD2XLyTWhXLHrQ+lw0OaIOC
 +CD3mdboNBBpk7KhHlEo5E8h6+6PYTb/1Eau/AkvAKuBe+QwsM/sAoraCCFYlF+gkf
 aTUNdKyDSehsw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=BkMKIFTn
Subject: Re: [Buildroot] [PATCH] package/perftest: fix unmet direct
 dependencies
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

Waldemar, All,

On 2023-08-14 09:16 +0200, Waldemar Brodkorb spake thusly:
> rdma-core selects perftest and needs NPTL.
> Should be backported to stable branches, because the problem
> exist since the addition of the package.
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/00c/00ce19a1589c6028ee77c333ed9107e2c8c8d6de
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  package/perftest/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/perftest/Config.in b/package/perftest/Config.in
> index 25cd1a9b8d..0a4114015b 100644
> --- a/package/perftest/Config.in
> +++ b/package/perftest/Config.in
> @@ -20,7 +20,7 @@ config BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
>  config BR2_PACKAGE_PERFTEST
>  	bool "perftest"
>  	depends on BR2_PACKAGE_PERFTEST_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # rdma-core

You also missed propagating the dependency on the kernel headers
version, so I've done that.

I also expanded the commit log to explain when the two issues were
introduced.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	depends on !BR2_STATIC_LIBS # rdma-core
>  	# musl does not define sysconf(_SC_LEVEL1_DCACHE_LINESIZE)
>  	depends on !BR2_TOOLCHAIN_USES_MUSL
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
