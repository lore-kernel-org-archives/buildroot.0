From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Thu, 5 Feb 2015 15:07:14 +0100
Subject: [Buildroot] [PATCH] python-cherrypy: new package
In-Reply-To: <1423144225-26837-1-git-send-email-fhunleth@troodon-software.com>
References: <1423144225-26837-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <CAGm1_ks1xu=pQDG7ZYbhSsv4ScU2UcSerZnr0b2Myn3Wb1xrhw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 5, 2015 at 2:50 PM, Frank Hunleth
<fhunleth@troodon-software.com> wrote:
> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
> ---
>  package/Config.in                          |  1 +
>  package/python-cherrypy/Config.in          |  7 +++++++
>  package/python-cherrypy/python-cherrypy.mk | 14 ++++++++++++++
>  3 files changed, 22 insertions(+)
>  create mode 100644 package/python-cherrypy/Config.in
>  create mode 100644 package/python-cherrypy/python-cherrypy.mk
>
> diff --git a/package/Config.in b/package/Config.in
> index fe3d3d0..a5d1be5 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -510,6 +510,7 @@ menu "external python modules"
>         source "package/python-certifi/Config.in"
>         source "package/python-cffi/Config.in"
>         source "package/python-cheetah/Config.in"
> +       source "package/python-cherrypy/Config.in"
>         source "package/python-coherence/Config.in"
>         source "package/python-configobj/Config.in"
>         source "package/python-configshell-fb/Config.in"
> diff --git a/package/python-cherrypy/Config.in b/package/python-cherrypy/Config.in
> new file mode 100644
> index 0000000..d66dc16
> --- /dev/null
> +++ b/package/python-cherrypy/Config.in
> @@ -0,0 +1,7 @@
> +config BR2_PACKAGE_PYTHON_CHERRYPY
> +       bool "python-cherrypy"
> +       depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3

remove depends statement. You need this only, if your package can run
either under Python 2.x or 3.x

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> +       help
> +         A minimalist web framework
> +
> +         http://www.cherrypy.org
> diff --git a/package/python-cherrypy/python-cherrypy.mk b/package/python-cherrypy/python-cherrypy.mk
> new file mode 100644
> index 0000000..a08b21a
> --- /dev/null
> +++ b/package/python-cherrypy/python-cherrypy.mk
> @@ -0,0 +1,14 @@
> +################################################################################
> +#
> +# python-cherrypy
> +#
> +################################################################################
> +
> +PYTHON_CHERRYPY_VERSION = 3.6.0
> +PYTHON_CHERRYPY_SOURCE = CherryPy-$(PYTHON_CHERRYPY_VERSION).tar.gz
> +PYTHON_CHERRYPY_SITE = http://pypi.python.org/packages/source/C/CherryPy
> +PYTHON_CHERRYPY_LICENSE = BSD-3c
> +PYTHON_CHERRYPY_LICENSE_FILES = LICENSE.txt
> +PYTHON_CHERRYPY_SETUP_TYPE = distutils
> +
> +$(eval $(python-package))
> --
> 1.9.1
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
