From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 00:23:35 +0200
Subject: [Buildroot] [PATCH v2 12/24] opencv: add superres module knob
In-Reply-To: <1398208556-4195-13-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-13-git-send-email-s.martin49@gmail.com>
Message-ID: <20140503222334.GF13170@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> This new module has been introduced in opencv-2.4.8.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> 
> ---
> changes v1 -> v2:
> - new patch (split suggested by Yann)
> ---
>  package/opencv/Config.in | 7 +++++++
>  package/opencv/opencv.mk | 1 +
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 2c6200c..129e0aa 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -92,6 +92,13 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  	help
>  	  Include opencv_stitching module into the OpenCV build.
>  
> +config BR2_PACKAGE_OPENCV_LIB_SUPERRES
> +	bool "superres"
> +	default y

We usually do not set options to 'default y', unless there is a very
stromg reason to do so.

With that 'default y' removed, or an explication why:
--> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +	help
> +	  Include opencv_superres "super resolution" - module into the OpenCV
> +	  build.
> +
>  config BR2_PACKAGE_OPENCV_LIB_TS
>  	bool "ts (touchscreen)"
>  	default y
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 264507c..f129dc3 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -61,6 +61,7 @@ OPENCV_CONF_OPT += \
>  	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
>  	-DBUILD_opencv_python=OFF                                               \
>  	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
> +	-DBUILD_opencv_superres=$(if $(BR2_PACKAGE_OPENCV_LIB_SUPERRES),ON,OFF) \
>  	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
>  	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
>  	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
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
