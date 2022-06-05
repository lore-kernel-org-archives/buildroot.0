Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D51E0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:41:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 861228406A;
	Sun,  5 Jun 2022 19:41:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SMlkGCLdFQK4; Sun,  5 Jun 2022 19:41:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A65EF840D9;
	Sun,  5 Jun 2022 19:41:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 27D911BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16F1F61283
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id g5B8AD579pas for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:41:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9E24F6129B
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:41:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:3d1d:2cca:75e8:9e80])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 6514F7802E5;
 Sun,  5 Jun 2022 21:41:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1654458100;
 bh=oEEoCWHBXy8ZoI4AMNez4dbAarn6qe1SGS0NfGj7uok=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZGnZpUHWR28OOrU+fbHgSVBVxcD2ic+UARV4vFW3s4Ao442NAfIcN3ly60egc1CH6
 f10Tjp5K/H6lBXUGoqBuS4tVfsy28FZLx7s8cY8/FUXwVp76zXQa1KQeiTWAsojCKG
 W31t86UpRdco2EjHn3ooYLPGd2tr8n6POFOcmNLDGWcxD0F5rf0qYVii3K26WVNxPM
 KLUjff/qH8XTVeIyMJ073/MGi4VIpY2R4oI6HFsylCQlQ/a6copVvnMTLz+ZST/Iy8
 3U47vn85kkfGArfl5NeSre4Y4FJw0fsORkMV5sp760rDNH6G9L9skvhluurMiW0KqK
 e+0Xz87VXsdvA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 05 Jun 2022 21:41:38 +0200
Date: Sun, 5 Jun 2022 21:41:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220605194138.GS427639@scaer>
References: <20220605155910.1927906-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220605155910.1927906-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/linux-tools: perf needs dynamic
 library
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

On 2022-06-05 17:59 +0200, Fabrice Fontaine spake thusly:
> traceevent needs dynamic library since its addition in kernel 3.14 and
> https://github.com/torvalds/linux/commit/c877bbd8eceb14c5eac6779cc804fa8b34044736:
> 
> event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
>    10 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/24206071721479a6ba4d0267e7e20ef9498e1e05
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/linux-tools/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index 6217fcfb7a..131380cb02 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -50,6 +50,7 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
>  config BR2_PACKAGE_LINUX_TOOLS_PERF
>  	bool "perf"
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on !BR2_STATIC_LIBS # dlfcn.h
>  	select BR2_PACKAGE_LINUX_TOOLS
>  	help
>  	  perf (sometimes "Perf Events" or perf tools, originally
> @@ -69,6 +70,10 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
>  
>  	  https://perf.wiki.kernel.org/
>  
> +comment "perf needs a toolchain w/ dynamic library"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
> +	depends on BR2_STATIC_LIBS
> +
>  if BR2_PACKAGE_LINUX_TOOLS_PERF
>  
>  config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
> -- 
> 2.35.1
> 

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
