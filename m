From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sun, 7 Feb 2016 08:41:15 +0100
Subject: [Buildroot] [PATCH v4 03/17] python-lmdb: new package
In-Reply-To: <1454799603-5474-4-git-send-email-mc5686@mclink.it>
References: <1454799603-5474-1-git-send-email-mc5686@mclink.it>
 <1454799603-5474-4-git-send-email-mc5686@mclink.it>
Message-ID: <CAGm1_ku-usgOfTrHSgdg4J_RqD84ewfc__LdREUAKDhDw22E_Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Feb 6, 2016 at 11:59 PM, Mauro Condarelli <mc5686@mclink.it> wrote:
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

>
> ---
> Changes v3 -> v4
>   - removed spurious blank line at end of Config.in (suggested by yegorich)
>   - yegorich inquired about double licensing; I left as-is because it is
>     like that in PKG-INFO file ("License: OpenLDAP BSD").
>     No LICENSE file is present in package sources.
>
> Signed-off-by: Mauro Condarelli <mc5686@mclink.it>
> ---
>  package/Config.in                    |  1 +
>  package/python-lmdb/Config.in        |  7 +++++++
>  package/python-lmdb/python-lmdb.hash |  3 +++
>  package/python-lmdb/python-lmdb.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-lmdb/Config.in
>  create mode 100644 package/python-lmdb/python-lmdb.hash
>  create mode 100644 package/python-lmdb/python-lmdb.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 3b3526c..8e13c64 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -658,6 +658,7 @@ menu "External python modules"
>         source "package/python-json-schema-validator/Config.in"
>         source "package/python-keyring/Config.in"
>         source "package/python-libconfig/Config.in"
> +       source "package/python-lmdb/Config.in"
>         source "package/python-lxml/Config.in"
>         source "package/python-mad/Config.in"
>         source "package/python-mako/Config.in"
> diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
> new file mode 100644
> index 0000000..baf9bce
> --- /dev/null
> +++ b/package/python-lmdb/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_LMDB
> +       bool "python-lmdb"
> +       select BR2_PACKAGE_PYTHON_CFFI # runtime
> +       help
> +         Universal Python binding for the LMDB 'Lightning' Database.
> +
> +         https://pypi.python.org/pypi/lmdb
> diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
> new file mode 100644
> index 0000000..c983cfb
> --- /dev/null
> +++ b/package/python-lmdb/python-lmdb.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=001817d754f96865549c85fb5251082f, sha256 locally computed.
> +md5    001817d754f96865549c85fb5251082f  lmdb-0.88.tar.gz
> +sha256 37d97041fb237da5600e14b889af49bd47538d6fde4a69d3a6c9097f787d175a  lmdb-0.88.tar.gz
> diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
> new file mode 100644
> index 0000000..18302b0
> --- /dev/null
> +++ b/package/python-lmdb/python-lmdb.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-lmdb
> +#
> +################################################################################
> +
> +PYTHON_LMDB_VERSION = 0.88
> +PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
> +PYTHON_LMDB_SITE = http://pypi.python.org/packages/source/l/lmdb
> +PYTHON_LMDB_LICENSE = OpenLDAP BSD
> +PYTHON_LMDB_SETUP_TYPE = setuptools
> +PYTHON_LMDB_DEPENDENCIES = host-python-cffi
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
