From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 13 Apr 2019 22:46:08 +0200
Subject: [Buildroot] [PATCH 1/2] package/libhtp: new package
In-Reply-To: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
References: <20190314212600.20918-1-fontaine.fabrice@gmail.com>
Message-ID: <20190413224608.770dd966@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fabrice,

On Thu, 14 Mar 2019 22:25:59 +0100
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> +LIBHTP_VERSION = 0.5.30
> +LIBHTP_SITE = $(call github,OISF,libhtp,$(LIBHTP_VERSION))
> +LIBHTP_LICENSE = BSD-3-Clause
> +LIBHTP_LICENSE_FILES = LICENSE 

There was a trailing white space on this line.

> +LIBHTP_DEPENDENCIES = \
> +	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
> +	zlib
> +LIBHTP_INSTALL_STAGING = YES
> +# From git
> +LIBHTP_AUTORECONF = YES
> +
> +LIBHTP_CONF_ENV = NO_STACK_PROTECTOR=$(if $(BR2_TOOLCHAIN_HAS_SSP),no,true)

I changed to:

LIBHTP_CONF_ENV = NO_STACK_PROTECTOR=true

indeed, our policy is that we prefer to have our gcc/wrapper handle SSP
support by passing the appropriate flags.

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
