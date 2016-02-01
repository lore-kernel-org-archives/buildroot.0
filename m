From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 1 Feb 2016 15:58:53 +0100
Subject: [Buildroot] [PATCH 05/22] package/python-lmdb: new package.
In-Reply-To: <1454335541-14224-6-git-send-email-mc5686@mclink.it>
References: <1454335541-14224-1-git-send-email-mc5686@mclink.it>
 <1454335541-14224-6-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_kv8DpBbGMN-TDc4RCo0xKjzmQujfp90EDmPgPDpUo+YXw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 1, 2016 at 3:05 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                    |  1 +
>  package/python-lmdb/Config.in        |  8 ++++++++
>  package/python-lmdb/python-lmdb.hash |  3 +++
>  package/python-lmdb/python-lmdb.mk   | 15 +++++++++++++++
>  4 files changed, 27 insertions(+)
>  create mode 100644 package/python-lmdb/Config.in
>  create mode 100644 package/python-lmdb/python-lmdb.hash
>  create mode 100644 package/python-lmdb/python-lmdb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3980c00..8dcaef7 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -657,6 +657,7 @@ menu "External python modules"
>         source "package/python-json-schema-validator/Config.in"
>         source "package/python-keyring/Config.in"
>         source "package/python-libconfig/Config.in"
> +       source "package/python-lmdb/Config.in"
>         source "package/python-lxml/Config.in"
>         source "package/python-mad/Config.in"
>         source "package/python-mako/Config.in"
> diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
> new file mode 100644
> index 0000000..2cff7ac
> --- /dev/null
> +++ b/package/python-lmdb/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_LMDB
> +       bool "python-lmdb"
> +       depends on BR2_PACKAGE_PYTHON

remove depends and add

select BR2_PACKAGE_PYTHON_CFFI # runtime

> +       help
> +         Universal Python binding for the LMDB 'Lightning' Database.
> +
> +         https://pypi.python.org/pypi/lmdb
> +
> diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
> new file mode 100644
> index 0000000..ba4cc96
> --- /dev/null
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -0,0 +1,3 @@
> +# Locally computed.
> +md5    001817d754f96865549c85fb5251082f  lmdb-0.88.tar.gz
> +sha256 37d97041fb237da5600e14b889af49bd47538d6fde4a69d3a6c9097f787d175a  lmdb-0.88.tar.gz
> diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
> new file mode 100644
> index 0000000..7295083
> --- /dev/null
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -0,0 +1,15 @@
> +################################################################################
> +#
> +# python-lmdb
> +#
> +################################################################################
> +
> +PYTHON_LMDB_VERSION = 0.88
> +PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> +PYTHON_LMDB_SITE = http://pypi.python.org/packages/source/l/lmdb
> +PYTHON_LMDB_LICENSE = BSD
> +#PYTHON_LMDB_LICENSE_FILES = LICENSE
> +PYTHON_LMDB_SETUP_TYPE = setuptools
> +#PYTHON_LMDB_DEPENDENCIES =
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
