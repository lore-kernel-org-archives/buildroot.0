Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB7FC433F5
	for <buildroot@archiver.kernel.org>; Sat,  9 Apr 2022 13:43:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A4CE4089C;
	Sat,  9 Apr 2022 13:43:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zgp3o7DoGzbf; Sat,  9 Apr 2022 13:43:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E4C99408A2;
	Sat,  9 Apr 2022 13:43:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F30691BF592
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 13:43:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87074089C
 for <buildroot@lists.busybox.net>; Sat,  9 Apr 2022 13:43:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nh669JVUNkYy for <buildroot@lists.busybox.net>;
 Sat,  9 Apr 2022 13:43:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 32922407D7
 for <buildroot@buildroot.org>; Sat,  9 Apr 2022 13:43:04 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id b24so12958053edu.10
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uDjJs3LI9ck4ESwo6oBzjfE8fF82UgRM0OSDXQS9Css=;
 b=H9PUKfxUKlRMnx6ub91tvByYpzvincGn1Nzl18JEYQo9sdameJn+kHGbS89lET0dxq
 balVko1k0aSnjbv/mNwZQKwjJra26orQYs1jbO93vPppoWcLodh9muxE3bL29ClTKYwo
 8hoef1o/jdS5Av/aQkFtAlVqKOnvfiIiPn2zQLNwQu2AaW9vYsHtcCrPY2pAwB9NUitW
 AbOVTI1Ax/b1PsJnOQAVJj6uC0YLlC7OoNjSOciNr+eGPCb7YSz6HRdZFF3TavtN4tua
 OWN8zq+FcNOYrUupqSKcutrDL4F49A2yyOLkO9SYzJjZFF2tioTnz6TJy6cCmsN8jZtD
 fz4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=uDjJs3LI9ck4ESwo6oBzjfE8fF82UgRM0OSDXQS9Css=;
 b=bh0iMxc6UMGRQ45KK/Crt//8f93vJsIDodPvwpWAjJKzWyTIJUHzjDBXkKR1ACrpMF
 8JldcVnF+zoi+KctjhRT8130QaPw3glYyQQy575lRLfIzatufKOXCzDVBXHqoOS/XX4D
 /kpw/ChktwISkkAvqm/Eqm608vkoh/gon6c9mGsTaVYHiVRoYGMvvQa4oiaBqkG7ndRU
 Ant1pwUpvTOoRuYrt+Ji+/zZM1SZPjQP1IT2lMVKdrIttZo4VHanf0v7G9TXcqyxTwnX
 Wsms8EVbMrQP/zPUUWznMDnkjxQTG7evFhQ6/TSvIdIuVUE6gSa9b/rMaeAswLNMK6y3
 ZqWg==
X-Gm-Message-State: AOAM533O0C6uu2jzeB0ss2fJniUIKr5QTpc3QKASNFIj7OjDPVSiHToz
 5Ei/44pSV3ipuGvORxY1mzNrGw==
X-Google-Smtp-Source: ABdhPJxxA/pR8SKxDoo7unGL0swd6IPGmrqAjWmTrxY9bVt7/ASVUJf8ccp+pWZ1DfGwKuSjUCmcOg==
X-Received: by 2002:a05:6402:18:b0:410:86cd:9dce with SMTP id
 d24-20020a056402001800b0041086cd9dcemr24042111edu.70.1649511783046; 
 Sat, 09 Apr 2022 06:43:03 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 e12-20020a170906c00c00b006e66eff7584sm8363787ejz.102.2022.04.09.06.43.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Apr 2022 06:43:02 -0700 (PDT)
Message-ID: <fc1b7c76-80b2-51a5-d0f5-7afaf05a9a0a@mind.be>
Date: Sat, 9 Apr 2022 15:42:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220407182425.194001-1-flaniel@linux.microsoft.com>
 <20220407182425.194001-2-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220407182425.194001-2-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v1 1/2] tbb: new package
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 bradford barr <bradford@density.io>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

  Hi Francis,

  Thank you for this patch. I applied to master but with quite a few changes.

