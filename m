From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 14 Mar 2021 13:33:49 +0100
Subject: [Buildroot] [PATCH 1/1] package/libsigc: bump to version 2.10.6
In-Reply-To: <20210311173653.611070-1-fontaine.fabrice@gmail.com>
References: <20210311173653.611070-1-fontaine.fabrice@gmail.com>
Message-ID: <20210314123349.GS2737665@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2021-03-11 18:36 +0100, Fabrice Fontaine spake thusly:
> - Switch to meson-package as configure is not shipped in the official
>   tarball anymore
> - Drop host-m4 dependency (only needed in maintainer mode)
> - Disable examples and XML validation (enabled by default)
> - Drop LIBSIGC_INSTALL_TARGET_FIXUP as documentation is disabled by
>   default
> - Update web page in Config.in
> - Update indentation in hash file (two spaces)
> 
> https://github.com/libsigcplusplus/libsigcplusplus/blob/2.10.6/NEWS
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libsigc/Config.in    |  2 +-
>  package/libsigc/libsigc.hash |  6 +++---
>  package/libsigc/libsigc.mk   | 14 +++++---------
>  3 files changed, 9 insertions(+), 13 deletions(-)
> 
> diff --git a/package/libsigc/Config.in b/package/libsigc/Config.in
> index 4bd762efce..e5157e87b4 100644
> --- a/package/libsigc/Config.in
> +++ b/package/libsigc/Config.in
> @@ -8,7 +8,7 @@ config BR2_PACKAGE_LIBSIGC
>  	  signals to any callback function, either global or a member
>  	  function, regardless of whether it is static or virtual.
>  
> -	  http://libsigc.sourceforge.net/
> +	  https://libsigcplusplus.github.io/libsigcplusplus/
>  
>  comment "libsigc++ needs a toolchain w/ C++, gcc >= 4.8"
>  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
> diff --git a/package/libsigc/libsigc.hash b/package/libsigc/libsigc.hash
> index bc3880f7c3..d631185a41 100644
> --- a/package/libsigc/libsigc.hash
> +++ b/package/libsigc/libsigc.hash
> @@ -1,5 +1,5 @@
> -# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.0.sha256sum
> -sha256	f843d6346260bfcb4426259e314512b99e296e8ca241d771d21ac64f28298d81	libsigc++-2.10.0.tar.xz
> +# From http://ftp.gnome.org/pub/gnome/sources/libsigc++/2.10/libsigc++-2.10.6.sha256sum
> +sha256  dda176dc4681bda9d5a2ac1bc55273bdd381662b7a6d49e918267d13e8774e1b  libsigc++-2.10.6.tar.xz
>  
>  # Locally calculated
> -sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING
> +sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING
> diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
> index d7cbd36da8..6539fdbdb6 100644
> --- a/package/libsigc/libsigc.mk
> +++ b/package/libsigc/libsigc.mk
> @@ -5,18 +5,14 @@
>  ################################################################################
>  
>  LIBSIGC_VERSION_MAJOR = 2.10
> -LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).0
> +LIBSIGC_VERSION = $(LIBSIGC_VERSION_MAJOR).6
>  LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.xz
>  LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/$(LIBSIGC_VERSION_MAJOR)
> -LIBSIGC_DEPENDENCIES = host-m4
>  LIBSIGC_INSTALL_STAGING = YES
>  LIBSIGC_LICENSE = LGPL-2.1+
>  LIBSIGC_LICENSE_FILES = COPYING
> +LIBSIGC_CONF_OPTS = \
> +	-Dbuild-examples=false \
> +	-Dvalidation=false
>  
> -define LIBSIGC_INSTALL_TARGET_FIXUP
> -	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*
> -endef
> -
> -LIBSIGC_POST_INSTALL_TARGET_HOOKS += LIBSIGC_INSTALL_TARGET_FIXUP
> -
> -$(eval $(autotools-package))
> +$(eval $(meson-package))
> -- 
> 2.30.0
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
