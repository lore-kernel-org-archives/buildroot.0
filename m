From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 22 Dec 2019 16:05:48 +0100
Subject: [Buildroot] [PATCH 2/2] package/openocd: use host-jimtcl for
 host variant
In-Reply-To: <20191222140237.2389908-2-fontaine.fabrice@gmail.com>
References: <20191222140237.2389908-1-fontaine.fabrice@gmail.com>
 <20191222140237.2389908-2-fontaine.fabrice@gmail.com>
Message-ID: <20191222150548.GG26395@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2019-12-22 15:02 +0100, Fabrice Fontaine spake thusly:
> This will fix a build failure raised by commit
> 06aa2995350922197c6db0a46e39ac5c37d5a49e which dropped patch on embedded
> jimtcl
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/bd140b5f433d4272f3efd43ff840e13e4301c4db
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openocd/openocd.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
> index 29e4f4b31f..7887f3a6dc 100644
> --- a/package/openocd/openocd.mk
> +++ b/package/openocd/openocd.mk
> @@ -97,12 +97,12 @@ HOST_OPENOCD_CONF_OPTS = \
>  	--oldincludedir=$(HOST_DIR)/include \
>  	--includedir=$(HOST_DIR)/include \
>  	--disable-doxygen-html \
> -	--with-jim-shared=no \
> +	--disable-internal-jimtcl \
>  	--disable-shared \
>  	--enable-dummy \
>  	--disable-werror
>  
> -HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat
> +HOST_OPENOCD_DEPENDENCIES = host-jimtcl host-libftdi host-libusb host-libusb-compat
>  
>  # Avoid documentation rebuild. On PowerPC64(le), we patch the
>  # configure script. Due to this, the version.texi files gets
> -- 
> 2.24.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
