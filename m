Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C223AC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 21:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAAD60B78;
	Mon, 14 Feb 2022 21:16:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FhjKgfTb-R7M; Mon, 14 Feb 2022 21:16:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EAE560BD5;
	Mon, 14 Feb 2022 21:16:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56D6C1BF275
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4F6AA60B8D
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 21:16:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6m5aYLD2Gt6r for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 21:16:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E662A60B78
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 21:16:22 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id h18so6703249edb.7
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 13:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:organization:in-reply-to:content-transfer-encoding;
 bh=uHF+rWVn5UerIBvMxEv7w2keo6ule2UZ/SQhO/RDKhc=;
 b=IFWEBPUK58ZwUaSaX90Arr1sW8Iouf/jy9V7t6Y5CLZ7XBm8Hh5jMg76t9vKXElD2N
 hGHODv19AMp7fgNlA+JGFltusv+bWeYsckqqD0rW2EAvAAI1oW0zgCrOQQxJdm3GvXOR
 fb69OTwTjGBix5Ae52YGgNIrEACmElDXMKOXidb/mDG6u8Zxa4NZvSooAc//WEJcxWM6
 lz5vIM5pEehghrEDinuIA3J6R7DWxwP6NT7LsE+QMRSD+O4SDZzz3jKjtLy8dJKNrfzu
 4t0Rx0B3T6s8yrrUaiJfvR0/oTVuyn6+fMM6LpeCkdMi7hSbUqvnHapz8Z9uFDI591jQ
 ylQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uHF+rWVn5UerIBvMxEv7w2keo6ule2UZ/SQhO/RDKhc=;
 b=VYyo1/4UDvKEGBW8T7LfwztxFUfYoWTSjNbrnnOwrvvGIdDvAcjuHDF8Rjtk40YikP
 EbEasYmgLjKGMWbCiQvd+NIdnTFAtkh3oBVMeN1HWMTHoLm63lGLQxq8yLXl3trvWfwB
 YVXvzc3w5w9OpUVA6xq7Dm2AW8QA/PbMmPSyFrPoMnOSdu0t4JZDhUTlzthohFdUvLLl
 yhIBvNa2EqdWOHN8JtQZRuX5zrn4nx5nhWIAYiD3isJNyOEc4MY/VPYQfiFxcXTxzsJ3
 GEuZT9hxrCYd9jYDAO3e6pCLuQxrUdUi9FEDeAR93nSwo5ihUjFR8d4oyMKMvmUteJIu
 xP7Q==
X-Gm-Message-State: AOAM5327Y06cnteIUXK+4Hl178Z/N/4RsScN1WgigpHVmQVGHHnWHbsv
 r9QYWuASDEX0jfIxkXKBwcTQOQNqB6i5ag==
X-Google-Smtp-Source: ABdhPJwdqjBxdrM0HPiisoqA26ITWbp0DlvdDeAwaGCDmisQQrti3+UZi4MT8Ipz5ON4DsgXmiEzZQ==
X-Received: by 2002:a05:6402:2050:: with SMTP id
 bc16mr737788edb.431.1644873380897; 
 Mon, 14 Feb 2022 13:16:20 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id o18sm15678317edw.102.2022.02.14.13.16.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 13:16:20 -0800 (PST)
Message-ID: <1b0d866f-fc09-f23d-3fae-068858ab5304@mind.be>
Date: Mon, 14 Feb 2022 22:16:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-GB
To: Waldemar Brodkorb <wbx@openadk.org>, buildroot@buildroot.org
References: <YgamBwVM9TcIH/i5@waldemar-brodkorb.de>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <YgamBwVM9TcIH/i5@waldemar-brodkorb.de>
Subject: Re: [Buildroot] [PATCH 2/2] package/{glibc,
 localedef}: update to 2.35
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 11/02/2022 19:08, Waldemar Brodkorb wrote:
> https://sourceware.org/pipermail/libc-alpha/2022-February/136040.html
> 
> - allow to use optimization CFLAGS (not CPPFLAGS) which are nowadays
>    supported by upstream (except nios2)
> - enable support for or1k, which is now included upstream
> - runtime tested with qemu-system for aarch64/arm/microblaze/mips/mips64/nios2/
>    or1k/powerpc/powerpc64/powerpc64le/riscv32/riscv64/s390x/sh4/sparc64/x86/x86_64
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>   ...v-linux-microblaze-pselect32.c-add-m.patch | 85 -------------------
>   .../glibc.hash                                |  2 +-
>   package/glibc/glibc.mk                        | 16 ++--
>   ...ACK-only-build-and-install-localedef.patch |  0
>   ...y-on-GCC-to-4.8-and-binutils-to-2.24.patch |  0
>   .../localedef.hash                            |  2 +-
>   package/localedef/localedef.mk                |  2 +-
>   toolchain/toolchain-buildroot/Config.in       |  3 +-
>   8 files changed, 15 insertions(+), 95 deletions(-)
>   delete mode 100644 package/glibc/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-sysdeps-unix-sysv-linux-microblaze-pselect32.c-add-m.patch
>   rename package/glibc/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/glibc.hash (70%)
>   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/0001-HACK-only-build-and-install-localedef.patch (100%)
>   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch (100%)
>   rename package/localedef/{2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c => 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586}/localedef.hash (70%)

  with the removal of the csky fork in commit ebc6c7e, there's no longer a need 
