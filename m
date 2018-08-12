From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sun, 12 Aug 2018 18:45:04 +0200
Subject: [Buildroot] [PATCH 04/17] perl-class-std-fast: new package
In-Reply-To: <20180811182749.20924-5-chrismcc@gmail.com>
References: <20180811182749.20924-1-chrismcc@gmail.com>
 <20180811182749.20924-5-chrismcc@gmail.com>
Message-ID: <CAB0FRsv0t4mMC=SEO5fq2BOqbqF08BzHdWjtWFuvnRMGut6cfw@mail.gmail.com>
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
>  DEVELOPERS                                           |  1 +
>  package/Config.in                                    |  1 +
>  package/perl-class-std-fast/Config.in                |  7 +++++++
>  package/perl-class-std-fast/perl-class-std-fast.hash |  6 ++++++
>  package/perl-class-std-fast/perl-class-std-fast.mk   | 14 ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/perl-class-std-fast/Config.in
>  create mode 100644 package/perl-class-std-fast/perl-class-std-fast.hash
>  create mode 100644 package/perl-class-std-fast/perl-class-std-fast.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index c693f6765b..7c8483f493 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -484,6 +484,7 @@ F:  package/perl-appconfig
>  F:     package/perl-astro-suntime
>  F:     package/perl-cgi
>  F:     package/perl-class-std
> +F:     package/perl-class-std-fast
>  F:     package/perl-data-uuid
>  F:     package/perl-date-manip
>  F:     package/perl-dbi
> diff --git a/package/Config.in b/package/Config.in
> index 5b9c47aa79..d38c26a98a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -669,6 +669,7 @@ menu "Perl libraries/modules"
>         source "package/perl-astro-suntime/Config.in"
>         source "package/perl-cgi/Config.in"
>         source "package/perl-class-std/Config.in"
> +       source "package/perl-class-std-fast/Config.in"
>         source "package/perl-convert-asn1/Config.in"
>         source "package/perl-crypt-blowfish/Config.in"
>         source "package/perl-crypt-cbc/Config.in"
> diff --git a/package/perl-class-std-fast/Config.in
> b/package/perl-class-std-fast/Config.in
> new file mode 100644
> index 0000000000..10b1e0d786
> --- /dev/null
> +++ b/package/perl-class-std-fast/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PERL_CLASS_STD_FAST
> +       bool "perl-class-std-fast"
> +       select BR2_PACKAGE_PERL_CLASS_STD
> +       help
> +         faster but less secure than Class::Std
> +
> +         https://metacpan.org/release/Class-Std-Fast
> diff --git a/package/perl-class-std-fast/perl-class-std-fast.hash
> b/package/perl-class-std-fast/perl-class-std-fast.hash
> new file mode 100644
> index 0000000000..07e830a5ee
> --- /dev/null
> +++ b/package/perl-class-std-fast/perl-class-std-fast.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    d06d084cb84f295b0aabf2eee78ef746 Class-Std-Fast-v0.0.8.tar.gz
> +sha256 1bd43763c6a373183097a30e787f5d6713b0db27511c52d533266b59d2cfa780
> Class-Std-Fast-v0.0.8.tar.gz
> +
> +# computed by scancpan
> +sha256 aa1ab90c498aee078076e9a1f83e5f14bbfd841509582795ab5a9571428c0c38
> README
> diff --git a/package/perl-class-std-fast/perl-class-std-fast.mk
> b/package/perl-class-std-fast/perl-class-std-fast.mk
> new file mode 100644
> index 0000000000..7c008622dd
> --- /dev/null
> +++ b/package/perl-class-std-fast/perl-class-std-fast.mk
> @@ -0,0 +1,14 @@
> +###########################################################
> #####################
> +#
> +# perl-class-std-fast
> +#
> +###########################################################
> #####################
> +
> +PERL_CLASS_STD_FAST_VERSION = v0.0.8
> +PERL_CLASS_STD_FAST_SOURCE = Class-Std-Fast-$(PERL_CLASS_
> STD_FAST_VERSION).tar.gz
> +PERL_CLASS_STD_FAST_SITE = $(BR2_CPAN_MIRROR)/authors/id/A/AC/ACID
> +PERL_CLASS_STD_FAST_DEPENDENCIES = perl-class-std
> +PERL_CLASS_STD_FAST_LICENSE = Artistic or GPL-1.0+
> +PERL_CLASS_STD_FAST_LICENSE_FILES = README
> +
> +$(eval $(perl-package))
> --
> 2.14.4
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180812/7c476cfd/attachment.html>
