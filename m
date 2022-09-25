Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51E0C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 07:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 543BF60AFE;
	Sun, 25 Sep 2022 07:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 543BF60AFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5TS-0KReWFId; Sun, 25 Sep 2022 07:25:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EFAB607BC;
	Sun, 25 Sep 2022 07:25:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3EFAB607BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B9091BF5DC
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3233E8195D
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 07:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3233E8195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B902nY6sQoIi for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 07:25:43 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E2D3818C4
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E2D3818C4
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 07:25:42 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 773D613F87E;
 Sun, 25 Sep 2022 09:25:02 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 09:25:02 +0200
Date: Sun, 25 Sep 2022 09:25:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925072502.GU1419013@scaer>
References: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220924205327.1489102-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664090708;
 bh=ZROBqX/Naw6IUowv3hM635wAK8kTLHRFAZ6FI5XcI1c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZwccbfnmfoFLkC2QBotQMUS4w3/xUvJnvgn1ZgQVgghdYwBaDZBMGys5ctUhM4syx
 nyoFWzccLOBrtmcbxy5GUsWirRolgySXlyl23aS7cMSSvGYHbA4T9aFVPyqhHY8xz/
 DFNw8t18r22kUSm/7D/9hLLIhhkiBgpdzxVz4zSQgRdyU7vtWxey7PaW6bX09riqIA
 yjITYcE/mjPhOqPP2RhNqkyjeEBfhuVMFAY8KLyx0StHWGOtQBzIDb9f/EdH8+Vtea
 ftWbJsCUCqvfzW4QDeb6OS/n6tQPDoRIz95fCFHaDhEzJFe/2WF6LOn4k364a27b2M
 DvdqSab7JIZ/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Zwccbfnm
Subject: Re: [Buildroot] [PATCH 1/4] arch/Config.in.xtensa: adjust
 endianness logic to avoid bogus configurations
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
Cc: Jonathan Ben Avraham <yba@tkos.co.il>,
 Romain Naour <romain.naour@gmail.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-24 22:53 +0200, Thomas Petazzoni via buildroot spake thusly:
> The Xtensa architecture supports both LE and BE configurations. When
> BR2_XTENSA_CUSTOM is chosen, a choice in menuconfig to choose between
> LE and BE.
> 
> However, if using the internal toolchain backend, when the
> BR2_XTENSA_OVERLAY_FILE is empty, in practice, the configuration will
> always be big endian. But the choice being present, random
> configuration testing ends up testing configurations where
> BR2_XTENSA_OVERLAY_FILE is empty, but the endianness selected is LE,
> which is incorrect.
> 
> This commit fixes this by:
> 
>  (1) Showing the overlay file option only when building an internal
>      toolchain. For external toolchain configurations, it does not
>      make sense to show it as it will have no effect.

This should be a separate patch.

>  (2) Showing the endianness choice either for internal toolchain
>      configurations with non-empty BR2_XTENSA_OVERLAY_FILE, or for
>      external toolchain configurations.

As an empty BR2_XTENSA_OVERLAY_FILE is not accepted anymore (see below),
this can be simplified to "sharing the endianness chice for internal and
external toolchains".

>  (2) Defaulting to BE when BR2_XTENSA_OVERLAY_FILE is empty.

An empty BR2_XTENSA_OVERLAY_FILE is now no longer accepted, after commit
4cbf7336914f (arch/xtensa: custom configuration requires an overlay).

> Fixes:
>   http://autobuild.buildroot.net/results/702e2886156f291466375dfcf412c20f1aa5857d/

This commit if from August the 15th; I could not find any such failure
since 4cbf7336914f was applied; the last occured 2022-09-08, on commit
d2141f65e449, which is the parent of 4cbf7336914f (there are build
failures on older branches, of course, but not on master).

Regards,
Yann E. MORIN.

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  arch/Config.in.xtensa | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/Config.in.xtensa b/arch/Config.in.xtensa
> index f9d5adb4c9..e9263f888e 100644
> --- a/arch/Config.in.xtensa
> +++ b/arch/Config.in.xtensa
> @@ -14,7 +14,7 @@ endchoice
>  
>  config BR2_XTENSA_OVERLAY_FILE
>  	string "Overlay file for custom configuration"
> -	depends on BR2_XTENSA_CUSTOM
> +	depends on BR2_XTENSA_CUSTOM && BR2_TOOLCHAIN_BUILDROOT
>  	help
>  	  Enter the path to the overlay tarball for a custom processor
>  	  configuration.
> @@ -31,6 +31,7 @@ choice
>  	prompt "Target Architecture Endianness"
>  	default BR2_XTENSA_LITTLE_ENDIAN
>  	depends on BR2_XTENSA_CUSTOM
> +	depends on BR2_XTENSA_OVERLAY_FILE != "" || BR2_TOOLCHAIN_EXTERNAL
>  
>  config BR2_XTENSA_LITTLE_ENDIAN
>  	bool "Little endian"
> @@ -51,7 +52,9 @@ config BR2_XTENSA_USE_MMU
>  
>  config BR2_ENDIAN
>  	default "LITTLE"	if BR2_XTENSA_LITTLE_ENDIAN
> -	default "BIG"		if BR2_xtensa_fsf || BR2_XTENSA_BIG_ENDIAN
> +	default "BIG"		if BR2_XTENSA_BIG_ENDIAN
> +	default "BIG"		if BR2_xtensa_fsf
> +	default "BIG"		if BR2_XTENSA_CUSTOM && BR2_XTENSA_OVERLAY_FILE = ""
>  
>  config BR2_ARCH
>  	default "xtensa"	if BR2_xtensa
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
