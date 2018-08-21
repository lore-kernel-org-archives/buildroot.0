From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <fperrad@gmail.com>
Date: Tue, 21 Aug 2018 15:16:56 +0200
Subject: [Buildroot] [PATCH 02/18] perl-dbd-mysql: new package
In-Reply-To: <20180820115519.24046-3-chrismcc@gmail.com>
References: <20180820115519.24046-1-chrismcc@gmail.com>
 <20180820115519.24046-3-chrismcc@gmail.com>
Message-ID: <CAGhdn57mkhFomHwawxA++Fbrx94J24MqjsPte7tfqf2=NAsaeQ@mail.gmail.com>
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
>  DEVELOPERS                                 |  1 +
>  package/Config.in                          |  1 +
>  package/perl-dbd-mysql/Config.in           | 12 ++++++++++++
>  package/perl-dbd-mysql/perl-dbd-mysql.hash |  6 ++++++
>  package/perl-dbd-mysql/perl-dbd-mysql.mk   | 15 +++++++++++++++
>  5 files changed, 35 insertions(+)
>  create mode 100644 package/perl-dbd-mysql/Config.in
>  create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.hash
>  create mode 100644 package/perl-dbd-mysql/perl-dbd-mysql.mk
>
> diff --git a/DEVELOPERS b/DEVELOPERS
> index 9a2576ddc7..75237eae3b 100644
> --- a/DEVELOPERS
> +++ b/DEVELOPERS
> @@ -489,6 +489,7 @@ F:  package/perl-class-std-fast/
>  F:     package/perl-data-optlist/
>  F:     package/perl-data-uuid/
>  F:     package/perl-date-manip/
> +F:     package/perl-dbd-mysql/
>  F:     package/perl-dbi/
>  F:     package/perl-device-serialport/
>  F:     package/perl-file-slurp/
> diff --git a/package/Config.in b/package/Config.in
> index eda0f698dc..b6e739dade 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -678,6 +678,7 @@ menu "Perl libraries/modules"
>         source "package/perl-data-uuid/Config.in"
>         source "package/perl-date-manip/Config.in"
>         source "package/perl-datetime-tiny/Config.in"
> +       source "package/perl-dbd-mysql/Config.in"
>         source "package/perl-dbi/Config.in"
>         source "package/perl-device-serialport/Config.in"
>         source "package/perl-digest-hmac/Config.in"
> diff --git a/package/perl-dbd-mysql/Config.in b/package/perl-dbd-mysql/
> Config.in
> new file mode 100644
> index 0000000000..49e7ff99d6
> --- /dev/null
> +++ b/package/perl-dbd-mysql/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_PERL_DBD_MYSQL
> +       bool "perl-dbd-mysql"
> +       depends on !BR2_STATIC_LIBS
> +       select BR2_PACKAGE_PERL_DBI
> +       select BR2_PACKAGE_MYSQL
> +       help
> +         A MySQL driver for the Perl5 Database Interface (DBI)
> +
> +         http://dbi.perl.org/
> +
> +comment "perl-dbd-mysql needs a toolchain w/ dynamic library"
> +       depends on BR2_STATIC_LIBS
> diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.hash
> b/package/perl-dbd-mysql/perl-dbd-mysql.hash
> new file mode 100644
> index 0000000000..51de476095
> --- /dev/null
> +++ b/package/perl-dbd-mysql/perl-dbd-mysql.hash
> @@ -0,0 +1,6 @@
> +# retrieved by scancpan from http://cpan.metacpan.org/
> +md5    bdf4f4d899b8af29ebd8ebfb7438d05f DBD-mysql-4.046.tar.gz
> +sha256 6165652ec959d05b97f5413fa3dff014b78a44cf6de21ae87283b28378daf1f7
> DBD-mysql-4.046.tar.gz
> +
> +# computed by scancpan
> +sha256 7a9ba29702b957805cfa8aa63bca43175625824263232dbade0010d385ab888c
> LICENSE
> diff --git a/package/perl-dbd-mysql/perl-dbd-mysql.mk
> b/package/perl-dbd-mysql/perl-dbd-mysql.mk
> new file mode 100644
> index 0000000000..752bc199b1
> --- /dev/null
> +++ b/package/perl-dbd-mysql/perl-dbd-mysql.mk
> @@ -0,0 +1,15 @@
> +###########################################################
> #####################
> +#
> +# perl-dbd-mysql
> +#
> +###########################################################
> #####################
> +
> +PERL_DBD_MYSQL_VERSION = 4.046
> +PERL_DBD_MYSQL_SOURCE = DBD-mysql-$(PERL_DBD_MYSQL_VERSION).tar.gz
> +PERL_DBD_MYSQL_SITE = $(BR2_CPAN_MIRROR)/authors/id/C/CA/CAPTTOFU
> +PERL_DBD_MYSQL_DEPENDENCIES = host-perl-dbi perl-dbi mysql
> +PERL_DBD_MYSQL_CONF_OPTS += --mysql_config=$(STAGING_DIR)/
> usr/bin/mysql_config
> +PERL_DBD_MYSQL_LICENSE = Artistic or GPL-1.0+
> +PERL_DBD_MYSQL_LICENSE_FILES = LICENSE
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
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180821/cbdf8f31/attachment.html>
