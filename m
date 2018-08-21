From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 08:35:52 +0200
Subject: [Buildroot] [PATCH 06/18] perl-sys-cpu: new package
In-Reply-To: <20180820115519.24046-7-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-7-chrismcc@gmail.com>
Message-ID: <CAGhdn56NEiorxp+spyYFD3iEf__eu+-2dwffiU1Li3ewgsXr3w@mail.gmail.com>
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
>  DEVELOPERS                             |  1 +
>  package/Config.in                      |  1 +
>  package/perl-sys-cpu/Config.in         |  5 +++++
>  package/perl-sys-cpu/perl-sys-cpu.hash |  2 ++
>  package/perl-sys-cpu/perl-sys-cpu.mk   | 13 +++++++++++++
>  5 files changed, 22 insertions(+)
>  create mode 100644 package/perl-sys-cpu/Config.in
>  create mode 100644 package/perl-sys-cpu/perl-sys-cpu.hash
>  create mode 100644 package/perl-sys-cpu/perl-sys-cpu.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 410d01b02b..70879360f2 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -503,6 +503,7 @@ F:  package/perl-module-runtime/
>  F:     package/perl-number-bytes-human/
>  F:     package/perl-params-util/
>  F:     package/perl-sub-install/
> +F:     package/perl-sys-cpu/
>  F:     package/perl-sys-meminfo/
>  F:     package/perl-sys-mmap/
>  F:     package/perl-time-parsedate/
> diff --git a/package/Config.in b/package/Config.in
> index c083f4e1bd..fcb67b7617 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -729,6 +729,7 @@ menu "Perl libraries/modules"
>         source "package/perl-params-util/Config.in"
>         source "package/perl-path-tiny/Config.in"
>         source "package/perl-sub-install/Config.in"
> +       source "package/perl-sys-cpu/Config.in"
>         source "package/perl-sys-meminfo/Config.in"
>         source "package/perl-sys-mmap/Config.in"
>         source "package/perl-time-hires/Config.in"
> diff --git a/package/perl-sys-cpu/Config.in b/package/perl-sys-cpu/Config.
> in
> new file mode 100644
> index 0000000000..d5fff5b849
> --- /dev/null
> +++ b/package/perl-sys-cpu/Config.in
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_PERL_SYS_CPU
> +       bool "perl-sys-cpu"
> +       help
> +         perl-sys-cpu
> +
> diff --git a/package/perl-sys-cpu/perl-sys-cpu.hash
> b/package/perl-sys-cpu/perl-sys-cpu.hash
> new file mode 100644
> index 0000000000..0977606b1a
> --- /dev/null
> +++ b/package/perl-sys-cpu/perl-sys-cpu.hash
> @@ -0,0 +1,2 @@
> +# locally computed
> +sha256 ca0ec47ab24070e3040e5075337cfc69721362d9bef50f6992072efe644d4d26
> Sys-CPU-0.52.tar.gz
> diff --git a/package/perl-sys-cpu/perl-sys-cpu.mk b/package/perl-sys-cpu/
> perl-sys-cpu.mk
> new file mode 100644
> index 0000000000..efc9ee814b
> --- /dev/null
> +++ b/package/perl-sys-cpu/perl-sys-cpu.mk
> @@ -0,0 +1,13 @@
> +###########################################################
> #####################
> +#
> +# perl-sys-cpu
> +#
> +###########################################################
> #####################
> +
> +PERL_SYS_CPU_VERSION = 0.52
> +PERL_SYS_CPU_SOURCE = Sys-CPU-$(PERL_SYS_CPU_VERSION).tar.gz
> +PERL_SYS_CPU_SITE = $(BR2_CPAN_MIRROR)/authors/id/M/MK/MKODERER
> +PERL_SYS_CPU_LICENSE = Artistic or GPL-1.0+ # as stated in README file
> +PERL_SYS_CPU_LICENSE_FILES = README
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/34f0c4d2/attachment.html>
