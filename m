From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:39:01 +0200
Subject: [Buildroot] [PATCH 16/20] perl-http-entity-parser: new package
In-Reply-To: <20181006165524.23778-17-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-17-francois.perrad@gadz.org>
Message-ID: <20181008163901.3933d098@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  6 Oct 2018 18:55:20 +0200, Francois Perrad wrote:

> diff --git a/package/perl-http-entity-parser/perl-http-entity-parser.mk b/package/perl-http-entity-parser/perl-http-entity-parser.mk
> new file mode 100644
> index 000000000..1cba1eb8e
> --- /dev/null
> +++ b/package/perl-http-entity-parser/perl-http-entity-parser.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# perl-http-entity-parser
> +#
> +################################################################################
> +
> +PERL_HTTP_ENTITY_PARSER_VERSION = 0.21
> +PERL_HTTP_ENTITY_PARSER_SOURCE = HTTP-Entity-Parser-$(PERL_HTTP_ENTITY_PARSER_VERSION).tar.gz
> +PERL_HTTP_ENTITY_PARSER_SITE = $(BR2_CPAN_MIRROR)/authors/id/K/KA/KAZEBURO
> +PERL_HTTP_ENTITY_PARSER_DEPENDENCIES = host-perl-module-build-tiny perl-http-multipartparser perl-hash-multivalue perl-json-maybexs perl-stream-buffered perl-www-form-urlencoded

This line should be split with backslashes. Perhaps scancpan could be
improved to do that automatically ?

Also, I'm interested in understanding why all those packages need to be
build time dependencies. Is Perl checking at build time that those
modules are available ?

Anyway, I've wrapped the too long line of dependencies, and applied.
Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
