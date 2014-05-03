From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 00:34:57 +0200
Subject: [Buildroot] [PATCH v2 14/24] opencv: disable opencl
 support/module
In-Reply-To: <1398208556-4195-15-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-15-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503223456.GH13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, I have a question, below.

> ---
> changes v1 -> v2:
> - new patch (split suggested by Yann)
> ---
>  package/opencv/opencv.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index b87eddc..a4bdd39 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -59,6 +59,7 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
>  	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
>  	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
> +	-DBUILD_opencv_ocl=OFF                                                  \
>  	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
>  	-DBUILD_opencv_python=OFF                                               \
>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
> @@ -151,6 +152,7 @@ OPENCV_CONF_OPT += \
>  	-DWITH_1394=OFF    \
>  	-DWITH_EIGEN=OFF   \
>  	-DWITH_IMAGEIO=OFF \
> +	-DWITH_OPENCL=OFF  \

Here you have two options to disable it:
    -DBUILD_opencv_ocl=OFF
    -DWITH_OPENCL=OFF

But I did not see the same schema with other modules, such as the
dynamic cuda, where you only have:
    -DBUILD_opencv_dynamicuda=OFF

and not:
    -DWITH_DYNAMIC_CUDA=OFF

You are the cmake guy, but I'd like to understand the discrepancy
between the two, which when I look at the code, are defined in a similar
way.

Regards,
Yann E. MORIN.

>  	-DWITH_OPENEXR=OFF \
>  	-DWITH_OPENGL=OFF  \
>  	-DWITH_OPENNI=OFF  \
> -- 
> 1.9.2
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
