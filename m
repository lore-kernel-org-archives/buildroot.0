From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 21 May 2021 18:56:19 +0200
Subject: [Buildroot] [PATCH 1/1] package/wpewebkit: select gstreamer
 autoaudiosink
In-Reply-To: <20210519213237.1286906-1-aperez@igalia.com>
References: <20210519213237.1286906-1-aperez@igalia.com>
Message-ID: <20210521165619.GN3208066@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian, All,

On 2021-05-20 00:32 +0300, Adrian Perez de Castro spake thusly:
> Select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT when multimedia
> support is enabled. This is needed at runtime to automatically select
> a suitable audio output element, otherwise WebKit will crash at an
> assertion due to the missing "autoaudiosink" element. More here:
> 
>   https://wpewebkit.org/about/faq.html#why-does-the-browser%2Flauncher-(e.g.-cog)-crash-when-trying-to-play-audio%3F
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks. As I messed up, I also accidentally applied
to next...

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wpewebkit/Config.in b/package/wpewebkit/Config.in
> index 640f7c7011..c8c66e8458 100644
> --- a/package/wpewebkit/Config.in
> +++ b/package/wpewebkit/Config.in
> @@ -95,6 +95,7 @@ config BR2_PACKAGE_WPEWEBKIT_MULTIMEDIA
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
>  	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
>  	select BR2_PACKAGE_GST1_PLUGINS_GOOD
> +	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
>  	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
>  	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
>  	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
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
