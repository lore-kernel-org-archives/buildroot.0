From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 23 Jul 2015 22:39:22 +0200
Subject: [Buildroot] [PATCH 03/15] perl-file-listing: fix dependencies
In-Reply-To: <1437670050-27014-3-git-send-email-francois.perrad@gadz.org>
References: <1437670050-27014-1-git-send-email-francois.perrad@gadz.org>
 <1437670050-27014-3-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150723223922.221466c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

On Thu, 23 Jul 2015 18:47:18 +0200, Francois Perrad wrote:

>  PERL_FILE_LISTING_VERSION = 6.04
>  PERL_FILE_LISTING_SOURCE = File-Listing-$(PERL_FILE_LISTING_VERSION).tar.gz
>  PERL_FILE_LISTING_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
> -PERL_FILE_LISTING_DEPENDENCIES = perl-http-date
> +PERL_FILE_LISTING_DEPENDENCIES = perl perl-http-date

Why isn't the perl-package infrastructure automatically adding "perl"
to the dependencies of perl modules, just like the python
infrastructure is doing for python module?

Is there any usefulness in installing perl modules on the target, but
not having the perl interpreter?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
