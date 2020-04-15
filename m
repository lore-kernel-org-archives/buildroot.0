From: Pierre-Jean Texier <pjtexier@koncepto.io>
Date: Wed, 15 Apr 2020 15:15:46 +0200
Subject: [Buildroot] [PATCH 1/2] imx/genimage: Specify the volume-label
 for vfat
In-Reply-To: <20200415123656.13298-1-festevam@gmail.com>
References: <20200415123656.13298-1-festevam@gmail.com>
Message-ID: <e2ae52b1-58fa-e945-106a-2d40cb565c38@koncepto.io>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

Le 15/04/2020 ? 14:36, Fabio Estevam a ?crit?:
> Currently the volume-label for the vfat partition is a string with
> the following pattern: 5934-861D.
> 
> Specify the volume-label as "boot" to make it easier to identify it.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>

Works fine on my WaRP7.

Tested-by: Pierre-Jean Texier <pjtexier@koncepto.io>

Thanks !

Pierre-Jean

> ---
>   board/freescale/common/imx/genimage.cfg.template      | 1 +
>   board/freescale/common/imx/genimage.cfg.template_imx8 | 1 +
>   board/freescale/common/imx/genimage.cfg.template_spl  | 1 +
>   3 files changed, 3 insertions(+)
> 
> diff --git a/board/freescale/common/imx/genimage.cfg.template b/board/freescale/common/imx/genimage.cfg.template
> index 2a7036a7df..61b09bde9f 100644
> --- a/board/freescale/common/imx/genimage.cfg.template
> +++ b/board/freescale/common/imx/genimage.cfg.template
> @@ -9,6 +9,7 @@
>   
>   image boot.vfat {
>     vfat {
> +    label = "boot"
>       files = {
>         %FILES%
>       }
> diff --git a/board/freescale/common/imx/genimage.cfg.template_imx8 b/board/freescale/common/imx/genimage.cfg.template_imx8
> index bd5f6cdc73..84a812f986 100644
> --- a/board/freescale/common/imx/genimage.cfg.template_imx8
> +++ b/board/freescale/common/imx/genimage.cfg.template_imx8
> @@ -9,6 +9,7 @@
>   
>   image boot.vfat {
>     vfat {
> +    label = "boot"
>       files = {
>         %FILES%
>       }
> diff --git a/board/freescale/common/imx/genimage.cfg.template_spl b/board/freescale/common/imx/genimage.cfg.template_spl
> index d2d810777b..3b0667c383 100644
> --- a/board/freescale/common/imx/genimage.cfg.template_spl
> +++ b/board/freescale/common/imx/genimage.cfg.template_spl
> @@ -9,6 +9,7 @@
>   
>   image boot.vfat {
>     vfat {
> +    label = "boot"
>       files = {
>         %FILES%
>       }
> 

-- 
Pierre-Jean Texier
Embedded Linux Engineer
https://koncepto.io
