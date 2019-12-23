From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 23 Dec 2019 07:51:02 +0200
Subject: [Buildroot] [PATCH] [PATCH] package/tio: new package
In-Reply-To: <20191222221203.1990-1-sergio.prado@e-labworks.com>
References: <20191222221203.1990-1-sergio.prado@e-labworks.com>
Message-ID: <20191223055102.lfw56utpgqalw2we@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Sergio,

On Sun, Dec 22, 2019 at 07:12:03PM -0300, Sergio Prado wrote:
> "tio" is a simple TTY terminal application which features a
> straightforward commandline interface to easily connect to
> TTY devices for basic input/output.
> 
> Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
> ---
>  DEVELOPERS            |  1 +
>  package/Config.in     |  1 +
>  package/tio/Config.in |  8 ++++++++
>  package/tio/tio.hash  |  5 +++++
>  package/tio/tio.mk    | 13 +++++++++++++
>  5 files changed, 28 insertions(+)
>  create mode 100644 package/tio/Config.in
>  create mode 100644 package/tio/tio.hash
>  create mode 100644 package/tio/tio.mk
> 
> diff --git a/DEVELOPERS b/DEVELOPERS
> index d2089e2672ce..d66f9a3bdd25 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -2213,6 +2213,7 @@ F:	package/libgdiplus/
>  F:	package/pimd/
>  F:	package/snort/
>  F:	package/stella/
> +F:	package/tio/
>  F:	package/traceroute/
>  F:	package/tunctl/
>  F:	package/ubus/
> diff --git a/package/Config.in b/package/Config.in
> index 2bfec097025c..3acc93620910 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -546,6 +546,7 @@ endmenu
>  	source "package/ti-sgx-um/Config.in"
>  	source "package/ti-uim/Config.in"
>  	source "package/ti-utils/Config.in"
> +	source "package/tio/Config.in"
>  	source "package/triggerhappy/Config.in"
>  	source "package/uboot-tools/Config.in"
>  	source "package/ubus/Config.in"
> diff --git a/package/tio/Config.in b/package/tio/Config.in
> new file mode 100644
> index 000000000000..6c748c5d12a1
> --- /dev/null
> +++ b/package/tio/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_TIO
> +	bool "tio"
> +	help
> +	  "tio" is a simple TTY terminal application which features a
> +	  straightforward commandline interface to easily connect to
> +	  TTY devices for basic input/output.
> +
> +	  https://tio.github.io/
> diff --git a/package/tio/tio.hash b/package/tio/tio.hash
> new file mode 100644
> index 000000000000..3053bd1bf085
> --- /dev/null
> +++ b/package/tio/tio.hash
> @@ -0,0 +1,5 @@
> +# Locally computed:
> +sha256 a8f5ed6994cacb96780baa416b19e5a6d7d67e8c162a8ea4fd9eccd64984ae44  tio-1.32.tar.xz
> +
> +# Hash for license files:
> +sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/tio/tio.mk b/package/tio/tio.mk
> new file mode 100644
> index 000000000000..dcddea7fd9b9
> --- /dev/null
> +++ b/package/tio/tio.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# tio
> +#
> +################################################################################
> +
> +TIO_VERSION = 1.32
> +TIO_SOURCE = tio-$(TIO_VERSION).tar.xz
> +TIO_SITE = https://github.com/tio/tio/releases/download/v$(TIO_VERSION)
> +TIO_LICENSE = GPLv2

The LICENSE file has the "or any later version" language. Also, we prefer the 
SPDX license identifiers. So "GPL-2.0+".

> +TIO_LICENSE_FILES = COPYING

Should also add "LICENSE".

> +$(eval $(autotools-package))

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
