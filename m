From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Wed, 26 Feb 2014 10:18:34 +0000
Subject: [Buildroot] [git commit] gst1-plugins-bad: select all opencv
 modules needed
In-Reply-To: <20140225200719.BBFBF9B97B@busybox.osuosl.org>
References: <20140225200719.BBFBF9B97B@busybox.osuosl.org>
Message-ID: <530DBF7A.60207@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/25/2014 07:59 PM, Peter Korsgaard wrote:
> commit: http://git.buildroot.net/buildroot/commit/?id=3324f4e8b69ab49783a233b27c9b2edeecedb5ce
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>
> gstopencv.c includes the old-style header opencv/cv.h which includes a
> set of module's headers. To satisfy the opencv/cv.h requirements we need
> to select the modules which provide the required headers.
>
> Fixes:
>     http://autobuild.buildroot.net/results/f5b/f5b248eb7be38d6eb3655cdc1ab6ee5e716b9b29/
>
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Reviewed-by: Samuel Martin <smartin@aldebaran-robotics.com>
> Reviewed-by: Samuel Martin <s.martin49@gmail.com>
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>   package/gstreamer1/gst1-plugins-bad/Config.in |    9 +++++++++
>   1 files changed, 9 insertions(+), 0 deletions(-)
>
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 3647e53..efad91e 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -418,6 +418,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
>   	bool "opencv"
>   	depends on BR2_INSTALL_LIBSTDCPP
>   	select BR2_PACKAGE_OPENCV
> +	# Remove the following opencv modules when gstreamer fixes the
> +	# problem of including the old "cv.h" header
> +	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> +	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +	select BR2_PACKAGE_OPENCV_LIB_FLANN
> +	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +	select BR2_PACKAGE_OPENCV_LIB_LEGACY
> +	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> +	select BR2_PACKAGE_OPENCV_LIB_VIDEO
>   	help
>   	  GStreamer OpenCV Plugins
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

A bug has been reported upstream to fix this issue properly:

https://bugzilla.gnome.org/show_bug.cgi?id=725163

And good news, a GStreamer developer agreed with my proposal. Should we 
add the bug URL below the comments in the Config.in so the users who are 
interested on it can know all the reasons and follow the progress of 
this issue?

-- 
Vincent
