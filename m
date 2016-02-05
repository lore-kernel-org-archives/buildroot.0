From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat,  6 Feb 2016 00:06:14 +0100
Subject: [Buildroot] [PATCH 0/3 v2] defconfigs: follow-up fix after
	headers-same-as-kernel option (branch yem/kernel-headers)
Message-ID: <cover.1454713324.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Fix building all our defconfigs.

After 63abfb7 (package/linux-headers: add option to use same sources as
the kernel) was merged, the followup patches from the associated series
were not merged.

A patch from that series was meant to fix defconfigs that were using the
kernel-same-as-headers option, and turn them in to the converse
headers-same-as-kernel option. That patch is carried in this new series.

Another patch in that series got rid of the kernel-same-as-headers
option. This too is carried over in this series.

What was missing, however, was a patch to fix the other defconfigs and
make them use the headers-same-as-kernel option. This is fixed now in
this series.

Changes v1 -> v2:
  - fix remaining defconfigs


Regards,
Yann E. MORIN.


The following changes since commit 92fd33a1589e91a81969b93623800b827e4fad34:

  libbsd: upgrade to v0.8.2 and expand architecture support (2016-02-05 23:23:35 +0100)

are available in the git repository at:

  git://git.busybox.net/~ymorin/git/buildroot yem/kernel-headers

for you to fetch changes up to 827a4656f7051383049f51814c1bd336e705c2c9:

  defconfigs: all use the headers from the kernel (2016-02-05 23:59:01 +0100)

