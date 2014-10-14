From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 10:29:44 +0200
Subject: [Buildroot] [PATCH 8/8] package/tvheadend: Add transcoding
 support by ffmpeg
In-Reply-To: <1413137610-21887-8-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-8-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141014082943.GK3730@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-12 20:13 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index 7d27edc..5267a10 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -14,6 +14,13 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
>  TVHEADEND_DEPENDENCIES += avahi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE)$(BR2_PACKAGE_FFMPEG_SWSCALE),yy)
> +TVHEADEND_DEPENDENCIES += ffmpeg
> +TVHEADEND_CONF_OPTS += --enable-libav
> +else
> +TVHEADEND_CONF_OPTS += --disable-libav
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
>  TVHEADEND_DEPENDENCIES += libdvbcsa
>  TVHEADEND_CONF_OPTS += --enable-dvbcsa
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
