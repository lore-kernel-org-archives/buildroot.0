From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 Oct 2019 00:13:21 +0100
Subject: [Buildroot] [PATCH v1 1/2] package/qemu: enable xtensa support
 for host-qemu
In-Reply-To: <20191028210654.20400-1-ps.report@gmx.net>
References: <20191028210654.20400-1-ps.report@gmx.net>
Message-ID: <008c31e9-33f9-edc9-1884-13ff300479c5@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 28/10/2019 22:06, Peter Seiderer wrote:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 I didn't understand at first why xtensa was not yet enabled. But it turns out
that our xtensa support was added a few months after qemu was added, and nobody
bothered to update the list of supported architectures.

 Regards,
 Arnout

> ---
>  package/qemu/Config.in.host | 1 +
>  package/qemu/qemu.mk        | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/qemu/Config.in.host b/package/qemu/Config.in.host
> index 43d55c88ce..d6b4bf6dd4 100644
> --- a/package/qemu/Config.in.host
> +++ b/package/qemu/Config.in.host
> @@ -18,6 +18,7 @@ config BR2_PACKAGE_HOST_QEMU_ARCH_SUPPORTS
>  	default y if BR2_sh
>  	default y if BR2_sparc
>  	default y if BR2_sparc64
> +	default y if BR2_xtensa
>  	default y if BR2_x86_64
>  	depends on !BR2_powerpc_620 && !BR2_powerpc_630 && !BR2_powerpc_970
> 
> diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
> index 4e39fce8a6..a91f9d3eeb 100644
> --- a/package/qemu/qemu.mk
> +++ b/package/qemu/qemu.mk
> @@ -209,6 +209,7 @@ HOST_QEMU_DEPENDENCIES = host-pkgconf host-zlib host-libglib2 host-pixman
>  #       sh4aeb          sh4eb
>  #       sparc           sparc
>  #       sparc64         sparc64
> +#       xtensa          xtensa
> 
>  HOST_QEMU_ARCH = $(ARCH)
>  ifeq ($(HOST_QEMU_ARCH),i486)
> --
> 2.23.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
> 
