From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Tue, 21 Apr 2015 21:02:53 +0200
Subject: [Buildroot] [PATCH v2 18/25] package/perl-libwww: New package
In-Reply-To: <1429438640-9367-19-git-send-email-bernd.kuhls@t-online.de>
References: <1429438640-9367-1-git-send-email-bernd.kuhls@t-online.de>
 <1429438640-9367-19-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAB0FRsuSrY6A8Tfh=sJxUXwUd=Z8hONdJrPdwC28qJiVedVpcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

This Perl module has a silly name, on CPAN, you could find it as
'libwww-perl' distribution (see
http://search.cpan.org/search?query=libwww-perl&mode=dist)

If you run `support/script/scancpan -f libwww-perl`, you obtain the
correct BR package perl-libwww-perl, with these values:
PERL_LIBWWW_PERL_VERSION = 6.13
PERL_LIBWWW_PERL_SOURCE = libwww-perl-$(PERL_LIBWWW_PERL_VERSION).tar.gz
PERL_LIBWWW_PERL_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
so, without github/hash problem.

Please, remove perl-libwww and replace it by perl-libwww-perl

Fran?ois

2015-04-19 12:17 GMT+02:00 Bernd Kuhls <bernd.kuhls@t-online.de>:
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/Config.in                    |    1 +
>  package/perl-libwww/Config.in        |   16 ++++++++++++++++
>  package/perl-libwww/perl-libwww.hash |    3 +++
>  package/perl-libwww/perl-libwww.mk   |   23 +++++++++++++++++++++++
>  4 files changed, 43 insertions(+)
>  create mode 100644 package/perl-libwww/Config.in
>  create mode 100644 package/perl-libwww/perl-libwww.hash
>  create mode 100644 package/perl-libwww/perl-libwww.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 4e6e8c8..08e44bf 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -520,6 +520,7 @@ menu "Perl libraries/modules"
>         source "package/perl-io-html/Config.in"
>         source "package/perl-io-socket-ssl/Config.in"
>         source "package/perl-json-tiny/Config.in"
> +       source "package/perl-libwww/Config.in"
>         source "package/perl-lwp-mediatypes/Config.in"
>         source "package/perl-mojolicious/Config.in"
>         source "package/perl-net-dns/Config.in"
> diff --git a/package/perl-libwww/Config.in b/package/perl-libwww/Config.in
> new file mode 100644
> index 0000000..523371f
> --- /dev/null
> +++ b/package/perl-libwww/Config.in
> @@ -0,0 +1,16 @@
> +config BR2_PACKAGE_PERL_LIBWWW
> +       bool "perl-libwww"
> +       select BR2_PACKAGE_PERL_ENCODE_LOCALE
> +       select BR2_PACKAGE_PERL_FILE_LISTING
> +       select BR2_PACKAGE_PERL_HTML_PARSER
> +       select BR2_PACKAGE_PERL_HTTP_COOKIES
> +       select BR2_PACKAGE_PERL_HTTP_DAEMON
> +       select BR2_PACKAGE_PERL_HTTP_NEGOTIATE
> +       select BR2_PACKAGE_PERL_LWP_MEDIATYPES
> +       select BR2_PACKAGE_PERL_NET_HTTP
> +       select BR2_PACKAGE_PERL_URI
> +       select BR2_PACKAGE_PERL_WWW_ROBOTRULES
> +       help
> +         The World-Wide Web library for Perl
> +
> +         https://github.com/libwww-perl/libwww-perl
> diff --git a/package/perl-libwww/perl-libwww.hash b/package/perl-libwww/perl-libwww.hash
> new file mode 100644
> index 0000000..1ef5ccf
> --- /dev/null
> +++ b/package/perl-libwww/perl-libwww.hash
> @@ -0,0 +1,3 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    85b36bcd2fd2450718ee14f894f0d3d1 libwww-perl-6.13.tar.gz
> +sha256 5fbd13eebd1933e5a203fceb2c1629efbccff3efc8fab6ec0285c79d0a95f8b2 libwww-perl-6.13.tar.gz
> diff --git a/package/perl-libwww/perl-libwww.mk b/package/perl-libwww/perl-libwww.mk
> new file mode 100644
> index 0000000..0ee1e04
> --- /dev/null
> +++ b/package/perl-libwww/perl-libwww.mk
> @@ -0,0 +1,23 @@
> +################################################################################
> +#
> +# perl-libwww
> +#
> +################################################################################
> +
> +PERL_LIBWWW_VERSION = 6.13
> +PERL_LIBWWW_SITE = $(call github,libwww-perl,libwww-perl,$(PERL_LIBWWW_VERSION))
> +PERL_LIBWWW_LICENSE = Artistic or GPLv1+
> +PERL_LIBWWW_LICENSE_FILES = LICENSE
> +PERL_LIBWWW_DEPENDENCIES = \
> +       perl-encode-locale \
> +       perl-file-listing \
> +       perl-html-parser \
> +       perl-http-cookies \
> +       perl-http-daemon \
> +       perl-http-date \
> +       perl-http-negotiate \
> +       perl-net-http \
> +       perl-uri \
> +       perl-www-robotrules
> +
> +$(eval $(perl-package))
> --
> 1.7.10.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
