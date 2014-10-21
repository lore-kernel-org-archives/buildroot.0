From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 21 Oct 2014 23:24:24 +0200
Subject: [Buildroot] [PATCH v2 05/30] gst-ffmpeg: allow usage of ARMv6
 optimizations on ARMv7 platforms
In-Reply-To: <1413923237-2861-6-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1413923237-2861-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1413923237-2861-6-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20141021212424.GG23999@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2014-10-21 22:26 +0200, Thomas Petazzoni spake thusly:
> Contrary to the ffmpeg package, the gst-ffmpeg package was only
> allowing ARMv6 optimizations on ARMv6 platforms. This commit also
> allows ARMv6 optimizations on ARMv7 platforms, like the ffmpeg package
> does.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index 5e55363..59b9323 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -54,7 +54,7 @@ endif
>  ifeq ($(BR2_ARM_CPU_ARMV4),y)
>  GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv5te
>  endif
> -ifeq ($(BR2_ARM_CPU_ARMV6),y)
> +ifeq ($(BR2_ARM_CPU_ARMV6)$(BR2_ARM_CPU_ARMV7A),y)
>  GST_FFMPEG_CONF_EXTRA_OPTS += --enable-armv6
>  else
>  GST_FFMPEG_CONF_EXTRA_OPTS += --disable-armv6 --disable-armv6t2
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
