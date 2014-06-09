From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 9 Jun 2014 16:04:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: Add optional
 dependency to libiconv
In-Reply-To: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402313033-31085-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20140609140456.GG3512@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-06-09 13:23 +0200, Bernd Kuhls spake thusly:
> To get reproducable builds depend on libiconv if needed.
> 
> tvheadend configure either shows
> 
>   checking for cc libiconv ...                      fail
> 
> or
> 
>   checking for cc libiconv ...                      ok
> 
> depending on the presence of libiconv, and gets linked
> 
> output/host/usr/bin/i586-buildroot-linux-uclibc-readelf -a output/target/usr/bin/tvheadend | grep NEEDED | grep iconv
>  0x00000001 (NEEDED)                     Shared library: [libiconv.so.2]
> 
> Tested with minimal defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
> BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
> BR2_PACKAGE_LIBICONV=y
> BR2_PACKAGE_TVHEADEND=y
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/tvheadend/tvheadend.mk |    4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
> index c582c07..4d0a16d 100644
> --- a/package/tvheadend/tvheadend.mk
> +++ b/package/tvheadend/tvheadend.mk
> @@ -14,6 +14,10 @@ ifeq ($(BR2_PACKAGE_AVAHI),y)
>  TVHEADEND_DEPENDENCIES += avahi
>  endif
>  
> +ifeq ($(BR2_PACKAGE_LIBICONV),y)
> +TVHEADEND_DEPENDENCIES += libiconv
> +endif
> +
>  TVHEADEND_DEPENDENCIES += dtv-scan-tables
>  
>  define TVHEADEND_CONFIGURE_CMDS
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
