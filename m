Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC0BC001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 13:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D32D760B8F;
	Sun, 23 Jul 2023 13:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D32D760B8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Xu7348fnLjk; Sun, 23 Jul 2023 13:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E11E060B15;
	Sun, 23 Jul 2023 13:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E11E060B15
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 177DE1BF575
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 13:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E378A410DF
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 13:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E378A410DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MtQeHd8c886n for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 13:56:25 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 21324410DE
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 13:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21324410DE
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 93F6F5FFAF;
 Sun, 23 Jul 2023 15:56:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 15:56:17 +0200
Date: Sun, 23 Jul 2023 15:56:17 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Cherniaev Andrei <dungeonlords789@naver.com>
Message-ID: <20230723135617.GC2503916@scaer>
References: <20230723112022.15074-1-dungeonlords789@naver.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723112022.15074-1-dungeonlords789@naver.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690120581;
 bh=Cdtw2SNqbR1+KN9oNYB5T57knE+k4fnoKKWwq5Xku1U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nWWIk0VqfZHe7BkPFI1766HCax/4jvOfh7QJZg3MsvQRhQb5T1Kq9KzAcidejJ5pu
 aC1PFd1zvrVyjtgzy6+uiw4rLK1EZSyb2MDSVyGGffZoOAfiJ1jxmyg6umFeMsflvU
 TqxB4A+ZgZBuBCGkVrj8EF+ui6IlcInTeNuh5d8R+B4Zpsr43fWAKU0aIjsjnyeyHn
 6s3uqxoRuEGGbwkdhCkhfi1ldR1uRTGzeEktpe1iQ2n+rPI896xLEWQwG7zHwX7mCD
 bi0vQt/tnprOMq9eT1dyCSE2UoFo/qkP1Bmyp3bRq1oTbZGfmNXqqLPqXvGWYPVmyQ
 xWJy6+r4n4BHQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=nWWIk0Vq
Subject: Re: [Buildroot] [PATCH 1/1] arch/Config.in.x86: add MMX instruction
 set capability for Geode CPU
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
Cc: bagasdotme@gmail.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cherniaev Andrei, All,

On 2023-07-23 20:20 +0900, Cherniaev Andrei spake thusly:
> Currently, there is no MMX support for modern GEODE processors in Buildroot.
> Yet, some packages like ffmpeg can leverage it when the package is built.
> 
> Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
> ---
>  arch/Config.in.x86 | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
> index c770ae3ffe..288d274b0e 100644
> --- a/arch/Config.in.x86
> +++ b/arch/Config.in.x86
> @@ -521,11 +521,24 @@ config BR2_x86_steamroller
>  	select BR2_X86_CPU_HAS_SSE4
>  	select BR2_X86_CPU_HAS_SSE42
>  config BR2_x86_geode
> -	bool "geode"
> -	# Don't include MMX support because there several variant of geode
> -	# processor, some with MMX support, some without.
> -	# See: http://en.wikipedia.org/wiki/Geode_%28processor%29
> +	bool "geode (no mmx)"
> +	help
> +	  For several variant of geode which have not MMX support.
> +	  See
> +	  https://en.wikipedia.org/wiki/Geode_%28processor%29 to
> +	  determine if your particular Geode processor supports MMX or
> +	  not.
> +	depends on !BR2_x86_64
> +config BR2_x86_geode_mmx
> +	bool "geode (with mmx)"
> +	help
> +	  For several variant of geode which have MMX support.
> +	  See
> +	  https://en.wikipedia.org/wiki/Geode_%28processor%29 to
> +	  determine if your particular Geode processor supports MMX or
> +	  not.
>  	depends on !BR2_x86_64
> +	select BR2_X86_CPU_HAS_MMX

    $ make check-package
    arch/Config.in.x86:531: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
    arch/Config.in.x86:531: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    arch/Config.in.x86:540: attributes order: type, default, depends on, select, help (http://nightly.buildroot.org/#_config_files)
    arch/Config.in.x86:540: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    arch/Config.in.x86:541: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I've fixed that when applying (the help text errors are spurious, due to
the previous order issue; still I did reflow them too).

Applied to master with those fixes, thanks.

Regards,
Yann E. MORIN.

>  config BR2_x86_c3
>  	bool "Via/Cyrix C3 (Samuel/Ezra cores)"
>  	depends on !BR2_x86_64
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
