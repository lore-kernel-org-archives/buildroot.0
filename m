From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Wed, 2 Jun 2021 11:46:55 +0200
Subject: [Buildroot] [PATCH/RFC 00/28] sunxi: switch to mainline ATF
In-Reply-To: <20210531212748.2378872-1-geomatsi@gmail.com>
References: <20210531212748.2378872-1-geomatsi@gmail.com>
Message-ID: <CAEyMn7a6wLjxHVV1fO3PL7pWjrOnaAuhAAC9jDvM-biSORmRoA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergey,

Am Mo., 31. Mai 2021 um 23:28 Uhr schrieb Sergey Matyukevich
<geomatsi@gmail.com>:
>
> Hi all,
>
> This patch set updates BSP on H5/A64 sunxi boards. For each board
> the following changes are implemented:
>
> - switch from early Allwinner ATF port to mainline ATF
> - bump Linux kernel and U-Boot versions
>
> Note that I have only orangepi-zero-plus2 board at my disposal. So only
> this board has been tested. For all the other boards only build tests
> have been completed. Any help with boot tests on other H5/A64 sunxi
> boards is more than welcome.

Are you aware that we already bumped the ATF version to v2.5 in the
next branch [1] and do you stick to v2.4 in all your changed
defconfigs to avoid any regression?

[1] https://git.buildroot.net/buildroot/commit/?h=next&id=cb5d9fdf1ebf7002a29e6fa43c817611e2e4e8d1

> Regards,
> Sergey
>
>
> Sergey Matyukevich (28):
>   boot/arm-trusted-firmware: option to disable stack protection
>   support/testing: switch TestATFAllwinner to upstream ATF
>   support/testing/tests/boot/test_atf: update U-Boot in TestATFAllwinner
>   configs/orangepi_zero_plus2_defconfig: switch to upstream ATF
>   configs/bananapi_m64_defconfig: switch to upstream ATF
>   configs/orangepi_zero_plus_defconfig: switch to upstream ATF
>   configs/orangepi_pc2_defconfig: switch to upstream ATF
>   configs/orangepi_prime_defconfig: switch to upstream ATF
>   configs/orangepi_win_defconfig: switch to upstream ATF
>   configs/friendlyarm_nanopi_a64_defconfig: switch to upstream ATF
>   configs/friendlyarm_nanopi_neo2_defconfig: switch to upstream ATF
>   configs/friendlyarm_nanopi_neo_plus2_defconfig: switch to upstream ATF
>   configs/amarula_a64_relic_defconfig: switch to upstream ATF
>   configs/olimex_a64_olinuxino_defconfig: switch to mainline ATF
>   configs/pine64_defconfig: switch to mainline ATF
>   configs/pine64_sopine_defconfig: switch to upstream ATF
>   configs/orangepi-zero-plus2: bump BSP versions
>   configs/bananapi_m64_defconfig: bump BSP versions
>   configs/orangepi_zero_plus_defconfig: bump BSP versions
>   configs/orangepi_pc2_defconfig: bump BSP versions
>   configs/orangepi_prime_defconfig: bump BSP versions
>   configs/orangepi_win_defconfig: bump BSP versions
>   configs/friendlyarm_nanopi_a64_defconfig: bump BSP versions
>   configs/friendlyarm_nanopi_neo2_defconfig: bump BSP versions
>   configs/friendlyarm_nanopi_neo_plus2_defconfig: bump BSP versions
>   configs/olimex_a64_olinuxino_defconfig: bump BSP versions
>   configs/pine64_defconfig: bump BSP versions
>   configs/pine64_sopine_defconfig: bump BSP versions
>
>  board/bananapi/bananapi-m64/genimage.cfg      | 10 ++------
>  board/friendlyarm/nanopi-a64/genimage.cfg     | 10 ++------
>  .../friendlyarm/nanopi-neo-plus2/genimage.cfg | 10 ++------
>  board/friendlyarm/nanopi-neo2/genimage.cfg    | 10 ++------
>  board/olimex/a64-olinuxino/genimage.cfg       | 10 ++------
>  board/orangepi/orangepi-pc2/genimage.cfg      | 10 ++------
>  board/orangepi/orangepi-prime/genimage.cfg    | 10 ++------
>  board/orangepi/orangepi-win/genimage.cfg      | 10 ++------
>  .../orangepi/orangepi-zero-plus/genimage.cfg  | 10 ++------
>  .../orangepi/orangepi-zero-plus2/genimage.cfg | 10 ++------
>  board/pine64/pine64/genimage.cfg              | 10 ++------
>  board/pine64/sopine/genimage.cfg              | 10 ++------
>  boot/arm-trusted-firmware/Config.in           |  7 ++++++
>  .../arm-trusted-firmware.mk                   |  4 ++++
>  configs/amarula_a64_relic_defconfig           |  8 +++----
>  configs/bananapi_m64_defconfig                | 21 ++++++++---------
>  configs/friendlyarm_nanopi_a64_defconfig      | 21 ++++++++---------
>  configs/friendlyarm_nanopi_neo2_defconfig     | 21 ++++++++---------
>  .../friendlyarm_nanopi_neo_plus2_defconfig    | 20 ++++++++--------
>  configs/olimex_a64_olinuxino_defconfig        | 21 ++++++++---------
>  configs/orangepi_pc2_defconfig                | 21 ++++++++---------
>  configs/orangepi_prime_defconfig              | 21 ++++++++---------
>  configs/orangepi_win_defconfig                | 23 ++++++++++---------
>  configs/orangepi_zero_plus2_defconfig         | 19 ++++++++-------
>  configs/orangepi_zero_plus_defconfig          | 19 ++++++++-------
>  configs/pine64_defconfig                      | 22 +++++++++---------
>  configs/pine64_sopine_defconfig               | 21 ++++++++---------
>  support/testing/tests/boot/test_atf.py        | 16 ++++++-------
>  28 files changed, 168 insertions(+), 237 deletions(-)
>

-- 
Heiko
