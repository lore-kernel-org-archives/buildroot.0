From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Mar 2021 17:45:30 +0100
Subject: [Buildroot] [PATCH 1/2] package/libcamera: disable package
 affected by binutils bug 27597
In-Reply-To: <20210317164346.1917962-1-giulio.benetti@benettiengineering.com>
References: <20210314230738.1c19d335@windsurf.home>
 <20210317164346.1917962-1-giulio.benetti@benettiengineering.com>
Message-ID: <20210317174530.15bd89ac@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 17 Mar 2021 17:43:45 +0100
Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:

> This package is affected by binutils bug 27597 and no work around has
> been found, so let's disable it if
> BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597=y.
> 
> Fixes:
> http://autobuild.buildroot.net/results/8ac/8ac599392f773eecff4773393ef0d0232a22f372/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/libcamera/Config.in | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
> index b9c243084e..3df9c68feb 100644
> --- a/package/libcamera/Config.in
> +++ b/package/libcamera/Config.in
> @@ -12,6 +12,7 @@ menuconfig BR2_PACKAGE_LIBCAMERA
>  	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
>  	depends on !BR2_STATIC_LIBS # gnutls
>  	depends on BR2_USE_WCHAR # gnutls
> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27597

Perhaps we could just push this dependency to
BR2_PACKAGE_LIBCAMERA_ARCH_SUPPORTS ?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
