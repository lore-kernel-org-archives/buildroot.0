From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Wed, 28 Mar 2018 11:23:25 +0200
Subject: [Buildroot] [PATCH v6 0/4] Initial support for NXP iMX8
 (imx8mq-evk)
In-Reply-To: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <CAPP7BN3cKEbmV61bqsk5D0tX74aXkC--RmZtJT4eK_geWBzSRw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all!

2018-03-10 12:51 GMT+01:00 Erik Larsson <karl.erik.larsson@gmail.com>:
> This series provides initial support for NXP iMX8 (imx8mq-evk).
>
> This series of patches are tested against NXP imx8mq-evk.
> It only handles basic support for iIMX8M, currently no
> support for GPU, VPU and other HW features. This series
> makes it possible to build a minimal system for imx8mq-evk.
>
> Changes since v5
> ================
>   - Switch to letting post-image.sh generate imx-boot-imx8mqevk-sd.bin
>     instead of letting imx-mkimage do that.
>
> Changes since v4
> ================
>   - Build kernel, u-boot, atf from tag rel_imx_4.9.51_8mq_beta_patch.
>   - Add board readme.txt.
>   - Update imx-mkimage package to use host mkimage
>
> Changes since v3
> ================
>   - Use Buildroot toolchain instead of external Linareo toolchain.
>   - Changed title on patch number 2
>
> Changes since v2
> ================
>   - Build kernel, u-boot, atf based on tags instead of branches.
>   - Make sure to assign BR2_PACKAGE_FREESCALE_IMX_PLATFORM to IMX8M.
>   - Remove kernel defconfig from board folder and use arch default in kernel tree.
>   - Split third commit into two commits.
>
> Changes since v1
> ================
>   - Removed new imx-atf package, use boot/arm-trusted-firmware.
>   - Move imx-mkimage from package/freescale-imx to package.
>   - Add upstream URL for imx-mkimage in Config.in.host.
>   - Fix install command syntax for imx-mkimage package.
>   - Use Makefile in imx-mkimage to build imx-boot-imx8mqevk-sd.bin instead of doing that in the post-script.sh
>   - Split third commit into two, one for firmware-img package and one for iMX8 board.
>
> Erik Larsson (4):
>   imx-mkimage: new package
>   freescale-imx: add config option for i.MX8M
>   firmware-imx: add support for iMX8M firmware
>   configs/freescale_imx8mqevk: new defconfig
>
>  .../common/imx/genimage.cfg.template_imx8          | 40 +++++++++++
>  board/freescale/common/imx/post-image.sh           | 28 +++++++-
>  board/freescale/imx8mqevk/readme.txt               | 83 ++++++++++++++++++++++
>  configs/freescale_imx8mqevk_defconfig              | 41 +++++++++++
>  package/Config.in.host                             |  1 +
>  package/freescale-imx/Config.in                    |  5 +-
>  package/freescale-imx/firmware-imx/Config.in       |  2 +-
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 13 ++++
>  ...-for-overriding-bl32-and-bl33-not-only-bl.patch | 58 +++++++++++++++
>  .../0002-add-ldflags-to-link-step.patch            | 26 +++++++
>  package/imx-mkimage/Config.in.host                 |  7 ++
>  package/imx-mkimage/imx-mkimage.hash               |  3 +
>  package/imx-mkimage/imx-mkimage.mk                 | 24 +++++++
>  13 files changed, 326 insertions(+), 5 deletions(-)
>  create mode 100644 board/freescale/common/imx/genimage.cfg.template_imx8
>  create mode 100644 board/freescale/imx8mqevk/readme.txt
>  create mode 100644 configs/freescale_imx8mqevk_defconfig
>  create mode 100644 package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch
>  create mode 100644 package/imx-mkimage/0002-add-ldflags-to-link-step.patch
>  create mode 100644 package/imx-mkimage/Config.in.host
>  create mode 100644 package/imx-mkimage/imx-mkimage.hash
>  create mode 100644 package/imx-mkimage/imx-mkimage.mk
>
> --
> 2.7.4
>

Any comments on this? I think this serie was missed by Patchwork a
couple of weeks ago. I've also been a bit quiet due to the fact that
I'm on my honeymoon and was not allowed to bring my iMX8 board. But
I'm back on track in a couple of days.

/Erik
