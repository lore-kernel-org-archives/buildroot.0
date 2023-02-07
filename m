Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF3DC636CD
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 22:48:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 32F8641802;
	Tue,  7 Feb 2023 22:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 32F8641802
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0VaSQgWJVlEK; Tue,  7 Feb 2023 22:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDB4417D6;
	Tue,  7 Feb 2023 22:48:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DDB4417D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3BB31BF328
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:48:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BEDDD40B4D
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 22:48:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BEDDD40B4D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AyyuzUf9qbBG for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 22:48:04 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CC6E40B4A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CC6E40B4A
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 22:48:04 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.112.98])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 3905DB0053A;
 Tue,  7 Feb 2023 23:47:55 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 07 Feb 2023 23:47:54 +0100
Date: Tue, 7 Feb 2023 23:47:54 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: John Keeping <john@metanate.com>
Message-ID: <20230207224754.GD2817@scaer>
References: <20230207195810.2016594-1-john@metanate.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230207195810.2016594-1-john@metanate.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675810081;
 bh=nfDhtJREFpkU3E3vTroAmKC+tgutSBys+MaqYK7UC4o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Re1C9m4QUeVwS5Pd5l3Z84vK2H9HzR7qUKeRl16x8GcU1uu084qRsqyd/pKuSGFnU
 TDDibjqEZMRC3UkXbKIWyIdsDPqS+oikcnsIBAmKLgg5Ac3DwWXpOS2ysfZc+7545X
 DNCsJD+jMkg1rf9QKadq86VEpGkkaSfyD09+wONsNvWqafObpKSLT3JdaJ0lVQtrfI
 7efxdXOWHpeguaxPEiY9jBRHbEbmaICRcmdDSzwhb0M7hcnUlLBFFBV5/baub1YeM4
 vuZF6kEVsRg7WV64TO4MDsVizmPk3KMOHkUnK09VnpqjXx75AU31oJzn5PQu10x+db
 mtoAFWfrdcPUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Re1C9m4Q
Subject: Re: [Buildroot] [PATCH v2] package/gcc: map debug prefix when
 reproducible
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

John, All,

On 2023-02-07 19:58 +0000, John Keeping spake thusly:
> When building with BR2_REPRODUCIBLE the toolchain wrapper passes
> -fdebug-prefix-map for all packages that are built.  But this doesn't
> affect the target libraries (like libgcc) built by GCC's build system.
> 
> GCC 4.3 added a configure option to set the debug prefix map for these
> libraries, which is used here to avoid encoding potentially
> non-reproducible build paths into the debug data.
> 
> Signed-off-by: John Keeping <john@metanate.com>

After burnng through ~80% of my battery testing this: applied to
master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes since v1:
> - Add the option to GCC common config, not just gcc-final
> 
>  package/gcc/gcc.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
> index ec6f3b550a..6dfd93f2a4 100644
> --- a/package/gcc/gcc.mk
> +++ b/package/gcc/gcc.mk
> @@ -84,6 +84,10 @@ HOST_GCC_COMMON_CONF_OPTS = \
>  	--with-bugurl="http://bugs.buildroot.net/" \
>  	--without-zstd
>  
> +ifeq ($(BR2_REPRODUCIBLE),y)
> +HOST_GCC_COMMON_CONF_OPTS += --with-debug-prefix-map=$(BASE_DIR)=buildroot
> +endif
> +
>  # Don't build documentation. It takes up extra space / build time,
>  # and sometimes needs specific makeinfo versions to work
>  HOST_GCC_COMMON_CONF_ENV = \
> -- 
> 2.39.1
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
