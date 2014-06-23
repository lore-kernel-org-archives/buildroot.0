From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Mon, 23 Jun 2014 19:29:09 +0200
Subject: [Buildroot] [PATCH] package/perl-mojolicious: bump to 5.08
In-Reply-To: <1403471757-19622-1-git-send-email-yann.morin.1998@free.fr>
References: <1403471757-19622-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <CAB0FRstxBpfBcoyojk3j_fPhJdaVfRz2gOZXWdiCGdBviF16TQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-06-22 23:15 GMT+02:00 Yann E. MORIN <yann.morin.1998@free.fr>:
> From: "Yann E. MORIN" <yann.morin.1998@free.fr>
>
> Since CPAN only ever keeps the latest version for download, CPAN now has
> only 5.08, so us packaging the 5.07 is causing autobuild failures
>     http://autobuild.buildroot.net/results/358/358f531f2db90b9bc3b1e4e2158c68d2bf6587fc/
>
> Bump to the latest version.

The author of Mojolicious remove very quickly older versions from
CPAN. It is not a usual policy.
So, I think that the best way for this module is to move to Backpan
site which contains all releases.

PERL_MOJOLICIOUS_SITE = http://backpan.perl.org/authors/id/S/SR/SRI/

Fran?ois

>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Francois Perrad <fperrad@gmail.com>
> ---
>  package/perl-mojolicious/perl-mojolicious.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/perl-mojolicious/perl-mojolicious.mk b/package/perl-mojolicious/perl-mojolicious.mk
> index 2c713e6..b7c33ac 100644
> --- a/package/perl-mojolicious/perl-mojolicious.mk
> +++ b/package/perl-mojolicious/perl-mojolicious.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -PERL_MOJOLICIOUS_VERSION = 5.07
> +PERL_MOJOLICIOUS_VERSION = 5.08
>  PERL_MOJOLICIOUS_SOURCE = Mojolicious-$(PERL_MOJOLICIOUS_VERSION).tar.gz
>  PERL_MOJOLICIOUS_SITE = $(BR2_CPAN_MIRROR)/authors/id/S/SR/SRI/
>  PERL_MOJOLICIOUS_DEPENDENCIES = perl
> --
> 1.8.3.2
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
