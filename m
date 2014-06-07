From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 7 Jun 2014 23:27:25 +0200
Subject: [Buildroot] [PATCH v12 03/32] xbmc: add host-nasm dependency
In-Reply-To: <1402144292-27837-4-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
 <1402144292-27837-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140607212725.GB10718@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-07 14:31 +0200, Bernd Kuhls spake thusly:
> Fixes:
> checking for nasm... no
> configure: error: Could not find a required program. Please see the README for your platform.
> 
> This will be needed for 13.0 Gotham.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/xbmc.mk |    3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index d8b9508..3522802 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -18,6 +18,9 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>  	libogg libplist libpng libsamplerate libungif libvorbis libxml2 lzo ncurses \
>  	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
>  
> +# xbmc at i386 depends on nasm
> +XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm)
> +
>  XBMC_CONF_ENV = \
>  	PYTHON_VERSION="$(PYTHON_VERSION_MAJOR)" \
>  	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
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
