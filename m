Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 297CBC77B7D
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:39:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C21B440A0A;
	Sun,  7 May 2023 21:38:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C21B440A0A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id n6gf-jEBLTNz; Sun,  7 May 2023 21:38:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D595440639;
	Sun,  7 May 2023 21:38:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D595440639
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CBC391BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:38:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A553F81E9E
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:38:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A553F81E9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ra7UxQ9D5tj5 for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:38:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D41781E9D
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8D41781E9D
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:38:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id D30812003C3;
 Sun,  7 May 2023 23:38:49 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 23:38:49 +0200
Date: Sun, 7 May 2023 23:38:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20230507213849.GT252090@scaer>
References: <20230502154713.1490788-1-etienne.carriere@linaro.org>
 <20230502154713.1490788-6-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230502154713.1490788-6-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683495533;
 bh=VdnRMhjDcxpsXwjJb6pEAlxeov7CipLpjmrFUaeiF1M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LfHsuuFLHTtERlFBYNuVraG4gbjB57Ohv2M0K1rypsPsk+ecRHA4N0C2vV/6QlHtU
 bHUJvrLbPgG7bEa/kUz5Rddlhtry7OwCZOkXQDukNCam4tDuAz3fhoVzI3EsW2PCJ7
 CKgRAGYNryUgAEBmsj/PLS+FV/enzkxmoa3vHiFKc1r0Wr5M0u0TDMlkA1v3vag97W
 zuF8DCGuZ994eit/+2CB8arhqIyfcVTQtbWWALXOjAwZgzpC2rkJ14oYm3MyJhagfk
 wY7AMi6EC/V3OAOTMtQZyVZnfp62dhUfjgBIBd2UfiWb96Ml6y4c/pw8tyvJpnxGMo
 6tmZyCTvzPf2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LfHsuuFL
Subject: Re: [Buildroot] [PATCH 6/6] package/optee-benchmark: remove
 deprecated package
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Etienne, All,

On 2023-05-02 17:47 +0200, Etienne Carriere spake thusly:
> Removes package optee-benchmark that is no more maintained as
> pointed by discussion thread [1].

This needs to be moved to Config.in.legacy, to inform users that used to
use optee-benchmark that they can't use it anymore.

Applied to master with the ab ove entry added, thanks.

And now when I write this, I notice I forgot to amend the commit before
I pushed, so I did a separate commit. Dang...

Regards,
Yann E. MORIN.

> Link: [1] https://github.com/OP-TEE/optee_os/issues/5909
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/Config.in                            |  1 -
>  package/optee-benchmark/Config.in            | 20 --------------------
>  package/optee-benchmark/optee-benchmark.hash |  4 ----
>  package/optee-benchmark/optee-benchmark.mk   | 14 --------------
>  4 files changed, 39 deletions(-)
>  delete mode 100644 package/optee-benchmark/Config.in
>  delete mode 100644 package/optee-benchmark/optee-benchmark.hash
>  delete mode 100644 package/optee-benchmark/optee-benchmark.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index eaac32a01a..53c2d3b077 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2565,7 +2565,6 @@ menu "Security"
>  	source "package/apparmor/Config.in"
>  	source "package/checkpolicy/Config.in"
>  	source "package/ima-evm-utils/Config.in"
> -	source "package/optee-benchmark/Config.in"
>  	source "package/optee-client/Config.in"
>  	source "package/optee-examples/Config.in"
>  	source "package/optee-test/Config.in"
> diff --git a/package/optee-benchmark/Config.in b/package/optee-benchmark/Config.in
> deleted file mode 100644
> index 2070582fbb..0000000000
> --- a/package/optee-benchmark/Config.in
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -config BR2_PACKAGE_OPTEE_BENCHMARK
> -	bool "optee-benchmark"
> -	depends on BR2_USE_MMU # fork()
> -	depends on BR2_TOOLCHAIN_HAS_THREADS # optee-client
> -	depends on !BR2_STATIC_LIBS # optee-client
> -	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # optee-client
> -	select BR2_PACKAGE_OPTEE_CLIENT
> -	select BR2_PACKAGE_LIBYAML
> -	help
> -	  Enable the OP-TEE benchmark package that brings facilities
> -	  for profiling traversal and execution timings when
> -	  invoking OP-TEE. OP-TEE benchmark is a component delivered
> -	  by the OP-TEE project.
> -
> -	  http://github.com/linaro-swg/optee_benchmark
> -
> -comment "optee-benchmark needs a toolchain w/ threads, dynamic library, headers >= 4.3"
> -	depends on BR2_USE_MMU
> -	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
> -		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3
> diff --git a/package/optee-benchmark/optee-benchmark.hash b/package/optee-benchmark/optee-benchmark.hash
> deleted file mode 100644
> index d74a24c8ab..0000000000
> --- a/package/optee-benchmark/optee-benchmark.hash
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -# From https://github.com/linaro-swg/optee_benchmark/archive/3.19.0/optee-benchmark-3.19.0.tar.gz
> -sha256  32f41854bf07eb7bb89dfc702da023c3a99518c33fbe7edf0e1f004e29a8c90c  optee-benchmark-3.19.0.tar.gz
> -# Locally computed
> -sha256  0571be5b739142dc3e40e0a4e7e30d4ab8bff0d4d606a3f2db2010745587d383  LICENSE
> diff --git a/package/optee-benchmark/optee-benchmark.mk b/package/optee-benchmark/optee-benchmark.mk
> deleted file mode 100644
> index 338a51ada4..0000000000
> --- a/package/optee-benchmark/optee-benchmark.mk
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -################################################################################
> -#
> -# optee-benchmark
> -#
> -################################################################################
> -
> -OPTEE_BENCHMARK_VERSION = 3.19.0
> -OPTEE_BENCHMARK_SITE = $(call github,linaro-swg,optee_benchmark,$(OPTEE_BENCHMARK_VERSION))
> -OPTEE_BENCHMARK_LICENSE = BSD-2-Clause
> -OPTEE_BENCHMARK_LICENSE_FILES = LICENSE
> -
> -OPTEE_BENCHMARK_DEPENDENCIES = optee-client libyaml
> -
> -$(eval $(cmake-package))
> -- 
> 2.25.1
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