----------------------------------------------------------------
Yann E. MORIN (3):
      defconfigs: use the new headers-version-same-as-kernel-version option
      linux: drop the option to use the same version as that of the headers
      defconfigs: all use the headers from the kernel

 Config.in.legacy                                 | 10 ++++++++++
 configs/acmesystems_aria_g25_128mb_defconfig     |  4 +---
 configs/acmesystems_aria_g25_256mb_defconfig     |  4 +---
 configs/altera_socdk_defconfig                   |  4 +---
 configs/altera_sockit_defconfig                  |  4 +---
 configs/arm_foundationv8_defconfig               |  3 +--
 configs/armadeus_apf27_defconfig                 |  4 +---
 configs/armadeus_apf28_defconfig                 |  4 +---
 configs/armadeus_apf51_defconfig                 |  4 +---
 configs/armadeus_apf9328_defconfig               |  5 +----
 configs/at91sam9260eknf_defconfig                |  4 +---
 configs/at91sam9g20dfc_defconfig                 |  4 +---
 configs/at91sam9g45m10ek_defconfig               |  3 +--
 configs/at91sam9rlek_defconfig                   |  3 +--
 configs/at91sam9x5ek_defconfig                   |  3 +--
 configs/atmel_sama5d3_xplained_defconfig         |  3 +--
 configs/atmel_sama5d3_xplained_mmc_defconfig     |  6 ++----
 configs/atmel_sama5d3xek_defconfig               |  3 +--
 configs/atmel_sama5d4_xplained_defconfig         |  3 +--
 configs/atmel_sama5d4ek_defconfig                |  3 +--
 configs/beaglebone_defconfig                     |  4 +---
 configs/calao_qil_a9260_defconfig                |  3 +--
 configs/calao_tny_a9g20_lpw_defconfig            |  4 +---
 configs/calao_usb_a9260_defconfig                |  2 ++
 configs/calao_usb_a9263_defconfig                |  2 ++
 configs/calao_usb_a9g20_lpw_defconfig            |  2 ++
 configs/ci20_defconfig                           |  6 +++---
 configs/cubieboard2_defconfig                    |  3 +--
 configs/cubieboard_defconfig                     |  4 ++--
 configs/freescale_imx28evk_defconfig             |  7 +++----
 configs/freescale_imx31_3stack_defconfig         | 11 +++++------
 configs/freescale_imx6dlsabreauto_defconfig      |  4 +---
 configs/freescale_imx6dlsabresd_defconfig        |  4 +---
 configs/freescale_imx6qsabreauto_defconfig       |  4 +---
 configs/freescale_imx6qsabresd_defconfig         |  4 +---
 configs/freescale_imx6sololiteevk_defconfig      |  3 +++
 configs/freescale_imx6sxsabresd_defconfig        |  4 +---
 configs/freescale_imx6ulevk_defconfig            |  4 +---
 configs/freescale_mpc8315erdb_defconfig          |  4 +---
 configs/freescale_p1010rdb_pa_defconfig          |  4 +---
 configs/freescale_p2020ds_defconfig              |  4 +---
 configs/galileo_defconfig                        |  3 +--
 configs/kb9202_defconfig                         |  4 +---
 configs/lego_ev3_defconfig                       |  4 +---
 configs/microzed_defconfig                       |  5 ++---
 configs/mini2440_defconfig                       |  5 +----
 configs/minnowboard_defconfig                    |  4 +---
 configs/minnowboard_max_defconfig                |  4 +---
 configs/mx53loco_defconfig                       |  6 +++---
 configs/nitrogen6sx_defconfig                    |  4 +---
 configs/nitrogen6x_defconfig                     |  4 +---
 configs/olimex_a20_olinuxino_lime2_defconfig     |  2 ++
 configs/olimex_a20_olinuxino_lime_defconfig      |  4 +---
 configs/olimex_a20_olinuxino_lime_mali_defconfig |  4 +---
 configs/olimex_a20_olinuxino_micro_defconfig     |  4 +---
 configs/olimex_imx233_olinuxino_defconfig        |  4 +---
 configs/openblocks_a6_defconfig                  |  4 +---
 configs/orangepipc_defconfig                     |  2 ++
 configs/pandaboard_defconfig                     |  4 +---
 configs/qemu_aarch64_virt_defconfig              |  4 +---
 configs/qemu_arm_nuri_defconfig                  |  6 ++----
 configs/qemu_arm_versatile_defconfig             |  4 +---
 configs/qemu_arm_vexpress_defconfig              |  4 +---
 configs/qemu_microblazebe_mmu_defconfig          |  4 +---
 configs/qemu_microblazeel_mmu_defconfig          |  4 +---
 configs/qemu_mips64_malta_defconfig              |  4 +---
 configs/qemu_mips64el_malta_defconfig            |  4 +---
 configs/qemu_mips_malta_defconfig                |  4 +---
 configs/qemu_mipsel_malta_defconfig              |  4 +---
 configs/qemu_ppc64_pseries_defconfig             |  4 +---
 configs/qemu_ppc_g3beige_defconfig               |  4 +---
 configs/qemu_ppc_mpc8544ds_defconfig             |  4 +---
 configs/qemu_ppc_virtex_ml507_defconfig          |  4 +---
 configs/qemu_sh4_r2d_defconfig                   |  4 +---
 configs/qemu_sh4eb_r2d_defconfig                 |  4 +---
 configs/qemu_sparc64_sun4u_defconfig             |  4 +---
 configs/qemu_sparc_ss10_defconfig                |  4 +---
 configs/qemu_x86_64_defconfig                    |  4 +---
 configs/qemu_x86_defconfig                       |  4 +---
 configs/qemu_xtensa_lx60_defconfig               |  4 +---
 configs/qmx6_defconfig                           |  3 +--
 configs/raspberrypi2_defconfig                   |  5 +----
 configs/raspberrypi_defconfig                    |  5 +----
 configs/riotboard_defconfig                      |  4 +---
 configs/s6lx9_microboard_defconfig               |  2 ++
 configs/sheevaplug_defconfig                     |  4 +---
 configs/snps_aarch64_vdk_defconfig               |  3 ++-
 configs/snps_axs101_defconfig                    |  4 +---
 configs/snps_axs103_defconfig                    |  4 +---
 configs/snps_hs38_smp_vdk_defconfig              |  4 +---
 configs/snps_hs38_vdk_defconfig                  |  4 +---
 configs/telit_evk_pro3_defconfig                 |  4 +---
 configs/ts5x00_defconfig                         | 15 +++++++++++----
 configs/udoo_quad_defconfig                      |  4 +---
 configs/via_imx6_vab820_defconfig                |  4 +---
 configs/wandboard_defconfig                      |  4 ++--
 configs/warpboard_defconfig                      |  4 +---
 configs/xilinx_zc706_defconfig                   |  5 ++---
 configs/zedboard_defconfig                       |  5 ++---
 linux/Config.in                                  | 13 -------------
 linux/linux.mk                                   |  3 ---
 101 files changed, 144 insertions(+), 284 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
