From: David PIERRET <david.pierret@smile.fr>
Date: Fri, 27 Mar 2020 11:51:56 +0100
Subject: [Buildroot] [PATCH v3 05/10] package/rust: drop dependency on
 host-cargo-bin
In-Reply-To: <20200207180829.165689-6-arnout@mind.be>
References: <20200207180829.165689-1-arnout@mind.be>
 <20200207180829.165689-6-arnout@mind.be>
Message-ID: <CADyEP=T9Vwgwmb7D00x=qcHs1fivOO5oGJT8Lr2mDpc4mZXp8Q@mail.gmail.com>
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
> As host-rust depends on host-rust-bin, which depends on host-cargo-bin,
> remove unneeded dependency.
>
> Signed-off-by: Eric Le Bihan <eric.le.bihan.dev@free.fr>
> Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Reviewed-by: David Pierret <david.pierret@smile.fr>
Tested-by: David Pierret <david.pierret@smile.fr>
> ---
>  package/rust/rust.mk | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/package/rust/rust.mk b/package/rust/rust.mk
> index 9bbed15082..588e1088f8 100644
> --- a/package/rust/rust.mk
> +++ b/package/rust/rust.mk
> @@ -15,7 +15,6 @@ HOST_RUST_PROVIDES = host-rustc
>  HOST_RUST_DEPENDENCIES = \
>         toolchain \
>         host-rust-bin \
> -       host-cargo-bin \
>         host-openssl \
>         host-python \
>         $(BR2_CMAKE_HOST_DEPENDENCY)
> --
> 2.24.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
