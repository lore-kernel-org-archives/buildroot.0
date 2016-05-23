From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Mon, 23 May 2016 09:02:00 +0200
Subject: [Buildroot] [PATCH v2] python-backports-ssl-match-hostname: new
	package
In-Reply-To: <1461332125-18295-1-git-send-email-yegorslists@googlemail.com>
References: <1461332125-18295-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <CAGm1_kvgg-hqRB2UMm=o5aC9LuLcxW-1jE=bjxysc8Y5oPOnoQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Apr 22, 2016 at 3:35 PM,  <yegorslists@googlemail.com> wrote:
> From: Yegor Yefremov <yegorslists@googlemail.com>
>
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> ---
> Changes:
>         v2: add Python 2 only dependency

I've got this patch [1] merged. So we don't really need this package.
I can either apply this patch or wait for next python-tornado release.

[1] https://github.com/tornadoweb/tornado/commit/24e7d3d1526ad915887062a8463dbd200ef97958

Yegor

>  package/Config.in                                          |  1 +
>  package/python-backports-ssl-match-hostname/Config.in      |  7 +++++++
>  .../python-backports-ssl-match-hostname.hash               |  4 ++++
>  .../python-backports-ssl-match-hostname.mk                 | 14 ++++++++++++++
>  4 files changed, 26 insertions(+)
>  create mode 100644 package/python-backports-ssl-match-hostname/Config.in
>  create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
>  create mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index f6407bb..e635b7d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -630,6 +630,7 @@ menu "External python modules"
>         source "package/python-alsaaudio/Config.in"
>         source "package/python-autobahn/Config.in"
>         source "package/python-backports-abc/Config.in"
> +       source "package/python-backports-ssl-match-hostname/Config.in"
>         source "package/python-beautifulsoup4/Config.in"
>         source "package/python-bottle/Config.in"
>         source "package/python-can/Config.in"
> diff --git a/package/python-backports-ssl-match-hostname/Config.in b/package/python-backports-ssl-match-hostname/Config.in
> new file mode 100644
> index 0000000..8e55191
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
> +       bool "python-backports-ssl-match-hostname"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         The ssl.match_hostname() function from Python 3.5.
> +
> +         http://bitbucket.org/brandon/backports.ssl_match_hostname
> diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
> new file mode 100644
> index 0000000..8313d96
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
> @@ -0,0 +1,4 @@
> +# md5 from https://pypi.python.org/pypi/backports.ssl_match_hostname/json
> +md5    c03fc5e2c7b3da46b81acf5cbacfe1e6  backports.ssl_match_hostname-3.5.0.1.tar.gz
> +# sha256 calculated by scanpypi
> +sha256 502ad98707319f4a51fa2ca1c677bd659008d27ded9f6380c79e8932e38dcdf2  backports.ssl_match_hostname-3.5.0.1.tar.gz
> diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
> new file mode 100644
> index 0000000..6848dd2
> --- /dev/null
> +++ b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-backports-ssl-match-hostname
> +#
> +################################################################################
> +
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.5.0.1
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE = backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://pypi.python.org/packages/source/b/backports.ssl_match_hostname
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python Software Foundation License v2
> +PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = backports/ssl_match_hostname/LICENSE.txt
> +
> +$(eval $(python-package))
> --
> 2.8.0.rc3
>
