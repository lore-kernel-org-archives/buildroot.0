From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:27:56 +0200
Subject: [Buildroot] [PATCH v6 05/16] package/opencv: reword modules'
 prompt and help text
In-Reply-To: <1435262397-888-6-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-6-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626152756.GA27480@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> This patch is mostly cosmetic changes improving the human interface.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v5->v6:
> - fix prompts de help texts (Yann, ThomasP)
> 
> changes v4->v5:
> - new patch
> ---
>  package/opencv/Config.in | 52 +++++++++++++++++++++++++++---------------------
>  1 file changed, 29 insertions(+), 23 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 87f4bf5..4f29ffd 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -24,7 +24,8 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> -	  Include opencv_calib3d module into the OpenCV build.
> +	  Include opencv_calib3d (camera calibration and 3d reconstruction) module
> +	  into the OpenCV build.
>  
>  # opencv_core module is automatically enabled when OpenCV package is selected
>  
> @@ -35,14 +36,16 @@ config BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_ML
>  	help
> -	  Include opencv_features2d module into the OpenCV build.
> +	  Include opencv_features2d (2d features framework) module into the OpenCV
> +	  build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_FLANN
>  	bool "flann"
>  	default y
>  	# opencv_core dependency is already enabled
>  	help
> -	  Include opencv_flann module into the OpenCV build.
> +	  Include opencv_flann (clustering and search in multi-dimensional spaces)
> +	  module into the OpenCV build.
>  
>  # opencv_hal (hardware acceleration layer (hal) module is required by
>  # opencv_core, so it is automatically enabled
> @@ -54,28 +57,29 @@ config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	help
> -	  Include opencv_highgui module into the OpenCV build.
> +	  Include opencv_highgui (high-level gui and media i/o) module into the
> +	  OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> -	bool "imgcodecs (image codecs)"
> +	bool "imgcodecs"
>  	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> -	  Include opencv_imgcodecs module into the OpenCV build.
> +	  Include opencv_imgcodecs (image codecs) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	bool "imgproc (image processing)"
> +	bool "imgproc"
>  	default y
>  	# opencv_core dependency is already enabled
>  	help
> -	  Include opencv_imgproc module into the OpenCV build.
> +	  Include opencv_imgproc (image processing) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_ML
> -	bool "ml (machine learning)"
> +	bool "ml"
>  	default y
>  	# opencv_core dependency is already enabled
>  	help
> -	  Include opencv_ml module into the OpenCV build.
> +	  Include opencv_ml (machine learning) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	bool "objdetect"
> @@ -84,25 +88,27 @@ config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_ML
>  	help
> -	  Include opencv_objdetect module into the OpenCV build.
> +	  Include opencv_objdetect (object detection) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_PHOTO
>  	bool "photo"
>  	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> -	  Include opencv_photo module into the OpenCV build.
> +	  Include opencv_photo (computational photography) module into the OpenCV
> +	  build.
>  
>  comment "opencv_python module requires numpy which is not yet available."
>  
>  config BR2_PACKAGE_OPENCV_LIB_SHAPE
> -	bool "shape (shape descriptors and matchers)"
> +	bool "shape"
>  	default y
>  	# opencv_core dependency is already enabled
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
> -	  Include opencv_shape module into the OpenCV build.
> +	  Include opencv_shape (shape descriptors and matchers) module into the
> +	  OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  	bool "stitching"
> @@ -112,7 +118,7 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>  	help
> -	  Include opencv_stitching module into the OpenCV build.
> +	  Include opencv_stitching (images stitching) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>  	bool "superres"
> @@ -120,11 +126,10 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
> -	  Include opencv_superres "super resolution" - module into the OpenCV
> -	  build.
> +	  Include opencv_superres (super resolution) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_TS
> -	bool "ts (touchscreen)"
> +	bool "ts"
>  	default y
>  	# opencv_core dependency is already enabled
>  	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
> @@ -132,22 +137,22 @@ config BR2_PACKAGE_OPENCV_LIB_TS
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEOIO
>  	help
> -	  Include opencv_ts module into the OpenCV build.
> +	  Include opencv_ts (test) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOIO
> -	bool "videoio (media i/o)"
> +	bool "videoio"
>  	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> -	  Include opencv_videoio module into the OpenCV build.
> +	  Include opencv_videoio (media i/o) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	bool "video"
>  	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	help
> -	  Include opencv_video module into the OpenCV build.
> +	  Include opencv_video (video analysis) module into the OpenCV build.
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
>  	bool "videostab"
> @@ -158,7 +163,8 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
>  	select BR2_PACKAGE_OPENCV_LIB_PHOTO
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
> -	  Include opencv_videostab module into the OpenCV build.
> +	  Include opencv_videostab (video stabilization) module into the OpenCV
> +	  build.
>  
>  comment "Test sets"
>  config BR2_PACKAGE_OPENCV_BUILD_TESTS
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
