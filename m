Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A574C04A94
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 17:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE4058206E;
	Tue,  8 Aug 2023 17:56:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE4058206E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lVVT5v9RuH7J; Tue,  8 Aug 2023 17:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF5D48207C;
	Tue,  8 Aug 2023 17:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF5D48207C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C6C41BF59C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E823840592
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 17:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E823840592
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id os_xyGe9Klqp for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 17:56:24 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5C9534044A
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 17:56:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C9534044A
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5CD9C40003;
 Tue,  8 Aug 2023 17:56:22 +0000 (UTC)
Date: Tue, 8 Aug 2023 19:56:21 +0200
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20230808195621.1c5d4242@windsurf>
In-Reply-To: <20230808003527.1469175-4-adam.duskett@amarulasolutions.com>
References: <20230808003527.1469175-1-adam.duskett@amarulasolutions.com>
 <20230808003527.1469175-4-adam.duskett@amarulasolutions.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691517382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Fo73dPXXDre5fSouTiRuNWYEEW+i8nsoYKhYCTf0SYQ=;
 b=UyaUBDGnDuH7uXi8f+eOEVd1EcIbpKilgC7bvMzVV6CO5I+0xjfJWLR2JTwip4R6NfdOWL
 ZkcT6GixyZ3RUVxaJzlhkp8Oqog5G0/YeHQL6GAO2p0nf2q69NQgj36RYGE45DRiMTTKUr
 xPd8CeaIIFHKX4XZLdS617cDlUHIP2NnmoxCK0wdzbW/e2ot/ofmMzV9kpPXIvHVgBcz1h
 xyLyPjB5huU5nwYVlMWlGwMugfWpAprzRFqY85R6XJssAPXWa7tWkg+aNvWgXsxdjLOyZd
 GxdaWC9mecJGsRA/JbGVhWSKKUZRZ0upC7gBSK8u5pHy7GnrzyAchJJcVJ/2hA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=UyaUBDGn
Subject: Re: [Buildroot] [PATCH/next vRFCv2 3/3] package/flutter-engine: new
 package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Adam,

On Mon,  7 Aug 2023 18:35:27 -0600
Adam Duskett <adam.duskett@amarulasolutions.com> wrote:

>   I have asked the flutter project to release full tarballs suitable for
>   compiling here: https://github.com/flutter/flutter/issues/130734

Thanks for having started this conversation with upstream, very good.

>  N:	Adam Duskett <adam.duskett@amarulasolutions.com>
>  F:	package/depot-tools
> +F:	package/flutter-engine

Missed that minor nit on the depot-tools patch, but applicable here as
well: directory paths in DEVELOPERS end with a final slash, i.e
package/depot-tools/.


> diff --git a/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
> new file mode 100644
> index 0000000000..94da49fdf8
> --- /dev/null
> +++ b/package/flutter-engine/0004-pkg-config.py-do-not-prepend-sysroot-path.patch
> @@ -0,0 +1,34 @@
> +From 51e8fed854fd9d373bb9b20d7ed8e7cf6ef12312 Mon Sep 17 00:00:00 2001
> +From: Adam Duskett <aduskett@gmail.com>
> +Date: Wed, 19 Jul 2023 11:48:59 -0700
> +Subject: [PATCH] pkg-config.py: do not prepend sysroot path
> +
> +The pkg-config script provided by Buildroot already includes the sysroot
> +path, causing the pkg-config.py script to double prepend the sysroot path.
> +
> +IE: output/host/.../sysroot/output/host/.../sysroot
> +
> +Upstream: Buildroot specific
> +Signed-off-by: Adam Duskett <aduskett@gmail.com>

Actually, I don't see how this is Buildroot specific. We simply use the
standard PKG_CONFIG_SYSROOT_DIR variable. So it's what their
pkg-config.py script is doing that doesn't make sense: they shouldn't
prepend the sysroot themselves, but let pkg-config obey to the
PKG_CONFIG_SYSROOT_DIR variable.

Note: I'm not going to block the merging on this. But perhaps this is
something to report upstream.


> diff --git a/package/flutter-engine/Config.in b/package/flutter-engine/Config.in
> new file mode 100644
> index 0000000000..ba59e1c8ac
> --- /dev/null
> +++ b/package/flutter-engine/Config.in
> @@ -0,0 +1,60 @@
> +config BR2_PACKAGE_FLUTTER_ENGINE
> +	bool "flutter-engine"
> +	# Flutter includes a patched copy of clang which is mandatory to use for
> +	# compiling. However, we should still depend on LLVM_ARCH_SUPPORTS as it
> +	# gives a complete list of supported clang architectures.
> +	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

