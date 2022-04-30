Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC88BC433F5
	for <buildroot@archiver.kernel.org>; Sat, 30 Apr 2022 18:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 80EB3404C3;
	Sat, 30 Apr 2022 18:07:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kQrcp44ceXMe; Sat, 30 Apr 2022 18:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6ED3B40491;
	Sat, 30 Apr 2022 18:07:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BECD61BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:07:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB52260A89
 for <buildroot@lists.busybox.net>; Sat, 30 Apr 2022 18:07:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=mind.be
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cEGhi6wewDEd for <buildroot@lists.busybox.net>;
 Sat, 30 Apr 2022 18:07:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 658AE60A69
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 18:07:45 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id g20so12398433edw.6
 for <buildroot@buildroot.org>; Sat, 30 Apr 2022 11:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mind.be; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=reZKauolwUput3+bRp09+Ri8Jl4qZ6sZOBLy8CuZNqk=;
 b=UqG6PL6nGFeyBY3IoOky4uThL8CrfG5tINnSSXM4sLHIxK/SID/7ogc5/ZAFPLEb5n
 wLPx1c6VRMeRbwsg+nS0dj6XCz634EwrtyW8/Q16oUbJIjWoXzJWNxxtX58ys6NYJhFo
 JhSfBo0OZIFlbyEgjW1meGJu7vlU/fID6vwKEO6D3qDTHmt9GT2V6j3j5h9MKmsm5YgM
 kU0h6Hyg6w5PCsvcdQ7GHAWx5UPXM6eqzeqakTajbmvkQnmVS7HWltJiTNkwaNBHNgOq
 aq3y4SKKFKa8g6BGhBxMVmpdCpIEEemox8TfyT56UctS8PMp44aB99jtZGGxYGhau3RR
 4Ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=reZKauolwUput3+bRp09+Ri8Jl4qZ6sZOBLy8CuZNqk=;
 b=2Mx2N5yLiR2V+AEt3n5YXkLY19JVD6NBCw6yYms1BmIK29aX1ieY7r1O85fxskNqbm
 XAT0ob/2dU8YZzdYrVDy79+kOQzUe8DRRcq2ukZP+xoXUj2Kyf2gPBiKKUklOdjhoVxx
 OhblIIRROM2jL6PK9CXnL/mfymAaanB/nkd/kH+VTQje16yRmxxQbyCSpw3V3KlxEwSx
 nKKPskHcANBCUiKREa0SuOQsN3KNwXRdZwvMjVKy4iN5EYOulG9nOGSuBl86HQlHSXkj
 mY2QZBHA6yaF/sSQybMNmZGFKFcPyX/jOqBbktoINTrHcZuSGltaAxnw3jCiYiEHiAw+
 i5yA==
X-Gm-Message-State: AOAM532S6oPE8Liq5232NKGz8NWJbsYkGzefOaj7ZKZVOyyXiKSGRVOT
 1QqMVMnUUzGgKO3UTiwJwUMnEQ==
X-Google-Smtp-Source: ABdhPJwUWQ3NmAG1qUFf5PfeYz/GDBEaRxVatGaP0PbFyeD6tGB+wYyGhnR3eXtplJa3kXZZoJ0eng==
X-Received: by 2002:aa7:d549:0:b0:425:fc06:60d4 with SMTP id
 u9-20020aa7d549000000b00425fc0660d4mr5509227edr.300.1651342063225; 
 Sat, 30 Apr 2022 11:07:43 -0700 (PDT)
Received: from ?IPV6:2a02:1811:3a7e:7b00:1400:24ea:cbca:e681?
 (ptr-9fplejn4os7m3x31ny9.18120a2.ip6.access.telenet.be.
 [2a02:1811:3a7e:7b00:1400:24ea:cbca:e681])
 by smtp.gmail.com with ESMTPSA id
 bd28-20020a056402207c00b0042617ba6391sm4416729edb.27.2022.04.30.11.07.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 11:07:42 -0700 (PDT)
Message-ID: <e15d95db-043a-aa7f-baee-78ade04669f2@mind.be>
Date: Sat, 30 Apr 2022 20:07:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-GB
To: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
References: <20220425164319.24788-1-flaniel@linux.microsoft.com>
 <20220425164319.24788-3-flaniel@linux.microsoft.com>
From: Arnout Vandecappelle <arnout@mind.be>
Organization: Essensium/Mind
In-Reply-To: <20220425164319.24788-3-flaniel@linux.microsoft.com>
Subject: Re: [Buildroot] [RFC PATCH v4 2/2] package/sysdig: bump to 0.29.1
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
 Samuel Martin <s.martin49@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>



