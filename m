From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Fri, 9 Jun 2017 21:36:24 +0200
Subject: [Buildroot] [PATCH v3 03/11] package/python-simplegeneric:
 Switch setup type to 'setuptools'
In-Reply-To: <20170602235653.4655-4-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-4-andrew.smirnov@gmail.com>
Message-ID: <CAGm1_ksNSgq54_qmv+3st0d8L4+LR0gqCMFzZFWR+t=AcqOZzw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Specifying setup type to be 'distutils' results in this package being
> installed as .egg, a zipped file, which inadvertantly makes
> 'simplegeneric' to be dependent on BR2_PACKAGE_PYTHON*_ZLIB. In order
> to avoid that specify setup type to be 'setuptools' which would use
> --single-version-externally-managed and install the package as .pyc
> and a .egg-info folder.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Yegor Yefremov <yegorslists@googlemail.com>

> ---
>  package/python-simplegeneric/python-simplegeneric.mk | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/package/python-simplegeneric/python-simplegeneric.mk b/package/python-simplegeneric/python-simplegeneric.mk
> index 556a478..1d195c3 100644
> --- a/package/python-simplegeneric/python-simplegeneric.mk
> +++ b/package/python-simplegeneric/python-simplegeneric.mk
> @@ -8,7 +8,13 @@ PYTHON_SIMPLEGENERIC_VERSION = 0.8.1
>  PYTHON_SIMPLEGENERIC_SOURCE = simplegeneric-$(PYTHON_SIMPLEGENERIC_VERSION).zip
>  PYTHON_SIMPLEGENERIC_SITE = https://pypi.python.org/packages/3d/57/4d9c9e3ae9a255cd4e1106bb57e24056d3d0709fc01b2e3e345898e49d5b
>  PYTHON_SIMPLEGENERIC_LICENSE = ZPL-2.1
> -PYTHON_SIMPLEGENERIC_SETUP_TYPE = distutils
> +#
> +# Force setup-type to be 'setuptools' in order to force package to be
> +# installed with --single-version-externally-managed. Otherwise we'll
> +# end up wit a .egg file, which is a zip archive, and as such forces
> +# use to have 'zlib' as a runtime dependency
> +#
> +PYTHON_SIMPLEGENERIC_SETUP_TYPE = setuptools
>
>  define PYTHON_SIMPLEGENERIC_EXTRACT_CMDS
>         unzip $(DL_DIR)/$(PYTHON_SIMPLEGENERIC_SOURCE) -d $(@D)
> --
> 2.9.4
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
