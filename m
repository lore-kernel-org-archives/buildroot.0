From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 20 May 2021 14:59:46 +0200
Subject: [Buildroot] [PATCH 2/3] package/libglib2: add -Dxattr=true when
 libselinux is selected
In-Reply-To: <20210501195620.910716-2-aduskett@gmail.com>
References: <20210501195620.910716-1-aduskett@gmail.com>
 <20210501195620.910716-2-aduskett@gmail.com>
Message-ID: <20210520125946.GC2268078@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adam, All,

On 2021-05-01 12:56 -0700, Adam Duskett spake thusly:
> Xattrs is required for SELinux. Explicitly enable the feature when the
> libselinux package is selected.
> 
> Signed-off-by: Adam Duskett <aduskett@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libglib2/libglib2.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
> index b5554d6b56..e3263ce9ce 100644
> --- a/package/libglib2/libglib2.mk
> +++ b/package/libglib2/libglib2.mk
> @@ -77,10 +77,10 @@ LIBGLIB2_DEPENDENCIES += libiconv
>  endif
>  
>  ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
> -LIBGLIB2_CONF_OPTS += -Dselinux=enabled
> +LIBGLIB2_CONF_OPTS += -Dselinux=enabled -Dxattr=true
>  LIBGLIB2_DEPENDENCIES += libselinux
>  else
> -LIBGLIB2_CONF_OPTS += -Dselinux=disabled
> +LIBGLIB2_CONF_OPTS += -Dselinux=disabled -Dxattr=false
>  endif
>  
>  # Purge gdb-related files
> -- 
> 2.31.1
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
