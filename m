From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 1 Oct 2015 23:24:38 +0300
Subject: [Buildroot] [PATCH v2 1/1] package/kodi-pvr-stalker: Needs
 jsoncpp
In-Reply-To: <1443730437-12443-1-git-send-email-bernd.kuhls@t-online.de>
References: <1443730437-12443-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151001202438.GE3337@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Benrd,

On Thu, Oct 01, 2015 at 10:13:57PM +0200, Bernd Kuhls wrote:
> diff --git a/package/kodi-pvr-stalker/Config.in 
> b/package/kodi-pvr-stalker/Config.in
> index b327fd8..0e6143a 100644
> --- a/package/kodi-pvr-stalker/Config.in
> +++ b/package/kodi-pvr-stalker/Config.in
> @@ -1,7 +1,12 @@
>  config BR2_PACKAGE_KODI_PVR_STALKER
>  	bool "kodi-pvr-stalker"
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # jsoncpp

Also BR2_INSTALL_LIBSTDCPP.

> +	select BR2_PACKAGE_JSONCPP
>  	select BR2_PACKAGE_KODI_PLATFORM
>  	help
>  	  A PVR Client that connects Kodi to Stalker Middleware
>  
>  	  https://github.com/kodi-pvr/pvr.stalker
> +
> +comment "kodi-pvr-stalker needs a toolchain w/ C++, gcc >= 4.7"
> +	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_7

Ditto.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
