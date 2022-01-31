Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E8C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 22:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97D2860804;
	Mon, 31 Jan 2022 22:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id buGTEbCa_fdp; Mon, 31 Jan 2022 22:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B010160F27;
	Mon, 31 Jan 2022 22:43:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 522C51BF836
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 404CE60F22
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 22:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jpmjXmkKkHM8 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 22:43:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9629F60804
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 22:43:50 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id j2so29717839edj.8
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 14:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=05FZpa8uzE9whYYYYGPX8yT1wdcGs9MgzyPPP4wjegE=;
 b=igQA9wcglBl/ATLpIFWNzvZ0xuY16wa56Gl+kofMpaQ78O9sKUXsWA/U/j0fwRvQxj
 c0Hj3kgKiohjZNHt89qGDKlknt+sbcvQgqhlZhrCFo4ozTU35jJZnTm3Nol2P70nnQRb
 RUfiQjewQTPBsVdMTqJGXOHe7YGc9WdmrJrujVpf5TiOmv8xc2nP/zytz0FUDeyHmhB+
 7E18v3Nf8x1fO4PjOu99IMEt1TZqrAuh+KRDfdogcJRWvEzXZ/oG52MfNA0NVmoISZZk
 TCOFhV61FyJJjw9PA3D1gNd580s5CEqtNgiClFCyi1fHyr3MuudjVbOszEHcC21Yfnqc
 cEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=05FZpa8uzE9whYYYYGPX8yT1wdcGs9MgzyPPP4wjegE=;
 b=ICOXPowghUs4RfT9DZLVacyGAgEq83UWBXigMOyoC8A0IAO/GE1fqz1Bw0W5vkKso8
 L3C8aA0dcOew7QvSbJ9lExvJq8w4+NxxSg5sg5FXl1Z475SgJ+FOJUWDOutgyZUsPuaP
 bUQupB0Fo0AuxwDEhkOkVlql67ze9R8aVFYqbvxIa/PR1LIwSGK659J5I2UQKrgRG0Hj
 SIo5YtX/gErGee6ohqXQjJbkslMmS4t19RlNGISGvfW+XzfKgeyjRGzxI78VL47JET5S
 5poyNFNV8cvZnwRjhBQJRKgVDxGOV+g+nyeHtmzFSIliCAm/TrMHID/kLmrpzDPOkoHE
 HgBg==
X-Gm-Message-State: AOAM533ZXS0sP4oKR62IUGvMU2yF0gjVahV0w9dHF/x8nlnWXJbnKycT
 4CaRxnh0zMzKZW5xMYYH+BpwnWziL+5Mnw==
X-Google-Smtp-Source: ABdhPJwim2u0j5pbPk68DHkkfOvq6TqCwBWhYanVidBdeWbbyoEBMH3bsntnMrdpjaiY1xqIJl90fA==
X-Received: by 2002:aa7:d702:: with SMTP id t2mr22283173edq.20.1643669028721; 
 Mon, 31 Jan 2022 14:43:48 -0800 (PST)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id d2sm13875546ejw.79.2022.01.31.14.43.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 14:43:48 -0800 (PST)
Message-ID: <077c8dc8-eb09-1672-615f-d86e15abf87e@mind.be>
Date: Mon, 31 Jan 2022 23:43:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Content-Language: en-GB
To: Norbert Lange <nolange79@gmail.com>, buildroot@buildroot.org
References: <20211203215438.213437-1-nolange79@gmail.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20211203215438.213437-1-nolange79@gmail.com>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/pkg-meson: separate
 infrastructure logic from package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 03/12/2021 22:54, Norbert Lange wrote:
