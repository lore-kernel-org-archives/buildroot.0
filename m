Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2E2C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 18:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C4B582C1E;
	Sun, 25 Sep 2022 18:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C4B582C1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Sw863UxiaMC; Sun, 25 Sep 2022 18:17:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 172BA82B9F;
	Sun, 25 Sep 2022 18:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 172BA82B9F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D22E31BF32E
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B67394097B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 18:16:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B67394097B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D_YhRw9lqCWW for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 18:16:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 442BF416BC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 442BF416BC
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 18:16:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4a9f:7e6b:a045:201d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 4E9DA5FFA0;
 Sun, 25 Sep 2022 20:16:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 20:16:50 +0200
Date: Sun, 25 Sep 2022 20:16:50 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925181650.GC1419013@scaer>
References: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925171932.1630739-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664129816;
 bh=se1h0d7zRKai2/DW4+qR8eevMdNs13DGX8RIVGMBvdc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OqGdoAzC55a9IIiAFAFXVAiX3Y/Y6uzkrnmEHgXj0+9UuQeVR37U+KapvW+lIuZp0
 SOXtE/eiR0Rs3N83kk7cmMl9PWE8rtstWJW1mTUjwaY8f7deB4llYGTAzq2T7K7Fb5
 hjbdTU+BRbiqdAbz2TEPVfDQCNcCv7J3n3R15YZwxHmzKqLN8nOm1dQd1oQWCbCSlf
 xgPDIG1P1+O2B97FN0Zh9Ip6aHf4iz8CrB6UJOHth7lC0kMSIqGvRLfX8++BCqVs5F
 qMiAwlAUntW6a2YWIa48i1d5+H9r5z3hGcgfgIU2Vk9KLt0pNYwbrAbycWOVUfwMh+
 pYwKp2N/4gCTw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=OqGdoAzC
Subject: Re: [Buildroot] [PATCH 1/4] package/nodejs: fixup qemu dependencies
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
Cc: Alexandru Ardelean <ardeleanalex@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Tomas, All,

On 2022-09-25 19:19 +0200, Thomas Petazzoni spake thusly:
> Commit 1facb09b94bf806b301868539185c0ff9ddffee2 ("package/nodejs:
> build host-nodejs only if we're installing modules with NPM") forgot
> to account for the dependency on Qemu. Now that nodejs no longer
> depends on host-nodejs, but needs host-qemu, we need to make sure that
> nodejs selects the relevant BR2_PACKAGE_HOST_QEMU options.
> 
> So this patch:
> 
>  - Drops the dependency of BR2_PACKAGE_NODEJS_ARCH_SUPPORTS on
>    BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET, which was incorrect: we
>    don't care about running Qemu on the target. We care about
>    host-qemu supporting the emulation of the target architecture,
>    which is what BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS is for.
> 
>  - Adds the dependency to the relevant BR2_PACKAGE_HOST_QEMU options
>    to BR2_PACKAGE_NODEJS, so that host-qemu is built with the
>    appropriate features needed to build the target nodejs.
> 
>  - Removes the qemu related dependencies from host-nodejs, which does
>    not need Qemu at all.
> 
> Without this change the build of nodejs without npm enabled is broken
> as the host-qemu that gets built does not have all the features that
> are needed. There are no autobuild failures at this point, however.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nodejs/Config.in      | 4 +++-
>  package/nodejs/Config.in.host | 4 ----
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/nodejs/Config.in b/package/nodejs/Config.in
> index 8d0bd8fd60..5375dfeacd 100644
> --- a/package/nodejs/Config.in
> +++ b/package/nodejs/Config.in
> @@ -6,7 +6,7 @@ config BR2_PACKAGE_NODEJS_ARCH_SUPPORTS
>  	default y if BR2_aarch64 || BR2_i386 || BR2_x86_64
>  	# libuv
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> -	depends on BR2_PACKAGE_QEMU_ARCH_SUPPORTS_TARGET
> +	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  
>  comment "nodejs needs a toolchain w/ C++, dynamic library, NPTL, gcc >= 7, wchar, host gcc >= 8"
>  	depends on BR2_USE_MMU
> @@ -31,6 +31,8 @@ config BR2_PACKAGE_NODEJS
>  	select BR2_PACKAGE_HOST_PYTHON3
>  	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
>  	select BR2_PACKAGE_HOST_PYTHON3_SSL
> +	select BR2_PACKAGE_HOST_QEMU
> +	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
>  	select BR2_PACKAGE_C_ARES
>  	select BR2_PACKAGE_LIBUV
>  	select BR2_PACKAGE_ZLIB
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> index 4ceaf0c73e..f7f2b80a9b 100644
> --- a/package/nodejs/Config.in.host
> +++ b/package/nodejs/Config.in.host
> @@ -1,12 +1,9 @@
>  config BR2_PACKAGE_HOST_NODEJS
>  	bool "host nodejs"
> -	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	depends on BR2_HOST_GCC_AT_LEAST_8
>  	select BR2_PACKAGE_HOST_PYTHON3
>  	select BR2_PACKAGE_HOST_PYTHON3_BZIP2
>  	select BR2_PACKAGE_HOST_PYTHON3_SSL
> -	select BR2_PACKAGE_HOST_QEMU
> -	select BR2_PACKAGE_HOST_QEMU_LINUX_USER_MODE
>  	help
>  	  Event-driven I/O server-side JavaScript environment based on
>  	  V8.
> @@ -14,5 +11,4 @@ config BR2_PACKAGE_HOST_NODEJS
>  	  http://nodejs.org/
>  
>  comment "host nodejs needs a host gcc >= 8"
> -	depends on BR2_PACKAGE_HOST_QEMU_USER_ARCH_SUPPORTS
>  	depends on !BR2_HOST_GCC_AT_LEAST_8
> -- 
> 2.37.3
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
