From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 12 Mar 2012 08:46:45 +0100
Subject: [Buildroot] [PATCH 2/3] libxml-parser-perl: add missing dep and
 drop wrong paths
In-Reply-To: <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
References: <1331517531-2291-1-git-send-email-gustavo@zacarias.com.ar>
 <1331517531-2291-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20120312084645.17cea210@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le Sun, 11 Mar 2012 22:58:50 -0300,
Gustavo Zacarias <gustavo@zacarias.com.ar> a ?crit :

> -LIBXML_PARSER_PERL_DEPENDENCIES = expat
> +LIBXML_PARSER_PERL_VERSION = 2.36
> +LIBXML_PARSER_PERL_SOURCE =
> XML-Parser-$(LIBXML_PARSER_PERL_VERSION).tar.gz
> +LIBXML_PARSER_PERL_SITE = http://www.cpan.org/modules/by-module/XML/
> +LIBXML_PARSER_PERL_DEPENDENCIES = expat host-microperl 
>  define HOST_LIBXML_PARSER_PERL_CONFIGURE_CMDS
>   (cd $(@D) ; \
> -   perl Makefile.PL \
> +   $(HOST_DIR)/usr/bin/perl Makefile.PL \

Unless there is a strong reason to do, I would prefer this change not
to go in. Buildroot has Perl amongst its mandatory dependencies
(see support/dependencies/dependencies.sh), so I'd prefer if we used
the Perl interpreter available on the host machine rather than building
our own. This will add quite a bit of build time, that apparently we
can avoid since we have been doing that for quite some time now.

Is there a good reason to switch to our own Perl built for the host?

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
