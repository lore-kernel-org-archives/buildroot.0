From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 3 Apr 2021 15:32:14 +0200
Subject: [Buildroot] [PATCH 3/3] board/amarula/vyasa: set sd-card as
 boot media
In-Reply-To: <20210402222039.3812925-4-giulio.benetti@benettiengineering.com>
References: <20210402222039.3812925-1-giulio.benetti@benettiengineering.com>
 <20210402222039.3812925-4-giulio.benetti@benettiengineering.com>
Message-ID: <af2367e1-fede-1357-ac06-92945269e074@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

please drop this patch. Sd-card when jumper JP4 is closed makes eMMC not 
available, so sd-card will be registered as mmcblk0.

Thank you
-- 
Giulio Benetti
Benetti Engineering sas
On 4/3/21 12:20 AM, Giulio Benetti wrote:
> I find easier to test using sd-card(mmcblk1p1) than eMMC(mmcblk0p1) to
> test this board. If needed one can swap back to mmcblk0p1 for using eMMC,
> or set a unique UUID for partition, so both sd-card or eMMC can be booted
> if that UUID partitions is found.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>   board/amarula/vyasa/extlinux.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/board/amarula/vyasa/extlinux.conf b/board/amarula/vyasa/extlinux.conf
> index a8fcc35f5a..e7e12ab9bc 100644
> --- a/board/amarula/vyasa/extlinux.conf
> +++ b/board/amarula/vyasa/extlinux.conf
> @@ -1,4 +1,4 @@
>   label Vyasa linux-next
>     kernel /boot/uImage
>     devicetree /boot/rk3288-vyasa.dtb
> -  append console=ttyS2,115200n8 root=/dev/mmcblk0p1 rootwait
> +  append console=ttyS2,115200n8 root=/dev/mmcblk1p1 rootwait
> 
