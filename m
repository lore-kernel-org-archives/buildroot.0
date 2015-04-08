From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 23:21:29 +0200
Subject: [Buildroot] [PATCH 11/18] package/mplayer: add optional faad2
 support
In-Reply-To: <1427649094-1240-12-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-12-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408212129.GF4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-03-29 19:11 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mplayer/mplayer.mk |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index a09cf43..442f82b 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -117,6 +117,13 @@ else
>  MPLAYER_CONF_OPTS += --disable-mencoder
>  endif
>  
> +ifeq ($(BR2_PACKAGE_FAAD2),y)
> +MPLAYER_DEPENDENCIES += faad2
> +MPLAYER_CONF_OPTS += --enable-faad
> +else
> +MPLAYER_CONF_OPTS += --disable-faad
> +endif
> +
>  ifeq ($(BR2_PACKAGE_LIBASS),y)
>  MPLAYER_DEPENDENCIES += libass
>  MPLAYER_EXTRA_LIBS += -lass
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
