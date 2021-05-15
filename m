From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 15 May 2021 18:15:29 +0200
Subject: [Buildroot] [PATCH/next v2 1/1] package/libbluray: add optional
 support for libudfread
In-Reply-To: <20210515070141.396977-1-bernd.kuhls@t-online.de>
References: <20210515070141.396977-1-bernd.kuhls@t-online.de>
Message-ID: <20210515161529.GT2506@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2021-05-15 09:01 +0200, Bernd Kuhls spake thusly:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

In fact, this is fixing a hidden optional dependency, so I've applied to
master. Thanks!

Regards,
Yann E. MORIN.

> ---
> v2: rebased, removed patch which is included in current upstream release
> 
>  package/libbluray/libbluray.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libbluray/libbluray.mk b/package/libbluray/libbluray.mk
> index 5c5f603dd8..233797f38d 100644
> --- a/package/libbluray/libbluray.mk
> +++ b/package/libbluray/libbluray.mk
> @@ -19,6 +19,10 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  LIBBLURAY_DEPENDENCIES += libiconv
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBUDFREAD),y)
> +LIBBLURAY_DEPENDENCIES += libudfread
> +endif
> +
>  ifeq ($(BR2_PACKAGE_FREETYPE),y)
>  LIBBLURAY_DEPENDENCIES += freetype
>  LIBBLURAY_CONF_OPTS += --with-freetype
> -- 
> 2.29.2
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
