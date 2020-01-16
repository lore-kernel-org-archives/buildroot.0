From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 16 Jan 2020 07:35:33 +0200
Subject: [Buildroot] [PATCH v2] package/python-pillow: bump to version
 6.2.2/7.0.0
In-Reply-To: <20200115210036.29906-1-angelo@amarulasolutions.com>
References: <20200115210036.29906-1-angelo@amarulasolutions.com>
Message-ID: <20200116053533.qyhozaffvp6ilwn7@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Angelo,

On Wed, Jan 15, 2020 at 10:00:36PM +0100, Angelo Compagnucci wrote:
> This patch bump Pillow to version 7.0.0 for Python3 and version
> 6.2.2 for Python2.
> 
> It updates also the LICENSE hash due to copyright year update.
> 
> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> ---
> Changelog:
> v1->v2: removed python2 support as the package supports only python3 now

Subject and commit log need update, then.

baruch

> 
>  package/python-pillow/Config.in          | 1 +
>  package/python-pillow/python-pillow.hash | 8 ++++----
>  package/python-pillow/python-pillow.mk   | 4 ++--
>  3 files changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/package/python-pillow/Config.in b/package/python-pillow/Config.in
> index 3820ba8fb1..f824d1371e 100644
> --- a/package/python-pillow/Config.in
> +++ b/package/python-pillow/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_PYTHON_PILLOW
>  	bool "python-pillow"
> +	depends on BR2_PACKAGE_PYTHON3
>  	help
>  	  Pillow is the "friendly" PIL fork by Alex Clark and
>  	  Contributors. PIL is the Python Imaging Library by Fredrik
> diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
> index 990b25c46e..0d66c4bb3c 100644
> --- a/package/python-pillow/python-pillow.hash
> +++ b/package/python-pillow/python-pillow.hash
> @@ -1,5 +1,5 @@
> -# md5, sha256 from https://pypi.org/pypi/pillow/json
> -md5	13acde283ece6ac69f62609fa108d316  Pillow-6.2.1.tar.gz
> -sha256	bf4e972a88f8841d8fdc6db1a75e0f8d763e66e3754b03006cbc3854d89f1cb1  Pillow-6.2.1.tar.gz
> +# md5, sha256 from https://pypi.org/project/Pillow/
> +md5	d099946335c1ba372f5b1fa68ca71645  Pillow-7.0.0.tar.gz
> +sha256	4d9ed9a64095e031435af120d3c910148067087541131e82b3e8db302f4c8946  Pillow-7.0.0.tar.gz
>  # Locally computed sha256 checksums
> -sha256	64ea4328ed56392b423ef968519a9ad427e3de9b985862c95ed2ed4d793d22ee  LICENSE
> +sha256	04a04a908e52921829c7f51528e5619c79becdde99c484ab7d4f235e2927968c  LICENSE
> diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
> index 895b1fcb99..5ff2dcfdb6 100644
> --- a/package/python-pillow/python-pillow.mk
> +++ b/package/python-pillow/python-pillow.mk
> @@ -4,9 +4,9 @@
>  #
>  ################################################################################
>  
> -PYTHON_PILLOW_VERSION = 6.2.1
> +PYTHON_PILLOW_VERSION = 7.0.0
> +PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/39/47/f28067b187dd664d205f75b07dcc6e0e95703e134008a14814827eebcaab
>  PYTHON_PILLOW_SOURCE = Pillow-$(PYTHON_PILLOW_VERSION).tar.gz
> -PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/5b/bb/cdc8086db1f15d0664dd22a62c69613cdc00f1dd430b5b19df1bea83f2a3
>  PYTHON_PILLOW_LICENSE = PIL Software License
>  PYTHON_PILLOW_LICENSE_FILES = LICENSE
>  PYTHON_PILLOW_SETUP_TYPE = setuptools

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
