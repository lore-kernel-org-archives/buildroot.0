From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 6 Feb 2017 15:28:48 +0200
Subject: [Buildroot] [PATCH v2] efl: do not force dependency on libudev
 by making eeze a config option.
In-Reply-To: <20170206132510.6247-1-romain.naour@gmail.com>
References: <20170206132510.6247-1-romain.naour@gmail.com>
Message-ID: <20170206132848.5yedfv7qzqqimz2m@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

On Mon, Feb 06, 2017 at 02:25:10PM +0100, Romain Naour wrote:
> @@ -28,5 +30,6 @@ config BR2_PACKAGE_ENLIGHTENMENT
>  
>  comment "enlightenment needs a toolchain w/ wchar, C++, threads"
>  	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
> -	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP
> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> +		!BR2_PACKAGE_HAS_UDEV
>  	depends on BR2_TOOLCHAIN_HAS_SYNC_4

What about updating the comment text?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
