From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jun 2014 23:25:54 +0200
Subject: [Buildroot] [PATCH v12 02/32] xbmc: add host-gettext dependency
In-Reply-To: <1402144292-27837-3-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140607212554.GA10718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> AUTOPOINT=/bin/true does not work anymore since
> https://github.com/xbmc/xbmc/commit/42017cba7a62a0cf16896b061a25a25d392e1e46
> 
> config.status: error: cannot find input file: `Makefile.in'
> configure: error: Submodule lib/cpluff failed to configure
> 
> This will be needed for 13.0 Gotham.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/xbmc.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index c7a4607..d8b9508 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -12,7 +12,7 @@ XBMC_LICENSE_FILES = LICENSE.GPL
>  # called TexturePacker. It is responsible to take all the images used in the
>  # GUI and pack them in a blob.
>  # http://wiki.xbmc.org/index.php?title=TexturePacker
> -XBMC_DEPENDENCIES = host-gawk host-gperf host-infozip host-lzo host-sdl_image host-swig
> +XBMC_DEPENDENCIES = host-gawk host-gettext host-gperf host-infozip host-lzo host-sdl_image host-swig
>  XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>  	libass libcdio libcurl libegl libfribidi libgcrypt libgles libmad libmodplug libmpeg2 \
>  	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
> @@ -133,7 +133,7 @@ endif
>  
>  # Add HOST_DIR to PATH for codegenerator.mk to find swig
>  define XBMC_BOOTSTRAP
> -	cd $(@D) && PATH=$(BR_PATH) AUTOPOINT=/bin/true ./bootstrap
> +	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
>  endef
>  XBMC_PRE_CONFIGURE_HOOKS += XBMC_BOOTSTRAP
>  
> -- 
> 1.7.10.4
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
