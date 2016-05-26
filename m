From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 26 May 2016 06:25:40 +0300
Subject: [Buildroot] [PATCH 1/3] configs: mx53loco: Update bootloader
 and kernel versions
In-Reply-To: <1464207368-22532-1-git-send-email-festevam@gmail.com>
References: <1464207368-22532-1-git-send-email-festevam@gmail.com>
Message-ID: <20160526032540.GM2178@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabio,

On Wed, May 25, 2016 at 05:16:06PM -0300, Fabio Estevam wrote:
> Update U-boot to the 2016.05 version and the kernel to 4.6.
> 
> U-boot 2016.05 needs a patch for fixing an IPU build error.
> 
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> ---
>  ...1-U-Boot-video-ipu_common-fix-build-error.patch | 41 ++++++++++++++++++++++
>  configs/mx53loco_defconfig                         | 20 ++++++-----
>  2 files changed, 53 insertions(+), 8 deletions(-)
>  create mode 100644 board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch
> 
> diff --git a/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch b/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch
> new file mode 100644
> index 0000000..1d39f4e
> --- /dev/null
> +++ b/board/freescale/imx53loco/patches/uboot/0001-U-Boot-video-ipu_common-fix-build-error.patch
> @@ -0,0 +1,41 @@
> +commit c510f2e436008e55a50b063f2180cb1e63984224
> +Author: Peng Fan <van.freenix@gmail.com>
> +Date:   Thu Apr 28 10:07:53 2016 +0800
> +
> +video: ipu_common: fix build error
> +
> +Some toolchains fail to build
> +"clk->rate = (u64)(clk->parent->rate * 16) / div;"
> +And the cast usage is wrong.
> +
> +Use the following code to fix the issue,
> +"
> +  do_div(parent_rate, div);
> +  clk->rate = parent_rate;
> +"
> +
> +Reported-by: Peter Robinson <pbrobinson@gmail.com>
> +Signed-off-by: Peng Fan <van.freenix@gmail.com>
> +Cc: Stefano Babic <sbabic@denx.de>
> +Cc: Fabio Estevam <fabio.estevam@nxp.com>
> +Cc: Tom Rini <trini@konsulko.com>
> +Cc: Anatolij Gustschin <agust@denx.de>
> +Cc: Peter Robinson <pbrobinson@gmail.com>
> +Reviewed-by: Tom Rini <trini@konsulko.com>
> +Tested-by: Peter Robinson <pbrobinson@gmail.com>

Please add your SoB here. And since this patch is upstream, please mention 
that in the patch description.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
