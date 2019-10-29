From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 29 Oct 2019 15:09:51 -0300
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx7ulpevk: new
 defconfig
In-Reply-To: <20191029170102.13482-2-fabrice.goucem@nxp.com>
References: <20191029170102.13482-1-fabrice.goucem@nxp.com>
 <20191029170102.13482-2-fabrice.goucem@nxp.com>
Message-ID: <CAOMZO5Bsrr1rnVSPAh8PuLPwNQDAKqpbwaGtS2A1uwb+kk1g3Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Tue, Oct 29, 2019 at 2:01 PM Fabrice Goucem <fabrice.goucem@nxp.com> wrote:
>
> Add basic support for NXP's i.MX7 ULP EVK board:
>
> https://www.nxp.com/design/development-boards/i.mx-evaluation-and-development-boards/evaluation-kit-for-the-i.mx-7ulp-applications-processor:MCIMX7ULP-EVK
>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
> ---
>  .gitlab-ci.yml                                |  1 +
>  DEVELOPERS                                    |  2 +
>  board/freescale/imx7ulpevk/readme.txt         | 65 +++++++++++++++++++
>  configs/freescale_imx7ulpevk_defconfig        | 28 ++++++++
>  package/freescale-imx/Config.in               |  8 ++-
>  .../imx-m4-firmware/imx-m4-firmware.hash      |  1 +
>  .../imx-m4-firmware/imx-m4-firmware.mk        | 13 +++-

The M4 firmware changes should not be part of this patch.

> +Boot the i.MX7ULP EVK board
> +===========================
> +
> +To boot your newly created system (refer to the i.MX 7ULP EVK Quick Start Guide [1] for guidance):
> +- insert the SD card in the micro SD slot of the board;
> +- put a micro USB cable into the Debug USB Port and connect using a terminal
> +  emulator at 115200 bps, 8n1;
> +- power on the board.

You should include some instructions to tell the user how to flash the
QSPI flash with the M4 SDK binary.

Thanks
