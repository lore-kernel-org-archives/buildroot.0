From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Wed, 7 Oct 2020 07:44:25 -0500
Subject: [Buildroot] [PATCH v2 1/3] package/uboot-tools: migrate
 BR2_TARGET_UBOOT_ENVIMAGE from U-Boot pkg
In-Reply-To: <aae92521-2c14-ff28-b092-6f3e89ae2b50@mind.be>
References: <20200924192912.51913-1-matthew.weber@rockwellcollins.com>
 <20200924192912.51913-2-matthew.weber@rockwellcollins.com>
 <aae92521-2c14-ff28-b092-6f3e89ae2b50@mind.be>
Message-ID: <CANQCQpYJxsgXvkySKQEiiOrbfmCKEM9VU-3i04KZxPC=pmTejQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,


On Tue, Oct 6, 2020 at 4:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 24/09/2020 21:29, Matt Weber wrote:
> > Migrating the support for this feature to uboot-tools to gain the
> > ability to build env files when BR2_TARGET_UBOOT isn't selected.
> >
> > Note: This patch creates a circular dependency with uboot until the
> > similar migration patch is merged for uboot scripts
> >
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
>
>  Series applied with the changes as explained in my reply to patch 1, and a few
> additional changes. Please have a got with current master to check if I broke
> anything.
>

Changes looked good, however I forgot to also include a fixup for all
the defconfigs using the feature.  I'll get a patch ready this morning
and sent out.

configs/at91sam9x5ek_mmc_dev_defconfig:99:BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
configs/socrates_cyclone5_defconfig:27:BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
configs/at91sam9x5ek_mmc_defconfig:39:BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
configs/ci20_defconfig:32:BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/ci20/uboot-env.txt"
configs/snps_archs38_hsdk_defconfig:39:BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"

configs/nanopi_m1_defconfig:36:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1/boot.cmd"
configs/orangepi_pc_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc/boot.cmd"
configs/orangepi_pc_plus_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc-plus/boot.cmd"
configs/pine64_sopine_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/sopine/boot.cmd"
configs/nanopi_m1_plus_defconfig:36:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-m1-plus/boot.cmd"
configs/olimex_a10_olinuxino_lime_defconfig:44:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a10_olinuxino/boot.cmd"
configs/orangepi_zero_plus2_defconfig:31:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero-plus2/boot.cmd"
configs/orangepi_zero_defconfig:32:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-zero/boot.cmd"
configs/orangepi_lite_defconfig:32:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
configs/orangepi_prime_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-prime/boot.cmd"
configs/orangepi_r1_defconfig:29:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-r1/boot.cmd"
configs/nitrogen6x_defconfig:32:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
configs/orangepi_one_defconfig:27:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-one/boot.cmd"
configs/nitrogen7_defconfig:31:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
configs/orangepi_plus_defconfig:36:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-plus/boot.cmd"
configs/friendlyarm_nanopi_a64_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-a64/boot.cmd"
configs/nanopi_r1_defconfig:40:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-r1/boot.cmd"
configs/bananapi_m2_ultra_defconfig:26:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-ultra/boot.cmd"
configs/olimex_a20_olinuxino_lime2_defconfig:55:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
configs/nitrogen6sx_defconfig:32:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/boundarydevices/common/boot.cmd"
configs/odroidc2_defconfig:29:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"
configs/bananapi_m2_zero_defconfig:27:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m2-zero/boot.cmd"
configs/friendlyarm_nanopi_neo2_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo2/boot.cmd"
configs/licheepi_zero_defconfig:46:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/licheepi/boot.cmd"
configs/olimex_a64_olinuxino_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a64-olinuxino/boot.cmd"
configs/olimex_a20_olinuxino_lime_defconfig:55:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
configs/bananapi_m2_plus_defconfig:26:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/sinovoip/m2-plus/boot.cmd"
configs/orangepi_pc2_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-pc2/boot.cmd"
configs/olimex_a20_olinuxino_micro_defconfig:42:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a20_olinuxino/boot.cmd"
configs/bananapi_m64_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m64/boot.cmd"
configs/pine64_defconfig:30:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/pine64/pine64/boot.cmd"
configs/olimex_a33_olinuxino_defconfig:26:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/olimex/a33_olinuxino/boot.cmd"
configs/bananapi_m1_defconfig:25:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/bananapi/bananapi-m1/boot.cmd"
configs/orangepi_win_defconfig:29:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-win/boot.cmd"
configs/cubieboard2_defconfig:28:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard2/boot.cmd"
configs/nanopi_neo_defconfig:34:BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/friendlyarm/nanopi-neo/boot.cmd"


Regards,
Matt
