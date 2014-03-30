From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 30 Mar 2014 20:30:52 +0300
Subject: [Buildroot] [PATCH v2 3/3] xtensa: remove
 -mtext-section-literals from individual package *.mk's
In-Reply-To: <1396198538-32628-4-git-send-email-jcmvbkbc@gmail.com>
References: <1396198538-32628-1-git-send-email-jcmvbkbc@gmail.com>
 <1396198538-32628-4-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <20140330173052.GP4579@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Max,

On Sun, Mar 30, 2014 at 08:55:38PM +0400, Max Filippov wrote:
> Now that -mtext-section-literals is specified in xtensa ABI remove it
> from individual packages that needed it.
> 
> Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
> ---
> Changes v1 -> v2:
> - new patch
> 
>  package/civetweb/civetweb.mk                | 3 ---
>  package/ffmpeg/ffmpeg.mk                    | 4 ----
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk  | 4 ----
>  package/gstreamer1/gst1-libav/gst1-libav.mk | 4 ----
>  package/lmbench/lmbench.mk                  | 4 ----
>  package/php/php.mk                          | 4 ----
>  package/sqlcipher/sqlcipher.mk              | 4 ----
>  package/sqlite/sqlite.mk                    | 4 ----
>  8 files changed, 31 deletions(-)

[snip]

> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index eb7389f..1975682 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -16,10 +16,6 @@ GST_FFMPEG_CONF_EXTRA_OPT = \
>  
>  GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
>  
> -ifeq ($(BR2_xtensa),y)
> -GST_FFMPEG_CFLAGS += -mtext-section-literals
> -endif
> -
>  GST_FFMPEG_CONF_ENV = CFLAGS="$(GST_FFMPEG_CFLAGS)"

Both GST_FFMPEG_CONF_ENV and GST_FFMPEG_CFLAGS are not used anywhere else.

>  ifeq ($(BR2_PACKAGE_ZLIB),y)
> diff --git a/package/gstreamer1/gst1-libav/gst1-libav.mk b/package/gstreamer1/gst1-libav/gst1-libav.mk
> index a0a536e..6e6ff51 100644
> --- a/package/gstreamer1/gst1-libav/gst1-libav.mk
> +++ b/package/gstreamer1/gst1-libav/gst1-libav.mk
> @@ -85,10 +85,6 @@ GST1_LIBAV_CONF_OPT = \
>  
>  GST1_LIBAV_CFLAGS = $(TARGET_CFLAGS)
>  
> -ifeq ($(BR2_xtensa),y)
> -GST1_LIBAV_CFLAGS += -mtext-section-literals
> -endif
> -
>  GST1_LIBAV_CONF_ENV += CFLAGS="$(GST1_LIBAV_CFLAGS)"

Ditto.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