On 25/04/2022 18:43, Francis Laniel wrote:
> sysdig 0.27.1 cannot be cross-compiled to, e.g., aarch64 because it uses open()
> syscall [1].
> This patch bumps its version to enable cross-compilation.
> 
> By doing so, we can remove the previous patches.
> But this commit introduces new patches.
> Indeed, libsinsp (lib system inspection), libscap (lib system capture) and the
> kernel module were moved to falcosecurity/libs.
> Sadly, it is not possible to compile sysdig with pre-compiled libs (like we do
> in buildroot).
> So, this contribution introduces a new patch to build sysdig with already built
> falcosecurity/libs.
> 
> [1] https://marc.info/?l=buildroot&m=164951521629400
> 
> Signed-off-by: Francis Laniel <flaniel@linux.microsoft.com>
[snip]
> diff --git a/package/sysdig/Config.in b/package/sysdig/Config.in
> index c124054105..392d858ac6 100644
> --- a/package/sysdig/Config.in
> +++ b/package/sysdig/Config.in
> @@ -2,25 +2,17 @@ config BR2_PACKAGE_SYSDIG
>   	bool "sysdig"
>   	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
>   	depends on BR2_LINUX_KERNEL
> -	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb
> +	depends on BR2_INSTALL_LIBSTDCPP # jsoncpp, protobuf, tbb, yaml-cpp
>   	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
>   	depends on BR2_TOOLCHAIN_HAS_THREADS # elfutils, jq, protobuf, tbb

  This is now an indirect dependency. We normally show that as
... # falcosecurity-libs -> elfutils, jq, protobuf, tbb
but that would get really long, so I changed all of them to just mention 
falcosecurity-libs.

>   	depends on !BR2_STATIC_LIBS # elfutils, protobuf, tbb
>   	depends on BR2_USE_WCHAR # elfutils

  This one is not present in falcosecurity-libs (anyway implied by glibc), so I 
removed it.

