From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 May 2014 23:06:32 +0200
Subject: [Buildroot] [PATCH v8 27/28] xbmc: add nasm/yasm dependency
In-Reply-To: <1400342276-10303-28-git-send-email-bernd.kuhls@t-online.de>
References: <1400342276-10303-1-git-send-email-bernd.kuhls@t-online.de>
 <1400342276-10303-28-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140517210632.GP3459@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-05-17 17:57 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Could you please add a bit more description in your commit logs?

This change comes out of the blue, and we can't see why it is needed.

If it breaks without it, then it should probably be part of the Gotham
bump, no?

If you are afraid the bump patch gets too big, then add it before the
bump, and state it is a preparatory patch.

Regards,
Yann E. MORIN.

> ---
>  package/xbmc/xbmc.mk |    2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index a18b82a..f537e92 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -18,6 +18,8 @@ XBMC_DEPENDENCIES += boost bzip2 expat flac fontconfig freetype jasper jpeg \
>  	libogg libplist libpng libsamplerate libungif libvorbis libxml2 libxslt lzo ncurses \
>  	openssl pcre python readline sqlite taglib tiff tinyxml yajl zlib
>  
> +XBMC_DEPENDENCIES += $(if $(BR2_i386),host-nasm) $(if $(BR2_x86_64),host-yasm)
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
