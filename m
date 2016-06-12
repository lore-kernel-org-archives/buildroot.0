From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Jun 2016 22:19:19 +0200
Subject: [Buildroot] [PATCH v2 4/5] package/libv4l: add optional support
 for libgl
In-Reply-To: <1465762042-18942-4-git-send-email-bernd.kuhls@t-online.de>
References: <1465762042-18942-1-git-send-email-bernd.kuhls@t-online.de>
 <1465762042-18942-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160612201919.GG3711@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2016-06-12 22:07 +0200, Bernd Kuhls spake thusly:
> libv4l has optional support for OpenGL:
> https://git.linuxtv.org/v4l-utils.git/tree/configure.ac#n160
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Same cursory look, no way to explicitly disable libgl support... :-/
(It would have been nice if you had said so in the commit log, btw...)

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> v2: no changes
> 
>  package/libv4l/libv4l.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
> index e7a57f0..a73b6cf 100644
> --- a/package/libv4l/libv4l.mk
> +++ b/package/libv4l/libv4l.mk
> @@ -36,6 +36,10 @@ else
>  LIBV4L_CONF_OPTS += --without-jpeg
>  endif
>  
> +ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
> +LIBV4L_DEPENDENCIES += libgl
> +endif
> +
>  ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
>  LIBV4L_CONF_OPTS += --with-libudev
>  LIBV4L_DEPENDENCIES += udev
> -- 
> 2.8.1
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
