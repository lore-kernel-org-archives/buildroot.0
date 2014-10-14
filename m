From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 14 Oct 2014 10:21:43 +0200
Subject: [Buildroot] [PATCH 2/8] package/ffmpeg: Enable support for
 libavresample
In-Reply-To: <1413137610-21887-2-git-send-email-bernd.kuhls@t-online.de>
References: <1413137610-21887-1-git-send-email-bernd.kuhls@t-online.de>
 <1413137610-21887-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141014082142.GF3730@free.fr>
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
>  package/ffmpeg/Config.in |    5 +++++
>  package/ffmpeg/ffmpeg.mk |    6 ++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/package/ffmpeg/Config.in b/package/ffmpeg/Config.in
> index 20d5231..6fde46e 100644
> --- a/package/ffmpeg/Config.in
> +++ b/package/ffmpeg/Config.in
> @@ -49,6 +49,11 @@ config BR2_PACKAGE_FFMPEG_FFSERVER
>  	help
>  	  FFserver is a streaming server for both audio and video.
>  
> +config BR2_PACKAGE_FFMPEG_AVRESAMPLE
> +	bool "Build libavresample"
> +	help
> +	  Avresample is a audio conversion library for compatibility.
> +
>  config BR2_PACKAGE_FFMPEG_POSTPROC
>  	bool "Build libpostproc"
>  	depends on BR2_PACKAGE_FFMPEG_GPL
> diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
> index af4e1f6..0493385 100644
> --- a/package/ffmpeg/ffmpeg.mk
> +++ b/package/ffmpeg/ffmpeg.mk
> @@ -104,6 +104,12 @@ else
>  FFMPEG_CONF_OPTS += --disable-ffserver
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FFMPEG_AVRESAMPLE),y)
> +FFMPEG_CONF_OPTS += --enable-avresample
> +else
> +FFMPEG_CONF_OPTS += --disable-avresample
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FFMPEG_POSTPROC),y)
>  FFMPEG_CONF_OPTS += --enable-postproc
>  else
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
