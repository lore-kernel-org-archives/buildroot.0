From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 12 Aug 2018 18:46:02 +0200
Subject: [Buildroot] [PATCH 05/17] perl-data-optlist: new package
In-Reply-To: <20180811182749.20924-6-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-6-chrismcc@gmail.com>
Message-ID: <CAB0FRssrcC-CV2K6F4ys1N56T4JFCsfvuCyPhxBGdk5zVt9BjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-11 20:27 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>


> ---
>  DEVELOPERS                                       |  1 +
>  package/Config.in                                |  1 +
>  package/perl-data-optlist/Config.in              | 12 ++++++++++++
>  package/perl-data-optlist/perl-data-optlist.hash |  6 ++++++
>  package/perl-data-optlist/perl-data-optlist.mk   | 14 ++++++++++++++
>  5 files changed, 34 insertions(+)
>  create mode 100644 package/perl-data-optlist/Config.in
>  create mode 100644 package/perl-data-optlist/perl-data-optlist.hash
>  create mode 100644 package/perl-data-optlist/perl-data-optlist.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 7c8483f493..2ecfddf9b0 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -485,6 +485,7 @@ F:  package/perl-astro-suntime
>  F:     package/perl-cgi
>  F:     package/perl-class-std
>  F:     package/perl-class-std-fast
> +F:     package/perl-data-optlist
>  F:     package/perl-data-uuid
>  F:     package/perl-date-manip
>  F:     package/perl-dbi
> diff --git a/package/Config.in b/package/Config.in
> index d38c26a98a..91aff2953b 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -675,6 +675,7 @@ menu "Perl libraries/modules"
>         source "package/perl-crypt-cbc/Config.in"
>         source "package/perl-crypt-openssl-random/Config.in"
>         source "package/perl-crypt-openssl-rsa/Config.in"
> +       source "package/perl-data-optlist/Config.in"
>         source "package/perl-data-uuid/Config.in"
>         source "package/perl-date-manip/Config.in"
>         source "package/perl-datetime-tiny/Config.in"
> diff --git a/package/perl-data-optlist/Config.in
> b/package/perl-data-optlist/Config.in
> new file mode 100644
> index 0000000000..0393e65645
> --- /dev/null
> +++ b/package/perl-data-optlist/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PERL_DATA_OPTLIST
> +       bool "perl-data-optlist"
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_PERL_PARAMS_UTIL
> +       select BR2_PACKAGE_PERL_SUB_INSTALL
> +       help
> +         parse and validate simple name/value option pairs
> +
> +         https://github.com/rjbs/Data-OptList
> +
> +comment "perl-data-optlist needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/perl-data-optlist/perl-data-optlist.hash
> b/package/perl-data-optlist/perl-data-optlist.hash
> new file mode 100644
> index 0000000000..93df006486
> --- /dev/null
> +++ b/package/perl-data-optlist/perl-data-optlist.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    f9236c9ea5607134ad8a2b3dc901c4c5 Data-OptList-0.110.tar.gz
> +sha256 366117cb2966473f2559f2f4575ff6ae69e84c69a0f30a0773e1b51a457ef5c3
> Data-OptList-0.110.tar.gz
> +
> +# computed by scancpan
> +sha256 73c7bd4c8e4adc474f9dae32b9aa08f6ce27327940751dd6e8373404beabdffa
> LICENSE
> diff --git a/package/perl-data-optlist/perl-data-optlist.mk
> b/package/perl-data-optlist/perl-data-optlist.mk
> new file mode 100644
> index 0000000000..ef643cf845
> --- /dev/null
> +++ b/package/perl-data-optlist/perl-data-optlist.mk
> @@ -0,0 +1,14 @@
> +###########################################################
> #####################
> +#
> +# perl-data-optlist
> +#
> +###########################################################
> #####################
> +
> +PERL_DATA_OPTLIST_VERSION = 0.110
> +PERL_DATA_OPTLIST_SOURCE = Data-OptList-$(PERL_DATA_
> OPTLIST_VERSION).tar.gz
> +PERL_DATA_OPTLIST_SITE = $(BR2_CPAN_MIRROR)/authors/id/R/RJ/RJBS
> +PERL_DATA_OPTLIST_DEPENDENCIES = perl-params-util perl-sub-install
> +PERL_DATA_OPTLIST_LICENSE = Artistic or GPL-1.0+
> +PERL_DATA_OPTLIST_LICENSE_FILES = LICENSE
> +
> +$(eval $(perl-package))
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180812/bf0b4217/attachment.html>
