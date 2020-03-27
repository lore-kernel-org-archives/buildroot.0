From: David PIERRET <david.pierret@smile.fr>
Date: Fri, 27 Mar 2020 11:50:15 +0100
Subject: [Buildroot] [PATCH v3 04/10] package/rust-bin: host variant
 depends on host-cargo-bin
In-Reply-To: <20200207180829.165689-5-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-5-arnout@mind.be>
Message-ID: <CADyEP=SncsCWM4Mfctv8-yK775DMB7DCDeaHRSPiyYJxXvb_Yw@mail.gmail.com>
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
> Ensure installation of pre-built cargo binary by adding it to the
> dependency list of the host variant of the pre-built Rust compiler.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
> ---
>  package/rust-bin/rust-bin.mk | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
> index a374215e20..bef3102450 100644
> --- a/package/rust-bin/rust-bin.mk
> +++ b/package/rust-bin/rust-bin.mk
> @@ -10,6 +10,7 @@ RUST_BIN_LICENSE = Apache-2.0 or MIT
>  RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
>
>  HOST_RUST_BIN_PROVIDES = host-rustc
> +HOST_RUST_BIN_DEPENDENCIES = host-cargo-bin
>
>  HOST_RUST_BIN_SOURCE = rustc-$(RUST_BIN_VERSION)-$(RUSTC_HOST_NAME).tar.xz
>
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
