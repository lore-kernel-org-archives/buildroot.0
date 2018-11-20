From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 20 Nov 2018 21:39:50 +0100
Subject: [Buildroot] [PATCH/next 1/1] weston: drop libunwind optional
 dependency
In-Reply-To: <20181120201925.21004-1-fontaine.fabrice@gmail.com>
References: <20181120201925.21004-1-fontaine.fabrice@gmail.com>
Message-ID: <20181120203950.GJ2601@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2018-11-20 21:19 +0100, Fabrice Fontaine spake thusly:
> libunwind was dropped since 3.0.91, see:
> https://github.com/wayland-project/weston/commit/bb707dc0fe331c9af112a0552b7aa6fde755dd83
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/weston/weston.mk | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> index efe12bc01e..66f5d5d792 100644
> --- a/package/weston/weston.mk
> +++ b/package/weston/weston.mk
> @@ -60,12 +60,6 @@ WESTON_CONF_OPTS += \
>  	--disable-simple-egl-clients
>  endif
>  
> -ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
> -WESTON_DEPENDENCIES += libunwind
> -else
> -WESTON_CONF_OPTS += --disable-libunwind
> -endif
> -
>  ifeq ($(BR2_PACKAGE_WESTON_RDP),y)
>  WESTON_DEPENDENCIES += freerdp
>  WESTON_CONF_OPTS += --enable-rdp-compositor
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
