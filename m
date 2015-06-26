From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 26 Jun 2015 17:36:46 +0200
Subject: [Buildroot] [PATCH v6 07/16] package/opencv: disable all
	modules by default
In-Reply-To: <1435262397-888-8-git-send-email-s.martin49@gmail.com>
References: <1435262397-888-1-git-send-email-s.martin49@gmail.com>
 <1435262397-888-8-git-send-email-s.martin49@gmail.com>
Message-ID: <20150626153646.GE27480@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2015-06-25 21:59 +0200, Samuel Martin spake thusly:
> This change allows to reduce the size of the default OpenCV package, so
> the final root filesystem.
> 
> However, this will break any existing defconfig enabling OpenCV. Indeed,
> a minimal OpenCV  package will be built, whereas, prior to applying this
> patches, a full-featured one would have been built instead.
> 
> Cc: "Yann E. Morin" <yann.morin.1998@free.fr>
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Although I'm usually not opposed to getting the smallest possible config
as a default, however as you say this one breaks existing defconfigs.

OTOH, do we really care?

Anyway, I won't ack this one, but I am not opposed to it being merged
either.

Regards,
Yann E. MORIN.

> ---
> changes v5->v6:
> - new patch
> ---
>  package/opencv/Config.in | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index ce67f0c..3c00525 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -93,7 +93,6 @@ comment "opencv_python module requires numpy which is not yet available."
>  
>  config BR2_PACKAGE_OPENCV_LIB_SHAPE
>  	bool "shape"
> -	default y
>  	# opencv_core dependency is already enabled
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> @@ -103,7 +102,6 @@ config BR2_PACKAGE_OPENCV_LIB_SHAPE
>  
>  config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  	bool "stitching"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> @@ -113,7 +111,6 @@ config BR2_PACKAGE_OPENCV_LIB_STITCHING
>  
>  config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>  	bool "superres"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>  	help
> @@ -121,7 +118,6 @@ config BR2_PACKAGE_OPENCV_LIB_SUPERRES
>  
>  config BR2_PACKAGE_OPENCV_LIB_TS
>  	bool "ts"
> -	default y
>  	# opencv_core dependency is already enabled
>  	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>  	select BR2_PACKAGE_OPENCV_LIB_IMGCODECS
> @@ -145,7 +141,6 @@ config BR2_PACKAGE_OPENCV_LIB_VIDEO
>  
>  config BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB
>  	bool "videostab"
> -	default y
>  	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
>  	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
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
