Return-Path: <SRS0=tdpc=MY=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55376C4338F
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:30:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C0C760EFD
	for <buildroot@archiver.kernel.org>; Sun,  1 Aug 2021 20:30:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C0C760EFD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D756A400DF;
	Sun,  1 Aug 2021 20:30:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ON9KweziRSRH; Sun,  1 Aug 2021 20:30:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBC0340101;
	Sun,  1 Aug 2021 20:30:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 027111BF5A2
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F39AD83508
 for <buildroot@lists.busybox.net>; Sun,  1 Aug 2021 20:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id welZvfmRDMsM for <buildroot@lists.busybox.net>;
 Sun,  1 Aug 2021 20:30:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1A957834E8
 for <buildroot@buildroot.org>; Sun,  1 Aug 2021 20:30:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:89a2:641e:9d1f:2c0d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4BA065FF9A;
 Sun,  1 Aug 2021 22:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1627849826;
 bh=E+BBA+5lWdB/Zw2yV0WIxWQmuyjynZ2Fqd1lyeKLSAk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Qi2XXgmDCfz1rntCjLykvnQwBsMIcDHE43p8dO+05u0wNcxWpdn6jXM9yv66V29k/
 wspNPEO9tiydBv19BXrA11biJ26PDC4IricXbbBWKqShIJRhyAu+lPGTaXXNi0rLU9
 oUzcPfKRGUVq+pkDfytEoGLUjzhxueDRuAZOmCatNpThVywVEhWFim4OqkKI3OAJUi
 tFB2gjgDpOGC1yFnGDPu8xSR4XO99TYGz9qWWoD+4eKYEiHrkyYgfHtrpZNGI9Fizq
 VNpfSBtp1/bY4aTN+mw2E96EarnqiRGL0UoIGjRHFdfKpUKFkC90xzchXAbdzF+FCO
 RdgWuStek4vDA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 01 Aug 2021 22:30:22 +0200
Date: Sun, 1 Aug 2021 22:30:22 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20210801203022.GP3189549@scaer>
References: <20210801201739.4190294-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210801201739.4190294-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/fio: needs gcc >= 4.9
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Fabrice, All,

On 2021-08-01 22:17 +0200, Fabrice Fontaine spake thusly:
> fio needs gcc >= 4.9 since version 3.22 and
> https://github.com/axboe/fio/commit/bb012314f734b9de3b2fc198db2c4e3e060db240
> as a result build fails since bump to version 3.27 in commit
> 5c788892102f0e22c9b5694facca0576b09f5ef4
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/01a1e2f4c02e86f3c5b0eb333ed5f4dd6568edf8
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/fio/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/fio/Config.in b/package/fio/Config.in
> index 8da227db7c..7825209b4c 100644
> --- a/package/fio/Config.in
> +++ b/package/fio/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_FIO
>  	bool "fio"
>  	depends on BR2_USE_MMU # fork()
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	# fio uses fallocate() which becomes fallocate64() while compiling with
> @@ -13,8 +14,9 @@ config BR2_PACKAGE_FIO
>  
>  	  http://git.kernel.dk/?p=fio.git;a=summary
>  
> -comment "fio needs a toolchain w/ dynamic library, threads"
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
> +comment "fio needs a toolchain w/ dynamic library, threads, gcc >= 4.9"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_nios2
>  	depends on BR2_USE_MMU
> -- 
> 2.30.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
