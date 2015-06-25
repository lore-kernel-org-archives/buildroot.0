From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 00:00:56 +0200
Subject: [Buildroot] [PATCH v6 01/16] package/opencv: alphabetically
 sorted each _CONF_OPTS group
In-Reply-To: <1435262397-888-2-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-2-git-send-email-s.martin49@gmail.com>
Message-ID: <20150625220056.GG4178@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> No new option added nor removed.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v5->v6:
> - fix configure options ordering (Yann)
> 
> changes v4->v5:
> - new patch
> ---
>  package/opencv/opencv.mk | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 9967abc..ee11220 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -12,9 +12,9 @@ OPENCV_LICENSE_FILES = LICENSE
>  
>  # OpenCV component options
>  OPENCV_CONF_OPTS += \
> -	-DBUILD_WITH_DEBUG_INFO=OFF \
>  	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
> -	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
> +	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF) \
> +	-DBUILD_WITH_DEBUG_INFO=OFF
>  
>  # OpenCV build options
>  OPENCV_CONF_OPTS += \
> @@ -71,14 +71,14 @@ OPENCV_CONF_OPTS += \
>  # * PowerPC support is turned off since its only effect is altering CFLAGS,
>  #   adding '-mcpu=G3 -mtune=G5' to them, which is already handled by Buildroot.
>  OPENCV_CONF_OPTS += \
> +	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
> +	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
>  	-DENABLE_POWERPC=OFF \
>  	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF) \
>  	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF) \
>  	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF) \
>  	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE4),ON,OFF) \
>  	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
> -	-DENABLE_AVX=$(if $(BR2_X86_CPU_HAS_AVX),ON,OFF) \
> -	-DENABLE_AVX2=$(if $(BR2_X86_CPU_HAS_AVX2),ON,OFF) \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
>  
>  # Cuda stuff
> @@ -92,8 +92,8 @@ OPENCV_CONF_OPTS += -DWITH_NVCUVID=OFF
>  
>  # AMD stuff
>  OPENCV_CONF_OPTS += \
> -	-DWITH_OPENCLAMDFFT=OFF \
> -	-DWITH_OPENCLAMDBLAS=OFF
> +	-DWITH_OPENCLAMDBLAS=OFF \
> +	-DWITH_OPENCLAMDFFT=OFF
>  
>  # Intel stuff
>  OPENCV_CONF_OPTS += \
> @@ -112,12 +112,12 @@ OPENCV_CONF_OPTS += -DWITH_XIMEA=OFF
>  
>  # Non-Linux support (Android options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> -	-DWITH_ANDROID_CAMERA=OFF \
>  	-DBUILD_ANDROID_CAMERA_WRAPPER=OFF \
>  	-DBUILD_ANDROID_EXAMPLES=OFF \
> -	-DINSTALL_ANDROID_EXAMPLES=OFF \
>  	-DBUILD_FAT_JAVA_LIB=OFF \
> -	-DBUILD_JAVA_SUPPORT=OFF
> +	-DBUILD_JAVA_SUPPORT=OFF \
> +	-DINSTALL_ANDROID_EXAMPLES=OFF \
> +	-DWITH_ANDROID_CAMERA=OFF
>  
>  # Non-Linux support (Mac OSX options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> @@ -127,22 +127,22 @@ OPENCV_CONF_OPTS += \
>  
>  # Non-Linux support (Windows options) must remain OFF:
>  OPENCV_CONF_OPTS += \
> -	-DWITH_VFW=OFF \
> -	-DWITH_WIN32UI=OFF \
>  	-DWITH_CSTRIPES=OFF \
>  	-DWITH_DSHOW=OFF \
>  	-DWITH_MSMF=OFF \
> -	-DWITH_VIDEOINPUT=OFF
> +	-DWITH_VFW=OFF \
> +	-DWITH_VIDEOINPUT=OFF \
> +	-DWITH_WIN32UI=OFF
>  
>  # Software/3rd-party support options.
>  OPENCV_CONF_OPTS += \
>  	-DBUILD_JASPER=OFF \
>  	-DBUILD_JPEG=OFF \
> +	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
>  	-DBUILD_OPENEXR=OFF \
>  	-DBUILD_PNG=OFF \
>  	-DBUILD_TIFF=OFF \
>  	-DBUILD_ZLIB=OFF \
> -	-DBUILD_NEW_PYTHON_SUPPORT=OFF \
>  	-DINSTALL_C_EXAMPLES=OFF \
>  	-DINSTALL_PYTHON_EXAMPLES=OFF \
>  	-DINSTALL_TO_MANGLED_PATHS=OFF
> @@ -221,8 +221,8 @@ endif
>  
>  ifeq ($(BR2_PACKAGE_OPENCV_WITH_V4L),y)
>  OPENCV_CONF_OPTS += \
> -	-DWITH_V4L=ON \
> -	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF)
> +	-DWITH_LIBV4L=$(if $(BR2_PACKAGE_LIBV4L),ON,OFF) \
> +	-DWITH_V4L=ON
>  OPENCV_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBV4L),libv4l)
>  else
>  OPENCV_CONF_OPTS += -DWITH_V4L=OFF -DWITH_LIBV4L=OFF
> -- 
> 2.4.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
