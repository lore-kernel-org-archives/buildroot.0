Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B69AC2BB3F
	for <buildroot@archiver.kernel.org>; Sat, 18 Nov 2023 18:30:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF06460D53;
	Sat, 18 Nov 2023 18:30:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF06460D53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kPIgKdvj4uZf; Sat, 18 Nov 2023 18:30:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8F4060D6B;
	Sat, 18 Nov 2023 18:30:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B8F4060D6B
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 750F51BF25F
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5A89D81398
 for <buildroot@lists.busybox.net>; Sat, 18 Nov 2023 18:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A89D81398
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1xzcY4hBuIWS for <buildroot@lists.busybox.net>;
 Sat, 18 Nov 2023 18:30:46 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 582D38138E
 for <buildroot@buildroot.org>; Sat, 18 Nov 2023 18:30:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 582D38138E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4173:7e62:c00c:757b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 55363780371;
 Sat, 18 Nov 2023 19:30:37 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 18 Nov 2023 19:30:37 +0100
Date: Sat, 18 Nov 2023 19:30:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Brandon Maier <brandon.maier@collins.com>
Message-ID: <20231118183037.GJ996011@scaer>
References: <20231110210001.58405-1-brandon.maier@collins.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231110210001.58405-1-brandon.maier@collins.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1700332243;
 bh=lmalEKrUZmfZGWDkqf0WK1RNyqzDV9p9wMuKXQ2GX28=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eQJZFz9FxjsJLTvjyHSarYtv97n4xmGm9NTtFQHAob/VMbeTaRbsjkGLHxUr8vNUg
 NUSG4onh+0u5lFOq1RPay3WIl5FY5kPpa9HYr/+ogEqTdpCLqfbKSKdTT36iU99MOn
 NMpO2wINBHiDOJmT+Nm+sf8Xxx98gqXMfojdUI55tIcNj/SU3404/U4baZt34LeZHn
 tpWnJvjEgr6JQ53fiwIZewcl3w9vpMQt6xryn1CJ31l6w9IN51zN0YURivI8+Y9NNn
 fjAI/Sd2PcELSz2K9LMuGesKzo4O6iExWv5LjtHkUiYP2Q/64uYuQNLsIoRBQJ9UNN
 fHBEUV6pzOlCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=eQJZFz9F
Subject: Re: [Buildroot] [PATCH 1/2] package/memtest86: bump to version 6.20
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
Cc: Steve Kenton <skenton@ou.edu>, Abhishek Anand <abhishek.anand@collins.com>,
 Kalpesh Panchal <kalpesh.panchal2@collins.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Kalpesh, Brandon, All,

On 2023-11-10 20:59 +0000, Brandon Maier via buildroot spake thusly:
> From: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> 
> - bumped package version to 6.20
> - as 6.20 prebuilt version is not available on same download site but
>   source code is released at https://github.com/memtest86plus/memtest86plus/releases
>   so updated mk file to download source from git release
> - prebuilt binary not found in 6.20 package and also README.md
>   does not mention any toolchain limitation for compilation
>   so added source build command depending on 32-bit or 64-bit x86 target.
> - corrected License file name
> - installed memtest binaries to image folder like other bootable
>   images(grub , kernel) are copied.
> - updated config help as per package README.md
> 
> Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
> Signed-off-by: Abhishek Anand <abhishek.anand@collins.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>

Thanks for this patch, here are a few comments:

