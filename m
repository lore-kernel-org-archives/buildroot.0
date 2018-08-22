From: Christopher McCrory <chrismcc@gmail.com>
Date: Wed, 22 Aug 2018 10:00:48 -0700
Subject: [Buildroot] [PATCH 14/18] perl-termreadkey: new package
In-Reply-To: <20180820115519.24046-15-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-15-chrismcc@gmail.com>
Message-ID: <CALURroTcwVV_U=cHkBSbfaoVwMrQNNmx4Eh5i=JP08P5XH6sEQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This fails on cross compile.  Somehow I missed that during testing ono
raspberry pi. :(



On Mon, Aug 20, 2018 at 4:55 AM Christopher McCrory <chrismcc@gmail.com>
wrote:

> For licensing see
> https://github.com/jonathanstowe/TermReadKey/issues/11
>
> https://src.fedoraproject.org/rpms/perl-TermReadKey/blob/master/f/perl-TermReadKey.spec
>
> Signed-off-by: Christopher McCrory <chrismcc@gmail.com>
> ---
>  DEVELOPERS                                     |  1 +
>  package/Config.in                              |  1 +
>  package/perl-termreadkey/Config.in             | 10 ++++++++++
>  package/perl-termreadkey/perl-termreadkey.hash |  6 ++++++
>  package/perl-termreadkey/perl-termreadkey.mk   | 15 +++++++++++++++
>  5 files changed, 33 insertions(+)
>  create mode 100644 package/perl-termreadkey/Config.in
>  create mode 100644 package/perl-termreadkey/perl-termreadkey.hash
>  create mode 100644 package/perl-termreadkey/perl-termreadkey.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index da08b66c77..1e6cc7d2b9 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -511,6 +511,7 @@ F:  package/perl-sys-cpu/
>  F:     package/perl-sys-meminfo/
>  F:     package/perl-sys-mmap/
>  F:     package/perl-template-toolkit/
> +F:     package/perl-termreadkey/
>  F:     package/perl-time-parsedate/
>  F:     package/perl-x10/
>  F:     package/perl-xml-parser/
> diff --git a/package/Config.in b/package/Config.in
> index fff68b3e67..fb320e4a73 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -737,6 +737,7 @@ menu "Perl libraries/modules"
>         source "package/perl-sys-meminfo/Config.in"
>         source "package/perl-sys-mmap/Config.in"
>         source "package/perl-template-toolkit/Config.in"
> +       source "package/perl-termreadkey/Config.in"
>         source "package/perl-time-hires/Config.in"
>         source "package/perl-time-parsedate/Config.in"
>         source "package/perl-timedate/Config.in"
> diff --git a/package/perl-termreadkey/Config.in
> b/package/perl-termreadkey/Config.in
> new file mode 100644
> index 0000000000..7157bb6f68
> --- /dev/null
> +++ b/package/perl-termreadkey/Config.in
> @@ -0,0 +1,10 @@
> +config BR2_PACKAGE_PERL_TERMREADKEY
> +       bool "perl-termreadkey"
> +       depends on !BR2_STATIC_LIBS
> +       help
> +         Change terminal modes, and perform non-blocking reads.
> +
> +         https://metacpan.org/release/TermReadKey
> +
> +comment "perl-termreadkey needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/perl-termreadkey/perl-termreadkey.hash
> b/package/perl-termreadkey/perl-termreadkey.hash
> new file mode 100644
> index 0000000000..168e37223c
> --- /dev/null
> +++ b/package/perl-termreadkey/perl-termreadkey.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    e8ea15c16333ac4f8d146d702e83cc0c TermReadKey-2.37.tar.gz
> +sha256 4a9383cf2e0e0194668fe2bd546e894ffad41d556b41d2f2f577c8db682db241
> TermReadKey-2.37.tar.gz
> +
> +# computed by scancpan
> +sha256 9deb4e80e04cca282a98902939225bf0bedac2e04034df5dba80f12bd0a3be26
> README
> diff --git a/package/perl-termreadkey/perl-termreadkey.mk
> b/package/perl-termreadkey/perl-termreadkey.mk
> new file mode 100644
> index 0000000000..d7e1103d0f
> --- /dev/null
> +++ b/package/perl-termreadkey/perl-termreadkey.mk
> @@ -0,0 +1,15 @@
>
> +################################################################################
> +#
> +# perl-termreadkey
> +#
>
> +################################################################################
> +
> +PERL_TERMREADKEY_VERSION = 2.37
> +PERL_TERMREADKEY_SOURCE = TermReadKey-$(PERL_TERMREADKEY_VERSION).tar.gz
> +PERL_TERMREADKEY_SITE = $(BR2_CPAN_MIRROR)/authors/id/J/JS/JSTOWE
> +#
> https://src.fedoraproject.org/rpms/perl-TermReadKey/blob/master/f/perl-TermReadKey.spec
> +# https://github.com/jonathanstowe/TermReadKey/issues/11
> +PERL_TERMREADKEY_LICENSE = Artistic or GPL-1.0+, and Copyright only
> +PERL_TERMREADKEY_LICENSE_FILES = README
> +
> +$(eval $(perl-package))
> --
> 2.14.4
>
>

-- 
Christopher McCrory
To the optimist, the glass is half full.
To the pessimist, the glass is half empty.
To the engineer, the glass is twice as big as it needs to be.
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180822/28578e72/attachment.html>
