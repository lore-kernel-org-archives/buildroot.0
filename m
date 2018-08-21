From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 08:43:26 +0200
Subject: [Buildroot] [PATCH 09/18] perl-class-load: new package
In-Reply-To: <20180820115519.24046-10-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-10-chrismcc@gmail.com>
Message-ID: <CAGhdn55XtzBJua3K0CPyKBtTypdOmPr8Gep4roAS+oj-R=m8Jg@mail.gmail.com>
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
>  DEVELOPERS                                   |  1 +
>  package/Config.in                            |  1 +
>  package/perl-class-load/Config.in            | 15 +++++++++++++++
>  package/perl-class-load/perl-class-load.hash |  6 ++++++
>  package/perl-class-load/perl-class-load.mk   | 14 ++++++++++++++
>  5 files changed, 37 insertions(+)
>  create mode 100644 package/perl-class-load/Config.in
>  create mode 100644 package/perl-class-load/perl-class-load.hash
>  create mode 100644 package/perl-class-load/perl-class-load.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 5cba9a231b..bb43154698 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -484,6 +484,7 @@ F:  package/targetcli-fb/
>  N:     Christopher McCrory <chrismcc@gmail.com>
>  F:     package/perl-appconfig/
>  F:     package/perl-astro-suntime/
> +F:     package/perl-class-load/
>  F:     package/perl-class-std/
>  F:     package/perl-class-std-fast/
>  F:     package/perl-data-dump/
> diff --git a/package/Config.in b/package/Config.in
> index ecdf285dca..b4aa57ab19 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -667,6 +667,7 @@ if BR2_PACKAGE_PERL
>  menu "Perl libraries/modules"
>         source "package/perl-appconfig/Config.in"
>         source "package/perl-astro-suntime/Config.in"
> +       source "package/perl-class-load/Config.in"
>         source "package/perl-class-std/Config.in"
>         source "package/perl-class-std-fast/Config.in"
>         source "package/perl-convert-asn1/Config.in"
> diff --git a/package/perl-class-load/Config.in b/package/perl-class-load/
> Config.in
> new file mode 100644
> index 0000000000..fef9431e49
> --- /dev/null
> +++ b/package/perl-class-load/Config.in
> @@ -0,0 +1,15 @@
> +config BR2_PACKAGE_PERL_CLASS_LOAD
> +       bool "perl-class-load"
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_PERL_DATA_OPTLIST
> +       select BR2_PACKAGE_PERL_MODULE_IMPLEMENTATION
> +       select BR2_PACKAGE_PERL_MODULE_RUNTIME
> +       select BR2_PACKAGE_PERL_PACKAGE_STASH
> +       select BR2_PACKAGE_PERL_TRY_TINY
> +       help
> +         A working (require "Class::Name") and more
> +
> +         https://github.com/moose/Class-Load
> +
> +comment "perl-class-load needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/perl-class-load/perl-class-load.hash
> b/package/perl-class-load/perl-class-load.hash
> new file mode 100644
> index 0000000000..c2900d6964
> --- /dev/null
> +++ b/package/perl-class-load/perl-class-load.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    e4c831c08df592ce8dfee0c7cfc12fd7 Class-Load-0.25.tar.gz
> +sha256 2a48fa779b5297e56156380e8b32637c6c58decb4f4a7f3c7350523e11275f8f
> Class-Load-0.25.tar.gz
> +
> +# computed by scancpan
> +sha256 dc030e63f20035291b90d09c2c40f296224e85878caf829ea981fc2f10910f9d
> LICENSE
> diff --git a/package/perl-class-load/perl-class-load.mk
> b/package/perl-class-load/perl-class-load.mk
> new file mode 100644
> index 0000000000..33a6288465
> --- /dev/null
> +++ b/package/perl-class-load/perl-class-load.mk
> @@ -0,0 +1,14 @@
> +###########################################################
> #####################
> +#
> +# perl-class-load
> +#
> +###########################################################
> #####################
> +
> +PERL_CLASS_LOAD_VERSION = 0.25
> +PERL_CLASS_LOAD_SOURCE = Class-Load-$(PERL_CLASS_LOAD_VERSION).tar.gz
> +PERL_CLASS_LOAD_SITE = $(BR2_CPAN_MIRROR)/authors/id/E/ET/ETHER
> +PERL_CLASS_LOAD_DEPENDENCIES = perl-data-optlist
> perl-module-implementation perl-module-runtime perl-package-stash
> perl-try-tiny
> +PERL_CLASS_LOAD_LICENSE = Artistic or GPL-1.0+
> +PERL_CLASS_LOAD_LICENSE_FILES = LICENSE
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/66214673/attachment.html>
