Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47834CD37B3
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 12:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E49ED610F0;
	Sun, 17 Sep 2023 12:38:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E49ED610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmcqCkjxp4cE; Sun, 17 Sep 2023 12:38:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1EAB761114;
	Sun, 17 Sep 2023 12:38:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1EAB761114
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5A2651BF473
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:38:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3325E610EE
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 12:38:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3325E610EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ntJJhWi319rC for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 12:38:12 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 99925610FD
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 12:38:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99925610FD
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:6a7e:c3f3:1d37:8ba2])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7D2B3B0056A;
 Sun, 17 Sep 2023 14:38:06 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Sep 2023 14:38:06 +0200
Date: Sun, 17 Sep 2023 14:38:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230917123806.GN415981@scaer>
References: <20230916212717.1181744-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916212717.1181744-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694954289;
 bh=pWxMvC6eW4dxRhgq4/71Hn7jHZ2c8oT3VG1Pz1N5Ya0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XINoKomiQrT9w6sgW/TqJ7jTJygFZy3nymry478QNM6PF/VHA9OY3j/ocCTlcT34h
 TSWatEgmPVcVLvXc1datbhQe175VH1vUAmNV7AmcdCNHV7LK9z2qkuTkwO1ExcwSLU
 t5XEfUNpJNze4wINNS5yzmDMHjTKqax5hVsVFbkNUoJPspxSovZqrKYqzG/T7PReXu
 0fV1D8Z/mMZIi+6lDEtBIrvafCaF5E0coAuzPCnhgN7Nda9HlEoz1ppkMiXp8qMSeF
 OnKTwwxLAdAX5P+vIgKmNf+SSpKgWTxhrVf62pBTWb7pzf4gq9hOyhqpcXkDdnEBqf
 KPZfM6PnfAJJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XINoKomi
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: needs MMU
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
Cc: Christian Stewart <christian@aperture.us>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2023-09-16 23:27 +0200, Fabrice Fontaine spake thusly:
> Fix the following build failure with uclibc but without MMU raised since
> commit 223596c75d73a7eb29152235d3c5d9bf53bd58f5:
> 
> /home/autobuild/autobuild/instance-6/output-1/host/riscv64-buildroot-linux-uclibc/bin/ld.real: ./.libs/libcrun.a(libcrun_la-container.o): in function `.L0 ':
> container.c:(.text+0x4e7c): undefined reference to `fork'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f19482753e9262ec806cf550619170467a144daf
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/crun/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/crun/Config.in b/package/crun/Config.in
> index 1b69034459..f6a1ec7c66 100644
> --- a/package/crun/Config.in
> +++ b/package/crun/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_CRUN
>  	bool "crun"
> +	depends on BR2_USE_MMU # fork()
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
>  	select BR2_PACKAGE_ARGP_STANDALONE if !BR2_TOOLCHAIN_USES_GLIBC
>  	select BR2_PACKAGE_YAJL # libocispec
> @@ -9,5 +10,6 @@ config BR2_PACKAGE_CRUN
>  	  https://github.com/containers/crun
>  
>  comment "crun needs a glibc or musl toolchain, gcc >= 4.9"
> +	depends on BR2_USE_MMU
>  	depends on BR2_TOOLCHAIN_USES_UCLIBC || \
>  		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> -- 
> 2.40.1
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
