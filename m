Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E550BC47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8474D40396;
	Mon,  1 Jan 2024 21:27:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8474D40396
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KisxVA4o1w4C; Mon,  1 Jan 2024 21:27:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 76044403FF;
	Mon,  1 Jan 2024 21:27:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 76044403FF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BF0C51BF3F9
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:27:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96BFC40219
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:27:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96BFC40219
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iMCE2CwvOBAs for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:27:51 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 255A04014D
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:27:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 255A04014D
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4f89:5708:1633:580e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id C6BFEB0056A;
 Mon,  1 Jan 2024 22:27:45 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 01 Jan 2024 22:27:45 +0100
Date: Mon, 1 Jan 2024 22:27:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Julien Olivain <ju.o@free.fr>
Message-ID: <ZZMuUejeIIupu_wM@landeda>
References: <20231231181437.582286-1-ju.o@free.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231231181437.582286-1-ju.o@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704144467;
 bh=cdud3Fdn+qlBR/YWO6jfaRaME4UDwtuwUVFMV4/7mpA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Wta29445fClB2nq+n/tQDZoKMzwhDPeIFWXjxwd10gwmXzEWpZ67VVdwPgWulz1qv
 AI8eHk4tDde+9USH8JJX3gTNni6/x40xqjKi2hHJPjalf6iDG5hKnZ4w8eAs4un1Vx
 fiSi1FYI+Pl1ENpHkpTok8umlXdNZax4oV821zcxyCLYBaIQ1v1dLUqJh9qRlfOPE5
 Zcd2Zber5Z2pk+rz9AcXBzjNKbb0X7uNySc4fRRIwlv2yIRaMLnE9PHwP3FwM6wdYn
 0PCXV9+BFlmh3rX8FRlmNsQQWr1FOrZZHP9Lvb/jh/5IicFrDcbeyRbgq7nMRhFjdO
 OCsoOwTYRhUlA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Wta29445
Subject: Re: [Buildroot] [PATCH RFC 1/1] boot/edk2: unset MAKEFLAGS in build
 environment
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

On 2023-12-31 19:14 +0100, Julien Olivain spake thusly:
> Yann reported in [1] that edk2 build could sometimes fail. The issue
> can be reproduced when per-package directories is enabled, or also
> when building on a system with GNU Make >= 4.4 using the
> "--shuffle=reverse" option (such as Fedora 39). Those are pointing
> toward a Makefile dependency issue.
> 
> The issue can be reproduced with commands:
> 
>     cat > .config <<EOF
>     BR2_riscv=y
>     BR2_RISCV_64=y
>     BR2_TOOLCHAIN_EXTERNAL=y
>     BR2_TARGET_EDK2=y
>     EOF
>     make olddefconfig
> 
> Then, building either with:
> 
>     make --shuffle=reverse
> 
> Or:
> 
>     utils/config -e BR2_PER_PACKAGE_DIRECTORIES
>     make olddefconfig
>     make -j$(nproc)
> 
> It is interesting to mention that when using "make --shuffle=reverse"
> to build, the build can be completed if restarted only with "make". It
> will not pull any other Buildroot package. This fact hints toward a
> Makefile dependency issue internal to the EDK2 build system, rather
> than in the Buildroot recipe.
> 
> The EDK2 build system is quite unique. See [2]. It generates files,
> makefiles and internally uses GNU Make to compile code. This system is
> likely not tested as being a sub-Make process in a complex Makefile
> such as Buildroot.
> 
> In order to prevent Buildroot to pass unexpected Make flags to the
> EDK2 sub-Make, this commit unset the MAKEFLAGS variable in the EDK2
> build environment. This will put the EDK2 build script in a more
> common and tested state. See GNU Make documentation about recursive use
> of Make, more specifically [3].
> 
> Note: as mentioned, the build failure is likely due to an internal
> issue of the EDK2 build system. The failure points to a missing
> dependency in the EDK2 generator itself. This commit does not fix this
> issue, but rather put the EDK2 build system in a normalized
> environment, avoiding Buildroot flags being passed to the internal
> EDK2 sub-Make invocation. The upstream EDK2 build system most likely
> need a fix too.
> 
> Fixes:
> 
>     make[2]: *** No rule to make target '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp/DEBUG/UiApp.efi', needed by '/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/FV/Ffs/462CAA21-7614-4503-836E-8AB6F4662331UiApp/UiApp.offset'.  Stop.
> 
>     build.py...
>      : error 7000: Failed to execute command
> 	    make tbuild [/buildroot/output/build/edk2-edk2-stable202308/Build/RiscVVirtQemu/RELEASE_GCC5/RISCV64/MdeModulePkg/Application/UiApp/UiApp]
> 
>     build.py...
>      : error F002: Failed to build module
> 	    /buildroot/output/build/edk2-edk2-stable202308/MdeModulePkg/Application/UiApp/UiApp.inf [RISCV64, GCC5, RELEASE]
> 
> [1] https://lists.buildroot.org/pipermail/buildroot/2023-December/681507.html
> [2] https://tianocore-docs.github.io/edk2-BuildSpecification/draft/4_edk_ii_build_process_overview/42_build_process_overview.html
> [3] https://www.gnu.org/software/make/manual/make.html#Options_002fRecursion
> 
> Reported-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Signed-off-by: Julien Olivain <ju.o@free.fr>

Thank you very much for this very detailed explanations! I see you
marked is as RFC, but I believe it is good to go as-is: the workaround
is perfectly sensible.

Of course, if upstream were to fix that issue, it would be better, but
given the complexity of it, we are probably not in a position to
properly fix it in a timely manner.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  boot/edk2/edk2.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/boot/edk2/edk2.mk b/boot/edk2/edk2.mk
> index efdb4d02ce..87ac80c88f 100644
> --- a/boot/edk2/edk2.mk
> +++ b/boot/edk2/edk2.mk
> @@ -150,7 +150,13 @@ EDK2_BASETOOLS_OPTS = \
>  
>  EDK2_PACKAGES_PATH = $(subst $(space),:,$(strip $(EDK2_PACKAGES_PATHS)))
>  
> +# EDK2 "build" script internally uses and calls "make", which controls
> +# its own flags. It is mainly tested while not being a sub-make. In
> +# order to stay in that configuration, we avoid leaking top-level
> +# Buildroot make flags into EDK2 build by clearing the MAKEFLAGS
> +# environment variable.
>  EDK2_BUILD_ENV += \
> +	MAKEFLAGS= \
>  	WORKSPACE=$(@D) \
>  	PACKAGES_PATH=$(EDK2_PACKAGES_PATH) \
>  	PYTHON_COMMAND=$(HOST_DIR)/bin/python3 \
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
