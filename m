From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 6 Apr 2015 17:29:53 +0200
Subject: [Buildroot] [PATCH v2 3/3] mp4v2: Remove --disable-debug
 workaround.
In-Reply-To: <1426173147-27755-3-git-send-email-johan.oudinet@gmail.com>
References: <1426173147-27755-1-git-send-email-johan.oudinet@gmail.com>
 <1426173147-27755-3-git-send-email-johan.oudinet@gmail.com>
Message-ID: <20150406152953.GH4369@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Johan, All,

On 2015-03-12 16:12 +0100, Johan Oudinet spake thusly:
> This is not needed since BR2_ENABLE_DEBUG does not set this flag
> anymore.
> 
> Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/mp4v2/mp4v2.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/mp4v2/mp4v2.mk b/package/mp4v2/mp4v2.mk
> index 5d38116..1da5bc3 100644
> --- a/package/mp4v2/mp4v2.mk
> +++ b/package/mp4v2/mp4v2.mk
> @@ -16,12 +16,6 @@ MP4V2_LICENSE_FILES = COPYING
>  # disable it
>  MP4V2_CONF_ENV = ac_cv_prog_FOUND_HELP2MAN=no
>  
> -# infrastructure passes --disable-debug if !BR2_ENABLE_DEBUG. With
> -# mpv42 the only thing this option does is that it tries to strip any
> -# -g* options from CFLAGS/CXXFLAGS. The logic to do so is
> -# unfortunately buggy, so just pass --enable-debug to disable this
> -MP4V2_CONF_OPTS = --enable-debug
> -
>  ifeq ($(BR2_LARGEFILE),y)
>  MP4V2_CONF_OPTS += --enable-largefile
>  else
> -- 
> 2.1.0
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
