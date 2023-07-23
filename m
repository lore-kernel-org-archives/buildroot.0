Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46CB9C001DE
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 17:11:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B26C9409C9;
	Sun, 23 Jul 2023 17:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B26C9409C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6YSpEpDfKl08; Sun, 23 Jul 2023 17:11:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2779409B0;
	Sun, 23 Jul 2023 17:11:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2779409B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F2E851BF5B5
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 17:11:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2453B40168
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 16:15:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2453B40168
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BJG8Qq11ig_5 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 16:15:31 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 117734018B
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 16:15:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 117734018B
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 664055FFA5;
 Sun, 23 Jul 2023 18:15:26 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 18:15:26 +0200
Date: Sun, 23 Jul 2023 18:15:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <20230723161526.GK2503916@scaer>
References: <20230721202757.15824-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230721202757.15824-1-ju.o@free.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690128928;
 bh=fJImSXZqw8TXY4vf5Lk/dL+Vdc3iu8HqH65UtR3xEWY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mj4uc3E5KZckZcr6bkihlUg6noFAtdrbbUOgZjrKopXjRS54qSlGL8JmpspyPoFfz
 WxurdV/Y2dM1oODEQYdhuYSziSF5QwX/RtvbbNnaQkk0l5NpDLUBrRZVpdU4pObtXm
 dPi4HqYm37sEQfAAFcrMIHSgkWSlb+X9IASD1Yp5uetZil349FNQjEORp3KTCkTbFN
 8IOxzuhL03dF4QXONq1l5JcFOpApbWhwcDjLzbB/2JawOPuFuA2mS8sSVdhT4qESDy
 8xrHRzbnWQ7TpdFzstdFuaTlpbymGEBtuOfYc1zQEl8Ea7u1QOeTMINRMY05AF92kt
 i+spcQ3MnHQyg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Mj4uc3E5
Subject: Re: [Buildroot] [PATCH 1/1] boot/edk2: introduce a new
 _OVMF_DEBUG_ON_SERIAL option
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

Julien, All,

On 2023-07-21 22:27 +0200, Julien Olivain spake thusly:
> When EDK2 OVMF is built with debug, messages are printed to
> IO port 0x402. Those messages are not shown in the normal
> Qemu emulated serial port. Enabling this option will print
> debug messages on the emulated serial port, potentially
> mixing messages with UEFI serial console output.
> 
> See OVMF README:
> https://github.com/tianocore/edk2/blob/master/OvmfPkg/README
> 
> This option has been useful to debug problems such as [1], in which the
> emulator was hanging at startup without any log. Enabling this option
> show the debug message on the console, before hanging:
> 
>     ...
>     PlatformCpuCountBugCheck: Present=0 Possible=1
>     PlatformCpuCountBugCheck: Broken CPU hotplug register block found. Update QEMU to version 8+, or
>     PlatformCpuCountBugCheck: to a stable release with commit dab30fbef389 backported. Refer to
>     PlatformCpuCountBugCheck: <https://bugzilla.tianocore.org/show_bug.cgi?id=4250>.
>     ...
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2023-July/670807.html
> 
> Signed-off-by: Julien Olivain <ju.o@free.fr>
> ---
>  boot/edk2/Config.in | 15 +++++++++++++++
>  boot/edk2/edk2.mk   |  6 ++++++
>  2 files changed, 21 insertions(+)
> 
> diff --git a/boot/edk2/Config.in b/boot/edk2/Config.in
> index 855a62f70b..bed503b168 100644
> --- a/boot/edk2/Config.in
> +++ b/boot/edk2/Config.in
> @@ -108,6 +108,21 @@ comment "QEMU SBSA depends on ATF not using EDK2 as BL33"
>  
>  endchoice
>  
> +config BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL
> +	bool "OVMF Debug on Serial"
> +	depends on BR2_ENABLE_DEBUG
> +	depends on BR2_TARGET_EDK2_PLATFORM_OVMF_I386 || \
> +		BR2_TARGET_EDK2_PLATFORM_OVMF_X64

Since it depends on OVMF32/64 here....

[--SNIP--]
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index 399bd346ef..1ed22d87da 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -55,6 +55,9 @@ EDK2_DEPENDENCIES += host-nasm
>  EDK2_PACKAGE_NAME = OvmfPkg
>  EDK2_PLATFORM_NAME = OvmfPkgIa32
>  EDK2_BUILD_DIR = OvmfIa32
> +ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
> +EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
> +endif

It is superfluous to have it duplicated here...

>  else ifeq ($(BR2_TARGET_EDK2_PLATFORM_OVMF_X64),y)
>  EDK2_ARCH = X64
> @@ -62,6 +65,9 @@ EDK2_DEPENDENCIES += host-nasm
>  EDK2_PACKAGE_NAME = OvmfPkg
>  EDK2_PLATFORM_NAME = OvmfPkgX64
>  EDK2_BUILD_DIR = OvmfX64
> +ifeq ($(BR2_TARGET_EDK2_OVMF_DEBUG_ON_SERIAL),y)
> +EDK2_BUILD_OPTS += -DDEBUG_ON_SERIAL_PORT=TRUE
> +endif

... and here.

So I moved it to the DEBUG test toward the beginning.

I also wondered why you did not also explicitly disabled it with
-DDEBUG_ON_SERIAL_PORT=FALSE (or =OFF or whatev'). But a cursory look at
the edk2 code seems to imply that the value is not tested, only that it
has been set.

Applied to master after fixing the above issues, thanks.

Furthermore, the documentation suggest just setting it with
-DDEBUG_ON_SERIAL_PORT without passing a value, so could you please
check that part and submit an follw-up patch is the =TRUE is indeed
superfluous (since I forgot to check that before I pushed)?

Regards,
Yann E. MORIN.

>  else ifeq ($(BR2_TARGET_EDK2_PLATFORM_ARM_VIRT_QEMU),y)
>  EDK2_ARCH = AARCH64
> -- 
> 2.41.0
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
