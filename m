From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 14 Jul 2020 15:36:57 +0200
Subject: [Buildroot] [PATCH v2] package/openal: bump to version 1.20.1
In-Reply-To: <20200412134900.14298-1-nerv@dawncrow.de>
References: <20200412134900.14298-1-nerv@dawncrow.de>
Message-ID: <20200714153657.76d86234@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, 12 Apr 2020 15:49:00 +0200
Andr? Hentschel <nerv@dawncrow.de> wrote:

> -OPENAL_VERSION = 1.19.1
> +OPENAL_VERSION = 1.20.1
>  OPENAL_SITE = $(call github,kcat,openal-soft,openal-soft-$(OPENAL_VERSION))
>  OPENAL_LICENSE = LGPL-2.0+
>  OPENAL_LICENSE_FILES = COPYING
> diff --git a/package/solarus/Config.in b/package/solarus/Config.in
> index 6bed38a6f5..851e54920c 100644
> --- a/package/solarus/Config.in
> +++ b/package/solarus/Config.in
> @@ -3,7 +3,7 @@ config BR2_PACKAGE_SOLARUS
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
>  	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS
> -	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
> +	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14

A question is why is this being changed? When I read
https://openal-soft.org/, it says:

""
The changes from 1.19.1 include:

    Converted the library codebase to C++11.
""

so they just moved to C++11, not C++14, at least according to this
change log.

Could you explain what prompted you to update the gcc requirement to
5.x, so that at least the commit log can be extended a bit ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
