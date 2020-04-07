From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 7 Apr 2020 08:04:33 +0200
Subject: [Buildroot] [PATCH] package/libminizip: new package
In-Reply-To: <20200406183559.130627-1-b.bilas@grinn-global.com>
References: <20200406183559.130627-1-b.bilas@grinn-global.com>
Message-ID: <20200407060433.GA22325@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bartosz, All,

On 2020-04-06 20:35 +0200, Bartosz Bilas spake thusly:
> libminizip is a minimalistic library that supports compressing,
> extracting, viewing, and manipulating zip files.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>

How is it different from package/minizip/ ?

I've marked as "not applicable", then.

Regards,
Yann E. MORIN.

> ---
>  DEVELOPERS                         |  1 +
>  package/Config.in                  |  1 +
>  package/libminizip/Config.in       | 11 +++++++++++
>  package/libminizip/libminizip.hash |  2 ++
>  package/libminizip/libminizip.mk   | 15 +++++++++++++++
>  5 files changed, 30 insertions(+)
>  create mode 100644 package/libminizip/Config.in
>  create mode 100644 package/libminizip/libminizip.hash
>  create mode 100644 package/libminizip/libminizip.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index e9ac2b7460..b6243276a3 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -282,6 +282,7 @@ F:	package/orbit/
>  N:	Bartosz Bilas <b.bilas@grinn-global.com>
>  F:	board/stmicroelectronics/stm32mp157a-dk1/
>  F:	configs/stm32mp157a_dk1_defconfig
> +F:	package/libminizip/
>  F:	package/python-esptool/
>  F:	package/python-pyaes/
>  F:	package/qt5/qt5scxml/
> diff --git a/package/Config.in b/package/Config.in
> index 373868ca82..95727396ea 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -1278,6 +1278,7 @@ endmenu
>  
>  menu "Compression and decompression"
>  	source "package/libarchive/Config.in"
> +	source "package/libminizip/Config.in"
>  	source "package/libmspack/Config.in"
>  	source "package/libsquish/Config.in"
>  	source "package/libzip/Config.in"
> diff --git a/package/libminizip/Config.in b/package/libminizip/Config.in
> new file mode 100644
> index 0000000000..5307db3c4f
> --- /dev/null
> +++ b/package/libminizip/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_LIBMINIZIP
> +	bool "libminizip"
> +	select BR2_PACKAGE_ZLIB
> +	help
> +	  LibMinizip is a minimalistic library that supports compressing,
> +	  extracting, viewing, and manipulating zip files.
> +
> +	  This package includes development support files
> +	  for the minizip library.
> +
> +	  http://www.winimage.com/zLibDll/minizip.html
> diff --git a/package/libminizip/libminizip.hash b/package/libminizip/libminizip.hash
> new file mode 100644
> index 0000000000..1aa87a2901
> --- /dev/null
> +++ b/package/libminizip/libminizip.hash
> @@ -0,0 +1,2 @@
> +# Locally computed
> +sha256  78d87c463dd6bd446292fe0d3ee72878355b3b7fa52add5722671dfe9290f262  libminizip-1.1.tar.gz
> diff --git a/package/libminizip/libminizip.mk b/package/libminizip/libminizip.mk
> new file mode 100644
> index 0000000000..6ae3c6cb01
> --- /dev/null
> +++ b/package/libminizip/libminizip.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# libminizip
> +#
> +################################################################################
> +
> +LIBMINIZIP_VERSION = 1.1
> +LIBMINIZIP_SITE = $(call github,nmoinvaz,minizip,$(LIBMINIZIP_VERSION))
> +LIBMINIZIP_DEPENDENCIES = zlib
> +LIBMINIZIP_AUTORECONF = YES
> +LIBMINIZIP_INSTALL_STAGING = YES
> +LIBMINIZIP_LICENSE = Zlib
> +LIBMINIZIP_LICENSE_FILES = LICENSE
> +
> +$(eval $(autotools-package))
> -- 
> 2.26.0
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
