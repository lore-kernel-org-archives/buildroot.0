From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 29 May 2020 23:41:46 +0200
Subject: [Buildroot] [PATCH v4 0/5] imx: add i.MX8M Nano EVK board
 support
In-Reply-To: <1590556068-7043-1-git-send-email-stephane.viau@oss.nxp.com>
References: <1590556068-7043-1-git-send-email-stephane.viau@oss.nxp.com>
Message-ID: <20200529214146.GS8737@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

St?phane, All,

On 2020-05-27 07:07 +0200, Stephane Viau spake thusly:
> This series adds support for the NXP i.MX8M Nano EVK board.
> 
> Since the i.MX8M Nano CPU was added for the Nitrogen8MNano board, which has a
> type of memory (LPDDR4) different from the NXP reference board (DDR4), the first
> half of the series introduce the DDR training selection for the whole i.MX8 M
> SoC family, as well as a separation of the DDR and HDMI FW copy.
> 
> The second half of the series adds support for i.MX8M Nano EVK Board with kernel/
> U-Boot based on 4.19.35_1.1.0, which is the current preferred version for all NXP
> reference boards.
> 
> Stephane Viau (5):
>   package/freescale-imx: Add option for DDR FW need

I'll reply separately to that one.

>   package/freescale-imx/firmware-imx: add choice for DDR training
>     binaries
>   board/freescale/common/imx: use generic ddr_fw.bin name
>   board/freescale/common/imx: add support for i.MX8M Nano
>   configs/freescale_imx8mnevk: new defconfig

Whole series applied to next, thanks.

Regards,
Yann E. MORIN.

>  .gitlab-ci.yml                                     |  1 +
>  DEVELOPERS                                         |  4 ++
>  .../common/imx/imx8-bootloader-prepare.sh          |  6 +-
>  board/freescale/common/imx/post-image.sh           |  2 +
>  board/freescale/imx8mnevk/readme.txt               | 73 ++++++++++++++++++++++
>  configs/freescale_imx8mnevk_defconfig              | 43 +++++++++++++
>  package/freescale-imx/Config.in                    |  6 ++
>  package/freescale-imx/firmware-imx/Config.in       | 24 +++++++
>  package/freescale-imx/firmware-imx/firmware-imx.mk | 43 ++++++++++++-
>  9 files changed, 197 insertions(+), 5 deletions(-)
>  create mode 100644 board/freescale/imx8mnevk/readme.txt
>  create mode 100644 configs/freescale_imx8mnevk_defconfig
> 
> -- 
> 2.7.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
