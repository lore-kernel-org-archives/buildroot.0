From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 1 Mar 2018 11:35:05 +0100
Subject: [Buildroot] [PATCH v3 2/4] freescale-imx: add new device iMX8mq
In-Reply-To: <1519807066-21466-3-git-send-email-karl.erik.larsson@gmail.com>
References: <1519807066-21466-1-git-send-email-karl.erik.larsson@gmail.com>
 <1519807066-21466-3-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <CAAMH-yu18qUQPcng=utqCMp8s5+XEDjsYS8vXtWF0yiQ80CDVw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Erik,

On Wed, Feb 28, 2018 at 9:37 AM, Erik Larsson
<karl.erik.larsson@gmail.com> wrote:
> Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
> Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
> ---
>  package/freescale-imx/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
> index b5e5ab2..fe993f3 100644
> --- a/package/freescale-imx/Config.in
> +++ b/package/freescale-imx/Config.in
> @@ -1,6 +1,6 @@
>  menuconfig BR2_PACKAGE_FREESCALE_IMX
>         bool "Freescale i.MX libraries"
> -       depends on BR2_arm
> +       depends on BR2_arm || BR2_aarch64
>         help
>           Those packages provide hardware acceleration for GPU or VPU,
>           hardware optimization or some hardware tools for Freescale
> @@ -40,6 +40,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
>         bool "imx7d/imx7ulp"
>
> +config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
> +       bool "imx8m"
>  endchoice
>
>  config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
> @@ -54,6 +56,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
>         default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
>         default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
>         default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
> +       default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
>
>  config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
>         bool
> --
> 2.7.4

The patch looks good but I'd change the title.

It should be "i.MX8M" (missing '.' and capital M). Also I'd drop the
'q' since this will apply to all 8M variants.

I'd prefer: "freescale-imx: add config option for i.MX8M"

Not sure it needs to respin the patch, might be changed when applied.

Regards,
Gary
