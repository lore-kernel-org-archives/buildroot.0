Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1163C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 22:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4446A847B9;
	Sat, 16 Jul 2022 22:04:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4446A847B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w08NGjZ6A7GW; Sat, 16 Jul 2022 22:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53E90847B6;
	Sat, 16 Jul 2022 22:04:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 53E90847B6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99F791BF3D0
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:04:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 74CA6847B1
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 22:04:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74CA6847B1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j8Ub1FzaOEq9 for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 22:04:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39ED6847B6
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39ED6847B6
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 22:04:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4985:d730:3c09:77ac])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 2C8D178031A;
 Sun, 17 Jul 2022 00:04:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 17 Jul 2022 00:04:26 +0200
Date: Sun, 17 Jul 2022 00:04:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220716220426.GN2543@scaer>
References: <20220716134714.611106-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716134714.611106-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658009069;
 bh=XkSBd9rckQibJGRDPoke2WPrlV+4dm3trMlaYb5BPlM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vS426PmR1u8bddGSpCyZIs3PmwhFl4V9UKekMywL/u+v3f7E0FJYJF6TEQJVMtVvb
 amqEFZOg6b4++m0xqdpuBVY/T3PpYAANUAjcfpTomRGB56h7hk9P1SmaXPKEeAMX9U
 OS4kUkvLZsrPenQBtpaLr4mN4cpwY0WcP9UplpKiVLmVapM79qWa58HFiMHsyJ+PnQ
 yfA7CB9Lwu6BlTfQ+sga7l/RoFyN7wBK88DmP6eot4SGtmU3167kA6m5aWPVjTZg6F
 C6HjsDYeI4xrkowMJe5x28sRq+YHQWQ5KlQblZSM5yW5DXGu1yaoPQxiY+7hXvArEJ
 mp7dEnOMlEktA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vS426PmR
Subject: Re: [Buildroot] [PATCH 1/1] package/openssl: fix libressl dependency
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

On 2022-07-16 15:47 +0200, Fabrice Fontaine spake thusly:
> libressl can be built with uclibc on noMMU since bump to version 3.0.2
> in commit 26f42106e8acfd336d8e902da96cd2ac9e63c09d and
> https://github.com/libressl-portable/openbsd/commit/f542e84c859e3fb2728075c702062cce8a0ea93f
> 
> However, uclibc-ng doesn't provide __register_atfork without NPTL
> resulting in the following libressl build failure:
> 
> /nvmedata/autobuild/instance-28/output-1/host/lib/gcc/arceb-buildroot-linux-uclibc/10.3.0/../../../../arceb-buildroot-linux-uclibc/bin/ld: ../../tls/libtls.a(arc4random.c.o): in function `_rs_stir':
> arc4random.c:(.text+0x50c): undefined reference to `__register_atfork'
> 
> So fix the dependency and, while at it, drop the double negation for
> readability
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/2fa4fa10cf19f1f942b6b49b5f6f05339c008cd4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openssl/Config.in | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openssl/Config.in b/package/openssl/Config.in
> index 7bf49b05f6..c7641ecefa 100644
> --- a/package/openssl/Config.in
> +++ b/package/openssl/Config.in
> @@ -34,8 +34,8 @@ config BR2_PACKAGE_LIBRESSL
>  	bool "libressl"
>  	depends on !BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	# uClibc on noMMU doesn't provide __register_atfork()
> -	depends on !(BR2_TOOLCHAIN_USES_UCLIBC && !BR2_USE_MMU)
> +	# uClibc doesn't provide __register_atfork() without NPTL
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_HAS_THREADS_NPTL
>  	help
>  	  LibreSSL is a version of the TLS/crypto stack forked from
>  	  OpenSSL in 2014, with goals of modernizing the codebase,
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
