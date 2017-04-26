From: Baruch Siach <baruch@tkos.co.il>
Date: Wed, 26 Apr 2017 06:38:12 +0300
Subject: [Buildroot] [PATCH 9/9] package/python-ipython: Add dependecy
 list
In-Reply-To: <20170425191423.13294-10-andrew.smirnov@gmail.com>
References: <20170425191423.13294-1-andrew.smirnov@gmail.com>
 <20170425191423.13294-10-andrew.smirnov@gmail.com>
Message-ID: <20170426033812.mzyxtmigeaz7m5zz@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andrey,

On Tue, Apr 25, 2017 at 12:14:23PM -0700, Andrey Smirnov wrote:
> List minimal set of packages needed to be installed alongside to be able
> to run IPython with Python 3 (not tested on Python 2)

[...]

> diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
> index e57d69d..f627846 100644
> --- a/package/python-ipython/python-ipython.mk
> +++ b/package/python-ipython/python-ipython.mk
> @@ -10,5 +10,19 @@ PYTHON_IPYTHON_SITE = https://pypi.python.org/packages/6e/cf/c2a3ca5942e2d808457
>  PYTHON_IPYTHON_LICENSE = BSD-3-Clause
>  PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst
>  PYTHON_IPYTHON_SETUP_TYPE = distutils
> +PYTHON_IPYTHON_DEPENDS = 	\
> +	python-traitlets 	\
> +	python-six 		\
> +	python-ipython-genutils \
> +	python-pygments		\
> +	python-pexpect		\
> +	python-ptyprocess	\
> +	python-pickleshare	\
> +	python-prompt-toolkit	\
> +	python-simplegeneric
> +
> +ifeq ($(BR2_PACKAGE_PYTHON),y)
> +PYTHON_IPYTHON_DEPENDS += python-backports-shutil-get-terminal-size
> +endif

Are these run-time only dependencies? If so there is no need to list them in 
<PKG>_DEPENDS, since they are not needed at build time.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
