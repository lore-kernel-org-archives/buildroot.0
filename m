Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0075C47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 20:28:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7941B605AF;
	Thu, 11 Jan 2024 20:28:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7941B605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wt3NMednE5p4; Thu, 11 Jan 2024 20:28:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EC76F76B;
	Thu, 11 Jan 2024 20:28:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 97EC76F76B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EA63E1BF2E5
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2C898401D
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 20:28:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C898401D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2zVUdsFN-FEN for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 20:28:08 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 716928401B
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 20:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 716928401B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id BC836B005A6;
 Thu, 11 Jan 2024 21:28:04 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Jan 2024 21:28:04 +0100
Date: Thu, 11 Jan 2024 21:28:04 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <ZaBPVFJXablPSqB0@landeda>
References: <20240102235957.3072102-1-adam.duskett@amarulasolutions.com>
 <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102235957.3072102-9-adam.duskett@amarulasolutions.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1705004886;
 bh=nh/Q9WerbR8QO75Wt2561Tph6CRZDDoBLPXrjqaiOu4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I4AEfPNBZT2F9PRL3s6pFXTK0dBbKApb4WqXBv7qsQv6+j5BoZfCuCFcehLLY0o4e
 UhvXso9P3/kP1Z7SiHkOBHIuNlvda4UzLYS1pPXopO3OB6AygiB0PYxQ5gklCtsbVx
 gEAc+gA7Br8JSN5TdbpyFwofzNg5MLfKlcLYemNx/jD1EdK/fLjxF3robFw0GYoXEW
 S7Q4QfSIf5mbWqyP9iTnzOrPl0DHMG5XTUvaFTEp+Q8BpYBq/0Ut36kKaCP+3tqd50
 0gdGw4qH3p53YahB6awQhZ8Xc0vBX5uIGVgCgsoQfqfL7sfnv9UG5nrmL7sVKUQZ0M
 ZJNO8GpLPosKA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=I4AEfPNB
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

Adam, All,

On 2024-01-02 16:59 -0700, Adam Duskett spake thusly:
> Now that profile mode is an option for the flutter-engine package, the logic
> in package/flutter-sdk-bin/flutter-sdk-bin.mk is no longer sufficient.
> 
> Add an ifeq statement for FLUTTER_ENGINE_RUNTIME_MODE_PROFILE and set the
> following logic, borrowed from
> https://github.com/meta-flutter/meta-flutter/blob/kirkstone/conf/include/flutter-app.inc#L239

This file no longer has 239 lines today (as of commit 86ab854), as it
seems it was exploded into a few files at least. So I changed the URL
to just point to the directory, not to a specific file and line.

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

This commit log is too descriptive, when we need explanations. I've
reworded and elided parts of it.

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

The debug block was not defining _SDK_VM_PROFILE, which would have
passed a -Ddart.vm.profile=  (i.e. nothing right of the equal sign).

I've added an assignment to =false.

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

No need to set variables to an empty string; unset variables in make
evealuate to the empty string (and notice how you did not set
_DEBUG_FLAGS in the profile bock, or _PROFILE_FLAGS in the debug block
either). I droipped that when applying.

>  HOST_FLUTTER_SDK_BIN_SDK_PRODUCT = true
> +HOST_FLUTTER_SDK_BIN_SDK_ROOT = $(HOST_FLUTTER_SDK_BIN_SDK_ENGINE)/common/flutter_patched_sdk_product
> +HOST_FLUTTER_SDK_BIN_SDK_VM_PROFILE = false
>  endif

As discussed elsewhere in the thread, I've also swapped the debug and
profiel cases, so that profile wins onver debug.

Applied to master with the above fixes, thanks.

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
