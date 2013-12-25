From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 25 Dec 2013 17:34:55 +0100
Subject: [Buildroot] [PATCH] fio: new package
In-Reply-To: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
References: <1383146545-9594-1-git-send-email-ezequiel.garcia@free-electrons.com>
Message-ID: <20131225173455.0c413356@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Ezequiel Garcia,

On Wed, 30 Oct 2013 12:22:25 -0300, Ezequiel Garcia wrote:
> Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
> ---
>  package/Config.in     |  1 +
>  package/fio/Config.in |  6 ++++++
>  package/fio/fio.mk    | 25 +++++++++++++++++++++++++
>  3 files changed, 32 insertions(+)
>  create mode 100644 package/fio/Config.in
>  create mode 100644 package/fio/fio.mk

Thanks, I've applied this, after making several changes.

> 
> diff --git a/package/Config.in b/package/Config.in
> index 4c4da51..7cb46aa 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -47,6 +47,7 @@ source "package/dmalloc/Config.in"
>  source "package/dropwatch/Config.in"
>  source "package/dstat/Config.in"
>  source "package/duma/Config.in"
> +source "package/fio/Config.in"
>  source "package/gdb/Config.in"
>  source "package/iozone/Config.in"
>  source "package/kexec/Config.in"
> diff --git a/package/fio/Config.in b/package/fio/Config.in
> new file mode 100644
> index 0000000..263e7f5
> --- /dev/null
> +++ b/package/fio/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_FIO
> +	bool "fio"
> +	depends on BR2_USE_MMU # fork()

The package required largefile and thread support.

> +	help
> +	  fio is an I/O tool meant to be used both for benchmark
> +	  and stress/hardware verification.

I've added an upstream URL here.

> diff --git a/package/fio/fio.mk b/package/fio/fio.mk
> new file mode 100644
> index 0000000..60cd14f
> --- /dev/null
> +++ b/package/fio/fio.mk
> @@ -0,0 +1,25 @@
> +################################################################################
> +#
> +# fio
> +#
> +################################################################################
> +
> +FIO_VERSION = 2.1.3
> +FIO_SITE = $(BR2_DEBIAN_MIRROR)/debian/pool/main/f/fio
> +FIO_SOURCE = fio_$(FIO_VERSION).orig.tar.gz

I've switched to use the official Git repository at git.kernel.dk, and
used the new 2.1.4 version.

> +FIO_LICENSE = GPLv2

I've changed that to "GPLv2 + special obligations", because the LICENSE
file makes additional requirements to the GPLv2.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
