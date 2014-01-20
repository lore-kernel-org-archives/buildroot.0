From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 20 Jan 2014 22:58:52 +0100
Subject: [Buildroot] [PATCH 4 of 5 v2] lzma: remove deprecated target
 package
In-Reply-To: <ad3654061390422916af.1390254369@argentina>
References: <patchbomb.1390254365@argentina>
 <ad3654061390422916af.1390254369@argentina>
Message-ID: <20140120215852.GG3421@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-01-20 22:46 +0100, Thomas De Schampheleire spake thusly:
> The on-target lzma package has been deprecated for a long time, so remove
> it. This does not remove the support for generating lzma-compressed rootfs
> images.
> 
> Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
[--SNIP--]
> diff --git a/Config.in.legacy b/Config.in.legacy
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -99,6 +99,16 @@ comment "-------------------------------
>  endif
>  
>  ###############################################################################
> +comment "Legacy options removed in 2014.02"
> +
> +config BR2_PACKAGE_LZMA
> +	bool "lzma target package has been removed"
> +	select BR2_LEGACY
> +	help
> +	  The 'lzma' target package has been removed since it has been
> +	  deprecated for more than four buildroot releases.
> +	  Note: generating lzma-compressed rootfs images is still supported.
> +
>  config BR2_PACKAGE_LIBNFC_LLCP
>  	bool "libnfc-llcp has been removed"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
> @@ -109,9 +119,6 @@ config BR2_PACKAGE_LIBNFC_LLCP
>            to 'libllcp'. We have added a new package for 'libllcp' and bumped
>            the version at the same time.
>  
> -###############################################################################
> -comment "Legacy options removed in 2014.02"
> -

Moving the comment will gonna clash with my recent patch being applied
by Peter:
    http://git.buildroot.org/buildroot/commit/?id=f169e5e1055600fda1b3ff0c852ee84d2ec80460

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
