From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 17 Sep 2019 23:12:32 +0200
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: bump to version
 3.0.0
In-Reply-To: <20190915184000.3491-1-fontaine.fabrice@gmail.com>
References: <20190915184000.3491-1-fontaine.fabrice@gmail.com>
Message-ID: <20190917231232.64e1bd19@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Sun, 15 Sep 2019 20:40:00 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> diff --git a/package/chocolate-doom/Config.in b/package/chocolate-doom/Config.in
> index 5e0d9c11ea..3ba520ad29 100644
> --- a/package/chocolate-doom/Config.in
> +++ b/package/chocolate-doom/Config.in
> @@ -1,12 +1,16 @@
>  config BR2_PACKAGE_CHOCOLATE_DOOM
>  	bool "chocolate-doom"
>  	depends on BR2_USE_MMU # fork()

This BR2_USE_MMU dependency...

> -	select BR2_PACKAGE_SDL
> -	select BR2_PACKAGE_SDL_MIXER
> -	select BR2_PACKAGE_SDL_NET
> +	depends on !BR2_STATIC_LIBS # sdl2
> +	select BR2_PACKAGE_SDL2
> +	select BR2_PACKAGE_SDL2_MIXER
> +	select BR2_PACKAGE_SDL2_NET
>  	help
>  	  Chocolate Doom is a set of conservative source ports for Doom,
>  	  Heretic, Hexen and Strife, with a philosophy of preserving the
>  	  look, feel, and bugs of the vanilla versions of each.
>  
>  	  http://www.chocolate-doom.org
> +
> +comment "chocolate-doom needs a toolchain w/ dynamic library"
> +	depends on BR2_STATIC_LIBS

...should have been propagated here.

I fixed that and applied. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
