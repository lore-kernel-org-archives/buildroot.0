Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED4FC47258
	for <buildroot@archiver.kernel.org>; Sat, 20 Jan 2024 20:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04A1760F26;
	Sat, 20 Jan 2024 20:35:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04A1760F26
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pxWurnmDGZve; Sat, 20 Jan 2024 20:35:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4867360F07;
	Sat, 20 Jan 2024 20:35:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4867360F07
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E18E41BF31E
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9A3D40275
 for <buildroot@lists.busybox.net>; Sat, 20 Jan 2024 20:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9A3D40275
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qvCsCDXagzpZ for <buildroot@lists.busybox.net>;
 Sat, 20 Jan 2024 20:35:48 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 048EE40003
 for <buildroot@buildroot.org>; Sat, 20 Jan 2024 20:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 048EE40003
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A00D513F86A;
 Sat, 20 Jan 2024 21:35:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Jan 2024 21:35:42 +0100
Date: Sat, 20 Jan 2024 21:35:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZawungZjGBS6Z3Dq@landeda>
References: <20240113194950.11170-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240113194950.11170-1-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705782944;
 bh=QpulpvKTNzD2RY+IH5ZZXNKaT+MDHeT7q4HmhfCH7s8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AlTYOsoQSWtvr6UwFPKUsxrlQ2J13aDlTvATX0poleUP2HqWcu7a21sG0hsMkv2Ne
 U1PCQsbyL4/8nDj2ELmAxAMrnL+BzhCR4534OdhL2ZNKxKnzSwSM9+y3PvqfHsbfLA
 lL4x2cxO5ULLXhH1vP/oiNr2Z5GNLNn6KKQKXXOIG+sknDs1avs1+AKlXjCek49WMT
 gyEQTySQL7IhecrRKF1Vo2Yg5g3stz2WolIjJV0xZY57GA9Y1ekWcCpL62BrRfZFRJ
 egp9SFmWFJc8oWSG9ntXzZ/HvUr6dKhBmqBCCewX0/popp9BSNtM+Zf3eWRSghgvo8
 etG4zVe3IVJDQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AlTYOsoQ
Subject: Re: [Buildroot] [PATCH v4 1/1]
 package/flutter-sdk-bin/Config.in.host: change flutter-pub-cache location
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

On 2024-01-13 12:49 -0700, Adam Duskett spake thusly:
> When running the command "flutter pub get," the plugins are stored in the
> pub-cache directory along with their sha256sum hashes. The default location of
> the pub-cache directory is current $(HOST_DIR)/share/flutter/sdk/.pub-cache,
> which is not an acceptable choice by default because every plugin is
> re-downloaded during every build of a flutter application either during a new
> build or when building with the per-package-directory option enabled.
> 
> Furthermore, keeping the pub-cache in its current location prevents users from
> committing the pub-cache directory to git for faster rebuilds of a
> Buildroot-based system, as users cannot store the pub-cache for later use.
> 
> To fix the above issue completely, the following two changes must occur:
> 
>   - Change the hard-coded Flutter pub-cache location to
>     $(DL_DIR)/br-flutter-pub-cache.
> 
>   - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` and the
>     associated comment about why the build system removes the .pub-cache
>     directory. After further research, the help text of the precache command
>     reads, "Populate the Flutter tool's cache of binary artifacts."
>     The current reasoning listed in the comments is not accurate for a
>     the following reasons:
> 
>     1. We do not want to remove their directory if users already have a pub
>        cache they have symlinked to.
> 
>     2. If the flutter-sdk-bin package previously set up the pub-cache, then
>        the pub-cache directory is set up with the options we want, and there
>        is no reason to remove the pub-cache directory.

I have added a little comment abot the concurrent acces to the shared
pub-cache, thanks for the pointer on IRC!

> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> changes v3 -> v4:
>   - Hardcode the directory to $(DL_DIR)/br-flutter-pub-cache. [Yann]
>   - Remove the `rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache` line. [Yann]
>   - Remove the associated comments about the above line. [Yann]
>   - Expand the commit log.
> 
>  package/flutter-sdk-bin/flutter-sdk-bin.mk | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index 5e5042bea8..2e37e6f036 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -41,11 +41,8 @@ define HOST_FLUTTER_SDK_BIN_CONFIGURE_CMDS
>  	$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/dart --disable-analytics
>  endef
>  
> -# Remove the cache, as we will run precache after setting up flutter and dart
> -# with the new config options.
>  define HOST_FLUTTER_SDK_BIN_BUILD_CMDS
>  	mkdir -p $(HOST_FLUTTER_SDK_BIN_SDK)
> -	rm -rf $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
>  	cd $(@D) && \
>  		$(HOST_FLUTTER_SDK_BIN_ENV) $(@D)/bin/flutter precache;
>  endef
> @@ -104,4 +101,4 @@ HOST_FLUTTER_SDK_BIN_DART_BIN = \
>  $(eval $(host-generic-package))
>  
>  # For target packages to locate said pub-cache
> -FLUTTER_SDK_BIN_PUB_CACHE = $(HOST_FLUTTER_SDK_BIN_SDK)/.pub-cache
> +FLUTTER_SDK_BIN_PUB_CACHE = $(DL_DIR)/br-flutter-pub-cache
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