to version the patches, so perhaps you could take this opportunity to move them 
out of the directory.

[snip]
> diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
> index 2702994c6b..f258f33c96 100644
> --- a/package/glibc/glibc.mk
> +++ b/package/glibc/glibc.mk
> @@ -7,7 +7,7 @@
>   # Generate version string using:
>   #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
>   # When updating the version, please also update localedef
> -GLIBC_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
> +GLIBC_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
>   # Upstream doesn't officially provide an https download link.
>   # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
>   # sometimes the connection times out. So use an unofficial github mirror.
> @@ -110,16 +110,20 @@ endif
>   #
>   #  2. We have to execute the configure script with bash and not sh.
>   #
> -# Note that as mentionned in
> -# http://patches.openembedded.org/patch/38849/, glibc must be
> -# built with -O2, so we pass our own CFLAGS and CXXFLAGS below.
> +# Glibc nowadays can be build with optimization flags f.e. -Os
> +
> +# crash in qemu-system-nios2 with -Os
> +ifeq ($(BR2_nios2),y)
> +TARGET_FCFLAGS := -O2

  You're overriding the global TARGET_FCFLAGS here, that's not allowed.

  Instead, you should use

GLIBC_CFLAGS = $(TARGET_CFLAGS)
# crash in qemu-system-nios2 with -Os
ifeq ($(BR2_nios2),y)
GLIBC_CFLAGS += -O2
endif

(I'm not sure if += is OK here, if not, just use =)

  And to make the below simpler, you can use

GLIBC_CFLAGS += $(GLIBC_EXTRA_CFLAGS)

  Alternatively, if += is OK for nios, you can use

ifeq ($(BR2_nios2),y)
GLIBC_EXTRA_CFLAGS += -O2
endif
...
		CFLAGS="$(TARGET_CFLAGS) $(GLIBC_EXTRA_CFLAGS)" \


> +endif
> +
>   define GLIBC_CONFIGURE_CMDS
>   	mkdir -p $(@D)/build
>   	# Do the configuration
>   	(cd $(@D)/build; \
>   		$(TARGET_CONFIGURE_OPTS) \
> -		CFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \
> -		CXXFLAGS="-O2 $(GLIBC_EXTRA_CFLAGS)" \
> +		CFLAGS="$(TARGET_FCFLAGS) $(GLIBC_EXTRA_CFLAGS)" CPPFLAGS="" \

  FCFLAGS stands for Fortran Compilation flags. You should use TARGET_CFLAGS here.

  Why is CPPFLAGS not set?


  Marked as Changes Requested.

  Regards,
  Arnout


> +		CXXFLAGS="$(TARGET_FCFLAGS) $(GLIBC_EXTRA_CFLAGS)" \
>   		$(GLIBC_CONF_ENV) \
>   		$(SHELL) $(@D)/configure \
>   		--target=$(GNU_TARGET_NAME) \
> diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/0001-HACK-only-build-and-install-localedef.patch
> similarity index 100%
> rename from package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0001-HACK-only-build-and-install-localedef.patch
> rename to package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/0001-HACK-only-build-and-install-localedef.patch
> diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> similarity index 100%
> rename from package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> rename to package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
> diff --git a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash b/package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/localedef.hash
> similarity index 70%
> rename from package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
> rename to package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/localedef.hash
> index dfd939020f..f28c15c2a3 100644
> --- a/package/localedef/2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c/localedef.hash
> +++ b/package/localedef/2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586/localedef.hash
> @@ -1,5 +1,5 @@
>   # Locally calculated (fetched from Github)
> -sha256  3c299a21468a80356b848ca341f45551616c4928a6c871e6d45cee942e8b0f24  glibc-2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c.tar.gz
> +sha256  0ca43b2a6cd74609519554303a16e350abdac0e66943c5d98d91228233c826a0  glibc-2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586.tar.gz
>   
>   # Hashes for license files
>   sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
> index f8f0b42984..fb5edde0c2 100644
> --- a/package/localedef/localedef.mk
> +++ b/package/localedef/localedef.mk
> @@ -7,7 +7,7 @@
>   # Use the same VERSION and SITE as target glibc
>   # As in glibc.mk, generate version string using:
>   #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
> -LOCALEDEF_VERSION = 2.34-109-gd64b08d5ba7ffbc9155630f4843cf2e271b1629c
> +LOCALEDEF_VERSION = 2.35-6-g491f2ef1f0ff849490f374917957018d07ee0586
>   LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
>   LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
>   HOST_LOCALEDEF_DL_SUBDIR = glibc
> diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
> index 4004c0edf8..437daafa74 100644
> --- a/toolchain/toolchain-buildroot/Config.in
> +++ b/toolchain/toolchain-buildroot/Config.in
> @@ -49,7 +49,8 @@ config BR2_TOOLCHAIN_BUILDROOT_GLIBC
>   		   BR2_powerpc     || BR2_powerpc64  || BR2_powerpc64le || \
>   		   BR2_riscv       || BR2_s390x      || BR2_sh          || \
>   		   BR2_sparc64     || BR2_x86_64     || BR2_microblaze  || \
> -		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || BR2_csky
> +		   BR2_nios2       || (BR2_arc && BR2_ARC_ATOMIC_EXT)   || \
> +		   BR2_csky 	   || BR2_or1k
>   	depends on BR2_USE_MMU
>   	depends on !BR2_STATIC_LIBS
>   	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
