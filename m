From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Sep 2020 22:25:52 +0200
Subject: [Buildroot] [PATCH 1/1] package/wlroots: drop libcap dependency
In-Reply-To: <20200908195738.78038-1-fontaine.fabrice@gmail.com>
References: <20200908195738.78038-1-fontaine.fabrice@gmail.com>
Message-ID: <20200908202552.GY14354@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-09-08 21:57 +0200, Fabrice Fontaine spake thusly:
> libcap has been drroped since version 0.11.0 and
> https://github.com/swaywm/wlroots/commit/906c0766df2fec4bd32c316fd1b0d46fded5fc84
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wlroots/wlroots.mk | 7 -------
>  1 file changed, 7 deletions(-)
> 
> diff --git a/package/wlroots/wlroots.mk b/package/wlroots/wlroots.mk
> index 7923e94325..27ccc8d5f3 100644
> --- a/package/wlroots/wlroots.mk
> +++ b/package/wlroots/wlroots.mk
> @@ -27,13 +27,6 @@ ifeq ($(BR2_PACKAGE_FFMPEG),y)
>  WLROOTS_DEPENDENCIES += ffmpeg
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBCAP),y)
> -WLROOTS_CONF_OPTS += -Dlibcap=enabled
> -WLROOTS_DEPENDENCIES += libcap
> -else
> -WLROOTS_CONF_OPTS += -Dlibcap=disabled
> -endif
> -
>  ifeq ($(BR2_PACKAGE_LIBPNG),y)
>  WLROOTS_DEPENDENCIES += libpng
>  endif
> -- 
> 2.28.0
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
