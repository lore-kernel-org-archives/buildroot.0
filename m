From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Tue, 3 Jan 2017 09:53:15 +0100
Subject: [Buildroot] [PATCH v3 1/1] python-arrow: new package
In-Reply-To: <1483432528-11139-1-git-send-email-david.bachelart@bbright.com>
References: <1483432528-11139-1-git-send-email-david.bachelart@bbright.com>
Message-ID: <CAGm1_kuDJm5=54onRVVtt2A7HyEtmfijHXw10RfT6LZgo5DsFQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi David,

On Tue, Jan 3, 2017 at 9:35 AM, David Bachelart
<david.bachelart@bbright.com> wrote:
> Signed-off-by: David Bachelart <david.bachelart@bbright.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

Btw.could you please go to
http://patchwork.ozlabs.org/project/buildroot/list/?submitter=64407,
register there and remove all obsolete patch versions? This would
greatly help our maintainers.

See this section in our manual: "21.5.4. Patch revision changelog"

Yegor

> ---
> Changes v1 -> v2:
>   - download source from pypi.python.org
>   - use MD5 sum from upstream in hash file
>
> Changes v2 -> v3:
>   - use ./support/scripts/scanpypi arrow to create package (suggestion from Yegor Yefremov)
>   - fix missing dot in package description (suggestion from Yegor Yefremov)
>   - remove sha1 sum in hash file (suggestion from Yegor Yefremov)
>
> ---
>  package/Config.in                      |  1 +
>  package/python-arrow/Config.in         |  7 +++++++
>  package/python-arrow/python-arrow.hash |  3 +++
>  package/python-arrow/python-arrow.mk   | 14 ++++++++++++++
>  4 files changed, 25 insertions(+)
>  create mode 100644 package/python-arrow/Config.in
>  create mode 100644 package/python-arrow/python-arrow.hash
>  create mode 100644 package/python-arrow/python-arrow.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 59fa851..caeb7f5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -643,6 +643,7 @@ if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
>  menu "External python modules"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-argh/Config.in"
> +       source "package/python-arrow/Config.in"
>         source "package/python-autobahn/Config.in"
>         source "package/python-backports-abc/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
> diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
> new file mode 100644
> index 0000000..2449568
> --- /dev/null
> +++ b/package/python-arrow/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_ARROW
> +       bool "python-arrow"
> +       select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
> +       help
> +         Better dates and times for Python.
> +
> +         https://github.com/crsmithdev/arrow/
> diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
> new file mode 100644
> index 0000000..0b5076a
> --- /dev/null
> +++ b/package/python-arrow/python-arrow.hash
> @@ -0,0 +1,3 @@
> +# md5 from https://pypi.python.org/pypi/arrow/json, sha256 locally computed
> +md5    5d00592200050ad58284d45a4ee147c6  arrow-0.10.0.tar.gz
> +sha256 805906f09445afc1f0fc80187db8fe07670e3b25cdafa09b8d8ac264a8c0c722  arrow-0.10.0.tar.gz
> diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
> new file mode 100644
> index 0000000..6e2e331
> --- /dev/null
> +++ b/package/python-arrow/python-arrow.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-arrow
> +#
> +################################################################################
> +
> +PYTHON_ARROW_VERSION = 0.10.0
> +PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
> +PYTHON_ARROW_SITE = https://pypi.python.org/packages/54/db/76459c4dd3561bbe682619a5c576ff30c42e37c2e01900ed30a501957150
> +PYTHON_ARROW_SETUP_TYPE = setuptools
> +PYTHON_ARROW_LICENSE = Apache-2.0
> +PYTHON_ARROW_LICENSE_FILES = LICENSE docs/_themes/COPYING.txt
> +
> +$(eval $(python-package))
> --
> 2.1.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
