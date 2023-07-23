Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70199C001B0
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 21:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B256640004;
	Sun, 23 Jul 2023 21:26:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B256640004
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t7_dPcaVeTYc; Sun, 23 Jul 2023 21:26:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F50A401CC;
	Sun, 23 Jul 2023 21:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0F50A401CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 13D8E1BF5A6
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 21:26:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E175660A8D
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 21:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E175660A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HGICCs8wcKL7 for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 21:26:12 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 790FC60A7E
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 21:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 790FC60A7E
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:22c7:ca40:1a2e:1362])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1E7955FFA0;
 Sun, 23 Jul 2023 23:26:03 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 23:26:02 +0200
Date: Sun, 23 Jul 2023 23:26:02 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230723212602.GC3544423@scaer>
References: <20230720233629.1642220-1-adam.duskett@amarulasolutions.com>
 <20230720233629.1642220-4-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720233629.1642220-4-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690147569;
 bh=//FVdYB50589bpuGs4xaJz6vv3LXV47e88OOu5GXu0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SOo+QesPPPsgzH7OZkrhEFElb5pVNscCpkpPPPTgvSk9099W1qsHU+UjcNGbMxldG
 tJZV3VPTdnOdirqb5LptbOv8OS+1BZ7CFEYpir6qmFAeBNoJFY9Htq2hbv68QPYntx
 Qg3H1nTErNDCiPmp0aWZsmZeY2aigeh+Ek1HvwRfBwd5popZ6x2zVJsm7V/IdvCYEu
 F2eKLS9zt6el0aalzS6AWaYztRZKFldJevrN++NRJprwvHDHyKmAEVM4OXU0kuBuh2
 FedTQIN+rNd3ADknkkwrHE1X4KRYaQSZ9sfZiFe5xgAZ+jPXWd7DmTLk2pW7JWIa+q
 B/HEith4e0/mQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SOo+QesP
Subject: Re: [Buildroot] [PATCH vRFC 3/3] package/flutter-engine: new package
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Adam, All,

