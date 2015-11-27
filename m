From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 27 Nov 2015 23:45:49 +0100
Subject: [Buildroot] [PATCH 2/2] unzip: new package
In-Reply-To: <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
References: <1448645881-32202-1-git-send-email-luca@lucaceresoli.net>
 <1448645881-32202-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <5658DD1D.6060506@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Luca, all

Le 27/11/2015 18:38, Luca Ceresoli a ?crit :
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Romain Naour <romain.naour@openwide.fr>
> Cc: Jan Pedersen <jp@jp-embedded.com>
> ---
>  package/Config.in                                  |  1 +
>  ...a-CMakeFile.txt-to-ease-cross-compilation.patch | 53 ++++++++++++++++++++++
>  package/unzip/Config.in                            | 11 +++++
>  package/unzip/unzip.hash                           |  2 +
>  package/unzip/unzip.mk                             | 13 ++++++
>  5 files changed, 80 insertions(+)
>  create mode 100644 package/unzip/0001-Add-a-CMakeFile.txt-to-ease-cross-compilation.patch
>  create mode 100644 package/unzip/Config.in
>  create mode 100644 package/unzip/unzip.hash
>  create mode 100644 package/unzip/unzip.mk
> 

[snip]

> diff --git a/package/unzip/Config.in b/package/unzip/Config.in
> new file mode 100644
> index 0000000..0d98d28
> --- /dev/null
> +++ b/package/unzip/Config.in
> @@ -0,0 +1,11 @@
> +config BR2_PACKAGE_UNZIP
> +	bool "unzip"

Have you checked some toolchain dependencies ?
It seems that process.c use wchar_t so "depends on BR2_USE_WCHAR" is needed.

Also, I checked if unzip build correctly with a musl and uClibc-ng toolchains.

Best regards,
Romain

> +	help
> +	  UnZip is an extraction utility for archives compressed in
> +	  .zip format (also called "zipfiles"). Although highly
> +	  compatible both with PKWARE's PKZIP and PKUNZIP utilities
> +	  for MS-DOS and with Info-ZIP's own Zip program, our primary
> +	  objectives have been portability and non-MSDOS
> +	  functionality.
> +
> +	  http://www.info-zip.org/UnZip.html
> diff --git a/package/unzip/unzip.hash b/package/unzip/unzip.hash
> new file mode 100644
> index 0000000..a138cc2
> --- /dev/null
> +++ b/package/unzip/unzip.hash
> @@ -0,0 +1,2 @@
> +# Locally computed:
> +sha256 036d96991646d0449ed0aa952e4fbe21b476ce994abc276e49d30e686708bd37 unzip60.tgz
> diff --git a/package/unzip/unzip.mk b/package/unzip/unzip.mk
> new file mode 100644
> index 0000000..cff5951
> --- /dev/null
> +++ b/package/unzip/unzip.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# unzip
> +#
> +################################################################################
> +
> +UNZIP_VERSION = 60
> +UNZIP_SOURCE = unzip$(UNZIP_VERSION).tgz
> +UNZIP_SITE = ftp://ftp.info-zip.org/pub/infozip/src
> +UNZIP_LICENSE = Info-ZIP
> +UNZIP_LICENSE_FILES = LICENSE
> +
> +$(eval $(cmake-package))
> 

-- 
Romain Naour

OPEN WIDE Ing?nierie - Paris
23/25, rue Daviel| 75013 PARIS
http://ingenierie.openwide.fr

Le blog des technologies libres et embarqu?es :
http://www.linuxembedded.fr
