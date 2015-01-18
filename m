From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Jan 2015 17:17:33 +0100
Subject: [Buildroot] [PATCH 1/2] distcc: remove deprecated package
In-Reply-To: <1421329232-21302-1-git-send-email-gustavo@zacarias.com.ar>
References: <1421329232-21302-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20150118161733.GO4275@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gustavo, All,

On 2015-01-15 10:40 -0300, Gustavo Zacarias spake thusly:
> It's been deprecated since feb 2014 and it'll be a year for the 2015.02
> release so remove it.
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/Config.in        |  3 ---
>  package/distcc/Config.in | 11 -----------
>  package/distcc/distcc.mk | 19 -------------------
>  3 files changed, 33 deletions(-)
>  delete mode 100644 package/distcc/Config.in
>  delete mode 100644 package/distcc/distcc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index b1375ae..eeb363a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -108,9 +108,6 @@ menu "Development tools"
>  	source "package/cvs/Config.in"
>  if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/diffutils/Config.in"
> -endif
> -	source "package/distcc/Config.in"
> -if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	source "package/findutils/Config.in"
>  endif
>  	source "package/flex/Config.in"
> diff --git a/package/distcc/Config.in b/package/distcc/Config.in
> deleted file mode 100644
> index 08e1ab3..0000000
> --- a/package/distcc/Config.in
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -config BR2_PACKAGE_DISTCC
> -	bool "distcc"
> -	# needs fork()
> -	depends on BR2_USE_MMU
> -	depends on BR2_DEPRECATED_SINCE_2014_02
> -	help
> -	  Distributed compiler client and server.  Allows you to
> -	  distribute compilation of C code across several machines
> -	  on a network.
> -
> -	  http://distcc.samba.org/
> diff --git a/package/distcc/distcc.mk b/package/distcc/distcc.mk
> deleted file mode 100644
> index eae5fb8..0000000
> --- a/package/distcc/distcc.mk
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -################################################################################
> -#
> -# distcc
> -#
> -################################################################################
> -
> -DISTCC_VERSION = 2.18.3
> -DISTCC_SOURCE = distcc-$(DISTCC_VERSION).tar.bz2
> -DISTCC_SITE = http://distcc.googlecode.com/files
> -DISTCC_CONF_OPTS = --with-included-popt --without-gtk --without-gnome
> -DISTCC_LICENSE = GPLv2+
> -DISTCC_LICENSE_FILES = COPYING
> -
> -define DISTCC_INSTALL_TARGET_CMDS
> -	$(INSTALL) -D $(@D)/distccd $(TARGET_DIR)/usr/bin/distccd
> -	$(INSTALL) -D $(@D)/distcc $(TARGET_DIR)/usr/bin/distcc
> -endef
> -
> -$(eval $(autotools-package))
> -- 
> 2.0.5
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
