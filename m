From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:51:29 +0200
Subject: [Buildroot] [PATCH 6/8] perl-moo: new package
In-Reply-To: <20181008193646.13046-7-francois.perrad@gadz.org>
References: <20181008193646.13046-1-francois.perrad@gadz.org>
 <20181008193646.13046-7-francois.perrad@gadz.org>
Message-ID: <20181008215129.6ff9da6f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Oct 2018 21:36:44 +0200, Francois Perrad wrote:

> +PERL_MOO_VERSION = 2.003004
> +PERL_MOO_SOURCE = Moo-$(PERL_MOO_VERSION).tar.gz
> +PERL_MOO_SITE = $(BR2_CPAN_MIRROR)/authors/id/H/HA/HAARG
> +PERL_MOO_DEPENDENCIES = \
> +	perl-class-method-modifiers \
> +	perl-devel-globaldestruction \
> +	perl-module-runtime \
> +	perl-role-tiny \
> +	perl-sub-quote

Please remove all those build-time dependencies, and try to build
without them. I.e do a build with BR2_PACKAGE_PERL_MOO enabled, but run
just "make perl-moo". If it works, then those dependencies are only
runtime dependencies, not build time ones.

It is much easier to detect missing build dependencies (thanks to build
testing, either on your side or in the autobuilders) than to detect
extraneous build dependencies and remove them.

So I think scancpan should only add dependencies on host packages
(which are obviously needed at build time) and not add any dependency
on target packages. And then build testing is needed to manually add
the build-time dependencies that are needed, if any.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
