From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 14:15:59 +0200
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: add opencv3 optional
 dependency
In-Reply-To: <20201016214551.2522338-1-fontaine.fabrice@gmail.com>
References: <20201016214551.2522338-1-fontaine.fabrice@gmail.com>
Message-ID: <20201017121559.GK3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-16 23:45 +0200, Fabrice Fontaine spake thusly:
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zxing-cpp/zxing-cpp.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
> index c138c925bb..316afd6ad2 100644
> --- a/package/zxing-cpp/zxing-cpp.mk
> +++ b/package/zxing-cpp/zxing-cpp.mk
> @@ -16,8 +16,8 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
>  ZXING_CPP_DEPENDENCIES += libiconv
>  endif
>  
> -ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),y)
> -ZXING_CPP_DEPENDENCIES += opencv
> +ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
> +ZXING_CPP_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV),opencv,opencv3)

I found that a separate condition was easier to read (and thus to
maintain), so I did the split when applying to master. Thanks!

Regards,
Yann E. MORIN.

>  ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
>  else
>  ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=OFF
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