> Move all logic related to handling meson packages to the
> package/pkg-meson file. This now mirrors the other build
> systems and keeps the package itself clean.
> 
> Correctly prefix variables with PKG_MESON_
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
> v2->v3:
> -   rebase, split up the moving
> 
> v1->v2:
> -   squash 2 commits, really hard to separate as moving and renaming
>      variables from 2 to one location affects alot code.
> -   use TOOLCHAIN_POST_INSTALL_STAGING_HOOKS again.
> -   consistently use double quotes for sed patterns
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>   package/meson/meson.mk | 38 --------------------------------------
>   package/pkg-meson.mk   | 40 +++++++++++++++++++++++++++++++++++++++-
>   2 files changed, 39 insertions(+), 39 deletions(-)
> 
> diff --git a/package/meson/meson.mk b/package/meson/meson.mk
> index a8c846126a..5553c15d91 100644
> --- a/package/meson/meson.mk
> +++ b/package/meson/meson.mk
> @@ -13,44 +13,6 @@ MESON_SETUP_TYPE = setuptools
>   HOST_MESON_DEPENDENCIES = host-ninja
>   HOST_MESON_NEEDS_HOST_PYTHON = python3
>   
> -HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
> -HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)
> -
> -# https://mesonbuild.com/Reference-tables.html#cpu-families
> -ifeq ($(BR2_arcle)$(BR2_arceb),y)
> -HOST_MESON_TARGET_CPU_FAMILY = arc
> -else ifeq ($(BR2_arm)$(BR2_armeb),y)
> -HOST_MESON_TARGET_CPU_FAMILY = arm
> -else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> -HOST_MESON_TARGET_CPU_FAMILY = aarch64
> -else ifeq ($(BR2_i386),y)
> -HOST_MESON_TARGET_CPU_FAMILY = x86
> -else ifeq ($(BR2_m68k),y)
> -HOST_MESON_TARGET_CPU_FAMILY = m68k
> -else ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
> -HOST_MESON_TARGET_CPU_FAMILY = microblaze
> -else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> -HOST_MESON_TARGET_CPU_FAMILY = mips
> -else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> -HOST_MESON_TARGET_CPU_FAMILY = mips64
> -else ifeq ($(BR2_powerpc),y)
> -HOST_MESON_TARGET_CPU_FAMILY = ppc
> -else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> -HOST_MESON_TARGET_CPU_FAMILY = ppc64
> -else ifeq ($(BR2_riscv),y)
> -HOST_MESON_TARGET_CPU_FAMILY = riscv64
> -else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
> -HOST_MESON_TARGET_CPU_FAMILY = sh4
> -else ifeq ($(BR2_sparc),y)
> -HOST_MESON_TARGET_CPU_FAMILY = sparc
> -else ifeq ($(BR2_sparc64),y)
> -HOST_MESON_TARGET_CPU_FAMILY = sparc64
> -else ifeq ($(BR2_x86_64),y)
> -HOST_MESON_TARGET_CPU_FAMILY = x86_64
> -else
> -HOST_MESON_TARGET_CPU_FAMILY = $(ARCH)
> -endif
> -
>   # Avoid interpreter shebang longer than 128 chars
>   define HOST_MESON_SET_INTERPRETER
>   	$(SED) '1s:.*:#!/usr/bin/env python3:' $(HOST_DIR)/bin/meson
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 16a90d157b..4914486665 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -185,9 +185,47 @@ meson-package = $(call inner-meson-package,$(pkgname),$(call UPPERCASE,$(pkgname
>   host-meson-package = $(call inner-meson-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
>   
>   ################################################################################
> -# Generation of the Meson cross-compilation.conf file
> +# Generation of the Meson compile flags and cross-compilation file
>   ################################################################################
>   
> +# https://mesonbuild.com/Reference-tables.html#cpu-families
> +ifeq ($(BR2_arcle)$(BR2_arceb),y)
> +PKG_MESON_TARGET_CPU_FAMILY = arc
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +PKG_MESON_TARGET_CPU_FAMILY = arm
> +else ifeq ($(BR2_aarch64)$(BR2_aarch64_be),y)
> +PKG_MESON_TARGET_CPU_FAMILY = aarch64
> +else ifeq ($(BR2_i386),y)
> +PKG_MESON_TARGET_CPU_FAMILY = x86
> +else ifeq ($(BR2_m68k),y)
> +PKG_MESON_TARGET_CPU_FAMILY = m68k
> +else ifeq ($(BR2_microblazeel)$(BR2_microblazebe),y)
> +PKG_MESON_TARGET_CPU_FAMILY = microblaze
> +else ifeq ($(BR2_mips)$(BR2_mipsel),y)
> +PKG_MESON_TARGET_CPU_FAMILY = mips
> +else ifeq ($(BR2_mips64)$(BR2_mips64el),y)
> +PKG_MESON_TARGET_CPU_FAMILY = mips64
> +else ifeq ($(BR2_powerpc),y)
> +PKG_MESON_TARGET_CPU_FAMILY = ppc
> +else ifeq ($(BR2_powerpc64)$(BR2_powerpc64le),y)
> +PKG_MESON_TARGET_CPU_FAMILY = ppc64
> +else ifeq ($(BR2_riscv),y)
> +PKG_MESON_TARGET_CPU_FAMILY = riscv64
> +else ifeq ($(BR2_sh4)$(BR2_sh4eb)$(BR2_sh4a)$(BR2_sh4aeb),y)
> +PKG_MESON_TARGET_CPU_FAMILY = sh4
> +else ifeq ($(BR2_sparc),y)
> +PKG_MESON_TARGET_CPU_FAMILY = sparc
> +else ifeq ($(BR2_sparc64),y)
> +PKG_MESON_TARGET_CPU_FAMILY = sparc64
> +else ifeq ($(BR2_x86_64),y)
> +PKG_MESON_TARGET_CPU_FAMILY = x86_64
> +else
> +PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
> +endif
> +
> +HOST_MESON_TARGET_ENDIAN = $(call qstrip,$(call LOWERCASE,$(BR2_ENDIAN)))
> +HOST_MESON_TARGET_CPU = $(GCC_TARGET_CPU)

  I moved all this to the beginning of the file, since it's (indirectly) used 
within inner-meson-package.

  Applied to master with that changed, thanks.

  Regards,
  Arnout

> +
>   # Generate a Meson cross-compilation.conf suitable for use with the
>   # SDK; also install the file as a template for users to add their
>   # own flags if they need to.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