> ---
>  package/memtest86/Config.in      | 30 ++++++++++++++++++++++--------
>  package/memtest86/memtest86.hash |  4 ++--
>  package/memtest86/memtest86.mk   | 26 +++++++++++++++++++-------
>  3 files changed, 43 insertions(+), 17 deletions(-)
> 
> diff --git a/package/memtest86/Config.in b/package/memtest86/Config.in
> index 79c0161020..81c69e0222 100644
> --- a/package/memtest86/Config.in
> +++ b/package/memtest86/Config.in
> @@ -14,14 +14,28 @@ config BR2_PACKAGE_MEMTEST86
>  	  back again and verifies whether the result of the read is the
>  	  same as what was written to memory.
>  
> -	  Memtest86+ will only work on 32-bit or 64-bit x86 targets.
> -	  It boots as an i486 program and autodetects hardware. It can
> -	  be added to the grub2 boot menu by adding the following
> -	  lines to the bottom of /boot/grub/grub.cfg - note the use of
> -	  linux16.
> -
> -	  menuentry "Memtest86+" {
> -	    linux16 /boot/memtest86+.bin
> +	  Memtest86+ will only work on 32-bit or 64-bit x86 targets. It
> +	  boots and autodetects hardware. Refer README.md for boot
> +	  options.
> +
> +	  It can be loaded and run either directly by a PC BIOS (legacy
> +	  or UEFI) or via an intermediate bootloader that supports the
> +	  Linux 16-bit, 32-bit, 64-bit, or EFI handover boot protocol.
> +
> +	  It can be added to the grub2 boot menu by adding the following
> +	  lines to the bottom of grub.cfg
> +
> +	  Example for legacy BIOS using the Linux 16-bit boot protocol
> +
> +	  menuentry "Start Memtest86+, use built-in support for USB keyboards" {
> +	      linux16 /boot/memtest.bin console=ttyS0,115200 keyboard=both
> +	  }
> +
> +	  Or for UEFI BIOS using the Linux 32-bit or 64-bit boot
> +	  protocols.
> +
> +	  menuentry "Start Memtest86+, use built-in support for USB keyboards" {
> +	      linux /EFI/BOOT/memtest.efi console=ttyS0,115200 keyboard=both
>  	  }

    $ ./utils/docker-run make check-package
    package/memtest86/Config.in:30: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/memtest86/Config.in:31: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/memtest86/Config.in:37: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)
    package/memtest86/Config.in:38: help text: <tab><2 spaces><62 chars> (http://nightly.buildroot.org/#writing-rules-config-in)

I've rewrittten the help text to avoid this limitation.

>  	  Other boot loaders will have similar requirements.
> diff --git a/package/memtest86/memtest86.hash b/package/memtest86/memtest86.hash
> index 559ae0ac6c..df4699c63b 100644
> --- a/package/memtest86/memtest86.hash
> +++ b/package/memtest86/memtest86.hash
> @@ -1,3 +1,3 @@
>  # locally computed using sha256sum
> -sha256  142127b7953fbd829b1057fb64a78d3340c2b771484230a7347e94530a0d9039  memtest86+-5.01.tar.gz
> -sha256  2e15e2174b86640d7fbfcb62b51d9182062d9db71d66a46e5b01d736c68150ea  README
> +sha256  463b2db66128e45c96be76136272e2ee940f1319804b1b88cc2ef04edccd01d8  memtest86+-6.20.tar.gz
--------------------------------------------------------------------------------------^

    $ make memtest86-source
    >>> memtest86 6.20 Downloading
    [...]
    ERROR: No hash found for memtest86-6.20.tar.gz
    make[1]: *** [package/pkg-generic.mk:179: /home/ymorin/dev/buildroot/O/next/build/memtest86-6.20/.stamp_downloaded] Error 1
    make: *** [Makefile:23: _all] Error 2

I've fixed that as well.

> +sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
> diff --git a/package/memtest86/memtest86.mk b/package/memtest86/memtest86.mk
> index eb071cc29d..332157ab26 100644
> --- a/package/memtest86/memtest86.mk
> +++ b/package/memtest86/memtest86.mk
> @@ -4,15 +4,27 @@
>  #
>  ################################################################################
>  
> -MEMTEST86_VERSION = 5.01
> -MEMTEST86_SOURCE = memtest86+-$(MEMTEST86_VERSION).tar.gz
> -MEMTEST86_SITE = http://www.memtest.org/download/$(MEMTEST86_VERSION)
> +MEMTEST86_VERSION = 6.20
> +MEMTEST86_SITE = $(call github,memtest86plus,memtest86plus,v$(MEMTEST86_VERSION))
>  MEMTEST86_LICENSE = GPL-2.0
> -MEMTEST86_LICENSE_FILES = README
> +MEMTEST86_LICENSE_FILES = LICENSE
> +MEMTEST86_INSTALL_IMAGES = YES
> +MEMTEST86_INSTALL_TARGET = NO
>  
> -# memtest86+ is sensitive to toolchain changes, use the shipped binary version
> -define MEMTEST86_INSTALL_TARGET_CMDS
> -	$(INSTALL) -m 0755 -D $(@D)/precomp.bin $(TARGET_DIR)/boot/memtest86+.bin
> +ifeq ($(BR2_i386),y)
> +MEMTEST86_BUILD_DIR = build32
> +else
> +ifeq ($(BR2_x86_64),y)
> +MEMTEST86_BUILD_DIR = build64
> +endif
> +endif
> +
> +define MEMTEST86_BUILD_CMDS
> +	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D)/$(MEMTEST86_BUILD_DIR)
> +endef
> +
> +define MEMTEST86_INSTALL_IMAGES_CMDS
> +	$(INSTALL) -m 0755 -D $(@D)/$(MEMTEST86_BUILD_DIR)/memtest.* $(BINARIES_DIR)/

When the destination of installation is a directory, one must ensure the
directory exists beforehand, with an explicit mkdir first.

But here, I've changed that to install the two files explicitly.

Applied to next with the above changes, thanks.

Regards,
Yann E. MORIN.

>  endef
>  
>  $(eval $(generic-package))
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
