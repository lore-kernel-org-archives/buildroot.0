From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2020 22:32:30 +0200
Subject: [Buildroot] [PATCH 1/1] package/cryptsetup: needs iconv
In-Reply-To: <20200628204808.1229288-1-fontaine.fabrice@gmail.com>
References: <20200628204808.1229288-1-fontaine.fabrice@gmail.com>
Message-ID: <20200629203230.GR20645@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-06-28 22:48 +0200, Fabrice Fontaine spake thusly:
> iconv is a mantadory dependency since version 2.3.0 and
> https://github.com/mbroz/cryptsetup/commit/62c872eb4942ec37a18a37ea7cca1749757ddbb6
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/a13c4b64e8ac673df07d8dc1d33fae42a4f80fff
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/cryptsetup/Config.in     | 1 +
>  package/cryptsetup/cryptsetup.mk | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/package/cryptsetup/Config.in b/package/cryptsetup/Config.in
> index c4281f7e26..d9c9d4d4f4 100644
> --- a/package/cryptsetup/Config.in
> +++ b/package/cryptsetup/Config.in
> @@ -11,6 +11,7 @@ config BR2_PACKAGE_CRYPTSETUP
>  	select BR2_PACKAGE_UTIL_LINUX_LIBBLKID
>  	select BR2_PACKAGE_JSON_C
>  	select BR2_PACKAGE_LIBARGON2
> +	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
>  	help
>  	  This tool helps manipulate dm-crypt and luks partitions for
>  	  on-disk encryption.
> diff --git a/package/cryptsetup/cryptsetup.mk b/package/cryptsetup/cryptsetup.mk
> index 587ef0a810..68cc1543dc 100644
> --- a/package/cryptsetup/cryptsetup.mk
> +++ b/package/cryptsetup/cryptsetup.mk
> @@ -9,6 +9,7 @@ CRYPTSETUP_VERSION = $(CRYPTSETUP_VERSION_MAJOR).3
>  CRYPTSETUP_SOURCE = cryptsetup-$(CRYPTSETUP_VERSION).tar.xz
>  CRYPTSETUP_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/cryptsetup/v$(CRYPTSETUP_VERSION_MAJOR)
>  CRYPTSETUP_DEPENDENCIES = lvm2 popt util-linux host-pkgconf json-c libargon2 \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
>  	$(TARGET_NLS_DEPENDENCIES)
>  CRYPTSETUP_LICENSE = GPL-2.0+ (programs), LGPL-2.1+ (library)
>  CRYPTSETUP_LICENSE_FILES = COPYING COPYING.LGPL
> -- 
> 2.26.2
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
