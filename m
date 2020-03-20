From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 20 Mar 2020 15:08:03 +0100
Subject: [Buildroot] [PATCH v6 1/4] package/python-numpy: Bump to
 version 1.18.1
In-Reply-To: <20200318090740.4973-2-jagan@amarulasolutions.com>
References: <20200318090740.4973-1-jagan@amarulasolutions.com>
 <20200318090740.4973-2-jagan@amarulasolutions.com>
Message-ID: <20200320150803.283ade11@x230_1.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Wed, 18 Mar 2020 14:37:37 +0530
Jagan Teki <jagan@amarulasolutions.com> wrote:

> Bump the python-numpy version to 1.18.1.
> 
> Drop BR2_PACKAGE_PYTHON dependency from
> - opencv3
> - gnuadio
> python support since numpy now support only for python3.
> 
> Cc: Samuel Martin <s.martin49@gmail.com>
> Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> Cc: Esben Haabendal <esben@geanix.com>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v6:
> - new patch
> 
>  package/gnuradio/Config.in             |  2 +-
>  package/opencv3/Config.in              |  2 +-
>  package/python-numpy/Config.in         |  2 ++
>  package/python-numpy/python-numpy.hash | 14 +++++++-------
>  package/python-numpy/python-numpy.mk   |  4 +++-
>  5 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/package/gnuradio/Config.in b/package/gnuradio/Config.in
> index 6d438bcd6f..bf69ed605b 100644
> --- a/package/gnuradio/Config.in
> +++ b/package/gnuradio/Config.in
> @@ -63,7 +63,7 @@ config BR2_PACKAGE_GNURADIO_FEC
>  
>  config BR2_PACKAGE_GNURADIO_PYTHON
>  	bool "python support"
> -	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL #
> python-numpy select BR2_PACKAGE_BOOST_PYTHON
If you drop python2 support maybe you need to drop in gnuradio.mk too.
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index d4b17b6acf..18c390c515 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -156,7 +156,7 @@ config BR2_PACKAGE_OPENCV3_LIB_PHOTO
>  
>  config BR2_PACKAGE_OPENCV3_LIB_PYTHON
>  	bool "python"
> -	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
> +	depends on BR2_PACKAGE_PYTHON3
>  	depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL #
> python-numpy select BR2_PACKAGE_PYTHON_NUMPY
Same as gnuradio.mk

[...]

Gwenhael
