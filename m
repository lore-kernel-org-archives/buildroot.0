From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 29 Nov 2016 18:05:30 +0200
Subject: [Buildroot] [PATCH 1/1] sane-backends: disable static
 configuration
In-Reply-To: <1480430155-25182-1-git-send-email-fhunleth@troodon-software.com>
References: <1480430155-25182-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <20161129160530.nnv3cvf4xlpb7ii4@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Frank,

On Tue, Nov 29, 2016 at 09:35:55AM -0500, Frank Hunleth wrote: 
> diff --git a/package/sane-backends/Config.in b/package/sane-backends/Config.in
> index 8156e85..b1771e7 100644
> --- a/package/sane-backends/Config.in
> +++ b/package/sane-backends/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SANE_BACKENDS
>  	bool "sane-backends"
>  	depends on BR2_USE_MMU # fork()
> +	depends on !BR2_STATIC_LIBS
>  	help
>  	  SANE - Scanner Access Now Easy
>  
> @@ -9,3 +10,6 @@ config BR2_PACKAGE_SANE_BACKENDS
>  	  Backends are included automatically based on the libraries that have
>  	  been selected: libusb, jpeg, tiff, avahi (with dbus and libglib2),
>  	  and netsnmp.
> +
> +comment "sane-backends needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS

As BR2_PACKAGE_SANE_BACKENDS depends on BR2_USE_MMU, this comment also needs 
the same dependency. Otherwise the comment is shown when the target arch does 
not support this package.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
