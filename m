From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 3 Sep 2020 23:55:15 +0200
Subject: [Buildroot] [PATCH] qemu_riscv32_virt: Update to mainline glibc
 and kernel 5.4
In-Reply-To: <20200831232051.2303515-1-alistair.francis@wdc.com>
References: <20200831232051.2303515-1-alistair.francis@wdc.com>
Message-ID: <20200903235515.7b95e485@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 31 Aug 2020 16:20:51 -0700
Alistair Francis <alistair.francis@wdc.com> wrote:

> Now that RISC-V 32-bit (RV32) support has been merged into mainilne
> glibc we can us upstream glibc and the 5.4 kernel.
> 
> This patch removes the old files for the RV32 glibc fork and replaces
> them with new files for the latest SHA from upstream glibc. We also need
> to update the kernel as RV32 requires a 5.4+ kernel.
> 
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...ert-riscv-Use-latest-system-call-ABI.patch | 66 -------------------
>  board/qemu/riscv32-virt/readme.txt            |  2 +-
>  configs/qemu_riscv32_virt_defconfig           |  7 +-
>  ...001-riscv-Do-not-use-__has_include__.patch | 28 --------
>  .../glibc.hash                                |  2 +-
>  package/glibc/glibc.mk                        |  6 +-
>  6 files changed, 9 insertions(+), 102 deletions(-)
>  delete mode 100644 board/qemu/riscv32-virt/patches/linux/0001-Revert-riscv-Use-latest-system-call-ABI.patch
>  delete mode 100644 package/glibc/06983fe52cfe8e4779035c27e8cc5d2caab31531/0001-riscv-Do-not-use-__has_include__.patch
>  rename package/glibc/{06983fe52cfe8e4779035c27e8cc5d2caab31531 => 2.32.9000-69-gbd394d131c10c9ec22c6424197b79410042eed99}/glibc.hash (69%)

Even though I understand they are related, I split the patch into two,
one for the glibc update, one for the defconfig change. Both applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
