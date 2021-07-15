From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 15 Jul 2021 14:45:05 +1000
Subject: [Buildroot] [PATCH v2 3/9] package make: build RISC-V nommu
 builds as linux
In-Reply-To: <20210715004843.337268-4-damien.lemoal@wdc.com>
References: <20210715004843.337268-1-damien.lemoal@wdc.com>
 <20210715004843.337268-4-damien.lemoal@wdc.com>
Message-ID: <CAKmqyKPT08es4_A6r+LjvfVf4ZCkzvtE7fDH2OASqrfHhw_fSA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Thu, Jul 15, 2021 at 10:51 AM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> From: Christoph Hellwig <hch@lst.de>
>
> Using *-uclinux-* seems like an only partially followed convention.
> And at least for RISC-V gcc doesn't know about uclinux tuples, so
> switch back to the normal Linux one for now.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> [Damien]
> * Make the change conditional on BR2_riscv arch being "y".
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  package/Makefile.in | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 86db62ba5b..6de673a085 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -39,8 +39,9 @@ endif
>  # Compute GNU_TARGET_NAME
>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
>
> -# FLAT binary format needs uclinux
> -ifeq ($(BR2_BINFMT_FLAT),y)
> +# FLAT binary format needs uclinux, except RISC-V which needs
> +# the regular linux name.
> +ifeq ($(BR2_BINFMT_FLAT):$(BR2_riscv),y:)
>  TARGET_OS = uclinux
>  else
>  TARGET_OS = linux
> --
> 2.31.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
