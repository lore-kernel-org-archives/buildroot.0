From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 7 Apr 2014 23:39:00 +0200
Subject: [Buildroot] [PATCH 1/2] package/libgc: add Boehm-Demers-Weiser
 gc library
In-Reply-To: <1396868422-5757-2-git-send-email-alex.bennee@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
 <1396868422-5757-2-git-send-email-alex.bennee@linaro.org>
Message-ID: <20140407233900.1b7b0e58@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Alex Benn?e,

On Mon,  7 Apr 2014 12:00:21 +0100, Alex Benn?e wrote:

> diff --git a/package/libgc/Config.in b/package/libgc/Config.in
> new file mode 100644
> index 0000000..bac636c
> --- /dev/null
> +++ b/package/libgc/Config.in
> @@ -0,0 +1,9 @@
> +config BR2_PACKAGE_LIBGC
> +	bool "libgc"
> +	help
> +          The Boehm-Demers-Weiser conservative garbage collector can be used
> +          as a garbage collecting replacement for C malloc or C++ new. It allows
> +          you to allocate memory basically as you normally would, without
> +          explicitly deallocating memory that is no longer useful.
> +
> +          http://www.hboehm.info/gc/

Indentation for the help text should be one tab + two spaces.


> +################################################################################
> +#
> +# Boehm-Demers-Weiser's GC

We normally just want the package name here, i.e the same as the
directory name.

> +#
> +################################################################################
> +
> +LIBGC_VERSION = 7.4.0
> +LIBGC_SOURCE = gc-${LIBGC_VERSION}.tar.gz
> +LIBGC_SITE = http://www.hboehm.info/gc/gc_source/
> +LIBGC_EXTRA_DOWNLOADS = libatomic_ops-${LIBGC_VERSION}.tar.gz
> +LIBGC_LICENSE = GPLv1+
> +LIBGC_LICENSE_FILES = COPYING
> +LIBGC_INSTALL_STAGING = YES
> +
> +define LIBGC_POST_EXTRACT_INC_LIBATOMIC
> +	env
> +	mkdir -p $(@D)/libatomic_ops
> +	tar -xvf ${BR2_DL_DIR}/libatomic_ops-${LIBGC_VERSION}.tar.gz --strip-components=1 -C $(@D)/libatomic_ops
> +endef

We have a libatomic_ops package in Buildroot. Wouldn't it be possible
to use it instead?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