One thing that bothers me a little bit here is that there is nothing
that guarantees us the clang copy in flutter-engine is in sync with the
copy in flutter-engine. Therefore, we might update
package/llvm-project/llvm to a newer version, which supports a new CPU
architecture, update BR2_PACKAGE_LLVM_ARCH_SUPPORTS to include the
newer architecture... but the copy in flutter-engine is older and
doesn't (yet) include that new CPU architecture.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
> +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthreads
> +	depends on BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::shared_future
> +	depends on !BR2_STATIC_LIBS
> +	depends on BR2_USE_WCHAR # std::wstring
> +	depends on BR2_HOST_GCC_AT_LEAST_5

We need the whole world! \o/

> +	depends on BR2_PACKAGE_HAS_LIBGL || BR2_PACKAGE_HAS_LIBGLES
> +	select BR2_PACKAGE_HOST_DEPOT_TOOLS
> +	select BR2_PACKAGE_FREETYPE

Minor nit: alphabetic ordering?

> +if BR2_PACKAGE_FLUTTER_ENGINE
> +
> +config BR2_PACKAGE_FLUTTER_ENGINE_ARTIFACTS
> +	bool "build the development artifacts"
> +	help
> +	  Build the development artifacts used for compiling
> +	  flutter applications. This significantly increases the time
> +	  to compile.

Could you clarify what those artifacts are? I don't really care about
"compiling flutter applications" on the target, I want to do that on
the host.

> +endif #if BR2_PACKAGE_FLUTTER_ENGINE
> +
> +comment "flutter-engine needs an OpenGL backend"
				 ^^^ an OpenGL or OpenGLES

	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS

needed here as well to not show the comment when not relevant.

> +	depends on !BR2_PACKAGE_HAS_LIBGL && !BR2_PACKAGE_HAS_LIBGLES

> diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
> new file mode 100644
> index 0000000000..b5b99c4cad
> --- /dev/null
> +++ b/package/flutter-engine/flutter-engine.mk
> @@ -0,0 +1,239 @@
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
> +#  - Copy the pre-made gclient config file to a temporary scratch directory.
> +#  - Run gclient sync to generate a source directory with the proper
> +#    flutter-engine source code in the correct places.
> +#  - Run mk_tar_gz to create a tarball.
> +#  - Copy the tarball to the $(FLUTTER_ENGINE_DL_DIR) directory to create a
> +#    tarball.
> +#
> +# There is no hash provided, as the gn binary (used for configuration) relies
> +# on the .git directories. As such, a reproducible tarball is not possible.
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

So perhaps this the full list of supported CPU architectures? This is
already a subset of the ones in BR2_PACKAGE_LLVM_ARCH_SUPPORTS:
BR2_riscv is not handled here. So it does confirm my point above: using
BR2_PACKAGE_LLVM_ARCH_SUPPORTS is probably not correct.