On 07/04/2022 20:24, Francis Laniel wrote:
> From: bradford barr <bradford@density.io>
> 
> Intel Threading Building Blocks (TBB), is a C++ library to help developers
> write highly parallelized applications. OpenCV uses it to accelerate some of
> it's more heavy weight procedures.
> 
> Signed-off-by: bradford barr <bradford@density.io>
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> ---
>   DEVELOPERS                                    |  1 +
>   package/Config.in                             |  1 +
>   .../0001-tbb-Enable-cross-compilation.patch   | 55 +++++++++++++++++++
>   package/tbb/Config.in                         | 16 ++++++
>   package/tbb/tbb.hash                          |  2 +
>   package/tbb/tbb.mk                            | 39 +++++++++++++
>   6 files changed, 114 insertions(+)
>   create mode 100644 package/tbb/0001-tbb-Enable-cross-compilation.patch
>   create mode 100644 package/tbb/Config.in
>   create mode 100644 package/tbb/tbb.hash
>   create mode 100644 package/tbb/tbb.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index a66b9d7eee..ef4ddcab50 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -970,6 +970,7 @@ F:	package/odhcploc/
>   
>   N:	Francis Laniel <flaniel@linux.microsoft.com>
>   F:	package/pahole/
> +F:	package/tbb/
>   
>   N:	Francisco Gonzalez <gzmorell@gmail.com>
>   F:	package/ser2net/
> diff --git a/package/Config.in b/package/Config.in
> index 0d5d763180..24f7af5ea8 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -2044,6 +2044,7 @@ endif
>   	source "package/skalibs/Config.in"
>   	source "package/sphinxbase/Config.in"
>   	source "package/startup-notification/Config.in"
> +	source "package/tbb/Config.in"
>   	source "package/tinycbor/Config.in"
>   	source "package/tz/Config.in"
>   	source "package/tzdata/Config.in"
> diff --git a/package/tbb/0001-tbb-Enable-cross-compilation.patch b/package/tbb/0001-tbb-Enable-cross-compilation.patch
> new file mode 100644
> index 0000000000..652d59c47b
> --- /dev/null
> +++ b/package/tbb/0001-tbb-Enable-cross-compilation.patch
> @@ -0,0 +1,55 @@
> +From 42c3faff14917f687aab405d8f571e352ffdf3f5 Mon Sep 17 00:00:00 2001
> +From: Francis Laniel <flaniel@linux.microsoft.com>
> +Date: Wed, 6 Apr 2022 15:58:02 +0100
> +Subject: [PATCH] tbb: Enable cross-compilation.
> +
> +This patch replaces hardcoded value for CPLUS and CONLY with $(CXX) and $(CC).
> +So, by defining CC= it is possible to cross compile this library using a
> +cross-compiler.
> +
> +This patch was originally written by:
> +Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> +and taken from:
> +https://github.com/intel/luv-yocto/blob/3b0688bc9a5e8d52b6ca461b15fb4abd3eaaf7a8/meta-oe/recipes-support/tbb/tbb/cross-compile.patch
> +
> +Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
> +---
> + build/linux.clang.inc | 5 +++--
> + build/linux.gcc.inc   | 5 +++--
> + 2 files changed, 6 insertions(+), 4 deletions(-)
> +
> +diff --git a/build/linux.clang.inc b/build/linux.clang.inc
> +index 5a459ef5..a0777db5 100644
> +--- a/build/linux.clang.inc
> ++++ b/build/linux.clang.inc
> +@@ -31,8 +31,9 @@ DYLIB_KEY = -shared
> + EXPORT_KEY = -Wl,--version-script,
> + LIBDL = -ldl
> +
> +-CPLUS = clang++
> +-CONLY = clang
> ++CPLUS = $(CXX)
> ++CONLY = $(CC)
> ++CPLUS_FLAGS = $(CXXFLAGS)

  I dropped this patch. Instead, I simply passed CPLUS, CONLY and CPLUS_FLAGS in 
the $(MAKE) call.

> + LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> + LIBS += -lpthread -lrt
> + LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> +diff --git a/build/linux.gcc.inc b/build/linux.gcc.inc
> +index 786c4153..30242a82 100644
> +--- a/build/linux.gcc.inc
> ++++ b/build/linux.gcc.inc
> +@@ -32,8 +32,9 @@ DYLIB_KEY = -shared
> + EXPORT_KEY = -Wl,--version-script,
> + LIBDL = -ldl
> +
> +-CPLUS = g++
> +-CONLY = gcc
> ++CPLUS = $(CXX)
> ++CONLY = $(CC)
> ++CPLUS_FLAGS = $(CXXFLAGS)
> + LIB_LINK_FLAGS = $(DYLIB_KEY) -Wl,-soname=$(BUILDING_LIBRARY)
> + LIBS += -lpthread -lrt
> + LINK_FLAGS = -Wl,-rpath-link=. -rdynamic
> +--
> +2.25.1
> +
> diff --git a/package/tbb/Config.in b/package/tbb/Config.in
> new file mode 100644
> index 0000000000..0f40b74d31
> --- /dev/null
> +++ b/package/tbb/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_TBB
> +	bool "tbb"
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	help
> +	  Intel(R) Threading Building Blocks (Intel(R) TBB) lets you
> +	  easily write parallel C++ programs that take full advantage
> +	  of multicore performance, that are portable, composable and
> +	  have future-proof scalability.
> +
> +	  https://www.threadingbuildingblocks.org/
> +
> +comment "tbb needs a glibc toolchain w/ dynamic library, threads, C++"
> +	depends on !BR2_TOOLCHAIN_USES_GLIBC || BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> diff --git a/package/tbb/tbb.hash b/package/tbb/tbb.hash
> new file mode 100644
> index 0000000000..e9fb7511b8
> --- /dev/null
> +++ b/package/tbb/tbb.hash
> @@ -0,0 +1,2 @@
> +# Locally calculated
> +sha256  b8dbab5aea2b70cf07844f86fa413e549e099aa3205b6a04059ca92ead93a372  tbb-2018_U5.tar.gz

  You also need to include a hash for the license file.

> diff --git a/package/tbb/tbb.mk b/package/tbb/tbb.mk
> new file mode 100644
> index 0000000000..cf06579b98
> --- /dev/null
> +++ b/package/tbb/tbb.mk
> @@ -0,0 +1,39 @@
> +################################################################################
> +#
> +# tbb
> +#
> +################################################################################
> +
> +TBB_VERSION = 2018_U5
> +TBB_SITE = $(call github,01org,tbb,$(TBB_VERSION))
> +TBB_INSTALL_STAGING = YES
> +TBB_LICENSE = Apache-2.0
> +TBB_LICENSE_FILES = LICENSE
> +
> +TBB_SO_VERSION = 2
> +TBB_LIBS = libtbb libtbbmalloc libtbbmalloc_proxy
> +TBB_BIN_PATH = $(@D)/build/linux_*
> +
> +define TBB_BUILD_CMDS
> +	$(MAKE) $(TARGET_CONFIGURE_OPTS) arch=$(BR2_ARCH) -C $(@D)

  The values for arch that are used by tbb are different from the values that 
BR2_ARCH has. I studied this in more detail:

# arch is normally set based on uname -m with some conversions. However,
# it is not really used for much:
# - to decide between 32 or 64-bit files (based on '64' in the name)
# - to decide on some arch-specific CFLAGS like -m32, which we don't actually want
# - to set DO_ITT_NOTIFY if it's x86 (32 or 64 bit)
# - to include assembler source, but it only exists for ia64
# The only thing we actually want from the above is the 32/64-bit, and
# DO_ITT_NOTIFY. Therefore, set arch to a fixed value which is unknown to
# the tbb build system, and set DO_ITT_NOTIFY explicitly.

  Regards,
  Arnout

> +endef
> +
> +define TBB_INSTALL_LIBS
> +	$(foreach lib,$(TBB_LIBS),
> +		$(INSTALL) -D -m 0755 $(TBB_BIN_PATH)/$(lib).so.$(TBB_SO_VERSION) \
> +			$(1)/usr/lib/$(lib).so.$(TBB_SO_VERSION) ;
> +		ln -sf $(lib).so.$(TBB_SO_VERSION) $(1)/usr/lib/$(lib).so
> +	)
> +endef
> +
> +define TBB_INSTALL_STAGING_CMDS
> +	mkdir -p $(STAGING_DIR)/usr/include/
> +	cp -a $(@D)/include/* $(STAGING_DIR)/usr/include/
> +	$(call TBB_INSTALL_LIBS,$(STAGING_DIR))
> +endef
> +
> +define TBB_INSTALL_TARGET_CMDS
> +	$(call TBB_INSTALL_LIBS,$(TARGET_DIR))
> +endef
> +
> +$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
