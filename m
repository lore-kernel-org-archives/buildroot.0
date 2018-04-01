From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Sun, 1 Apr 2018 09:25:47 -0500
Subject: [Buildroot] [PATCH] ppc64 e5500 arch: new qemu target
In-Reply-To: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
References: <1522592130-25157-1-git-send-email-matthew.weber@rockwellcollins.com>
Message-ID: <CANQCQpZu=s0ovBMLsQYLhAk8kPB3AfN_qCDutkSyV_+K0MAAPQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Sun, Apr 1, 2018 at 9:15 AM, Matt Weber
<matthew.weber@rockwellcollins.com> wrote:
> Adding basic support modeled after the Freescale/NXP
> T1040RDBD4 board.
>
> This target is used to support testing of the bootlin e5500
> toolchain.
>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
> ---
>  DEVELOPERS                            |  1 +
>  board/qemu/ppc64-e5500/linux.fragment |  2 ++
>  board/qemu/ppc64-e5500/readme.txt     |  7 +++++++
>  configs/qemu_ppc64_e5500_defconfig    | 18 ++++++++++++++++++
>  4 files changed, 28 insertions(+)
>  create mode 100644 board/qemu/ppc64-e5500/linux.fragment
>  create mode 100644 board/qemu/ppc64-e5500/readme.txt
>  create mode 100644 configs/qemu_ppc64_e5500_defconfig
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index ac7a47f..dd7e389 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -1165,6 +1165,7 @@ F:        package/ts4900-fpga/
>  N:     Matt Weber <matthew.weber@rockwellcollins.com>
>  F:     board/freescale/p*
>  F:     board/freescale/t*
> +F:     board/qemu/ppc64-e5500/
>  F:     configs/freescale_p*
>  F:     configs/freescale_t*

Just noticed I should have added myself to configs/qemu_ppc64_e5500_defconfig

>  F:     package/argp-standalone/
> diff --git a/board/qemu/ppc64-e5500/linux.fragment b/board/qemu/ppc64-e5500/linux.fragment
> new file mode 100644
> index 0000000..81993d2
> --- /dev/null
> +++ b/board/qemu/ppc64-e5500/linux.fragment
> @@ -0,0 +1,2 @@
> +# Enables generic e500 arch support for QEMU
> +CONFIG_PPC_QEMU_E500=y
> diff --git a/board/qemu/ppc64-e5500/readme.txt b/board/qemu/ppc64-e5500/readme.txt
> new file mode 100644
> index 0000000..8da23f9
> --- /dev/null
> +++ b/board/qemu/ppc64-e5500/readme.txt
> @@ -0,0 +1,7 @@
> +Run the emulation with:
> +
> + qemu-system-ppc64 -M ppce500 -cpu e5500 -m 256 -kernel output/images/uImage -append 'console=ttyS0 root=/dev/ram' -initrd output/images/rootfs.cpio.gz -serial mon:stdio -nographic
> +

This arch seems like it had good support back to QEMU 2.0.0.  However,
I'll be submitting a bootlin e6500 arch variant toolchain but I'm
still working out what version of QEMU can even boot that arch.  As of
2.11.x support hasn't been merged.

(Working on pull request for e5500 testing in the toolchain-builder repo now)

Matt
