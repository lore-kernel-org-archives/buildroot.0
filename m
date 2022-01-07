Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2295BC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 01:13:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 87BF183005;
	Fri,  7 Jan 2022 01:13:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s5Z-n4Wt3BbH; Fri,  7 Jan 2022 01:13:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E566823C6;
	Fri,  7 Jan 2022 01:13:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1814D1C1162
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 01:13:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 01D07823C6
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 01:13:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SbvhlUlVgqOS for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 01:13:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com
 [IPv6:2607:f8b0:4864:20::c2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 082F281CA3
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 01:13:03 +0000 (UTC)
Received: by mail-oo1-xc2a.google.com with SMTP id
 y13-20020a4a624d000000b002daae38b0b5so1105570oog.9
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 17:13:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hIfw+EDSUqh68daOAOC5HRRrZVJf5mvOsWhoa3kIJ+E=;
 b=o2bSXPfZSF8pCcQ85FzzDtQW0gs2CpicsGglEWfi52pKD5yX8B6HLVJT8qViWofXa1
 2A93G1VgY3jFl82yHkNEYI1wXW+4VpkDiW60szBAmimvB22PUdCRPuh7GjRRp9F/RbSX
 +YzZpKBEaY8tsq6EaajaBP6x/y9ZttQG/ciBG5C2oN+sqsvjWaNnNx9N2+1W3upP/pdG
 Kn0+c1nr0TCqJ1wftxE3QOZmmE1zx50T5HcWCmDiKal7DKtaDV+qQyHnrCSklUaggePU
 3OtNKsEaf+rkkXPn8VfTMUt3LbfCuvhlSys2SzMbVVXtNYB+5EGSbUcQBMboDbb8PlDr
 V3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hIfw+EDSUqh68daOAOC5HRRrZVJf5mvOsWhoa3kIJ+E=;
 b=z8k9CNEzbxJmly/YLrjFeJ1TBRYsEnOtHK1Q1wF2DWitHlpVnn7UAPXD624QA1it++
 6tngF4gcVzBoBLpsstiyCdkxpzF2QSK0d8apMiFGW+y58LatLzr2eOsRPw9BI0oUmraB
 XHTRVNU7G3Efi4MNm7rxGcybIHKTaX6WLL6+qrQBJ6BC8a3ikGXhiMu0lhqup1KrzFbO
 l/HHYVx7AgyHwcjVmKtnNFmRO05HK0RlQMrcOQeEzsLhMoww1i4Nx/vUah8k/X1fdh3D
 Blj/Sx7u2JK7G57TthWM2s7Q6XBQlVokRwHbtJiLw2utk3WxLHSKQnV4w4yoTuaPaPBJ
 /hHQ==
X-Gm-Message-State: AOAM533CRbMIbubbzYGHRZhQn1vMPGpCCf1eIGP5k8Rsw7rRNYUj2Gne
 bNeS56RHPvmdzVrbDGL4IZFObpVzgcX3Rue4xGA=
X-Google-Smtp-Source: ABdhPJwMY8SU/VVFIDeWWZSRaNnTse4H+mU70E7tfzHonosmxRo7KrX11ArAcK60GQyBWyWKEW6tOFa4f1dyPcuxoHA=
X-Received: by 2002:a05:6820:1609:: with SMTP id
 bb9mr2673485oob.22.1641517982814; 
 Thu, 06 Jan 2022 17:13:02 -0800 (PST)
MIME-Version: 1.0
References: <20220106210000.397694-1-thomas.petazzoni@bootlin.com>
 <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
In-Reply-To: <20220106210000.397694-6-thomas.petazzoni@bootlin.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Thu, 6 Jan 2022 19:12:51 -0600
Message-ID: <CADvTj4rf+NisSUL7=Ee_=3bpDFCaxpsXmUzcOF=oUD5imqXbSQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH v3 05/11] package/pkg-cargo.mk: introduce
 the cargo package infrastructure
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
Cc: Matt Weber <Matthew.Weber@rockwellcollins.com>,
 Patrick Havelange <patrick.havelange@essensium.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Thu, Jan 6, 2022 at 3:00 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> From: Patrick Havelange <patrick.havelange@essensium.com>
