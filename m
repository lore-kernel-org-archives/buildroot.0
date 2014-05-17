From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 22:29:18 +0200
Subject: [Buildroot] [PATCH v8 19/28] xbmc: Add host-gettext dependency
In-Reply-To: <1400342276-10303-20-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-20-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517202918.GJ3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> AUTOPOINT=/bin/true does not work anymore since
> https://github.com/xbmc/xbmc/commit/42017cba7a62a0cf16896b061a25a25d392e1e46
> 
> config.status: error: cannot find input file: `Makefile.in'
> configure: error: Submodule lib/cpluff failed to configure

Does that mean that XBMC is no longer buildable between the patch that
bumps it, and this patch?

If so, then you have two options:
  - fold this patch into the bump patch, or
  - move this patch before the bump aptch (stating it is in preparation
    of the bump.)

I would prefer the second option.

Regards,
Yann E. MORIN.

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 9123d35..5a72dab 100644
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
>  	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
> @@ -134,7 +134,7 @@ endif
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
