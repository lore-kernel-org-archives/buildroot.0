From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 10 Dec 2014 22:05:38 +0100
Subject: [Buildroot] [PATCH v2 2/4] menu-cache: new package
In-Reply-To: <1416583990-35169-2-git-send-email-Vincent.Riera@imgtec.com>
References: <1416583990-35169-1-git-send-email-Vincent.Riera@imgtec.com>
 <1416583990-35169-2-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141210210538.GG3926@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-21 15:33 +0000, Vicente Olivert Riera spake thusly:
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
[--SNIP--]
> diff --git a/package/menu-cache/menu-cache.hash b/package/menu-cache/menu-cache.hash
> new file mode 100644
> index 0000000..3b9e5c4
> --- /dev/null
> +++ b/package/menu-cache/menu-cache.hash
> @@ -0,0 +1,2 @@
> +# From http://blog.lxde.org/?p=1299
> +sha1  e7b3854109f9826472cf9795e924acebe5e27861  menu-cache-1.0.0.tar.xz
> diff --git a/package/menu-cache/menu-cache.mk b/package/menu-cache/menu-cache.mk
> new file mode 100644
> index 0000000..a8ff21b
> --- /dev/null
> +++ b/package/menu-cache/menu-cache.mk
> @@ -0,0 +1,17 @@
> +################################################################################
> +#
> +# menu-cache
> +#
> +################################################################################
> +
> +MENU_CACHE_VERSION_MAJOR = 1.0
> +MENU_CACHE_VERSION_MINOR = 0

Drop the _MINOR variable.

> +MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).$(MENU_CACHE_VERSION_MINOR)

MENU_CACHE_VERSION = $(MENU_CACHE_VERSION_MAJOR).0

Regards,
Yann E. MORIN.

> +MENU_CACHE_SOURCE = menu-cache-$(MENU_CACHE_VERSION).tar.xz
> +MENU_CACHE_SITE = http://sourceforge.net/projects/lxde/files/menu-cache/$(MENU_CACHE_VERSION_MAJOR)
> +MENU_CACHE_DEPENDENCIES = libfm-extra libglib2
> +MENU_CACHE_LICENSE = LGPLv2.1
> +MENU_CACHE_LICENSE_FILES = COPYING
> +MENU_CACHE_INSTALL_STAGING = YES
> +
> +$(eval $(autotools-package))
> -- 
> 1.7.1
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
