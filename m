From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Mon, 9 Dec 2013 15:36:18 +0100
Subject: [Buildroot] [PATCH 33/38] python-tornado: new package
In-Reply-To: <1386540907-7242-34-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386540907-7242-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386540907-7242-34-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <CAAXf6LU3EP66abxnzHtme4-CG--e6TQtz6keZCQuRxQ1T4j1KA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Dec 8, 2013 at 11:15 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> From: Ryan Barnett <ryanbarnett3@gmail.com>
>
> Signed-off-by: Ryan Barnett <rjbarnet@rockwellcollins.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/Config.in                        |  1 +
>  package/python-tornado/Config.in         |  8 ++++++++
>  package/python-tornado/python-tornado.mk | 13 +++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/python-tornado/Config.in
>  create mode 100644 package/python-tornado/python-tornado.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index 1f45ea0..269ac5a 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -408,6 +408,7 @@ source "package/python-serial/Config.in"
>  source "package/python-setuptools/Config.in"
>  source "package/python-simplejson/Config.in"
>  source "package/python-thrift/Config.in"
> +source "package/python-tornado/Config.in"
>  source "package/python-versiontools/Config.in"
>  endmenu
>  endif
> diff --git a/package/python-tornado/Config.in b/package/python-tornado/Config.in
> new file mode 100644
> index 0000000..c127d0e
> --- /dev/null
> +++ b/package/python-tornado/Config.in
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_PYTHON_TORNADO
> +       bool "python-tornado"
> +       depends on BR2_PACKAGE_PYTHON
> +       help
> +         Tornado is a Python web framework and asynchronous networking
> +         library, originally developed at FriendFeed.
> +
> +         http://www.tornadoweb.org
> diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
> new file mode 100644
> index 0000000..0aeef86
> --- /dev/null
> +++ b/package/python-tornado/python-tornado.mk
> @@ -0,0 +1,13 @@
> +################################################################################
> +#
> +# python-tornado
> +#
> +################################################################################
> +
> +PYTHON_TORNADO_VERSION = 3.1.1
> +PYTHON_TORNADO_SOURCE  = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
> +PYTHON_TORNADO_SITE    = https://pypi.python.org/packages/source/t/tornado
> +PYTHON_TORNADO_LICENSE = Apache-v2
> +PYTHON_TORNADO_SETUP_TYPE = setuptools

Seems Ludovic is not the only one adding these spaces.
I won't repeat this comment on each patch then, but of course it
applies on all of them.
