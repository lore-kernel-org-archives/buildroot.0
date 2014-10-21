From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 23:18:11 +0200
Subject: [Buildroot] [PATCH v2 04/30] gst-ffmpeg: use the new
 BR2_ARM_CPU_ARM* options
In-Reply-To: <1413923237-2861-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141021211811.GF23999@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-10-21 22:26 +0200, Thomas Petazzoni spake thusly:
> Instead of using the Config.in options for each individual ARM core,
> use the newly introduced BR2_ARM_CPU_ARM* options, which exist per ARM
> architecture.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

However, a side comment, see below...

> ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index b94fb0f..5e55363 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -51,10 +51,10 @@ endif
>  # Explicitly disable everything that doesn't match for ARM
>  # FFMPEG "autodetects" by compiling an extended instruction via AS
>  # This works on compilers that aren't built for generic by default
> -ifeq ($(BR2_arm920t)$(BR2_arm922t)$(BR2_strongarm)$(BR2_fa526),y)
> +ifeq ($(BR2_ARM_CPU_ARMV4),y)
>  GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
>  endif
> -ifeq ($(BR2_arm1136jf_s)$(BR2_arm1176jz_s)$(BR2_arm1176jzf_s),y)
> +ifeq ($(BR2_ARM_CPU_ARMV6),y)
>  GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
>  else
>  GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2

armv6t2: does that hint that we can tune to use Thumb-2 ?

Unrelated to the series, though...

Regards,
Yann E. MORIN.

> -- 
> 2.0.0
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
