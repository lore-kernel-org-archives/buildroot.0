Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5411C47073
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 23:21:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6556E43772;
	Wed, 10 Jan 2024 23:21:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6556E43772
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wUmKLF0YQ6qc; Wed, 10 Jan 2024 23:21:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B4C443778;
	Wed, 10 Jan 2024 23:21:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5B4C443778
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 939311BF398
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:21:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 799BB61591
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 23:21:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 799BB61591
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gN76XqW9hMwt for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 23:21:34 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8E13D61588
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:21:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E13D61588
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 88B72B0053D;
 Thu, 11 Jan 2024 00:21:29 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 00:21:29 +0100
Date: Thu, 11 Jan 2024 00:21:29 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZZ8meXMGuT2Z0YhG@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-4-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704928891;
 bh=YYlzaQc2aPeVYRvrvXtlaahV4W40XMQtqYV5cvOsTb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=L2SzPVwpmOWz/RWP6y89wKfPu9GImsWuBbl6dQtZhyYkaNlrZiKX/869wwu3YmmWl
 6ebPt+KtLCjnmSOOVyYgy/FUJxbUKTDQUI+WTAzPM28Al/7zuxKgpmsiPssv+t1kwO
 +iDZ1nELRTSxV7dy8nu76o6cbJqklwzwYXn+A5M62cA97Klun7e0CY0IjOHTXvBgtS
 8kISrcW8z2bGJAwSU2+/HgOq1YIFGAxx2eV2ScgtxDlmP0n29QtXPKCqi2D96nK3BZ
 IDaPCjZybmXzfRcy3l36iX7u6PaNDwPsF1iFMuuazvhACD+4uoDz3X/90T+Y5ssM21
 bIffhvFSjRC1Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=L2SzPVwp
Subject: Re: [Buildroot] [PATCH v3 03/11] package/flutter-sdk-bin: bump
 version to 3.16.5
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> On line 66 of flutter_tools/lib/runner.dart, the following lines have been
> replaced:
> 
> ```
> if (args.contains('--disable-telemetry') &&
>             args.contains('--enable-telemetry'))
> ```
> 
> with the following:
> 
> ```
> if (args.contains('--disable-analytics') &&
>     args.contains('--enable-analytics')) {
> ```
> 
> As such, the option in package/flutter-sdk-bin/flutter-sdk-bin.mk on line 27
> changes from "--disable-telemetry" to "--disable-analytics."

I've shortenned the above to just state that upstream had changed the
name of the option.

> A subsequent look at the rest of the file including the logic around the
> change of the name of the above option provides no other elevant changes
> that would apply to this package update.
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> v2 -> v3: Updted to 3.16.5
> 
>  package/flutter-sdk-bin/flutter-sdk-bin.hash | 2 +-
>  package/flutter-sdk-bin/flutter-sdk-bin.mk   | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.hash b/package/flutter-sdk-bin/flutter-sdk-bin.hash
> index a204de1807..f0a855f2c9 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.hash
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated
> -sha256  b6bc6f93423488c67110e0fe56523cd2260f3a4c379ed015cd1c7fab66362739  flutter_linux_3.13.9-stable.tar.xz
> +sha256  57e59fa3a31be7e87b3847cdf782f1323578bbf70a0cd35f3615f01ab429ac29  flutter_linux_3.16.5-stable.tar.xz
>  sha256  a598db94b6290ffbe10b5ecf911057b6a943351c727fdda9e5f2891d68700a20  LICENSE
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index e8e71b6ab0..a28cf645f3 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FLUTTER_SDK_BIN_VERSION = 3.13.9
> +FLUTTER_SDK_BIN_VERSION = 3.16.5
>  FLUTTER_SDK_BIN_SITE = https://storage.googleapis.com/flutter_infra_release/releases/stable/linux
>  FLUTTER_SDK_BIN_SOURCE = flutter_linux_$(FLUTTER_SDK_BIN_VERSION)-stable.tar.xz
>  FLUTTER_SDK_BIN_LICENSE = BSD-3-Clause
> @@ -25,7 +25,7 @@ HOST_FLUTTER_SDK_BIN_ENV = \
>  HOST_FLUTTER_SDK_BIN_CONF_OPTS = \
>  	--clear-features \
>  	--no-analytics \
> -	--disable-telemetry \
> +	--disable-analytics \
>  	--enable-custom-devices \
>  	--enable-linux-desktop \
>  	--no-enable-android \
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
