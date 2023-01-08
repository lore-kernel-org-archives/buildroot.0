Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 179D6C54EBD
	for <buildroot@archiver.kernel.org>; Sun,  8 Jan 2023 15:52:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EFC081CE7;
	Sun,  8 Jan 2023 15:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EFC081CE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tLdP4jiOutC7; Sun,  8 Jan 2023 15:52:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E2DC081CE1;
	Sun,  8 Jan 2023 15:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E2DC081CE1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 79FEF1BF360
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:52:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55D2460A46
 for <buildroot@lists.busybox.net>; Sun,  8 Jan 2023 15:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55D2460A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iothwp_v7dVB for <buildroot@lists.busybox.net>;
 Sun,  8 Jan 2023 15:52:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 589BA608F5
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 589BA608F5
 for <buildroot@buildroot.org>; Sun,  8 Jan 2023 15:52:35 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 5B89D5FFAB;
 Sun,  8 Jan 2023 16:52:30 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 08 Jan 2023 16:52:30 +0100
Date: Sun, 8 Jan 2023 16:52:30 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230108155230.GD151997@scaer>
References: <20221230175350.412551-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221230175350.412551-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673193152;
 bh=pYa6pRbGfNf4nL3ykssFjz/3gGTlMf3pe5wRzmPZHOw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M6z3SnUClCt95ToCOUj8m43EjVw+7BYhHjMOPE+3rl+1flBymNFEKKcVP9gxSwd/S
 4JtCVHg+yaUBsIo3FzCLGMIm9lHpTXnVcTi719ZfP6C3VODoiV1afCAbUgD2XGwSts
 hlebOaXsCPmSFFKRBs0wWCG/j7ZtvtGQn8IEfkJsS9ZY5+7SzWuPBvieI7Pjxi+w2p
 6GLL7cCy9MsxRkloIEp3yq8UYp9M29odz72xdNz0zgkCf8lgF7YA9LAoICe7IVnRWf
 2X/0rvXc/d8hAiSE3D86cP2gLGrmxlb979qHEkJ8dotaFgyssXSwE0GgxU3Edyhwwh
 tRBBbQWY9rIEA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M6z3SnUC
Subject: Re: [Buildroot] [PATCH 1/1] package/crun: needs fexecve
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

Fabrice, All,

On 2022-12-30 18:53 +0100, Fabrice Fontaine spake thusly:
> crun unconditionally uses fexecve since its addition in commit
> 530d6f661e506a4774b7236cb93d65f669adbc92 and
> https://github.com/containers/crun/commit/ce4dfbb97a8a05bef125030eaa6c46c07a5f9344:
> resulting in the following uclibc build failure:
> 
> /tmp/instance-11/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arceb-snps-linux-uclibc/9.2.1/../../../../arceb-snps-linux-uclibc/bin/ld: src/libcrun/crun-cloned_binary.o: in function `ensure_cloned_binary':
> cloned_binary.c:(.text+0x1006): undefined reference to `fexecve'

I slightly extended the commit log to refer to commit 6e3f7fbc072c,
which made runc also unavailable for uclibc toolchain for the exact
same reason (crun having copied from runc; damn, that naming is not
confusing at all...)

> Fixes:
>  - http://autobuild.buildroot.org/results/e1f4ef2b392c0e7161390ba0f97d6eef3bd12e9c
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/crun/Config.in | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/crun/Config.in b/package/crun/Config.in
> index 5def7001c1..fa0894e126 100644
> --- a/package/crun/Config.in
> +++ b/package/crun/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_CRUN
>  	bool "crun"
> -	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # no fexecve
> +	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_MUSL
>  	select BR2_PACKAGE_YAJL # libocispec
>  	help
>  	  crun is a fast and low-memory OCI Container Runtime in C.
>  
>  	  https://github.com/containers/crun
> +
> +comment "crun needs a glibc or musl toolchain"
> +	depends on BR2_TOOLCHAIN_USES_UCLIBC
> -- 
> 2.35.1
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
