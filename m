From: David PIERRET <david.pierret@smile.fr>
Date: Fri, 27 Mar 2020 11:47:18 +0100
Subject: [Buildroot] [PATCH v3 03/10] package/cargo-bin: install if
 rust-bin selected
In-Reply-To: <20200207180829.165689-4-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-4-arnout@mind.be>
Message-ID: <CADyEP=SEEdAUC3MMwOmLK10YexteGGJkZB7N98RT4HEMbUrb4w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Working on a new package using rust, this patch suite have resolved my
issue with rust version successfully.

Regards
David

On Fri, Feb 7, 2020 at 7:09 PM Arnout Vandecappelle (Essensium/Mind)
<arnout@mind.be> wrote:
>
> From: Eric Le Bihan <eric.le.bihan.dev@free.fr>
>
> If host-rust-bin, the pre-built Rust compiler, is selected as a rustc
> provider, then also install the pre-built cargo binary to be coherent.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> [Arnout: don't install cargo config, alread moved]
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
> ---
>  package/cargo-bin/cargo-bin.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/package/cargo-bin/cargo-bin.mk b/package/cargo-bin/cargo-bin.mk
> index 3614f7a53d..3eaf417531 100644
> --- a/package/cargo-bin/cargo-bin.mk
> +++ b/package/cargo-bin/cargo-bin.mk
> @@ -10,4 +10,10 @@ CARGO_BIN_SOURCE = cargo-$(CARGO_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
>  CARGO_BIN_LICENSE = Apache-2.0 or MIT
>  CARGO_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>
> +ifeq ($(BR2_PACKAGE_HOST_RUST_BIN),y)
> +define HOST_CARGO_BIN_INSTALL_CMDS
> +       $(@D)/install.sh --prefix=$(HOST_DIR) --disable-ldconfig
> +endef
> +endif
> +
>  $(eval $(host-generic-package))
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
