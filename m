From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 4 May 2014 12:10:20 +0200
Subject: [Buildroot] [PATCH v2 24/24] gst1-plugins-bad: rework opencv
 plugin dependencies
In-Reply-To: <1398208556-4195-25-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
 <1398208556-4195-25-git-send-email-s.martin49@gmail.com>
Message-ID: <20140504101020.GK3211@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel, All,

On 2014-04-23 01:15 +0200, Samuel Martin spake thusly:
> gst1 opencv plugin source code still include OpenCV's headers from its
> deprecated API.
> 
> Use the newly introduced BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS to
> select all required OpenCV module dependencies.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> changes v1 -> v2:
> - new patch
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 10 +---------
>  1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 02fa18c..e8bc110 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -429,15 +429,7 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
>  	# Remove the following opencv modules when gstreamer fixes the
>  	# problem of including the old "cv.h" header
>  	# bug: https://bugzilla.gnome.org/show_bug.cgi?id=725163
> -	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> -	select BR2_PACKAGE_OPENCV_LIB_CONTRIB
> -	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> -	select BR2_PACKAGE_OPENCV_LIB_FLANN
> -	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> -	select BR2_PACKAGE_OPENCV_LIB_LEGACY
> -	select BR2_PACKAGE_OPENCV_LIB_ML
> -	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> -	select BR2_PACKAGE_OPENCV_LIB_VIDEO
> +	select BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
>  	help
>  	  GStreamer OpenCV Plugins
>  
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
