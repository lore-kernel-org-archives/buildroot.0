From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Mar 2020 16:16:05 +0100
Subject: [Buildroot] [PATCH 06/10] package/perl-module-build: bump to
 0.4231
In-Reply-To: <20200311070956.6346-6-francois.perrad@gadz.org>
References: <20200311070956.6346-1-francois.perrad@gadz.org>
 <20200311070956.6346-6-francois.perrad@gadz.org>
Message-ID: <20200315161605.6ede723f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Wed, 11 Mar 2020 08:09:52 +0100
Francois Perrad <fperrad@gmail.com> wrote:

> -PERL_MODULE_BUILD_VERSION = 0.4229
> +PERL_MODULE_BUILD_VERSION = 0.4231
>  PERL_MODULE_BUILD_SOURCE = Module-Build-$(PERL_MODULE_BUILD_VERSION).tar.gz
>  PERL_MODULE_BUILD_SITE = $(BR2_CPAN_MIRROR)/authors/id/L/LE/LEONT
>  PERL_MODULE_BUILD_LICENSE = Artistic or GPL-1.0+
>  PERL_MODULE_BUILD_LICENSE_FILES = LICENSE
>  PERL_MODULE_BUILD_DISTNAME = Module-Build
>  
> +$(eval $(perl-package))

Why are you adding the target variant for this package? It doesn't have
any Config.in option, and as far as I remember, this package is only
needed on the build machine.

Is it just an artifact of running scancpan and not noticing this change ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
