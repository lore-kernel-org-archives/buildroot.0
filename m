From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 08:40:03 +0200
Subject: [Buildroot] [PATCH 07/18] perl-dist-checkconflicts: new package
In-Reply-To: <20180820115519.24046-8-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-8-chrismcc@gmail.com>
Message-ID: <CAGhdn56j2JRW5TuY2t5EyttHPg4c3iufh_WM9HmRKh6wpzYbOw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2018-08-20 13:55 GMT+02:00 Christopher McCrory <chrismcc@gmail.com>:

> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
>

Acked-by: Francois Perrad <francois.perrad@gadz.org>

---
>  DEVELOPERS                                                 |  1 +
>  package/Config.in                                          |  1 +
>  package/perl-dist-checkconflicts/Config.in                 |  7 +++++++
>  .../perl-dist-checkconflicts/perl-dist-checkconflicts.hash |  6 ++++++
>  .../perl-dist-checkconflicts/perl-dist-checkconflicts.mk   | 14
> ++++++++++++++
>  5 files changed, 29 insertions(+)
>  create mode 100644 package/perl-dist-checkconflicts/Config.in
>  create mode 100644 package/perl-dist-checkconflicts/perl-dist-
> checkconflicts.hash
>  create mode 100644 package/perl-dist-checkconflicts/perl-dist-
> checkconflicts.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 70879360f2..0d20a77c6b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -493,6 +493,7 @@ F:  package/perl-date-manip/
>  F:     package/perl-dbd-mysql/
>  F:     package/perl-dbi/
>  F:     package/perl-device-serialport/
> +F:     package/perl-dist-checkconflicts/
>  F:     package/perl-file-slurp/
>  F:     package/perl-io-interface/
>  F:     package/perl-io-socket-multicast/
> diff --git a/package/Config.in b/package/Config.in
> index fcb67b7617..966748fc95 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -685,6 +685,7 @@ menu "Perl libraries/modules"
>         source "package/perl-digest-hmac/Config.in"
>         source "package/perl-digest-md5/Config.in"
>         source "package/perl-digest-sha1/Config.in"
> +       source "package/perl-dist-checkconflicts/Config.in"
>         source "package/perl-encode-detect/Config.in"
>         source "package/perl-encode-locale/Config.in"
>         source "package/perl-file-listing/Config.in"
> diff --git a/package/perl-dist-checkconflicts/Config.in
> b/package/perl-dist-checkconflicts/Config.in
> new file mode 100644
> index 0000000000..10f0944aa8
> --- /dev/null
> +++ b/package/perl-dist-checkconflicts/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PERL_DIST_CHECKCONFLICTS
> +       bool "perl-dist-checkconflicts"
> +       select BR2_PACKAGE_PERL_MODULE_RUNTIME
> +       help
> +         declare version conflicts for your dist
> +
> +         http://metacpan.org/release/Dist-CheckConflicts
> diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
> b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
> new file mode 100644
> index 0000000000..5605fed4ae
> --- /dev/null
> +++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    c8725a92b9169708b0f63036812070f2 Dist-CheckConflicts-0.11.tar.gz
> +sha256 ea844b9686c94d666d9d444321d764490b2cde2f985c4165b4c2c77665caedc4
> Dist-CheckConflicts-0.11.tar.gz
> +
> +# computed by scancpan
> +sha256 b4e0637ed96008ddcbf7e0ddeb73967df3d0b4dc62a6b7fdb86eac37018cb12e
> LICENSE
> diff --git a/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
> b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
> new file mode 100644
> index 0000000000..4242b50ab2
> --- /dev/null
> +++ b/package/perl-dist-checkconflicts/perl-dist-checkconflicts.mk
> @@ -0,0 +1,14 @@
> +###########################################################
> #####################
> +#
> +# perl-dist-checkconflicts
> +#
> +###########################################################
> #####################
> +
> +PERL_DIST_CHECKCONFLICTS_VERSION = 0.11
> +PERL_DIST_CHECKCONFLICTS_SOURCE = Dist-CheckConflicts-$(PERL_
> DIST_CHECKCONFLICTS_VERSION).tar.gz
> +PERL_DIST_CHECKCONFLICTS_SITE = $(BR2_CPAN_MIRROR)/authors/id/D/DO/DOY
> +PERL_DIST_CHECKCONFLICTS_DEPENDENCIES = perl-module-runtime
> +PERL_DIST_CHECKCONFLICTS_LICENSE = Artistic or GPL-1.0+
> +PERL_DIST_CHECKCONFLICTS_LICENSE_FILES = LICENSE
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/bbf2e148/attachment-0001.html>
