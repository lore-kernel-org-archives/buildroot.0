From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 6 Jul 2020 09:36:46 +0200
Subject: [Buildroot] [PATCH] package/bitwise: add package
In-Reply-To: <20200706041904.1518500-1-rfried.dev@gmail.com>
References: <20200706041904.1518500-1-rfried.dev@gmail.com>
Message-ID: <20200706093646.00e954e9@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for your contribution! The commit title should be
"package/bitwise: new package".

On Mon,  6 Jul 2020 07:19:04 +0300
Ramon Fried <rfried.dev@gmail.com> wrote:

> Bitwise is multi base interactive calculator supporting dynamic
> base conversion and bit manipulation.
> It's a handy tool for low level hackers,
> kernel developers and device drivers developers.
> 
> Signed-off-by: Ramon Fried <rfried.dev@gmail.com>
> ---
>  package/Config.in            |  1 +
>  package/bitwise/Config.in    | 10 ++++++++++
>  package/bitwise/bitwise.hash |  1 +
>  package/bitwise/bitwise.mk   | 12 ++++++++++++
>  4 files changed, 24 insertions(+)

You need to update the DEVELOPERS file.


> diff --git a/package/bitwise/Config.in b/package/bitwise/Config.in
> new file mode 100644
> index 0000000000..07e6580d14
> --- /dev/null
> +++ b/package/bitwise/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_BITWISE
> +	bool "bitwise"
> +	select BR2_PACKAGE_NCURSES
> +	select BR2_PACKAGE_READLINE
> +	help
> +	  Bitwise is multi base interactive calculator supporting dynamic base
> +	  conversion and bit manipulation. It's a handy tool for low level hackers,
> +	  kernel developers and device drivers developers.

I think some of those lines are too long. Could you run "make
check-package" ?

> diff --git a/package/bitwise/bitwise.hash b/package/bitwise/bitwise.hash
> new file mode 100644
> index 0000000000..35a1109b93
> --- /dev/null
> +++ b/package/bitwise/bitwise.hash
> @@ -0,0 +1 @@
> +sha256 33ce934fb99dadf7652224152cc135a0abf6a211adde53d96e9be7067567749c  bitwise-v0.41.tar.gz
> diff --git a/package/bitwise/bitwise.mk b/package/bitwise/bitwise.mk
> new file mode 100644
> index 0000000000..2bc21da4b2
> --- /dev/null
> +++ b/package/bitwise/bitwise.mk
> @@ -0,0 +1,12 @@
> +#
> +# bitwise
> +#
> +################################################################################

The comment header is not complete, the first line full of #### is
missing.

> +BITWISE_VERSION = v0.41

This should be just 0.41

> +BITWISE_SITE = https://github.com/mellowcandle/bitwise/releases/download/$(BITWISE_VERSION)
> +BITWISE_SOURCE = bitwise-$(BITWISE_VERSION).tar.gz

So this should be:

BITWISE_SOURCE = bitwise-v$(BITWISE_VERSION).tar.gz

> +BITWISE_DEPENDENCIES= ncurses readline

Space before =. This is reported by "make check-package" as well I
believe.

> +BITWISE_LICENSE = GPL-2.0
> +BITWISE_LICENSE_FILES = COPYING

We need an empty line before the eval autotools-package line.

> +$(eval $(autotools-package))

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
