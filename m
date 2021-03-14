From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 14 Mar 2021 23:07:38 +0100
Subject: [Buildroot] [PATCH v2 5/6] package/libcamera: disable package
 while building for Nios II
In-Reply-To: <20210310091453.23611-6-giulio.benetti@benettiengineering.com>
References: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
 <20210310091453.23611-6-giulio.benetti@benettiengineering.com>
Message-ID: <20210314230738.1c19d335@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 10 Mar 2021 10:14:52 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package fails to build with Nios II up to gcc version 10.x and no
> work around has been found. So let's disable it whil building for Nios
> II.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
> V1->V2: add missing || that prevented building
> ---
>  package/libcamera/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index b9c243084e..fc8181f55c 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
> +	depends on !BR2_nios

So for this one, no BR2_TOOLCHAIN_HAS_BUG_xyz ?

Same question for PATCH 6/6 in the series.

Thanks!

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