>
> In order to be package agnostic, the install phase is now using cargo
> instead of install. TARGET_CONFIGURE_OPTS is now also set when running
> cargo in order to support cross compiling C code within cargo.
>
> This commit also adds support/download/cargo-post-process to perform
> the vendoring on Cargo packages.
>
> The <pkg>_LICENSE variable of cargo packages is expanded with ",
> vendored dependencies licenses probably not listed" as currently for
> all packages, the licenses of the vendored dependencies are not taken
> into account.
>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> [Thomas: add support for host-cargo-package and vendoring]
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/Makefile.in                 |   1 +
>  package/pkg-cargo.mk                | 153 ++++++++++++++++++++++++++++
>  support/download/cargo-post-process |  38 +++++++
>  3 files changed, 192 insertions(+)
>  create mode 100644 package/pkg-cargo.mk
>  create mode 100755 support/download/cargo-post-process
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index dae7a859fd..0ca2a5844e 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -441,3 +441,4 @@ include package/pkg-waf.mk
>  include package/pkg-golang.mk
>  include package/pkg-meson.mk
>  include package/pkg-qmake.mk
> +include package/pkg-cargo.mk
> diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> new file mode 100644
> index 0000000000..bf1436a86b
> --- /dev/null
> +++ b/package/pkg-cargo.mk
> @@ -0,0 +1,153 @@
> +################################################################################
> +# Cargo package infrastructure
> +#
> +# This file implements an infrastructure that eases development of package
> +# .mk files for Cargo packages. It should be used for all packages that use
> +# Cargo as their build system.
> +#
> +# See the Buildroot documentation for details on the usage of this
> +# infrastructure
> +#
> +# In terms of implementation, this Cargo infrastructure requires the .mk file
> +# to only specify metadata information about the package: name, version,
> +# download URL, etc.
> +#
> +# We still allow the package .mk file to override what the different steps
> +# are doing, if needed. For example, if <PKG>_BUILD_CMDS is already defined,
> +# it is used as the list of commands to perform to build the package,
> +# instead of the default Cargo behaviour. The package can also define some
> +# post operation hooks.
> +#
> +################################################################################
> +
> +################################################################################
> +# inner-cargo-package -- defines how the configuration, compilation and
> +# installation of a cargo package should be done, implements a few hooks
> +# to tune the build process for cargo specifities and calls the generic
> +# package infrastructure to generate the necessary make targets
> +#
> +#  argument 1 is the lowercase package name
> +#  argument 2 is the uppercase package name, including a HOST_ prefix
> +#             for host packages
> +#  argument 3 is the uppercase package name, without the HOST_ prefix
> +#             for host packages
> +#  argument 4 is the type (target or host)
> +################################################################################
> +
> +define inner-cargo-package
> +
> +# We need host-rustc to run cargo
> +$(2)_DOWNLOAD_DEPENDENCIES += host-rustc
> +
> +$(2)_CARGO_ENV += \
> +       CARGO_HOME=$$(HOST_DIR)/share/cargo \
> +       __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> +       CARGO_TARGET_APPLIES_TO_HOST="false"

Maybe want to set these additional options as well so that packages
using cargo can
build with only the env variables set(in some cases at least I think),
still probably
need to pass some command line args but this should reduce the amount at least:
RUSTC_TARGET_TRIPLE = $(subst -,_,$(call UPPERCASE,$(RUSTC_TARGET_NAME)))

PKG_RUST_CARGO_ENV = \
    CARGO_HOME=$(HOST_DIR)/share/cargo \
    CARGO_BUILD_TARGET=$(RUSTC_TARGET_NAME) \
    CARGO_INSTALL_ROOT=$(TARGET_DIR)/usr \
    CARGO_TARGET_$(RUSTC_TARGET_TRIPLE)_LINKER=$(notdir $(TARGET_CROSS))gcc

HOST_PKG_RUST_CARGO_ENV = \
    CARGO_HOME=$(HOST_DIR)/share/cargo \
    CARGO_INSTALL_ROOT=$(HOST_DIR) \
    RUSTFLAGS="$(addprefix -C link-args=,$(HOST_LDFLAGS))"

