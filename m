From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 4 May 2021 21:18:23 +0200
Subject: [Buildroot] [PATCH 1/2] package/kmod: support zstd compression
 if available
In-Reply-To: <20210504123319.20056-1-nolange79@gmail.com>
References: <20210504123319.20056-1-nolange79@gmail.com>
Message-ID: <20210504191823.GK2137340@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Norbert, All,

On 2021-05-04 14:33 +0200, Norbert Lange spake thusly:
> Signed-off-by: Norbert Lange <nolange79@gmail.com>

Series of two applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/kmod/kmod.mk | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/kmod/kmod.mk b/package/kmod/kmod.mk
> index 7fed252c22..9d2b2c47d7 100644
> --- a/package/kmod/kmod.mk
> +++ b/package/kmod/kmod.mk
> @@ -41,6 +41,13 @@ else
>  KMOD_CONF_OPTS += --without-zlib
>  endif
>  
> +ifeq ($(BR2_PACKAGE_ZSTD),y)
> +KMOD_DEPENDENCIES += zstd
> +KMOD_CONF_OPTS += --with-zstd
> +else
> +KMOD_CONF_OPTS += --without-zstd
> +endif
> +
>  ifeq ($(BR2_PACKAGE_XZ),y)
>  KMOD_DEPENDENCIES += xz
>  KMOD_CONF_OPTS += --with-xz
> -- 
> 2.30.2
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
