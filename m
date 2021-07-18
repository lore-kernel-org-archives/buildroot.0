From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 22:13:41 +0200
Subject: [Buildroot] [PATCH v2 1/4] boot/uboot: introduce
 BR2_TARGET_UBOOT_FORMAT_DTB
In-Reply-To: <20210616050341.510702-2-drew@beagleboard.org>
References: <20210616050341.510702-1-drew@beagleboard.org>
 <20210616050341.510702-2-drew@beagleboard.org>
Message-ID: <20210718221341.53f3528a@windsurf>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Tue, 15 Jun 2021 22:03:39 -0700
Drew Fustini <drew@beagleboard.org> wrote:

> If U-Boot CONFIG_OF_SEPARATE is defined [1], then the device tree will
> be built and placed in a u-boot.dtb file alongside u-boot.bin.
> 
> When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
> u-boot.dtb to $(BINARIES_DIR).
> 
> This is useful for RISC-V platforms that want to build OpenSBI with an
> external DTB by using FW_FDT_PATH [2].
> 
> [1] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control
> [2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
> 
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  boot/uboot/Config.in | 3 +++
>  boot/uboot/uboot.mk  | 4 ++++
>  2 files changed, 7 insertions(+)

This new option is not exactly another U-Boot format, u-boot.dtb does
not include the U-Boot code itself. But oh well, your solution is very
simple, and fits well with what already exists, so I've applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
