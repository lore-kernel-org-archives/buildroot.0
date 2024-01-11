Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E3FC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 18:49:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAE2342CF3;
	Thu, 11 Jan 2024 18:49:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAE2342CF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4VjUvHu1ghDo; Thu, 11 Jan 2024 18:49:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C8DF42CC7;
	Thu, 11 Jan 2024 18:49:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C8DF42CC7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D4BA1BF255
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 661DB82291
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 18:49:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 661DB82291
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fBFOjptRFh2n for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 18:49:02 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 612938227F
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 18:49:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 612938227F
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9C690B00572;
 Thu, 11 Jan 2024 19:48:58 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 19:48:58 +0100
Date: Thu, 11 Jan 2024 19:48:58 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaA4GvpdWkjt9kb5@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704998940;
 bh=hg3k0obm+/aZxP6V/vrsi3IpORWdWVC67B7aJOHJBFw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=kDTPPogwQfcMljonKZXdMcU+onNThkJiUlVITc1lkg8Utea+shx59raUq++TdceUr
 4o0I9haeHcEF4gXOfzqSj7N5ZeMRi1FSX30gNtekYXqz2gc4zMX3Fm83Uks4xw/nzQ
 wnk3S+F9yC8K8M2S2lCi4SA5UjVh8Bb+wz3u4rJ7l4hJlE3kPMsUglHJ5yVeiSG8i3
 D/AIYhof7cWCGNqHc8qcS+Sei9TO90mxiXrkztS/EvGbP8KO1qSI5zBh2Wuo78zAeU
 WLWsyY0VsyrF2O/5paxa6JM4DTIiZAfe/BCDUY3yBrfmT1ewbCCUPX28R9e8CrHbwV
 3omRvfct64Lpg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=kDTPPogw
Subject: Re: [Buildroot] [PATCH v3 08/11] package/flutter-sdk-bin: add dart
 arguments for different runtime modes
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

ADam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> Now that profile mode is an option for the flutter-engine package, the logic
> in package/flutter-sdk-bin/flutter-sdk-bin.mk is no longer sufficient.
> 
> Add an ifeq statement for FLUTTER_ENGINE_RUNTIME_MODE_PROFILE and set the
> following logic, borrowed from
> https://github.com/meta-flutter/meta-flutter/blob/kirkstone/conf/include/flutter-app.inc#L239
> 
> ```
> HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS = --track-widget-creation
> HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = true
> ```
> 
> The FLUTTER_ENGINE_RUNTIME_MODE_PROFILE also sets
> HOST_FLUTTER_SDK_BIN_SDK_PRODUCT to false, and the
> HOST_FLUTTER_SDK_BIN_SDK_ROOT to
> $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk. Which is the
> same as Debug mode.
> 
> The -Ddart.vm.profile option is no longer hard coded to false and is set to
> the value of the HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE variable.
> 
> Finally, add the following new variables to HOST_FLUTTER_SDK_BIN_DART_ARGS:
>   - HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS
>   - HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
>  package/flutter-sdk-bin/flutter-sdk-bin.mk | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/package/flutter-sdk-bin/flutter-sdk-bin.mk b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> index a28cf645f3..e7fd09cb56 100644
> --- a/package/flutter-sdk-bin/flutter-sdk-bin.mk
> +++ b/package/flutter-sdk-bin/flutter-sdk-bin.mk
> @@ -55,13 +55,20 @@ define HOST_FLUTTER_SDK_BIN_INSTALL_CMDS
>  endef
>  
>  ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> -HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
> -	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
> +HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS = --enable-asserts
>  HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
> +HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
> +else ifeq ($(FLUTTER_ENGINE_RUNTIME_MODE_PROFILE),y)
> +HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS = --track-widget-creation
> +HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = false
> +HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk
> +HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = true
>  else
> -HOST_FLUTTER_SDK_BIN_SDK_ROOT = \
> -	$(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
> +HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS =
> +HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS =
>  HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = true
> +HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
> +HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
>  endif

This if-elif-else block is not in the same order as the one to enable
profiling in flutter-engine. Here you have: debug, profiling, release,
while in flutter-engine the order is: profiling, debug, release.

Shouldn't the two match, i.e. should we swap the debug and profiling
blocks here?

If so, I can do so when applying.

(Also, the commit log is descriptive, not explanatory, but I can trimmed
it to the needed info when applying, too).

Regards,
Yann E. MORIN.

>  # The Order matters.Taken from:
> @@ -73,8 +80,10 @@ HOST_FLUTTER_SDK_BIN_DART_ARGS = \
>  	--sdk-root $(HOST_FLUTTER_SDK_BIN_SDK_ROOT) \
>  	--target=flutter \
>  	--no-print-incremental-dependencies \
> -	-Ddart.vm.profile=false \
> +	-Ddart.vm.profile=$(HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE) \
>  	-Ddart.vm.product=$(HOST_FLUTTER_SDK_BIN_SDK_PRODUCT) \
> +	$(HOST_FLUTTER_SDK_BIN_DEBUG_FLAGS) \
> +	$(HOST_FLUTTER_SDK_BIN_PROFILE_FLAGS) \
>  	--aot \
>  	--tfa \
>  	--target-os linux \
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
