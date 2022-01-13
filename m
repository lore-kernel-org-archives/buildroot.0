Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2709C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 17:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DC4F60BCB;
	Thu, 13 Jan 2022 17:53:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TXDQ8X7o6uGm; Thu, 13 Jan 2022 17:53:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E4C760A99;
	Thu, 13 Jan 2022 17:52:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0AF671BF4DA
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 065D140105
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 17:52:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwGSSer51CkY for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 17:52:45 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D89C6400E4
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 17:52:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:84d2:7b0:3327:1b6e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0CD9119F576;
 Thu, 13 Jan 2022 18:52:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642096363;
 bh=7G7Gd9X/ROY1Cc1t3BXWwUIu9SbAY4ft8zVnntqpThg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ls8cWmfszD4xcHWEUZWG5ntIJXNWWO+7LzKxx64DvFiHPFg76Zpqdlr2Kxjql4VM4
 j4Fo6mUv3cs25PjxMu2sKUWO9s0m2ezekmEGVrCzOssasppdnz4gFdGCyHKV/Rkrvc
 ZgMjp1PEpW/LT10/iJveALrSOByMpcxd5Hlr50gBHR3GJz+Fm3sSC9WgTye8te3OX2
 JtTBMZE7br5F/9ABn9lJgmDLSGBxx8iQPGphtissp2vJcW1TRmuwFD6QE/aozZU6+9
 ZJtcrs7WsKnTR/TkX4ZLvnoLKTkOiRBJZxjxb3bT9WpzP8owyFmiw+v0VDGu/Qnb59
 2SvjF1XLJNM5A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 13 Jan 2022 18:52:40 +0100
Date: Thu, 13 Jan 2022 18:52:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220113175240.GK1477939@scaer>
References: <20220113075847.3267080-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220113075847.3267080-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libglvnd: needs __sync_*_4
 intrinsics
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

On 2022-01-13 08:58 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:
> 
> /tmp/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sparc-buildroot-linux-uclibc/10.3.0/../../../../sparc-buildroot-linux-uclibc/bin/ld: src/EGL/libEGL.so.1.1.0.p/libegl.c.o: in function `AtomicIncrement':
> libegl.c:(.text+0x614): undefined reference to `__sync_add_and_fetch_4'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a204953020a714057ec6690e63a3ad8ac621acd5
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libglvnd/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
> index 2d99be8632..cd19fde582 100644
> --- a/package/libglvnd/Config.in
> +++ b/package/libglvnd/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_LIBGLVND
>  	bool "libglvnd"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
>  	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	help
>  	  The GL Vendor-Neutral Dispatch library
> @@ -45,4 +46,5 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
>  endif
>  
>  comment "libglvnd needs a toolchain w/ dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on BR2_STATIC_LIBS
> -- 
> 2.34.1
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
