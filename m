From: Yegor Yefremov <yegorslists@googlemail.com>
Date: Sat, 3 Jun 2017 07:23:13 +0200
Subject: [Buildroot] [PATCH v3 02/11] package/python-enum34: Switch
 setup type to 'setuptools'
In-Reply-To: <20170602235653.4655-3-andrew.smirnov@gmail.com>
References: <20170602235653.4655-1-andrew.smirnov@gmail.com>
 <20170602235653.4655-3-andrew.smirnov@gmail.com>
Message-ID: <CAGm1_kuJ-oeQFXsPv4b-wB5uf6p4AXoUjJ4_14iQBjHeLmuHeg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

On Sat, Jun 3, 2017 at 1:56 AM, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Enum34's setup.py imports 'setuptools' directly, without any fallback
> logic, so we need to have host-setuptools in order to install
> it. Switching this also removes unspecified implicit dependency on
> BR2_PACKAGE_PYTHON_ZLIB, by not installing the package as zipped .egg
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  package/python-enum34/python-enum34.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/package/python-enum34/python-enum34.mk b/package/python-enum34/python-enum34.mk
> index 1a4c6c6..c612cb6 100644
> --- a/package/python-enum34/python-enum34.mk
> +++ b/package/python-enum34/python-enum34.mk
> @@ -7,7 +7,7 @@
>  PYTHON_ENUM34_VERSION = 1.1.6
>  PYTHON_ENUM34_SOURCE = enum34-$(PYTHON_ENUM34_VERSION).tar.gz
>  PYTHON_ENUM34_SITE = https://pypi.python.org/packages/bf/3e/31d502c25302814a7c2f1d3959d2a3b3f78e509002ba91aea64993936876
> -PYTHON_ENUM34_SETUP_TYPE = distutils
> +PYTHON_ENUM34_SETUP_TYPE = setuptools
>  PYTHON_ENUM34_LICENSE = BSD-3-Clause
>  PYTHON_ENUM34_LICENSE_FILES = enum/LICENSE

Such a patch has been already applied.

Commit 3c54b7086fc0eaddb7f04560f30bb8cc99860b25

Yegor
