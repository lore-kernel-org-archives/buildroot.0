From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 18 Apr 2016 23:28:47 +0200
Subject: [Buildroot] [PATCH v3 1/2] package/opencv: add inter-module
	dependencies
In-Reply-To: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461010675-8274-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMKE14AdDGfh6jXOwZBHSgKJ+YbbP2jd97uPgVN1fanCUA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, all,

On Mon, Apr 18, 2016 at 10:17 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> As stated by Samuel the opencv2 package lacks inter-module dependencies:
> http://lists.busybox.net/pipermail/buildroot/2016-April/158902.html
>
> This patch adds the necessary code for freeswitch's mod_cv to compile.
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> v3: add more dependencies
> v2: initial release (Samuel)
>
>  package/opencv/Config.in | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/package/opencv/Config.in b/package/opencv/Config.in
> index 8bc6c34..b563312 100644
> --- a/package/opencv/Config.in
> +++ b/package/opencv/Config.in
> @@ -23,6 +23,13 @@ config BR2_PACKAGE_OPENCV_LIB_CALIB3D
>  config BR2_PACKAGE_OPENCV_LIB_CONTRIB
>         bool "contrib"
>         default y
> +       # modules/contrib/CMakeLists.txt
> +       select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> +       select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
> +       select BR2_PACKAGE_OPENCV_LIB_IMGPROC
> +       select BR2_PACKAGE_OPENCV_LIB_ML
> +       select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
> +       select BR2_PACKAGE_OPENCV_LIB_VIDEO
>         help
>           Include opencv_contrib module into the OpenCV build.
>
> @@ -46,6 +53,8 @@ config BR2_PACKAGE_OPENCV_LIB_GPU
>  config BR2_PACKAGE_OPENCV_LIB_HIGHGUI
>         bool "highgui"
>         default y
> +       # modules/highgui/CMakeLists.txt
> +       select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>         help
>           Include opencv_highgui module into the OpenCV build.
>
> @@ -58,6 +67,10 @@ config BR2_PACKAGE_OPENCV_LIB_IMGPROC
>  config BR2_PACKAGE_OPENCV_LIB_LEGACY
>         bool "legacy"
>         default y
> +       # modules/legacy/CMakeLists.txt
> +       select BR2_PACKAGE_OPENCV_LIB_CALIB3D
> +       select BR2_PACKAGE_OPENCV_LIB_ML
> +       select BR2_PACKAGE_OPENCV_LIB_VIDEO
>         help
>           Include opencv_legacy module into the OpenCV build.
>
> @@ -75,6 +88,8 @@ config BR2_PACKAGE_OPENCV_LIB_NONFREE
>  config BR2_PACKAGE_OPENCV_LIB_OBJDETECT
>         bool "objdetect"
>         default y
> +       # modules/objdetect/CMakeLists.txt
> +       select BR2_PACKAGE_OPENCV_LIB_IMGPROC
>         help
>           Include opencv_objdetect module into the OpenCV build.
>

Though this patch only fixes what is needed to meet the freeswitch's
deps, these deps. are correct.

Regards,

-- 
Samuel