> +ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
> +FLUTTER_ENGINE_RUNTIME_MODE=debug
> +else
> +FLUTTER_ENGINE_RUNTIME_MODE=release
> +endif
> +
> +FLUTTER_ENGINE_BUILD_DIR = \
> +	$(@D)/out/linux_$(FLUTTER_ENGINE_RUNTIME_MODE)_$(FLUTTER_ENGINE_TARGET_ARCH)
> +
> +FLUTTER_ENGINE_INSTALL_FILES = \
> +	libflutter_engine.so \
> +	libflutter_linux_gtk.so
> +
> +# Flutter engine includes a bundled patched clang that must be used for
> +# compiling or else there are linking errors.
> +FLUTTER_ENGINE_CLANG_PATH = $(@D)/buildtools/linux-x64/clang
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
> +	--target-toolchain $(FLUTTER_ENGINE_CLANG_PATH) \
> +	--target-triple $(FLUTTER_ENGINE_TARGET_TRIPPLE)
> +
> +ifeq ($(BR2_arm)$(BR2_armeb),y)
> +FLUTTER_ENGINE_CONF_OPTS += \
> +	--arm-float-abi $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
> +endif
> +
> +# We must specify a full path to ccache and a full path to the flutter-engine
> +# provided clang in order to use ccache, or else flutter-engine will error out
> +# attempting to find ccache in the target-toolchain provided path.
> +ifeq ($(BR2_CCACHE),y)
> +define FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> +	$(SED) "s%cc =.*%cc = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +
> +	$(SED) "s%cxx =.*%cxx = \"$(HOST_DIR)/bin/ccache $(FLUTTER_ENGINE_CLANG_PATH)/bin/clang++\""%g \
> +		$(@D)/build/toolchain/custom/BUILD.gn
> +endef
> +FLUTTER_ENGINE_PRE_CONFIGURE_HOOKS += FLUTTER_ENGINE_COMPILER_PATH_FIXUP
> +endif
> +
> +ifeq ($(BR2_ENABLE_LTO),y)
> +FLUTTER_ENGINE_CONF_OPTS += --lto
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-lto
> +endif
> +
> +ifeq ($(BR2_OPTIMIZE_0),y)
> +FLUTTER_ENGINE_CONF_OPTS += --unoptimized
> +endif
> +
> +ifeq ($(BR2_STRIP_strip),y)
> +FLUTTER_ENGINE_CONF_OPTS += --stripped
> +else
> +FLUTTER_ENGINE_CONF_OPTS += --no-stripped
> +endif

Please use --no-stripped unconditionally, and let Buildroot do the
stripping.


> +ifeq ($(BR2_PACKAGE_MESA3D),y)
> +FLUTTER_ENGINE_DEPENDENCIES += mesa3d
> +endif

Why do you have something specific to mesa3d here? mesa3d is an OpenGL
or OpenGLES provider, so:

+ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgl
+endif
+
+ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
+FLUTTER_ENGINE_DEPENDENCIES += libgles
+endif

already deals with it.

> +# There is no --disable-vulkan option
> +ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),y)
> +FLUTTER_ENGINE_CONF_OPTS += --enable-vulkan
> +endif

At some point we will probably want some kind of virtual package for
vulkan, but as it doesn't exist today, good enough for now.


> +# Generate a tarball if one does not already exist.
> +define FLUTTER_ENGINE_GENERATE_TARBALL
> +	PATH=$(BR_PATH):$(HOST_DIR)/share/depot_tools \
> +	PYTHONPATH=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR) \
> +	$(FLUTTER_ENGINE_PKGDIR)/gen-tarball \
> +		--dot-gclient $(FLUTTER_ENGINE_PKGDIR)/dot-gclient \
> +		--jobs $(PARALLEL_JOBS) \
> +		--scratch-dir $(@D)/dl-tmp \
> +		--tarball $(FLUTTER_ENGINE_TARBALL_PATH) \
> +		--version $(FLUTTER_ENGINE_VERSION)
> +endef
> +FLUTTER_ENGINE_POST_DOWNLOAD_HOOKS += FLUTTER_ENGINE_GENERATE_TARBALL

I was going to ask: why is this a post-download hook rather than an
override of the entire download step. Turns out we don't have anything
like <pkg>_DOWNLOAD_CMDS that we can override. It's a pity, cause it
would be the right thing to do here. Here again: I'm not making this a
requirement at all for your patch to  be merged.

> +define FLUTTER_ENGINE_EXTRACT_CMDS
> +	gzip -d -c $(FLUTTER_ENGINE_TARBALL_PATH) | tar --strip-components 1 -C $(@D) -xf -
> +endef

If I understand correctly, we cannot let the default <pkg>_EXTRACT_CMDS
do its job because <pkg>_SOURCE is empty. And <pkg>_SOURCE is empty to
prevent the default download step from downloading stuff. So here
again, being able to override the download step would allow us to set
<pkg>_SOURCE, and therefore be able to use the default extract commands.

> +define FLUTTER_ENGINE_CONFIGURE_CMDS
> +	cd $(@D)/ && \

Drop slash after cd $(@D)/

