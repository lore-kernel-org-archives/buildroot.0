From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 18 Oct 2020 21:45:49 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add webp support
In-Reply-To: <20201018150211.1299636-1-fontaine.fabrice@gmail.com>
References: <20201018150211.1299636-1-fontaine.fabrice@gmail.com>
Message-ID: <20201018194549.GD3466@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fabrice, All,

On 2020-10-18 17:02 +0200, Fabrice Fontaine spake thusly:
> webp support is available since version 3.0.0 and
> https://github.com/opencv/opencv/commit/500b7318beee639d8c341e9ea63ac7610ca225f4
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/opencv3/Config.in  | 8 ++++++++
>  package/opencv3/opencv3.mk | 8 +++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
> index ac7da67c5f..b9ea033f13 100644
> --- a/package/opencv3/Config.in
> +++ b/package/opencv3/Config.in
> @@ -312,6 +312,14 @@ config BR2_PACKAGE_OPENCV3_WITH_V4L
>  	  If the package libv4l is enabled, its support is
>  	  automatically enabled.
>  
> +config BR2_PACKAGE_OPENCV3_WITH_WEBP
> +	bool "webp support"
> +	select BR2_PACKAGE_WEBP
> +	help
> +	  Enable WebP support.
> +
> +	  Use shared libwebp from the target system.
> +
>  comment "Install options"
>  
>  config BR2_PACKAGE_OPENCV3_INSTALL_DATA
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index c67387e114..8cd28cbf0c 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -223,7 +223,6 @@ OPENCV3_CONF_OPTS += \
>  	-DWITH_VA=OFF \
>  	-DWITH_VA_INTEL=OFF \
>  	-DWITH_VTK=OFF \
> -	-DWITH_WEBP=OFF \
>  	-DWITH_XINE=OFF
>  
>  OPENCV3_DEPENDENCIES += host-pkgconf zlib
> @@ -318,6 +317,13 @@ else
>  OPENCV3_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
>  endif
>  
> +ifeq ($(BR2_PACKAGE_OPENCV3_WITH_WEBP),y)
> +OPENCV3_CONF_OPTS += -DWITH_WEBP=ON
> +OPENCV3_DEPENDENCIES += webp
> +else
> +OPENCV3_CONF_OPTS += -DWITH_WEBP=OFF
> +endif
> +
>  ifeq ($(BR2_PACKAGE_OPENCV3_LIB_PYTHON),y)
>  OPENCV3_CONF_OPTS += \
>  	-DBUILD_opencv_python2=OFF \
> -- 
> 2.28.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
