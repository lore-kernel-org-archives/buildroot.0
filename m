From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 12 Jul 2021 13:20:43 +1000
Subject: [Buildroot] [PATCH 1/9] arch/config: Make RISC-V MMU optional
In-Reply-To: <20210709063641.277005-2-damien.lemoal@wdc.com>
References: <20210709063641.277005-1-damien.lemoal@wdc.com>
 <20210709063641.277005-2-damien.lemoal@wdc.com>
Message-ID: <CAKmqyKOZxBNBM0SLAQu3EDs3tJ436-C6m8Z+NV2yViNRsCHTOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 9, 2021 at 4:37 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Linux supports No-MMU RISC-V since kernel version 5.8. Make MMU optional
> to enable building for RISC-V boards that do not have one.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  arch/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/Config.in b/arch/Config.in
> index 1853e26bb4..82d3b01980 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -210,7 +210,7 @@ config BR2_powerpc64le
>
>  config BR2_riscv
>         bool "RISCV"
> -       select BR2_ARCH_HAS_MMU_MANDATORY
> +       select BR2_ARCH_HAS_MMU_OPTIONAL
>         select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
>         help
>           RISC-V is an open, free Instruction Set Architecture created
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
