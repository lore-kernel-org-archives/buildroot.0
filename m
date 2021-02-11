From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Thu, 11 Feb 2021 08:44:54 +0100
Subject: [Buildroot] [PATCH 1/3] package/perl-extutils-pkgconfig: new
 package
In-Reply-To: <20210124112214.480254-1-fontaine.fabrice@gmail.com>
References: <20210124112214.480254-1-fontaine.fabrice@gmail.com>
Message-ID: <CAB0FRsu5BYSr8SvFziB0y0RHSnWyKe9s9WpamaALaLHiq3h+Yw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le dim. 24 janv. 2021 ? 12:23, Fabrice Fontaine <fontaine.fabrice@gmail.com>
a ?crit :

> host-perl-extutils-pkgconfig is needed by perl-gd to find gd in version
> 2.3.0
>
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/perl-extutils-pkgconfig/Config.in          |  6 ++++++
>  .../perl-extutils-pkgconfig.hash                   |  6 ++++++
>  .../perl-extutils-pkgconfig.mk                     | 14 ++++++++++++++
>  3 files changed, 26 insertions(+)
>  create mode 100644 package/perl-extutils-pkgconfig/Config.in
>  create mode 100644
> package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
>  create mode 100644 package/perl-extutils-pkgconfig/
> perl-extutils-pkgconfig.mk
>
> diff --git a/package/perl-extutils-pkgconfig/Config.in
> b/package/perl-extutils-pkgconfig/Config.in
> new file mode 100644
> index 0000000000..f3c4966fe1
> --- /dev/null
> +++ b/package/perl-extutils-pkgconfig/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_PERL_EXTUTILS_PKGCONFIG
> +       bool "perl-extutils-pkgconfig"
> +       help
> +         simplistic interface to pkg-config.
> +
> +         http://gtk2-perl.sourceforge.net
> diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
> b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
> new file mode 100644
> index 0000000000..7028b96be5
> --- /dev/null
> +++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5  b86318f2b6ac6af3ee985299e1e38fe5  ExtUtils-PkgConfig-1.16.tar.gz
> +sha256  bbeaced995d7d8d10cfc51a3a5a66da41ceb2bc04fedcab50e10e6300e801c6e
> ExtUtils-PkgConfig-1.16.tar.gz
> +
> +# computed by scancpan
> +sha256  1ca66d6d9d2e14426825889848f0b5b4d4e153afcd74b8f42a1f2937c3a9973d
> README
> diff --git a/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
> b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
> new file mode 100644
> index 0000000000..b70b2f1af1
> --- /dev/null
> +++ b/package/perl-extutils-pkgconfig/perl-extutils-pkgconfig.mk
> @@ -0,0 +1,14 @@
>
> +################################################################################
> +#
> +# perl-extutils-pkgconfig
> +#
>
> +################################################################################
> +
> +PERL_EXTUTILS_PKGCONFIG_VERSION = 1.16
> +PERL_EXTUTILS_PKGCONFIG_SOURCE =
> ExtUtils-PkgConfig-$(PERL_EXTUTILS_PKGCONFIG_VERSION).tar.gz
> +PERL_EXTUTILS_PKGCONFIG_SITE = $(BR2_CPAN_MIRROR)/authors/id/X/XA/XAOC
>

Fabrice,

you miss:
PERL_EXTUTILS_PKGCONFIG_DEPENDENCIES = host-pkgconf

after that host-pkgconf could be removed from PERL_GD_DEPENDENCIES
(host-perl-extutils-pkgconfig is enough)

Fran?ois


> +PERL_EXTUTILS_PKGCONFIG_LICENSE = LGPL-2.1
> +PERL_EXTUTILS_PKGCONFIG_LICENSE_FILES = README
> +PERL_EXTUTILS_PKGCONFIG_DISTNAME = ExtUtils-PkgConfig
> +
> +$(eval $(host-perl-package))
> --
> 2.29.2
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20210211/090c17d8/attachment-0001.html>