> +define FLUTTER_ENGINE_INSTALL_STAGING_CMDS
> +	$(foreach i,$(FLUTTER_ENGINE_INSTALL_FILES),
> +		$(Q)if [ -e $(FLUTTER_ENGINE_BUILD_DIR)/$(i) ]; then \
> +			$(INSTALL) -D -m 0755 $(FLUTTER_ENGINE_BUILD_DIR)/$(i) \
> +				$(STAGING_DIR)/usr/lib/$(i); \

Can FLUTTER_ENGINE_INSTALL_FILES be built in a bit of a smarter way to
avoid having the conditional here?

+FLUTTER_ENGINE_INSTALL_FILES = \
+	libflutter_engine.so \
+	libflutter_linux_gtk.so

Isn't libflutter_linux_gtk.so produced only when Gtk support is
available?

> diff --git a/package/flutter-engine/gen-tarball b/package/flutter-engine/gen-tarball
> new file mode 100755
> index 0000000000..572c055bea
> --- /dev/null
> +++ b/package/flutter-engine/gen-tarball
> @@ -0,0 +1,108 @@
> +#!/usr/bin/env bash
> +# Call gclient and generate a flutter-engine source tarball if one does not
> +# already exist.
> +#
> +# Author: Adam Duskett <adam.duskett@amarulasolutions.com>
> +set -eu
> +
> +DL_DIR=
> +DOT_GCLIENT=
> +JOBS=
> +SCRATCH_DIR=
> +TARBALL=
> +VERSION=
> +
> +# shellcheck disable=SC1091
> +. ./support/download/helpers
> +
> +# Print status messages in the same style Buildroot prints.
> +message() {
> +  term_bold="$(tput smso 2>/dev/null)"
> +  term_reset="$(tput rmso 2>/dev/null)"
> +  echo "${term_bold}>>> flutter-engine ${VERSION} ${1}${term_reset}"
> +}
> +
> +parse_opts(){
> +  local o O opts
> +
> +  o='d:j:s:t:v:'
> +  O='dot-gclient:,jobs:,scratch-dir:,tarball:,version:'
> +  opts="$(getopt -o "${o}" -l "${O}" -- "${@}")"
> +  eval set -- "${opts}"
> +
> +  while [ ${#} -gt 0 ]; do
> +    case "${1}" in
> +    (-d|--dot-gclient)
> +      DOT_GCLIENT="${2}"
> +      shift 2
> +      ;;
> +    (-j|--jobs)
> +      JOBS="${2}"
> +      shift 2
> +      ;;
> +    (-s|--scratch-dir)
> +      SCRATCH_DIR="${2}"
> +      shift 2
> +      ;;
> +    (-t|--tarball)
> +      DL_DIR=$(dirname "${2}")
> +      TARBALL="${2}"
> +      shift 2
> +      ;;
> +    (-v|--version)
> +      VERSION="${2}"
> +      shift 2
> +      ;;
> +    (--)
> +      shift
> +      break
> +      ;;
> +    esac
> +  done
> +}
> +
> +copy_dot_gclient(){
> +  rm -rf "${SCRATCH_DIR}"
> +  mkdir -p "${SCRATCH_DIR}"
> +  install -D -m 0755 "${DOT_GCLIENT}" "${SCRATCH_DIR}"/.gclient
> +  sed "s%!FLUTTER_VERSION!%${VERSION}%g" -i "${SCRATCH_DIR}"/.gclient
> +}
> +
> +run_gclient() {
> +  local gclient="${HOST_DIR}"/share/depot_tools/gclient.py
> +  if [[ ! -e "${gclient}" ]]; then
> +    message "${gclient} does not exist. Is host-depot-tools built and installed?"
> +    exit 1
> +  fi
> +  message "Downloading"
> +  cd "${SCRATCH_DIR}"
> +  "${gclient}" \
> +    sync \
> +    --delete_unversioned_trees \
> +    --no-history \
> +    --reset \
> +    --shallow \
> +    -j"${JOBS}"
> +}
> +
> +gen_tarball(){
> +  message "Generating tarball"
> +  mkdir -p "${DL_DIR}"
> +  mk_tar_gz \
> +    "${SCRATCH_DIR}"/src \
> +    flutter-"${VERSION}" \
> +    "$(git -C "${SCRATCH_DIR}"/src log -1 --pretty=format:%ci)" \
> +    "${TARBALL}"
> +  rm -rf "${SCRATCH_DIR}"
> +}
> +
> +main() {
> +  parse_opts "${@}"
> +  if [ ! -e "${TARBALL}" ]; then

I'm not sure about this condition. Why is there? If the tarball is
already there, I would expect this tool to re-generate it and overwrite
it, rather than "do nothing".

Thanks for this work. Seriously, it looks quite good, and close to a
state where it can be merged. I think it no longer needs to be in the
"RFC" state.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
