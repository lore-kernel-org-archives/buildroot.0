From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 19 Apr 2016 21:05:22 +0200
Subject: [Buildroot] [PATCH v4 1/1] package/freeswitch: select OpenCV
 modules needed for mod_cv
In-Reply-To: <1461085245-30787-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461085245-30787-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160419210522.1df89766@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 19 Apr 2016 19:00:45 +0200, Bernd Kuhls wrote:

> diff --git a/package/freeswitch/Config.in b/package/freeswitch/Config.in
> index 1350b2b..cef3fd4 100644
> --- a/package/freeswitch/Config.in
> +++ b/package/freeswitch/Config.in
> @@ -7,6 +7,17 @@ menuconfig BR2_PACKAGE_FREESWITCH
>  	depends on BR2_USE_WCHAR # libuuid
>  	select BR2_PACKAGE_LIBCURL
>  	select BR2_PACKAGE_JPEG
> +	# src/mod/applications/mod_cv/mod_cv.cpp includes cv.h
> +	select BR2_PACKAGE_OPENCV_LIB_CALIB3D if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_CONTRIB if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_FLANN if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_LEGACY if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT if BR2_PACKAGE_OPENCV
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEO if BR2_PACKAGE_OPENCV
> +	# src/mod/applications/mod_cv/mod_cv.cpp includes highgui.h
> +	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI if BR2_PACKAGE_OPENCV

Now that inter-module dependencies are properly handled in opencv.mk,
why do we have to do all of this?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
