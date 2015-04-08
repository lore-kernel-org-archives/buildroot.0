From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 8 Apr 2015 23:30:08 +0200
Subject: [Buildroot] [PATCH 14/18] package/mplayer: add optional
 libiconv support
In-Reply-To: <1427649094-1240-15-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-15-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150408213008.GH4197@free.fr>
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
>  package/mplayer/mplayer.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index 631e2fe..6d9c4f4 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -68,6 +68,14 @@ else
>  MPLAYER_CONF_OPTS += --disable-enca
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +MPLAYER_CONF_OPTS += --enable-iconv
> +MPLAYER_DEPENDENCIES += libiconv
> +MPLAYER_EXTRA_LIBS += -liconv

Even though that's jsut been merged, I think this has the same issue as
the librtmp: ./configure will find the appropriate CFLAGS/LIBS if not
explicitly told to use iconv, so I'd just add the dependency (like
already suggested for librtmp).

Care to address that ad send a respin, please?

Regards,
Yann E. MORIN.

> +else
> +MPLAYER_CONF_OPTS += --disable-iconv
> +endif
> +
>  ifeq ($(BR2_PACKAGE_NCURSES),y)
>  MPLAYER_CONF_OPTS += --enable-termcap
>  MPLAYER_DEPENDENCIES += ncurses
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