On 2023-07-20 16:36 -0700, Adam Duskett spake thusly:
> There are many issues with this package:
> 
> - The release tarballs from https://github.com/flutter/engine are in no state
>   to compile. They are only for the use of gclient to download a source
>   directory structure suitable to build the Flutter engine! If you download,
>   extract and attempt to run `./tools/gn --no-goma --no-prebuilt-dart-sdk`, you
>   receive the error message:
>   `No such file or directory: 'flutter/flutter/third_party/gn/gn.'
> 
>   But wait! Wasn't the gn binary just called? No, that's a wrapper in the
>   Flutter source tree that formats arguments to call the real gn binary.
>   The real gn is not provided in the tarball but is downloaded via gclient
>   (among many other supporting repositories.)
> 
>   Even worse, the flutter repository depends on the .git dirs being present.

s/flutter repository/flutter buildsystem/  maybe?

>   (https://github.com/meta-flutter/meta-flutter/issues/271) This dependency
>   means it is not possible to create a reproducible tarball from the downloaded
>   sources, which is why there is no .hash file provided.
> 
>   I have asked the flutter project to release full tarballs suitable for
>   compiling here: https://github.com/flutter/flutter/issues/130734
> 
> - The clang toolchain wrapper does not work properly, resulting in the immediate
>   errors of:
>     -Wl,-z,now: 'linker' input unused
>     -Wl,-z,relro: 'linker' input unused

Those two are us adding them because of BR2_RELRO_FULL (-Wl,-z,relro
alone would be due to BR2_RELRO_PARTIAL).

It does recognise that they are linker options, but why are they
rejected? Do you have more context to provide?

>   The solution is to use clang.br_real and clang++.br_real.

Most probably not, because you lose a lot of the options set by
Buildroot (optimisation ,target CPU, etc...). The real solution is to
understand why -Wl-z-relro/now are rejected, and if they really are not
needed, to find a way to tell the toolchain wrapper not set them for
clang tools.

> - If using per_package builds, flutter-engine tries to use the host /usr/bin/ld
>   instead of the one provided by the compiler, resulting in linking errors.
>   As such, if BR2_PER_PACKAGE_DIRECTORIES is enabled, we search for the ld
>   provided by the compiler in the host directory and set the path accordingly.

Can this be related to the above -Wl issue?

> - libtessellator.so (built by flutter) requires three files:
>   crtbeginS.o crtendS.o libgcc.a. However, the toolchain path isn't referenced
>   when linking. The solution is to copy those three files to the staging lib
>   directory before building.
> 
> Tested with:
>   - Debian 11 and 12
>   - Ubuntu 18.04, 20.04, and 22.04
>   - Fedora 38
>   - Per package directory enabled and disabled
>   - x86_64, arm64
> 
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> ---
[--SNIP--]
> diff --git a/package/flutter-engine/0001-disable-pre-canned-sysroot.patch b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
> new file mode 100644
> index 0000000000..c4064a77c9
> --- /dev/null
> +++ b/package/flutter-engine/0001-disable-pre-canned-sysroot.patch
> @@ -0,0 +1,32 @@
> +From 49a14e693124dc34f2cccbfb755d01a1198aa6bf Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>

You're not the author; Joel Winarske is. That's also the authorship
there is in the upstream issue you referenced.

[--SNIP--]
> diff --git a/package/flutter-engine/0002-remove-explicit-x11-dependency.patch b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
> new file mode 100644
> index 0000000000..1345d4a3dd
> --- /dev/null
> +++ b/package/flutter-engine/0002-remove-explicit-x11-dependency.patch
> @@ -0,0 +1,33 @@
> +From b1a5db9318ca33a03f2700758d5debad907d21b6 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <adam.duskett@amarulasolutions.com>

Ditto

> +Date: Wed, 19 Jul 2023 15:26:40 -0700
> +Subject: [PATCH] remove explicit x11 dependency
> +
> +This is redundant, as the gtk pkg-config query will reference x11 if that's how

Not so much redundant, but rather superfluous and may conflict with the
actual rendering system used in gtk3 (e.g. wayland).

> diff --git a/package/flutter-engine/0003-disable-undefined-version.patch b/package/flutter-engine/0003-disable-undefined-version.patch
> new file mode 100644
> index 0000000000..468ec4daf9
> --- /dev/null
> +++ b/package/flutter-engine/0003-disable-undefined-version.patch
> @@ -0,0 +1,32 @@
> +From 9512040259f3970dd5ca08fd9ebcfd42e7539997 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Tue, 18 Jul 2023 15:21:51 -0700
> +Subject: [PATCH] Disable undefined-version
> +
> +This isn't a valid flag for ld, and flutter compiles just fine with the
> +no-undefined-version flag.

Without that option, the linker will just ignore a symbol with an
undefined version. With the option, a smbol with an undefined version
turns into an error.

So indeed, without the option, the check is relaxed so it is not
surprising the build does not fail.

[--SNIP--]
> diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
> new file mode 100644
> index 0000000000..fe72191e77
> --- /dev/null
> +++ b/package/flutter-engine/Config.in
> @@ -0,0 +1,93 @@
> +config BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	bool
> +	default y if BR2_aarch64
> +	default y if BR2_arm && !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV5
> +	default y if BR2_i386
> +	default y if BR2_x86_64

Since it uses clang, i'd also add: BR2_PACKAGE_LLVM_ARCH_SUPPORTS, but
this is a bit fuzzy for me what option we should add, if any...

> +
> +config BR2_PACKAGE_FLUTTER_ENGINE
> +	bool "flutter-engine"
> +	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthreads
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR # std::wstring
> +	depends on BR2_HOST_GCC_AT_LEAST_5
> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HOST_DEPOT_TOOLS
> +	select BR2_PACKAGE_FREETYPE
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  Flutter is Google's SDK for crafting beautiful, fast user
> +	  experience for mobile, web, and desktop from a single
> +	  codebase. Flutter works with existing code, is used by
> +	  developers and organizations around the world, and is
> +	  free and open source.
> +
> +	  The Flutter Engine is a portable runtime for hosting
> +	  Flutter applications. It implements Flutter's core
> +	  libraries, including animation and graphics, file and
> +	  network I/O, accessibility support, plugin architecture,
> +	  and a Dart runtime and compile toolchain. Most developers
> +	  will interact with Flutter via the Flutter Framework,
> +	  which provides a modern, reactive framework, and a rich
> +	  set of platform, layout and foundation widgets.
> +
> +	  https://github.com/flutter/engine
> +
> +if BR2_PACKAGE_FLUTTER_ENGINE
> +
> +choice
> +	prompt "Runtime mode"
> +	default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE

Mabye:
    default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_DEBUG if BR2_ENABLE_RUNTIME_DEBUG
    default BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE

Which brings up the question: do we need the profile mode in Buildroot,
or can we settle with just Release vs. Debug?

If so, then no need for this choice; just test BR2_ENABLE_RUNTIME_DEBUG
in flutter.mk

[--SNIP--]
> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> new file mode 100644
> index 0000000000..aa392a31d8
> --- /dev/null
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -0,0 +1,286 @@
> +################################################################################
> +#
> +# flutter-engine
> +#
> +################################################################################
> +
> +# Flutter-engine has a release on the GitHub page. However, that release is
> +# only for Google. Its intended purpose is for the gclient tool provided by
> +# Google in their depot-tools package. To use the source code, we must use
> +# gclient to download the flutter-engine source code along with several other
> +# projects. Unfortunately, the Buildroot download system does not have the
> +# capability of using gclient, and considering this package is the only
> +# package that uses gclient, we side-step the entire download process and
> +# perform the following steps if a tarball does not exist already:
> +#
> +#  - Copy the pre-made gclient config file to a temporary download
> +#    directory.
> +#  - Run gclient sync to generate a source directory with the proper
> +#    flutter-engine source code in the correct places.
> +#  - Run mk_tar_gz to create a tarball.
> +#  - Copy the tarball to $(FLUTTER_ENGINE_DL_DIR)
> +#    directory to create a reproducible tarball.
> +#
> +# There is no hash provided, as the gn binary (used for configuration) relies
> +# on the .git directories, so there is no way to make reproducible tarballs.
> +FLUTTER_ENGINE_VERSION = 3.10.6
> +
> +# There is nothing for Buildroot to download. This is handled by gclient.
> +FLUTTER_ENGINE_SITE =
> +FLUTTER_ENGINE_SOURCE =
> +FLUTTER_ENGINE_LICENSE = BSD-3-Clause
> +FLUTTER_ENGINE_LICENSE_FILES = LICENSE
> +FLUTTER_ENGINE_TARBALL_PATH = $(FLUTTER_ENGINE_DL_DIR)/flutter-$(FLUTTER_ENGINE_VERSION).tar.gz
> +FLUTTER_ENGINE_INSTALL_STAGING = YES
> +FLUTTER_ENGINE_DOWNLOAD_DEPENDENCIES = host-depot-tools
> +FLUTTER_ENGINE_DEPENDENCIES = \
> +	host-clang \
> +	host-ninja \
> +	host-pkgconf \
> +	freetype \
> +	zlib
> +
> +# Dispatch all architectures of flutter
> +ifeq ($(BR2_i386),y)
> +FLUTTER_ENGINE_TARGET_ARCH = x86
> +FLUTTER_ENGINE_TARGET_TRIPPLE = x86-linux
> +else ifeq ($(BR2_x86_64),y)
> +FLUTTER_ENGINE_TARGET_ARCH = x64
> +FLUTTER_ENGINE_TARGET_TRIPPLE = x86_64-linux
> +else ifeq ($(BR2_arm)$(BR2_armeb),y)
> +FLUTTER_ENGINE_TARGET_ARCH = arm
> +FLUTTER_ENGINE_TARGET_TRIPPLE = arm-linux
> +else ifeq ($(BR2_aarch64),y)
> +FLUTTER_ENGINE_TARGET_ARCH = arm64
> +FLUTTER_ENGINE_TARGET_TRIPPLE = aarch64-linux
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_RELEASE),y)
> +FLUTTER_ENGINE_RUNTIME_MODE=release
> +else ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_RUNTIME_PROFILE),y)
> +FLUTTER_ENGINE_RUNTIME=profile
> +else
> +FLUTTER_ENGINE_RUNTIME=debug
> +endif
> +
> +FLUTTER_ENGINE_BUILD_DIR = \
> +	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
> +
> +FLUTTER_ENGINE_INSTALL_FILES = libflutter_engine.so libflutter_linux_gtk.so
> +
> +FLUTTER_ENGINE_CONF_OPTS = \
> +	--clang \
> +	--depot-tools $(HOST_DIR)/share/depot_tools \
> +	--embedder-for-target \
> +	--linux-cpu $(FLUTTER_ENGINE_TARGET_ARCH) \
> +	--no-build-embedder-examples \
> +	--no-clang-static-analyzer \
> +	--no-enable-unittests \
> +	--no-goma \
> +	--no-prebuilt-dart-sdk \
> +	--runtime-mode $(FLUTTER_ENGINE_RUNTIME_MODE) \
> +	--target-os linux \
> +	--target-sysroot $(STAGING_DIR) \
> +	--target-toolchain $(HOST_DIR) \
> +	--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
> +
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +FLUTTER_ENGINE_CONF_OPTS += \
> +	--arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS),y)
> +FLUTTER_ENGINE_CONF_OPTS += --build-engine-artifacts
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-build-engine-artifacts
> +endif
> +
> +ifeq ($(BR2_OPTIMIZE_0),y)
> +FLUTTER_ENGINE_CONF_OPTS += --unoptimized
> +endif
> +
> +ifeq ($(BR2_ENABLE_LTO),y)
> +FLUTTER_ENGINE_CONF_OPTS += --lto
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-lto
> +endif
> +
> +ifeq ($(BR2_STRIP_strip),y)
> +FLUTTER_ENGINE_CONF_OPTS += --stripped
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-stripped
> +endif
> +
> +ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
> +FLUTTER_ENGINE_DEPENDENCIES += fontconfig
> +FLUTTER_ENGINE_CONF_OPTS += --enable-fontconfig

    else
    FLUTTER_ENGINE_CONF_OPTS += --disable-fontconfig

> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +FLUTTER_ENGINE_DEPENDENCIES += libgl
> +endif
> +
> +ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
> +FLUTTER_ENGINE_DEPENDENCIES += libgles
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D),y)
> +FLUTTER_ENGINE_DEPENDENCIES += mesa3d
> +endif
> +
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
> +FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan

    else
    FLUTTER_ENGINE_CONF_OPTS += --diable-vulkan

> +endif
> +
> +ifneq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)

Prefer positive logic:

    ifeq ($(BR2_PACKAGE_XORG7)$(BR2_PACKAGE_LIBXCB),yy)
    FLUTTER_ENGINE_DEPENDENCIES += libxcb
    else
    [the hack]
    endif

> +define FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
> +	$(SED) "s%vulkan_use_x11.*%vulkan_use_x11 = false%g" -i \
> +		$(@D)/build_overrides/vulkan_headers.gni
> +endef
> +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_X11_SUPPORT_FIXUP
> +else
> +FLUTTER_ENGINE_DEPENDENCIES += libxcb
> +endif
> +
> +ifneq ($(BR2_PACKAGE_WAYLAND),y)

Ditto, positive logic please.

> +define FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
> +	$(SED) "s%vulkan_use_wayland.*%vulkan_use_wayland = false%g" \
> +		$(@D)/build_overrides/vulkan_headers.gni
> +endef
> +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_VULKAN_WAYLAND_SUPPORT_FIXUP
> +else
> +FLUTTER_ENGINE_DEPENDENCIES += wayland
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGTK3),y)
> +FLUTTER_ENGINE_DEPENDENCIES += libgtk3
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --disable-desktop-embeddings
> +endif
> +
> +ifeq ($(BR2_PACKAGE_LIBGLFW),y)
> +FLUTTER_ENGINE_DEPENDENCIES += libglfw
> +FLUTTER_ENGINE_CONF_OPTS += --build-glfw-shell
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-build-glfw-shell
> +endif
> +
> +# The clang toolchain wrapper causes a lot of the following errors:
> +# error: -Wl,-z,now: 'linker' input unused [-Werror,-Wunused-command-line-argument]
> +# error: -Wl,-z,relro: 'linker' input unused [-Werror,-Wunused-command-line-argument]

Ah, that's because linker options are passed when we are not linking but
just compiling. And that's an error because of -Werror!

Can we disable -Werror instead of skipping the wrappers?

> +# Excplicitly use the real clang binaries for cc and cxx.
> +ifeq ($(BR2_CCACHE),y)
> +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> +	$(SED) "s%cc =.*%cc = \"\$${toolchain_bin}/ccache clang.br_real\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +
> +	$(SED) "s%cxx =.*%cxx = \"\$${toolchain_bin}/ccache clang++.br_real\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +endef
> +else
> +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> +	$(SED) "s%cc =.*%cc = \"\$${toolchain_bin}/clang.br_real\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +
> +	$(SED) "s%cxx =.*%cxx = \"\$${toolchain_bin}/clang++.br_real\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +endef
> +endif
> +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> +
> +# If using per_package builds, flutter-engine tries to use the /usr/bin/ld instead of
> +# the one provided by the compiler, resulting in linking errors.
> +ifeq ($(BR2_PER_PACKAGE_DIRECTORIES),y)
> +define FLUTTER_ENGINE_GET_PATH
> +	(ld_bin_path=$$(dirname $$(realpath $$(find $(PER_PACKAGE_DIR)/flutter-engine -name ld -type f))); \
> +		echo $${ld_bin_path}:$(BR_PATH):$(HOST_DIR)/share/depot_tools; \
> +	)
> +endef
> +else
> +define FLUTTER_ENGINE_GET_PATH
> +		echo $(BR_PATH):$(HOST_DIR)/share/depot_tools
> +endef
> +endif
> +
> +# Generate a tarball if one does not already exist.
> +define FLUTTER_ENGINE_GENERATE_TARBALL
> +	(if [ ! -e $(FLUTTER_ENGINE_TARBALL_PATH) ]; then \

Don't use a subshell here (parenthesis are toally unneeded and
superfluous).

> +		. ./support/download/helpers && \
> +		rm -rf $(@D)/dl-tmp && mkdir -p $(@D)/dl-tmp && \
> +		$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_PKGDIR)/gclient \

This is not gclient, this is .gclient, but having a source fiel that is
a dot-file in the tree is not nice. Can we just name it dot-gclient
instead:

    $(FLUTTER_ENGINE_PKGDIR)/dot-gclient

> +			$(@D)/dl-tmp/.gclient && \
> +		$(SED) "s%!FLUTTER_VERSION!%$(FLUTTER_ENGINE_VERSION)%g" \
> +			$(@D)/dl-tmp/.gclient && \
> +		cd $(@D)/dl-tmp && \
> +		$(DEPOT_TOOLS_GCLIENT) \
> +			sync \
> +			--delete_unversioned_trees \
> +			-j$(PARALLEL_JOBS) \
> +			--no-history \
> +			--reset \
> +			--shallow && \
> +		mkdir -p $(FLUTTER_ENGINE_DL_DIR); \
> +		cd $(@D)/dl-tmp && \
> +		mk_tar_gz \
> +		$(@D)/dl-tmp/src \
> +		flutter-$(FLUTTER_ENGINE_VERSION) \
> +		"$$(git -C $(@D)/dl-tmp/src log -1 --pretty=format:%ci)" \
> +		$(FLUTTER_ENGINE_TARBALL_PATH) && \
> +		rm -rf $(@D)/dl-tmp; \
> +	fi \
> +	)

I think this big if-block should go into a helper script (yeah, yeah., I
may have written something using make code in my earlier suggestion, but
that was not smart of me...)

So:
    define FLUTTER_ENGINE_GENERATE_TARBALL
        $(FLUTTER_PKGDIR)/gen-tarball \
            --version $(FLUTTER_ENGINE_VERSION) \
            --tarball $(FLUTTER_ENGINE_TARBALL_PATH) \
            --dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
            --scratch-dir $(@D)/dl-tmp
    endef

And then a sequence of complex script shell is easier to write, to
review, and to maintain.

> +endef
> +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS += FLUTTER_ENGINE_GENERATE_TARBALL
> +
> +define FLUTTER_ENGINE_EXTRACT_CMDS
> +	gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-components 1 -C $(@D) -xf -
> +endef
> +
> +define FLUTTER_ENGINE_CONFIGURE_CMDS
> +  # libtessellator requires these three files, but the toolchain path isn't
> +  # referenced when linking. Copy them to the staging lib directory before
> +  # building.
> +	$(Q)$(foreach i,crtbeginS.o crtendS.o libgcc.a,
> +		$(Q)if [ ! -e $(STAGING_DIR)/usr/lib/$(i) ]; then \
> +			file_path=$$(find $(HOST_DIR) -type f -name $(i)); \

This is going to be a bit more complex than that, because of multi-lib
or multi-arch external toolchains. See the mess it is to find the
sysroot in toolchain/helpers.mk

But seriously though, why are they not brought in? Did you try to run
the linking command manually in debug mode (--verbose if calling ld
directly, of -Wl.--verbose if using gcc to link)?

Is it using ld to do the link, or is it using gcc?

Is ld binutils', or is it lld? This might also have a link as to why
-Wl,-z,now and -Wl,-z,relro are not supported...

> +			$(INSTALL) -D -m 0755 $${file_path} $(STAGING_DIR)/usr/lib/$(i); \
> +		fi \
> +	)
> +	(cd $(@D)/ && \
> +		rm -rf $(FLUTTER_ENGINE_BUILD_DIR) && \
> +		PATH=$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
> +		./flutter/tools/gn $(FLUTTER_ENGINE_CONF_OPTS) \
> +	)
> +endef
> +
> +define FLUTTER_ENGINE_BUILD_CMDS
> +	(cd $(@D); \
> +		PATH=$(shell $(call FLUTTER_ENGINE_GET_PATH)) \
> +		PYTHONNOUSERSITE=y \
> +		$(HOST_DIR)/bin/ninja \
> +			-j $(PARALLEL_JOBS) \
> +			-C $(FLUTTER_ENGINE_BUILD_DIR) \
> +	)
> +endef
> +
> +define FLUTTER_ENGINE_INSTALL_STAGING_CMDS
> +	$(foreach i,$(FLUTTER_ENGINE_INSTALL_STAGING_FILES),

Err... FLUTTER_ENGINE_INSTALL_STAGING_FILES is set nowhere?

Regards,
Yann E. MORIN.

> +		$(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
> +			$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
> +				$(STAGING_DIR)/usr/lib/$(i); \
> +		fi \
> +	)
> +	$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/flutter_embedder.h \
> +		$(STAGING_DIR)/usr/include/flutter_embedder.h
> +endef
> +
> +define FLUTTER_ENGINE_INSTALL_TARGET_CMDS
> +	$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
> +		$(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
> +			$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
> +				$(TARGET_DIR)/usr/lib/$(i); \
> +		fi \
> +	)
> +endef
> +
> +$(eval $(generic-package))
> diff --git a/package/flutter-engine/gclient b/package/flutter-engine/gclient
> new file mode 100644
> index 0000000000..168e9a368d
> --- /dev/null
> +++ b/package/flutter-engine/gclient
> @@ -0,0 +1,16 @@
> +# This file is taken from the output of meta-flutter/lib/gn.py
> +
> +solutions = [{
> +    "managed": False,
> +    "name": "src/flutter",
> +    "url": "https://github.com/flutter/engine.git@!FLUTTER_VERSION!",
> +    "custom_vars": {
> +        "download_android_deps": False,
> +        "download_windows_deps": False,
> +        "download_linux_deps": False
> +    },
> +    "custom_deps": {
> +        "src/third_party/dart/third_party/pkg/tools":
> +        "https://dart.googlesource.com/tools.git@unified_analytics-v1.1.0"
> +    }
> +}]
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