>   	depends on BR2_TOOLCHAIN_USES_GLIBC # elfutils
>   	depends on BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> -	select BR2_PACKAGE_C_ARES
> -	select BR2_PACKAGE_ELFUTILS
> -	select BR2_PACKAGE_GRPC
> -	select BR2_PACKAGE_JQ
> -	select BR2_PACKAGE_JSONCPP
> -	select BR2_PACKAGE_LIBB64
> -	select BR2_PACKAGE_LIBCURL
> +	select BR2_PACKAGE_FALCOSECURITY_LIBS
>   	select BR2_PACKAGE_NCURSES
> -	select BR2_PACKAGE_OPENSSL
> -	select BR2_PACKAGE_PROTOBUF
> -	select BR2_PACKAGE_TBB
> -	select BR2_PACKAGE_ZLIB
> +	select BR2_PACKAGE_JSON_FOR_MODERN_CPP
> +	select BR2_PACKAGE_YAML_CPP
>   	help
>   	  Sysdig is open source, system-level exploration:
>   	  capture system state and activity from a running Linux
> @@ -36,4 +28,4 @@ comment "sysdig needs a glibc toolchain w/ C++, threads, gcc >= 4.8, dynamic lib
>   		|| !BR2_TOOLCHAIN_HAS_THREADS \
>   		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS \
>   		|| !BR2_TOOLCHAIN_USES_GLIBC \
> -	    || !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> +		|| !BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION_5_1
> diff --git a/package/sysdig/sysdig.hash b/package/sysdig/sysdig.hash
> index 4ec46abfc3..380c9dce1e 100644
> --- a/package/sysdig/sysdig.hash
> +++ b/package/sysdig/sysdig.hash
> @@ -1,5 +1,3 @@
>   # sha256 locally computed
> -sha256  b9d05854493d245a7a7e75f77fc654508f720aab5e5e8a3a932bd8eb54e49bda  sysdig-0.27.1.tar.gz
> +sha256  3721c97f0da43c1a68d2962d30363525d8532ab5f2534dfefc86d175e17e423e  sysdig-0.29.1.tar.gz
>   sha256  a88fbf820b38b1c7fabc6efe291b8259e02ae21326f56fe31c6c9adf374b2702  COPYING
> -sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  driver/GPL2.txt
> -sha256  e3f6a43d097ed68176e9738de925d98b938e1bccf6d6bd1bcd79395eca8f76ed  driver/MIT.txt
> diff --git a/package/sysdig/sysdig.mk b/package/sysdig/sysdig.mk
> index 9a9aaa35c3..3ce5d0bb79 100644
> --- a/package/sysdig/sysdig.mk
> +++ b/package/sysdig/sysdig.mk
> @@ -4,10 +4,10 @@
>   #
>   ################################################################################
>   
> -SYSDIG_VERSION = 0.27.1
> +SYSDIG_VERSION = 0.29.1
>   SYSDIG_SITE = $(call github,draios,sysdig,$(SYSDIG_VERSION))
> -SYSDIG_LICENSE = Apache-2.0 (userspace), MIT or GPL-2.0 (driver)
> -SYSDIG_LICENSE_FILES = COPYING driver/MIT.txt driver/GPL2.txt
> +SYSDIG_LICENSE = Apache-2.0
> +SYSDIG_LICENSE_FILE = COPYING
>   SYSDIG_CPE_ID_VENDOR = sysdig
>   SYSDIG_CONF_OPTS = \
>   	-DENABLE_DKMS=OFF \
> @@ -16,39 +16,26 @@ SYSDIG_CONF_OPTS = \
>   SYSDIG_SUPPORTS_IN_SOURCE_BUILD = NO
>   
>   SYSDIG_DEPENDENCIES = \
> -	c-ares \
> -	elfutils \
> -	grpc \
> -	jq \
> -	jsoncpp \
> -	libb64 \
> -	libcurl \
> -	luainterpreter \
> +	falcosecurity-libs \
>   	ncurses \
> -	openssl \
> -	protobuf \
> -	tbb \
> -	zlib
> +	json-for-modern-cpp \
> +	yaml-cpp
>   
> -# sysdig creates the module Makefile from a template, which contains a
> -# single place-holder, KBUILD_FLAGS, wich is only replaced with two
> -# things:
> -#   - debug flags, which we don't care about here,
> -#   - 'sysdig-feature' flags, which are never set, so always empty
> -# So, just replace the place-holder with the only meaningful value: nothing.
> -define SYSDIG_MODULE_GEN_MAKEFILE
> -	$(INSTALL) -m 0644 $(@D)/driver/Makefile.in $(@D)/driver/Makefile
> -	$(SED) 's/@KBUILD_FLAGS@//;' $(@D)/driver/Makefile
> -	$(SED) 's/@PROBE_NAME@/sysdig-probe/;' $(@D)/driver/Makefile
> -endef
> -SYSDIG_POST_PATCH_HOOKS += SYSDIG_MODULE_GEN_MAKEFILE
> +# For sysdig to automatically loads the driver, SYSDIG_DRIVER_NAME should be
> +# the same than FALCOSECURITY_LIBS_DRIVER_NAME.
> +SYSDIG_DRIVER_NAME = scap

  It's a bit silly to have this huge comment and then define a variable that is 
used only once. So I removed all that and directly used 
FALCOSECURITY_LIBS_DRIVER_NAME below.

  Applied to master, thanks.

  Regards,
  Arnout

>   
> -# Don't build the driver as part of the 'standard' procedure, we'll
> -# build it on our own with the kernel-module infra.
> -SYSDIG_CONF_OPTS += -DBUILD_DRIVER=OFF
> -
> -SYSDIG_MODULE_SUBDIRS = driver
> -SYSDIG_MODULE_MAKE_OPTS = KERNELDIR=$(LINUX_DIR)
> +# Don't build the driver as part of the 'standard' procedure, it has been built
> +# by falcosecurity-libs.mk.
> +# grpc_cpp_plugin is needed to build falcosecurity libs, so we give the host
> +# one there.
> +SYSDIG_CONF_OPTS += -DFALCOSECURITY_LIBS_SOURCE_DIR=$(FALCOSECURITY_LIBS_SRCDIR) \
> +	-DBUILD_DRIVER=OFF \
> +	-DGRPC_CPP_PLUGIN=$(HOST_DIR)/bin/grpc_cpp_plugin \
> +	-DDRIVER_NAME=$(SYSDIG_DRIVER_NAME) \
> +	-DENABLE_DKMS=OFF \
> +	-DUSE_BUNDLED_DEPS=OFF \
> +	-DWITH_CHISEL=ON \
> +	-DVALIJSON_INCLUDE=$(BUILD_DIR)/valijson-0.6/include/valijson
>   
> -$(eval $(kernel-module))
>   $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
