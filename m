From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 3 May 2021 10:15:52 +1000
Subject: [Buildroot] [PATCH 2/5] package/libatomic_ops: enable for
 riscv32 and riscv64
In-Reply-To: <20210502214919.1826571-3-romain.naour@gmail.com>
References: <20210502214919.1826571-1-romain.naour@gmail.com>
 <20210502214919.1826571-3-romain.naour@gmail.com>
Message-ID: <CAKmqyKNFj9pH8u5Vx6W4LNGv8uujvNdHgzoH_EVnAhPsd3gkXQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, May 3, 2021 at 7:50 AM Romain Naour <romain.naour@gmail.com> wrote:
>
> The riscv support has been added since v7.6.4 release.
>
> https://github.com/ivmai/libatomic_ops/commit/137643f1417ded071c56e05401ca6a3c16492d96
>
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/libatomic_ops/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/libatomic_ops/Config.in b/package/libatomic_ops/Config.in
> index e9206f3395..6de5979aeb 100644
> --- a/package/libatomic_ops/Config.in
> +++ b/package/libatomic_ops/Config.in
> @@ -1,6 +1,6 @@
>  config BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
>         bool
> -       default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
> +       default y if BR2_arm || BR2_armeb || BR2_aarch64 || BR2_i386 || BR2_sparc || BR2_sparc64 || BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le || BR2_x86_64 || BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_riscv
>         # Unsupported for MIPS R6
>         depends on !BR2_MIPS_CPU_MIPS32R6 && !BR2_MIPS_CPU_MIPS64R6
>
> --
> 2.30.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
