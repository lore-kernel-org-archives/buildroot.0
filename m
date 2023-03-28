Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FCA0C6FD18
	for <buildroot@archiver.kernel.org>; Tue, 28 Mar 2023 21:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E7B1418BC;
	Tue, 28 Mar 2023 21:00:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E7B1418BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0CkVB8UY2DcO; Tue, 28 Mar 2023 21:00:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D432D41962;
	Tue, 28 Mar 2023 21:00:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D432D41962
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 483E61BF312
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:00:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2176340530
 for <buildroot@lists.busybox.net>; Tue, 28 Mar 2023 21:00:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2176340530
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rKf1u0T0DHN3 for <buildroot@lists.busybox.net>;
 Tue, 28 Mar 2023 21:00:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C464F4028D
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C464F4028D
 for <buildroot@buildroot.org>; Tue, 28 Mar 2023 21:00:14 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 8FB6C5FFA5;
 Tue, 28 Mar 2023 23:00:07 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 28 Mar 2023 23:00:07 +0200
Date: Tue, 28 Mar 2023 23:00:07 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20230328210007.GE3204460@scaer>
References: <20230326074820.12583-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230326074820.12583-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1680037211;
 bh=a6bcghSEveEj8yIcgYgGtsgLkJP175tl+oBx0thvPvM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SuMPp4X0bJSI6EFtDDo/hxTT3K5MZ6yn+xu7iqy/C9qTUEm0dX7yXE4vqOnpEWfCR
 eNs1za6X681nZkrWZ8ev+1qX6VJ9zbP+jcEihlm4v8nHiWmhFFwDsn8UkT4Y4ogoYg
 N1EXbNB74CtN8XYMKtMf8Vls3p4OWQhr5ztHRDQKGaDYMc6iDsOyxqLySkec9tx2LN
 HSPHUBdhbG2Aq4/Fp/iCU1ymXpDZgOtzckxPGVAjd5kz3eF1WkRtA78UKuwrqqgSLw
 7fx2PnF3lUb7IcwSEFeDgRRhQTsR3miBFeJ3VdVMtej337g0Gr3oMXONXXDHJocd0F
 z+DLHonqaWpUg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SuMPp4X0
Subject: Re: [Buildroot] [PATCH v1] package/flann: needs C++11 support
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
Cc: Davide Viti <zinosat@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2023-03-26 09:48 +0200, Peter Seiderer spake thusly:
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/c92a3df1bc73e00e1e4493500bfb7277cf5064ee
> 
>   .../build/flann-1.9.2/src/cpp/flann/util/lsh_table.h:367:5: error: 'random_device' is not a member of 'std'
>      std::random_device rd;
>      ^
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/flann/Config.in | 6 ++++--
>  package/flann/flann.mk  | 2 +-
>  2 files changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flann/Config.in b/package/flann/Config.in
> index 180d7eae8a..8b32e9077c 100644
> --- a/package/flann/Config.in
> +++ b/package/flann/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_FLANN
>  	bool "flann"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
>  	select BR2_PACKAGE_LZ4
>  	help
>  	  FLANN is a library for performing fast approximate nearest
> @@ -22,5 +23,6 @@ config BR2_PACKAGE_FLANN_EXAMPLES
>  
>  endif
>  
> -comment "flann needs a toolchain w/ C++, dynamic library"
> -	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS
> +comment "flann needs a toolchain w/ C++, dynamic library, gcc >= 4.7"
> +	depends on !BR2_INSTALL_LIBSTDCPP || BR2_STATIC_LIBS || \
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
> diff --git a/package/flann/flann.mk b/package/flann/flann.mk
> index d1a622e685..dc75b977af 100644
> --- a/package/flann/flann.mk
> +++ b/package/flann/flann.mk
> @@ -18,7 +18,7 @@ FLANN_CONF_OPTS = \
>  	-DUSE_OPENMP=$(if $(BR2_TOOLCHAIN_HAS_OPENMP),ON,OFF) \
>  	-DCMAKE_DISABLE_FIND_PACKAGE_HDF5=TRUE
>  
> -FLANN_CXXFLAGS = $(TARGET_CXXFLAGS)
> +FLANN_CXXFLAGS = $(TARGET_CXXFLAGS) -std=c++11
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_68485),y)
>  FLANN_CXXFLAGS += -O0
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
