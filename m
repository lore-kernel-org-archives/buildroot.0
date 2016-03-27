From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 27 Mar 2016 09:21:07 +0200
Subject: [Buildroot] [PATCH 06/18] package/opencv3: bump version to 3.1.0
In-Reply-To: <1459030883-15232-6-git-send-email-bernd.kuhls@t-online.de>
References: <1459030883-15232-1-git-send-email-bernd.kuhls@t-online.de>
 <1459030883-15232-6-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAHXCMMKvQ5kGYY1sj0MyQg5LYrkxqu6eSnLkc52xao8WueRmzg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd,

On Sat, Mar 26, 2016 at 11:21 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
> Removed patches applied upstream. This version bump is needed to
> provide support for ffmpeg 3.0:
> https://github.com/Itseez/opencv/commit/278747ba458c9097aa72bf664c7a8df96d3a56fa
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...pthread-based-parallel_for-with-gcc-4.4.3.patch |  62 ------
>  ...002-fix-support-for-pthreads-parallel_for.patch | 212 ---------------------
>  package/opencv3/opencv3.mk                         |   2 +-
>  3 files changed, 1 insertion(+), 275 deletions(-)
>  delete mode 100644 package/opencv3/0001-Fixed-compilation-of-pthread-based-parallel_for-with-gcc-4.4.3.patch
>  delete mode 100644 package/opencv3/0002-fix-support-for-pthreads-parallel_for.patch
>
[...]
> diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
> index 3ce78b5..bbf4a8b 100644
> --- a/package/opencv3/opencv3.mk
> +++ b/package/opencv3/opencv3.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -OPENCV3_VERSION = 3.0.0
> +OPENCV3_VERSION = 3.1.0
>  OPENCV3_SITE = $(call github,itseez,opencv,$(OPENCV3_VERSION))
>  OPENCV3_INSTALL_STAGING = YES
>  OPENCV3_LICENSE = BSD-3c

OpenCV 3.1.0 gets a couple of new options, which some are ON by
default; it may be worthwhile to disable them:
WITH_MATLAB, WITH_VA, WITH_VA_INTEL, DOWNLOAD_EXTERNAL_TEST_DATA.
This new OpenCV3 release also loses the BUILD_opencv_hal option.

Regards,

-- 
Samuel
