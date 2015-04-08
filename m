From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 23:35:16 +0200
Subject: [Buildroot] [PATCH 18/18] package/mplayer: add optional
 libmpeg2 support
In-Reply-To: <1427649094-1240-19-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-19-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408213516.GI4197@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-03-29 19:11 +0200, Bernd Kuhls spake thusly:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index da6e468..61c4594 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -150,6 +150,12 @@ MPLAYER_EXTRA_LIBS += -lass
>  MPLAYER_CONF_OPTS += --disable-ass-internal --enable-ass
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBMPEG2),y)
> +MPLAYER_DEPENDENCIES += libmpeg2
> +MPLAYER_CONF_OPTS += --disable-libmpeg2-internal --enable-libmpeg2
> +MPLAYER_EXTRA_LIBS += -lmpeg2
> +endif

Ditto, ./configure detects the LDFLAGS if it auto-finds libmpeg2 (i.e.
without passing --enable-libmpeg2).

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_TREMOR),y)
>  MPLAYER_DEPENDENCIES += tremor
>  MPLAYER_CONF_OPTS += --disable-tremor-internal --enable-tremor
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
