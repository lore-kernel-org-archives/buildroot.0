From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 08:19:14 +0200
Subject: [Buildroot] [PATCH 03/18] perl-data-dump: new package
In-Reply-To: <20180820115519.24046-4-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-4-chrismcc@gmail.com>
Message-ID: <CAGhdn578SxTRD7_NRw2SZqm7Scc28zrJ4GYdVeHAtmL_GRt+9g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-20 13:55 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> ---
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/perl-data-dump/Config.in           |  6 ++++++
>  package/perl-data-dump/perl-data-dump.hash |  6 ++++++
>  package/perl-data-dump/perl-data-dump.mk   | 13 +++++++++++++
>  5 files changed, 27 insertions(+)
>  create mode 100644 package/perl-data-dump/Config.in
>  create mode 100644 package/perl-data-dump/perl-data-dump.hash
>  create mode 100644 package/perl-data-dump/perl-data-dump.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 75237eae3b..023bddbce0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -486,6 +486,7 @@ F:  package/perl-appconfig/
>  F:     package/perl-astro-suntime/
>  F:     package/perl-class-std/
>  F:     package/perl-class-std-fast/
> +F:     package/perl-data-dump/
>  F:     package/perl-data-optlist/
>  F:     package/perl-data-uuid/
>  F:     package/perl-date-manip/
> diff --git a/package/Config.in b/package/Config.in
> index b6e739dade..f412ff673b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -674,6 +674,7 @@ menu "Perl libraries/modules"
>         source "package/perl-crypt-cbc/Config.in"
>         source "package/perl-crypt-openssl-random/Config.in"
>         source "package/perl-crypt-openssl-rsa/Config.in"
> +       source "package/perl-data-dump/Config.in"
>         source "package/perl-data-optlist/Config.in"
>         source "package/perl-data-uuid/Config.in"
>         source "package/perl-date-manip/Config.in"
> diff --git a/package/perl-data-dump/Config.in b/package/perl-data-dump/
> Config.in
> new file mode 100644
> index 0000000000..a44291baae
> --- /dev/null
> +++ b/package/perl-data-dump/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PERL_DATA_DUMP
> +       bool "perl-data-dump"
> +       help
> +         Pretty printing of data structures
> +
> +         https://metacpan.org/release/Data-Dump
> diff --git a/package/perl-data-dump/perl-data-dump.hash
> b/package/perl-data-dump/perl-data-dump.hash
> new file mode 100644
> index 0000000000..87850326de
> --- /dev/null
> +++ b/package/perl-data-dump/perl-data-dump.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    762c111e525c82ff23d62c90821b26e9 Data-Dump-1.23.tar.gz
> +sha256 af53b05ef1387b4cab4427e6789179283e4f0da8cf036e8db516ddb344512b65
> Data-Dump-1.23.tar.gz
> +
> +# computed by scancpan
> +sha256 31d1b6482bcc3db87a38ad02065554f9d3bc13321d4ef8e96042464045e2abcf
> README
> diff --git a/package/perl-data-dump/perl-data-dump.mk
> b/package/perl-data-dump/perl-data-dump.mk
> new file mode 100644
> index 0000000000..7c5d46e08e
> --- /dev/null
> +++ b/package/perl-data-dump/perl-data-dump.mk
> @@ -0,0 +1,13 @@
> +###########################################################
> #####################
> +#
> +# perl-data-dump
> +#
> +###########################################################
> #####################
> +
> +PERL_DATA_DUMP_VERSION = 1.23
> +PERL_DATA_DUMP_SOURCE = Data-Dump-$(PERL_DATA_DUMP_VERSION).tar.gz
> +PERL_DATA_DUMP_SITE = $(BR2_CPAN_MIRROR)/authors/id/G/GA/GAAS
> +PERL_DATA_DUMP_LICENSE = Artistic or GPL-1.0+
> +PERL_DATA_DUMP_LICENSE_FILES = README
> +
> +$(eval $(perl-package))
> --
> 2.14.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/fba67f91/attachment.html>
