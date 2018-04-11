From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Apr 2018 15:54:31 +0200
Subject: [Buildroot] [PATCH 1/1] adding new package: reaver
In-Reply-To: <1523451771-29353-1-git-send-email-guillaume.bressaix@gmail.com>
References: <1523451771-29353-1-git-send-email-guillaume.bressaix@gmail.com>
Message-ID: <20180411155431.305335a9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this contribution. See below for some comments.

First, the commit title should be "reaver: new package"

On Wed, 11 Apr 2018 15:02:51 +0200, Guillaume W. Bres wrote:
> Generic autotools package, easy to cross-compile but it is mandatory
> to use the t6x github fork (latest Makefiles set).

What is the "t6x github fork" ?

>  package/Config.in        |  1 +
>  package/reaver/Config.in |  8 ++++++++
>  package/reaver/reaver.mk | 15 +++++++++++++++

Addition of an entry in the DEVELOPERS file is missing, and also the
hash file is missing. Could you add these ?

> diff --git a/package/reaver/Config.in b/package/reaver/Config.in
> new file mode 100644
> index 0000000..703fa28
> --- /dev/null
> +++ b/package/reaver/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_REAVER
> +	bool "reaver"
> +	

Unneeded empty new line.

> +	select BR2_PACKAGE_LIBPCAP
> +

Ditto.

Also, could you test your package with ./utils/test-pkg, to make sure
it builds properly with some basic toolchain configurations ?

> +	help
> +		Reaver performs brute force attacks against WPS pin numbers.
> +		It is recommended to use "Aircrack-ng" along reaver, but not necessary.

Lines are too long, they should be wrapped at 72 characters. If you
run ./utils/check-package package/reaver/* you will see a number of
warnings about your package. They should be fixed before submission.

Also, please add the URL of the upstream project in the Config.in help
text. See how it's done in other packages.

> diff --git a/package/reaver/reaver.mk b/package/reaver/reaver.mk
> new file mode 100644
> index 0000000..8e4e3c6
> --- /dev/null
> +++ b/package/reaver/reaver.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# reaver
> +#
> +################################################################################
> +
> +REAVER_VERSION = 9bae55bd30b6d46b42da3a09dc23c8b0f9341996
> +REAVER_SITE = $(call github,t6x,reaver-wps-fork-t6x,$(REAVER_VERSION))
> +REAVER_LICENSE = GPL-2.0+
> +REAVER_LICENSE_FILES = docs/LICENSE
> +
> +REAVER_SUBDIR = src
> +REAVER_INSTALL_TARGET = YES

This last line is not needed.

If you could fix those issues and submit an updated version, it would
be nice. Don't forget to use "git format-patch -v2" for the new
version, and add a changelog of what has been changed.

Thanks!

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
