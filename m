Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA06C3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 21:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 021AA822FC;
	Mon,  8 Jan 2024 21:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 021AA822FC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A3Qoqa3i4xq6; Mon,  8 Jan 2024 21:25:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DE44822AE;
	Mon,  8 Jan 2024 21:25:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3DE44822AE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 84B401BF3AA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:25:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D6A241AEC
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 21:25:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D6A241AEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gPn9JgnrC4GS for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 21:25:00 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 584BF418B5
 for <buildroot@buildroot.org>; Mon,  8 Jan 2024 21:25:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584BF418B5
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 05B7F5FFAA;
 Mon,  8 Jan 2024 22:24:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 22:24:52 +0100
Date: Mon, 8 Jan 2024 22:24:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <ZZxoJD28cEghbMB7@landeda>
References: <20240108204352.319621-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240108204352.319621-1-fontaine.fabrice@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704749097;
 bh=XT9kK9glGa4GsMfMf8MS46EQ/kFAFIhMkcVl9FW23n0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M4DqtCX6+/qf7sWcCY4h1VEfSGUi+buZN7Ow2JaE7ukHy6c/dQtsirNQaQOsuIu6h
 LSra/jYzA5v6DXhJngGkPEmemC3ZZHZoVBIpI32zN4gkfw6Bi5PG0VfC8Y8SBscwhs
 JGb3dMT2q5/nyNXNVEz6Ds+bNQXOlIaj1CHwtEN0KdwwtvgMZMEFfh74wXtC2fl+6E
 8Su2MsPZ1xO44R1ay4KVOFjj9M9zCyHgiu2sd7t6MH6lGO9xJWd5nnDF6UToduvqIz
 rDcrukR/4s+mzqE65w9zaxuFih0pid+0MHV6ukYu9Bgmv+3r9+MY4LMNUq1IViQtGC
 abXOAjPtFSVfQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=M4DqtCX6
Subject: Re: [Buildroot] [PATCH 1/1] package/libtraceevent: needs dynamic
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2024-01-08 21:43 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since the addition of the package
> in commit 1474f1b34b178defca1d16d18a2446fadda9a12b:
> 
> ../src/event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
>    10 | #include <dlfcn.h>
>       |          ^~~~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/7802d1ad00293147edda39683f6d3f614dd48263
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
> index adfca4dbe3..62adae4463 100644
> --- a/package/linux-tools/Config.in
> +++ b/package/linux-tools/Config.in
> @@ -104,6 +104,7 @@ endif
>  
>  config BR2_PACKAGE_LINUX_TOOLS_RTLA
>  	bool "rtla"
> +	depends on !BR2_STATIC_LIBS # libtracefs -> libtraceevent

In the past, we used to indeed list the full dependency chain that
caused the inherited dependency.

However, there never a good reasoning behind that (unwritten) rule.

Recently, we've started to drop the full chain to only keep the
first-level inheritance.

Indeed, if one of the package further in the dependency chain loses that
dependency, but the first-level package keeps it, it's going to be
tricky to track and update all those comments.

So, I believe it is better to just list the first-level inheritance.

I think the new reasoning is more sound than the previous one.
That's still an unwritten rule, though... :-(

Applied to master with this little fix, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_LINUX_TOOLS
>  	select BR2_PACKAGE_LIBTRACEFS
>  	help
> @@ -123,6 +124,9 @@ config BR2_PACKAGE_LINUX_TOOLS_RTLA
>  	  not available in Buildroot, so only rtla in kernels 5.19
>  	  onwards is actually supported in Buildroot.
>  
> +comment "rtla needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS
> +
>  config BR2_PACKAGE_LINUX_TOOLS_SELFTESTS
>  	bool"selftests"
>  	depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
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
