From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:30:50 +0200
Subject: [Buildroot] [PATCH v6 06/16] package/opencv: reduce modules on
	by default
In-Reply-To: <1435262397-888-7-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-7-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626153050.GB27480@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> Since its integration into Buildroot, OpenCV always enables all modules
> by default because the inter-module denpedency were not supported.
> 
> Now that OpenCV inter-module dependencies are correctly set at the
> Buildroot configuration level, it is possible to reduce the enabled
> module list to its minimal set, letting kconfig enable the other
> modules.
> 
> This change will not change anything WRT a defconfig build with opencv.
> 
> Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v5->v6:
> - new patch
> ---
>  package/opencv/Config.in | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 4f29ffd..ce67f0c 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -20,7 +20,6 @@ comment "OpenCV modules"
>  
>  config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	bool "calib3d"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> @@ -31,7 +30,6 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  
>  config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	bool "features2d"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_FLANN
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_ML
> @@ -41,7 +39,6 @@ config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  
>  config BR2_PACKAGE_OPENCV_LIB_FLANN
>  	bool "flann"
> -	default y
>  	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_flann (clustering and search in multi-dimensional spaces)
> @@ -52,7 +49,6 @@ config BR2_PACKAGE_OPENCV_LIB_FLANN
>  
>  config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	bool "highgui"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
> @@ -62,28 +58,24 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
>  	bool "imgcodecs"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	bool "imgproc"
> -	default y
>  	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_imgproc (image processing) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_ML
>  	bool "ml"
> -	default y
>  	# opencv_core dependency is already enabled
>  	help
>  	  Include opencv_ml (machine learning) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	bool "objdetect"
> -	default y
>  	# opencv_core dependency is already enabled
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_ML
> @@ -92,7 +84,6 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  
>  config BR2_PACKAGE_OPENCV_LIB_PHOTO
>  	bool "photo"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_photo (computational photography) module into the OpenCV
> @@ -141,7 +132,6 @@ config BR2_PACKAGE_OPENCV_LIB_TS
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	bool "videoio"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> @@ -149,7 +139,6 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	bool "video"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
>  	  Include opencv_video (video analysis) module into the OpenCV build.
> -- 
> 2.4.4
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
