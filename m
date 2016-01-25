From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2016 00:05:07 +0100
Subject: [Buildroot] [PATCH 13/21] openocd: remove BR2_ARCH_HAS_ATOMICS
 dependency
In-Reply-To: <1453676887-31236-14-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-14-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160125230507.GQ3386@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

[it seems my previous mail got stuck in some pipes between me and the
list. Resending. Sorry for the dupe if the previous mail is evenutally
delivered...]

On 2016-01-25 00:07 +0100, Thomas Petazzoni spake thusly:
> For some reason, since when openocd was introduced, it was using a
> BR2_ARCH_HAS_ATOMICS dependency for all sub-options that selected
> BR2_PACKAGE_LIBFTDI1, even if the libftdi1 package did not have any
> atomics dependency. Maybe it was confused with the libftdi package,
> which did have a BR2_ARCH_HAS_ATOMICS dependency ?
> 
> Regardless, openocd with all four sub-options that currently depend on
> BR2_ARCH_HAS_ATOMICS builds perfectly fine with a toolchain that does
> not implement any of the __sync atomic built-ins, so we can remove the
> BR2_ARCH_HAS_ATOMICS dependency.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

This can go in regardless of the rest of the series, feel free to apply
as you wish! ;-)

Regards,
Yann E. MORIN.

> ---
>  package/openocd/Config.in | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index a35bd27..2313671 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -127,7 +127,6 @@ config BR2_PACKAGE_OPENOCD_FT2XXX
>  	bool "FT2232 based devices (DEPRECATED)"
>  	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	help
>  	  (DEPRECATED) Enable building support for FT2232
>  	  based devices using the libftdi library
> @@ -141,7 +140,6 @@ config BR2_PACKAGE_OPENOCD_UBLASTER
>  	bool "Altera USB-Blaster"
>  	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	help
>  	  Enable building support for the Altera USB-Blaster
>  	  using the libftdi driver, opensource alternate of
> @@ -182,7 +180,6 @@ config BR2_PACKAGE_OPENOCD_PRESTO
>  	bool "ASIX Presto Programmer"
>  	select BR2_PACKAGE_LIBFTDI1
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	help
>  	  Enable building support for ASIX Presto Programmer
>  	  using the libftdi driver
> @@ -193,7 +190,6 @@ config BR2_PACKAGE_OPENOCD_OPENJTAG
>  	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
> -	depends on BR2_ARCH_HAS_ATOMICS
>  	help
>  	  Enable building support for the OpenJTAG Programmer
>  	  with ftdi driver
> -- 
> 2.6.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
