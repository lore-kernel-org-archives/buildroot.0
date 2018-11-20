From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 21:38:16 +0100
Subject: [Buildroot] [PATCH 1/1] weston: egl support needs egl glesv2
In-Reply-To: <20181120202003.21053-1-fontaine.fabrice@gmail.com>
References: <20181120202003.21053-1-fontaine.fabrice@gmail.com>
Message-ID: <20181120203816.GI2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-11-20 21:20 +0100, Fabrice Fontaine spake thusly:
> Fixes:
>  - http://autobuild.buildroot.org/results/95db3f4ad4c7ae866b7db4431293c26faa5c1dfc
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index 66f5d5d792..dba5f35bf4 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -50,9 +50,9 @@ else
>  WESTON_CONF_OPTS += --disable-weston-launch
>  endif
>  
> -ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND),y)
> +ifeq ($(BR2_PACKAGE_HAS_LIBEGL_WAYLAND)$(BR2_PACKAGE_HAS_LIBGLES),yy)
>  WESTON_CONF_OPTS += --enable-egl
> -WESTON_DEPENDENCIES += libegl
> +WESTON_DEPENDENCIES += libegl libgles
>  else
>  WESTON_CONF_OPTS += \
>  	--disable-egl \
> -- 
> 2.14.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
