From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Oct 2014 00:44:12 +0200
Subject: [Buildroot] [PATCH 1/1] package/libplist: Bump version to 1.12
In-Reply-To: <1413659138-11363-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413659138-11363-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20141018224412.GC14899@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2014-10-18 21:05 +0200, Bernd Kuhls spake thusly:
> Quoting http://cgit.sukimashita.com/libplist.git/tree/NEWS
> "  * Fix parallel build for autotools"
> 
> Therefore removed MAKE1, tested with -j90

-j90, woot! :-)

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libplist/libplist.mk |    5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/package/libplist/libplist.mk b/package/libplist/libplist.mk
> index 1185370..b87c5ba 100644
> --- a/package/libplist/libplist.mk
> +++ b/package/libplist/libplist.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBPLIST_VERSION = 1.11
> +LIBPLIST_VERSION = 1.12
>  LIBPLIST_SITE = http://cgit.sukimashita.com/libplist.git/snapshot
>  LIBPLIST_DEPENDENCIES = libxml2 host-pkgconf
>  LIBPLIST_INSTALL_STAGING = YES
> @@ -14,9 +14,6 @@ LIBPLIST_LICENSE_FILES = COPYING
>  # Straight out of the git tree:
>  LIBPLIST_AUTORECONF = YES
>  
> -# Does not build in parallel
> -LIBPLIST_MAKE = $(MAKE1)
> -
>  # Disable building Python bindings, because it requires host-cython, which
>  # is not packaged in Buildroot at all.
>  LIBPLIST_CONF_OPTS = --without-cython
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
