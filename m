From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 15 Aug 2011 17:32:04 +0300
Subject: [Buildroot] [git commit] usbmount: depend on udev rather than
 selecting it
In-Reply-To: <20110815121044.054CD8C8E3@busybox.osuosl.org>
References: <20110815121044.054CD8C8E3@busybox.osuosl.org>
Message-ID: <20110815143204.GC22429@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Mon, Aug 15, 2011 at 02:09:57PM +0200, Peter Korsgaard wrote:
> diff --git a/package/usbmount/Config.in b/package/usbmount/Config.in
> index 6980c8c..30c7b5a 100644
> --- a/package/usbmount/Config.in
> +++ b/package/usbmount/Config.in
> @@ -2,7 +2,7 @@ config BR2_PACKAGE_USBMOUNT
>  	bool "usbmount"
>  	depends on BR2_LARGEFILE # util-linux
>  	depends on BR2_USE_WCHAR # util-linux
> -	select BR2_PACKAGE_UDEV
> +	depends on BR2_PACKAGE_UDEV
>  	select BR2_PACKAGE_LOCKFILE_PROGS
>  	select BR2_PACKAGE_UTIL_LINUX
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
> @@ -13,4 +13,4 @@ config BR2_PACKAGE_USBMOUNT
>  	  http://usbmount.alioth.debian.org/
>  
>  comment "usbmount requires a toolchain with LARGEFILE + WCHAR support"
> -	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR)
> +	depends on !(BR2_LARGEFILE && BR2_USE_WCHAR) && BR2_PACKAGE_UDEV

Shouldn't the comment text be updated to indicate the udev dependency?

baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
