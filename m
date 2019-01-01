From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 1 Jan 2019 19:11:53 +0100
Subject: [Buildroot] [PATCH v3 10/17] package/hackrf: use the new
 fftw-single package
In-Reply-To: <20181231133030.25991-11-thomas.petazzoni@bootlin.com>
References: <20181231133030.25991-1-thomas.petazzoni@bootlin.com>
 <20181231133030.25991-11-thomas.petazzoni@bootlin.com>
Message-ID: <20190101181153.GR26917@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, Gwenha?l, All,

On 2018-12-31 14:30 +0100, Thomas Petazzoni spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/hackrf/Config.in | 6 ++----
>  package/hackrf/hackrf.mk | 2 +-
>  2 files changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/package/hackrf/Config.in b/package/hackrf/Config.in
> index 4fa27699c4..b86790f2b0 100644
> --- a/package/hackrf/Config.in
> +++ b/package/hackrf/Config.in
> @@ -2,7 +2,8 @@ config BR2_PACKAGE_HACKRF
>  	bool "hackrf"
>  	depends on !BR2_STATIC_LIBS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	depends on BR2_PACKAGE_FFTW_PRECISION_SINGLE
> +	select BR2_PACKAGE_FFTW
> +	select BR2_PACKAGE_FFTW_SINGLE
>  	select BR2_PACKAGE_LIBUSB
>  	help
>  	  Library and tools for accessing HackRF SDR boards.
> @@ -11,6 +12,3 @@ config BR2_PACKAGE_HACKRF
>  
>  comment "hackrf needs a toolchain w/ threads, dynamic library"
>  	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
> -
> -comment "hackrf needs fftw's single precision"
> -	depends on !BR2_PACKAGE_FFTW_PRECISION_SINGLE
> diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
> index acab0be1d3..b83f6518e8 100644
> --- a/package/hackrf/hackrf.mk
> +++ b/package/hackrf/hackrf.mk
> @@ -9,7 +9,7 @@ HACKRF_SITE = https://github.com/mossmann/hackrf/releases/download/v$(HACKRF_VER
>  HACKRF_SOURCE = hackrf-$(HACKRF_VERSION).tar.xz
>  HACKRF_LICENSE = GPL-2.0+ BSD-3c
>  HACKRF_LICENSE_FILES = COPYING
> -HACKRF_DEPENDENCIES = fftw libusb
> +HACKRF_DEPENDENCIES = fftw-single libusb
>  HACKRF_SUBDIR = host
>  HACKRF_INSTALL_STAGING = YES
>  
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
