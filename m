From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 22 Oct 2019 09:13:53 +0200
Subject: [Buildroot] [PATCH v4 2/2] package/rng-tools: bump to 6.7
In-Reply-To: <20191021213839.46139-2-matthew.weber@rockwellcollins.com>
References: <20191021213839.46139-1-matthew.weber@rockwellcollins.com>
 <20191021213839.46139-2-matthew.weber@rockwellcollins.com>
Message-ID: <20191022091353.3ae0fd9e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon, 21 Oct 2019 16:38:39 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index b00477d336..18521bdd90 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -4,6 +4,8 @@ config BR2_PACKAGE_RNG_TOOLS
>  	select BR2_PACKAGE_ARGP_STANDALONE if BR2_TOOLCHAIN_USES_UCLIBC || BR2_TOOLCHAIN_USES_MUSL
>  	# For rdrand ligcrypt is required and it's not obvious to users
>  	select BR2_PACKAGE_LIBGCRYPT if BR2_i386 || BR2_x86_64
> +	select BR2_PACKAGE_LIBSYSFS
> +	select BR2_PACKAGE_JITTERENTROPY_LIBRARY

Alphabetic ordering.

> diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/rng-tools.mk
> index bbb1a64c15..1e8092be38 100644
> --- a/package/rng-tools/rng-tools.mk
> +++ b/package/rng-tools/rng-tools.mk
> @@ -4,10 +4,18 @@
>  #
>  ################################################################################
>  
> -RNG_TOOLS_VERSION = 5
> -RNG_TOOLS_SITE = http://downloads.sourceforge.net/project/gkernel/rng-tools/$(RNG_TOOLS_VERSION)
> +RNG_TOOLS_VERSION = 6.7
> +RNG_TOOLS_SITE = $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
>  RNG_TOOLS_LICENSE = GPL-2.0
>  RNG_TOOLS_LICENSE_FILES = COPYING
> +RNG_TOOLS_DEPENDENCIES = libsysfs jitterentropy-library host-automake \
> +			host-autoconf


Please drop the dependencies on host-automake and host-autoconf, they
are not needed as they are automatically added by AUTORECONF = YES.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
