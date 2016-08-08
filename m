From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 8 Aug 2016 20:01:43 +0200
Subject: [Buildroot] [PATCH] owfs: disable PHP support
In-Reply-To: <1470434333-17595-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1470434333-17595-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160808180143.GB32406@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-08-05 23:58 +0200, Thomas Petazzoni spake thusly:
> Since we upgraded PHP to PHP 7.x, the PHP support of OWFS started
> failing to build. Since we can hardly fix that on our own, the issue was
> reported upstream (https://sourceforge.net/p/owfs/support-requests/32/)
> and for now, we will disable PHP support in OWFS.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/fe6843ec53fbed452d2e38a8577a235f73abb8db/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/owfs/owfs.mk | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
> index 0092603..83614af 100644
> --- a/package/owfs/owfs.mk
> +++ b/package/owfs/owfs.mk
> @@ -17,6 +17,10 @@ OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
>  OWFS_LICENSE_FILES = COPYING COPYING.LIB
>  OWFS_INSTALL_STAGING = YES
>  
> +# owfs PHP support is not PHP 7 compliant
> +# https://sourceforge.net/p/owfs/support-requests/32/
> +OWFS_CONF_OPTS += --disable-owphp --without-php
> +
>  ifeq ($(BR2_PACKAGE_LIBFUSE),y)
>  OWFS_DEPENDENCIES += libfuse
>  OWFS_CONF_OPTS += \
> @@ -49,13 +53,6 @@ else
>  OWFS_CONF_OPTS += --disable-avahi
>  endif
>  
> -ifeq ($(BR2_PACKAGE_PHP),y)
> -OWFS_CONF_OPTS += --enable-owphp --with-php --with-phpconfig=$(STAGING_DIR)/usr/bin/php-config
> -OWFS_DEPENDENCIES += php host-swig
> -else
> -OWFS_CONF_OPTS += --disable-owphp --without-php
> -endif
> -
>  # setup.py isn't python3 compliant
>  ifeq ($(BR2_PACKAGE_PYTHON),y)
>  OWFS_CONF_OPTS += \
> -- 
> 2.7.4
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
