From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 1 Jan 2016 17:07:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/openocd: select libusb when
 selecting libusb-compat
In-Reply-To: <1451664066-6127-1-git-send-email-romain.naour@gmail.com>
References: <1451664066-6127-1-git-send-email-romain.naour@gmail.com>
Message-ID: <20160101160754.GB3710@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2016-01-01 17:01 +0100, Romain Naour spake thusly:
> libusb-compat depends on libusb package, so we need to select
> libusb package at the same time as libusb-compat to avoid an
> unmet dependency.
> 
> Since 28f67899e54f15c6e48484ea2976c3e431756bcb, the build
> stop if a package build is trigged at Makefile level without
> being selected at Config.in level.
> 
> This is the case here with BR2_PACKAGE_OPENOCD_USBPROG which
> select BR2_PACKAGE_LIBUSB_COMPAT without selecting
> BR2_PACKAGE_LIBUSB.
> 
> Fixes:
> http://autobuild.buildroot.net/results/b4a/b4a8c54eed6bf75ab8ade0653953d19792155727/
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/openocd/Config.in | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index d84aac1..a35bd27 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -84,6 +84,7 @@ config BR2_PACKAGE_OPENOCD_AICE
>  
>  config BR2_PACKAGE_OPENOCD_VSLLINK
>  	bool "Versaloon-Link JTAG Programmer"
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
>  	help
> @@ -92,6 +93,7 @@ config BR2_PACKAGE_OPENOCD_VSLLINK
>  
>  config BR2_PACKAGE_OPENOCD_USBPROG
>  	bool "USBProg JTAG Programmer"
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
>  	help
> @@ -100,6 +102,7 @@ config BR2_PACKAGE_OPENOCD_USBPROG
>  
>  config BR2_PACKAGE_OPENOCD_RLINK
>  	bool "Raisonance RLink JTAG Programmer"
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
>  	help
> @@ -108,6 +111,7 @@ config BR2_PACKAGE_OPENOCD_RLINK
>  
>  config BR2_PACKAGE_OPENOCD_ARMEW
>  	bool "Olimex ARM-JTAG-EW Programmer"
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb-compat -> libusb
>  	help
> @@ -186,6 +190,7 @@ config BR2_PACKAGE_OPENOCD_PRESTO
>  config BR2_PACKAGE_OPENOCD_OPENJTAG
>  	bool "OpenJTAG Programmer"
>  	select BR2_PACKAGE_LIBFTDI1
> +	select BR2_PACKAGE_LIBUSB
>  	select BR2_PACKAGE_LIBUSB_COMPAT # needs usb.h
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libftdi -> libusb
>  	depends on BR2_ARCH_HAS_ATOMICS
> -- 
> 2.4.3
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
