Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76747C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02437401E2;
	Mon,  8 Jan 2024 20:32:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02437401E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xuboAV7tNszJ; Mon,  8 Jan 2024 20:32:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44EDC40181;
	Mon,  8 Jan 2024 20:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44EDC40181
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C92A91BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AF58841E13
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF58841E13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E5kg40BDQ4sV for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:32:47 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FD6441E21
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 20:32:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FD6441E21
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A815560135;
 Mon,  8 Jan 2024 21:32:40 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 21:32:40 +0100
Date: Mon, 8 Jan 2024 21:32:40 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZxb6CjIUOyhtLQX@landeda>
References: <20240106220531.3285689-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240106220531.3285689-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704745964;
 bh=sWeiLadg3J2zd0aIlm7KwEXq0CusDxoahRgW+I+lIao=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sE0kdf89w3F5B22k9vX9ddEIarD1DoFTYRt03qmA/CLY/GMzyjyk6GQ1+vfHNrRfa
 0n0pGStt6O6Z6YlxQJhMXDc5rXY+Ycuw0yQcSVYofdyBb2h6p+ZUU3CUCTy4OFJFUC
 Ylf70AzanQeWNE7BQBD2Edd7nuZultr5QVKYJ5qxswQEFUwekBZOXvwDHwdTgOKEHq
 CXHc4PEjfE+XIFEsey+bJ5M+xS0oNiinUK0ElGi25CxhdVUt4C/EAq2jsjO3iEXu6q
 1KA1W7L/25a2rjlBeUz919aj6gZDI8PQhUUFtUsRlz2EhHpppUL87yIdFku9qiKOHH
 9NYWy3La7hQNw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=sE0kdf89
Subject: Re: [Buildroot] [PATCH 1/1] package/libutempter: fix dependencies
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabricem, All,

On 2024-01-06 23:05 +0100, Fabrice Fontaine spake thusly:
> Commit 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b forgot to add
> dependencies resulting in the following static build failure:
> 
> /home/autobuild/autobuild/instance-5/output-1/host/bin/arm-buildroot-linux-uclibcgnueabi-gcc -Wl,-z,relro -Wl,-stats  -static  -shared \
> 	-Wl,-soname,libutempter.so.0,--version-script=libutempter.map,-z,defs \
> 	-lc iface.os -o libutempter.so
> /home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/autobuild/autobuild/instance-5/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
> __uClibc_main.c:(.text+0x190): undefined reference to `__fini_array_start'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/781ab393455f0e6823b850f474f6fe38b27d8efa
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libutempter/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/libutempter/Config.in b/package/libutempter/Config.in
> index a06a240418..5b79c1e44d 100644
> --- a/package/libutempter/Config.in
> +++ b/package/libutempter/Config.in
> @@ -1,5 +1,7 @@
>  config BR2_PACKAGE_LIBUTEMPTER
>  	bool "libutempter"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_14
> +	depends on !BR2_STATIC_LIBS

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	help
>  	  The libutempter library provides interface for terminal
>  	  emulators such as screen and xterm to record user
> -- 
> 2.43.0
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
