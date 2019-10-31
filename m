From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 31 Oct 2019 19:52:00 -0300
Subject: [Buildroot] [PATCH v2 3/3]
 package/freescale-imx/imx-m4-firmware: add support for i.MX7ULP
In-Reply-To: <20191030133955.30611-3-fabrice.goucem@nxp.com>
References: <20191029170102.13482-1-fabrice.goucem@nxp.com>
 <20191030133955.30611-1-fabrice.goucem@nxp.com>
 <20191030133955.30611-3-fabrice.goucem@nxp.com>
Message-ID: <CAOMZO5B1wbsK2o_eh727WJkyudF3mc0ZKJubBCc4GBF-7omv-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On Wed, Oct 30, 2019 at 10:40 AM Fabrice Goucem <fabrice.goucem@nxp.com> wrote:
>
> Create new flag BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7ULP to
> differentiate i.MX7ULP from i.MX7D which has different Cortex-M4
> firmware.
>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
>
> ---
> Changes v1 -> v2:
>   - Split i.MX7ULP support into two commits:
>         new defconfig and m4 support (suggested by Fabio Estevam)
>
> Signed-off-by: Fabrice Goucem <fabrice.goucem@nxp.com>
> ---
>  board/freescale/imx7ulpevk/readme.txt            | 16 ++++++++++++++++
>  configs/freescale_imx7ulpevk_defconfig           |  1 +
>  package/freescale-imx/Config.in                  |  8 +++++++-
>  .../imx-m4-firmware/imx-m4-firmware.hash         |  1 +
>  .../imx-m4-firmware/imx-m4-firmware.mk           | 13 ++++++++++++-

This is still touching imx-m4-firmware package and imx7ulp-evk files
in the same patch.

It is preferred not to touch them in the same patch.

The patch that adds imx7ulp-evk support can be the last of the series
and contain the complete readme.txt and defconfig options.
