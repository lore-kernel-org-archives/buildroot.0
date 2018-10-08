From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 16:54:26 +0200
Subject: [Buildroot] [PATCH 20/20] perl-plack: new package
In-Reply-To: <20181006165524.23778-21-francois.perrad@gadz.org>
References: <20181006165524.23778-1-francois.perrad@gadz.org>
 <20181006165524.23778-21-francois.perrad@gadz.org>
Message-ID: <20181008165426.53df6f26@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Fran?ois,

On Sat,  6 Oct 2018 18:55:24 +0200, Francois Perrad wrote:

> +PERL_PLACK_VERSION = 1.0047
> +PERL_PLACK_SOURCE = Plack-$(PERL_PLACK_VERSION).tar.gz
> +PERL_PLACK_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MI/MIYAGAWA
> +PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install perl-apache-logformat-compiler perl-cookie-baker perl-devel-stacktrace perl-devel-stacktrace-ashtml perl-file-sharedir perl
-filesys-notify-simple perl-http-entity-parser perl-http-headers-fast perl-http-message perl-hash-multivalue perl-stream-buffered perl-try-tiny perl-uri perl-www-form-urlencoded

Here as well, this line was too long, so I wrapped it, and applied.

However, I am still worried that those may be unnecessary build time
dependencies. I just did a build with:

PERL_PLACK_DEPENDENCIES = host-perl-file-sharedir-install

and then ran "make perl-plack", which means that only perl-plack and
its dependencies were built, and it built just fine.

So to me, it seems like a lot of those build time dependencies on
target packages are useless. Could you check this, and if that's true,
send patches to remove them ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
