From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 18:57:14 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: make gst-gl depend
 on _HAS_PLATFORM
In-Reply-To: <20210519214200.1294908-1-aperez@igalia.com>
References: <20210519214200.1294908-1-aperez@igalia.com>
Message-ID: <20210521165714.GP3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-20 00:42 +0300, Adrian Perez de Castro spake thusly:
> The GStreamer-GL usage in WPE WebKit is usable as long as GStreamer
> is configured with a valid platform API (GLX+OpenGL, EGL+OpenGL,
> EGL+GLES, etc.), which is exactly what the symbol
> BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM represents.
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 640f7c7011..71bce8a88e 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -109,7 +109,7 @@ if BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>  config BR2_PACKAGE_WPEWEBKIT_USE_GSTREAMER_GL
>  	bool "use gstreamer-gl"
>  	default y
> -	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_OPENGL
> +	depends on BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_HAS_PLATFORM
>  	help
>  	  Use the GStreamer GL elements for handling video content.
>  	  This is recommended as it improves performance of video
> -- 
> 2.31.1
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