> +
> +$(2)_DOWNLOAD_POST_PROCESS = cargo
> +$(2)_DL_ENV = CARGO_HOME=$$(HOST_DIR)/share/cargo
> +
> +# Due to vendoring, it is pretty likely that not all licenses are
> +# listed in <pkg>_LICENSE.
> +$(2)_LICENSE += , vendored dependencies licenses probably not listed
> +
> +# Note: in all the steps below, we "cd" into the build directory to
> +# execute the "cargo" tool instead of passing $(@D)/Cargo.toml as the
> +# manifest-path. Indeed while the latter seems to work, it in fact
> +# breaks in subtle ways as the way cargo searches for its
> +# configuration file is based (among other rules) on the current
> +# directory. This means that if cargo is started outside of a package
> +# directory, its configuration file will not be taken into account.
> +#
> +# Also, we pass:
> +#  * --offline to prevent cargo from downloading anything: all
> +#    dependencies should have been built by the download post
> +#    process logic
> +#  * --locked to force cargo to use the Cargo.lock file, which ensures
> +#    that a fixed set of dependency versions is used
> +
> +#
> +# Build step. Only define it if not already defined by the package .mk
> +# file.
> +#
> +ifndef $(2)_BUILD_CMDS
> +ifeq ($(4),target)
> +define $(2)_BUILD_CMDS
> +       cd $$(@D) && \
> +       $$(TARGET_MAKE_ENV) \
> +               $$(TARGET_CONFIGURE_OPTS) \
> +               $$($(2)_CARGO_ENV) \
> +               cargo build \
> +                       --offline \
> +                       --target $$(RUSTC_TARGET_NAME) \
> +                       $$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
> +                       --manifest-path Cargo.toml \
> +                       --locked \
> +                       -Z target-applies-to-host \
> +                       $$($(2)_CARGO_BUILD_OPTS)
> +endef
> +else # ifeq ($(4),target)
> +define $(2)_BUILD_CMDS
> +       cd $$(@D) && \
> +       $$(HOST_MAKE_ENV) \
> +               RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> +               $$($(2)_CARGO_ENV) \
> +               cargo build \
> +                       --offline \
> +                       --release \
> +                       --manifest-path Cargo.toml \
> +                       --locked \
> +                       $$($(2)_CARGO_BUILD_OPTS)
> +endef
> +endif # ifeq ($(4),target)
> +endif # ifndef $(2)_BUILD_CMDS
> +
> +#
> +# Target installation step. Only define it if not already defined by
> +# the package .mk file.
> +#
> +ifndef $(2)_INSTALL_TARGET_CMDS
> +define $(2)_INSTALL_TARGET_CMDS
> +       cd $$(@D) && \
> +       $$(TARGET_MAKE_ENV) $$($(2)_CARGO_ENV) \
> +               cargo install \
> +                       --target $$(RUSTC_TARGET_NAME) \
> +                       --offline \
> +                       --root $$(TARGET_DIR)/usr/ \
> +                       --bins \
> +                       --path ./ \
> +                       --force \
> +                       --locked \
> +                       $$($(2)_CARGO_INSTALL_OPTS)
> +endef
> +endif
> +
> +ifndef $(2)_INSTALL_CMDS
> +define $(2)_INSTALL_CMDS
> +       cd $$(@D) && \
> +       $$(HOST_MAKE_ENV) \
> +               RUSTFLAGS="$$(addprefix -C link-args=,$$(HOST_LDFLAGS))" \
> +               $$($(2)_CARGO_ENV) \
> +               cargo install \
> +                       --offline \
> +                       --root $$(HOST_DIR) \
> +                       --bins \
> +                       --path ./ \
> +                       --force \
> +                       --locked \
> +                       $$($(2)_CARGO_INSTALL_OPTS)
> +endef
> +endif
> +
> +# Call the generic package infrastructure to generate the necessary
> +# make targets
> +$(call inner-generic-package,$(1),$(2),$(3),$(4))
> +
> +endef
> +
> +################################################################################
> +# cargo-package -- the target generator macro for Cargo packages
> +################################################################################
> +
> +cargo-package = $(call inner-cargo-package,$(pkgname),$(call UPPERCASE,$(pkgname)),$(call UPPERCASE,$(pkgname)),target)
> +host-cargo-package = $(call inner-cargo-package,host-$(pkgname),$(call UPPERCASE,host-$(pkgname)),$(call UPPERCASE,$(pkgname)),host)
> diff --git a/support/download/cargo-post-process b/support/download/cargo-post-process
> new file mode 100755
> index 0000000000..25dbbedbfa
> --- /dev/null
> +++ b/support/download/cargo-post-process
> @@ -0,0 +1,38 @@
> +#!/usr/bin/env bash
> +
> +set -e
> +
> +. "${0%/*}/helpers"
> +
> +while getopts "n:o:" OPT; do
> +    case "${OPT}" in
> +    o)  output="${OPTARG}";;
> +    n)  base_name="${OPTARG}";;
> +    :)  error "option '%s' expects a mandatory argument\n" "${OPTARG}";;
> +    \?) error "unknown option '%s'\n" "${OPTARG}";;
> +    esac
> +done
> +
> +# Already vendored tarball, nothing to do
> +if tar tf ${output} | grep -q "^[^/]*/VENDOR" ; then
> +    exit 0
> +fi
> +
> +post_process_unpack ${base_name} ${output}
> +
> +# Do the Cargo vendoring
> +pushd ${base_name} > /dev/null
> +cargo vendor --locked VENDOR
> +
> +# Create the local .cargo/config with vendor info
> +mkdir -p .cargo/
> +cat <<EOF >.cargo/config
> +[source.crates-io]
> +replace-with = "vendored-sources"
> +
> +[source.vendored-sources]
> +directory = "VENDOR"
> +EOF
> +popd > /dev/null
> +
> +post_process_repack $(pwd) ${base_name} ${output}
> --
> 2.33.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
