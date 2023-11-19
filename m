Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E12D8C072A2
	for <buildroot@archiver.kernel.org>; Sun, 19 Nov 2023 08:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71BDC418B9;
	Sun, 19 Nov 2023 08:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71BDC418B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vk4--7ofpA7K; Sun, 19 Nov 2023 08:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85354418BA;
	Sun, 19 Nov 2023 08:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85354418BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C4B051BF343
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 08:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D23A60B01
 for <buildroot@lists.busybox.net>; Sun, 19 Nov 2023 08:21:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D23A60B01
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u9s2eou1_L1U for <buildroot@lists.busybox.net>;
 Sun, 19 Nov 2023 08:21:26 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F94260A94
 for <buildroot@buildroot.org>; Sun, 19 Nov 2023 08:21:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F94260A94
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4D0B278034D;
 Sun, 19 Nov 2023 09:21:21 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Nov 2023 09:21:21 +0100
Date: Sun, 19 Nov 2023 09:21:21 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231119082120.GM996011@scaer>
References: <20231118221206.1369389-1-adam.duskett@amarulasolutions.com>
 <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231118221206.1369389-5-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700382083;
 bh=6jbNF/5TaDaUi8zOldYBYnU90Tozd4adejnaMP3D2io=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=a6g8gEUvXob3+86cRD6Hg1NfK6bqZTlR3T02k2Da0vOQPLk+MBuq8zqNT3wJ6SfVD
 nh6LRfI0BPqCRw/u7zV0lzRYjetJq7a+KpO8YkJxkKc0vSRLUhgT4ERZKZrQAcFTCL
 7U0DCG4DCLh4fLhc632sQTV4YmEB5UScIn9TEX85KZAKdPDDs1hUuMx0Vl5Gws3PWn
 rccsGGWSFwCyZQIFsr/lBNhVvtRPAkBezJkQ5ZyGFAmjKxSwaoyshl+9XA9PUUaE0d
 Zn/RiEUV64/amjbcwqqqR75u+z0rgXlVDww/n9xTkPtm488NHCR7FkZ145J9sYFdMQ
 N4Nwj7T44o0IA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=a6g8gEUv
Subject: Re: [Buildroot] [PATCH/next v2 5/9]
 package/flutter-sdk-bin/Config.in.host: add pub-cache location option
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

On 2023-11-18 15:12 -0700, Adam Duskett spake thusly:
> When running the command "flutter pub get," the plugins are stored in the
> pub-cache directory along with their sha256sum hashes. The default location
> of the pub-cache directory is $(HOST_DIR)/share/flutter/sdk/.pub-cache.
> While the above location is a perfectly acceptable choice by default, users
> may want to define an alternate location to prevent downloading all of the
> plugins on each fresh build of a Flutter application, and they may want to
> commit the pub-cache directory to their project.
> 
> Add the new option BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION to the
> flutter-sdk-bin/Config.in.host file, and set the default to the current
> default of $(HOST_DIR)/share/flutter/sdk/.pub-cache.

So, this is for caching the downloaded artefacts. It should probably be
non-configurable, and should be moved into a sub-directory iof
BR2_DL_DIR, like we have for cargo:

    8450b7691870 package/pkg-cargo: move CARGO_HOME into DL_DIR

So I would suggest that we do similar for the flutter download cache.

As for wanted to commit that downladed stuff to git: if people want
that, then they would also want to commit all ofthe download stuff, so
just have them point BR2_DL_DIR to a sub-dir of their outter repository.

Regards,
Yann E. MORIN.

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-sdk-bin/Config.in.host     | 11 +++++++++++
>  package/flutter-sdk-bin/flutter-sdk-bin.mk |  2 +-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/package/flutter-sdk-bin/Config.in.host b/package/flutter-sdk-bin/Config.in.host
> index a48714ea7f..0e31a8e0fa 100644
> --- a/package/flutter-sdk-bin/Config.in.host
> +++ b/package/flutter-sdk-bin/Config.in.host
> @@ -14,3 +14,14 @@ config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN
>  	  free and open source.
>  
>  	  https://flutter.dev/
> +
> +if BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
> +
> +config BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION
> +	string "pub-cache location"
> +	default "$(HOST_DIR)/share/flutter/sdk/.pub-cache"
> +	help
> +	  Directory to store cached packages used by Pub with
> +	  Dart/Flutter.
> +
> +endif
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index 9461148dfb..6471c11d4e 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -95,4 +95,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
>  $(eval $(host-generic-package))
>  
>  # For target packages to locate said pub-cache
> -FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> +FLUTTER_SDK_BIN_PUB_CACHE = $(call qstrip,$(BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_PUB_CACHE_LOCATION))
> -- 
> 2.42.0
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
