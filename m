From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 9 Sep 2020 10:44:37 -0700
Subject: [Buildroot] [PATCH v2 2/6] arch/config: Make RISC-V MMU optional
In-Reply-To: <20200908113324.1022230-3-damien.lemoal@wdc.com>
References: <20200908113324.1022230-1-damien.lemoal@wdc.com>
 <20200908113324.1022230-3-damien.lemoal@wdc.com>
Message-ID: <CAKmqyKMHVh1ypWeL2U4=a1u329FAXRvUu1LPod-Z=_mS6B+=RQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Sep 8, 2020 at 4:33 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
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
> index 0707c076e2..4a2787c350 100644
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
> 2.26.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
