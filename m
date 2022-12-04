Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17B96C4332F
	for <buildroot@archiver.kernel.org>; Sun,  4 Dec 2022 11:17:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8803481D0C;
	Sun,  4 Dec 2022 11:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8803481D0C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id foJgkgYjUQ3N; Sun,  4 Dec 2022 11:17:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C75FE81CDC;
	Sun,  4 Dec 2022 11:17:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C75FE81CDC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AF5F71BF3B0
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9387D4049C
 for <buildroot@lists.busybox.net>; Sun,  4 Dec 2022 11:17:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9387D4049C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Uq0yUhBTvt1t for <buildroot@lists.busybox.net>;
 Sun,  4 Dec 2022 11:17:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4248940499
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4248940499
 for <buildroot@buildroot.org>; Sun,  4 Dec 2022 11:17:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d16b:268a:13f6:6145])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id DC0FF19F5A6;
 Sun,  4 Dec 2022 12:17:22 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 04 Dec 2022 12:17:22 +0100
Date: Sun, 4 Dec 2022 12:17:22 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Etienne Carriere <etienne.carriere@linaro.org>
Message-ID: <20221204111722.GK3302@scaer>
References: <20221130075452.2507453-1-etienne.carriere@linaro.org>
 <20221130075452.2507453-6-etienne.carriere@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221130075452.2507453-6-etienne.carriere@linaro.org>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670152645;
 bh=y0OrKLgXxT1R4jOFGJKV3hylCXEh2cTQA4w5qprbgPU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XNWaU3uqWAM3/THLtK/zWbOiYNJmgEZxTZWw1Ep9UahsfG8W8TfWsDVun6crjBGNs
 g/l/fGyxNKBigfM0086KNXbnRaE3C2drUoLCJvg+SqZbEtveZaYww7zW/WNUvxBmXe
 OBS5EfR21zZsYCa4kdP4obZRBE8v/aKQzpXKwvnU90q2h9AmOmYRWai94wnlZEl63R
 o29tc0z7AAIrw2BxrcGNniz6wVf5BZxR1ZbuZAOFkl5B5v6iTquxOYKzFlsZR+ixyn
 VB92pODqQ2pGW7c/iSBKSeDwCXSHst+103Tyj/CmnC6xy0nzhFQcFLGVdgXECTuV71
 mk1lannv5dzTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XNWaU3uq
Subject: Re: [Buildroot] [PATCH 6/7] package: optee-client: select
 util-linux-libs, libuuid and pkgconf
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

Etienne, All,

On 2022-11-30 08:54 +0100, Etienne Carriere spake thusly:
> In order to use login methods `TEEC_LOGIN_USER` and `TEEC_LOGIN_GROUP`,
> a user space application must initialize the tokens with the SHA1
> hashed UUID of the user or group.
> 
> Select host-pkgconf, util-linux and libuuid in order to use `libuuid`
> and add supporting libraries to optee_client for this type of ACL based
> login initialization.

Looking at the upstream code for optee-client, it looks like this is a
mandatory dependency, so that should be part of the patch that bumps the
version. Otherwise, this means that just applying the version bumps
introduces breakage.

Regards,
Yann E. MORIN.

> This change is based on commit [1] from Eero Aaltonen, merged in OP-TEE
> test build environment.
> 
> Link: [1] https://github.com/OP-TEE/build/commit/4a27543494278a5d93e2f44d58e413d90739b08a
> Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> ---
>  package/optee-client/Config.in       | 3 +++
>  package/optee-client/optee-client.mk | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/optee-client/Config.in b/package/optee-client/Config.in
> index cc7f176c77..ed7da4edbc 100644
> --- a/package/optee-client/Config.in
> +++ b/package/optee-client/Config.in
> @@ -2,6 +2,9 @@ config BR2_PACKAGE_OPTEE_CLIENT
>  	bool "optee-client"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_3 # MMC_IOC_MULTI_CMD
> +	select BR2_PACKAGE_UTIL_LINUX
> +	select BR2_PACKAGE_UTIL_LINUX_LIBS
> +	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
>  	help
>  	  Enable the OP-TEE client package that brings non-secure
>  	  client application resources for OP-TEE support. OP-TEE
> diff --git a/package/optee-client/optee-client.mk b/package/optee-client/optee-client.mk
> index 54cc112c5c..a671b66662 100644
> --- a/package/optee-client/optee-client.mk
> +++ b/package/optee-client/optee-client.mk
> @@ -9,6 +9,7 @@ OPTEE_CLIENT_SITE = $(call github,OP-TEE,optee_client,$(OPTEE_CLIENT_VERSION))
>  OPTEE_CLIENT_LICENSE = BSD-2-Clause
>  OPTEE_CLIENT_LICENSE_FILES = LICENSE
>  OPTEE_CLIENT_INSTALL_STAGING = YES
> +OPTEE_CLIENT_EXT_DEPENDENCIES = host-pkgconf util-linux-libs
>  
>  OPTEE_CLIENT_CONF_OPTS = \
>  	-DCFG_TEE_FS_PARENT_PATH=$(BR2_PACKAGE_OPTEE_CLIENT_TEE_FS_PATH) \
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
