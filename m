From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 23:15:47 +0100
Subject: [Buildroot] [PATCH 6/6] gst-ffmpeg: add legal info
In-Reply-To: <1447850352-26299-6-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-6-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF893.4040107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 13:39, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Signed-off-by: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>

 NACK. Marked as rejected
> ---
>  package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> index b1d8f8b..b728128 100644
> --- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
> @@ -9,6 +9,8 @@ GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
>  GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
>  GST_FFMPEG_INSTALL_STAGING = YES
>  GST_FFMPEG_DEPENDENCIES = host-pkgconf gstreamer gst-plugins-base
> +GST_FFMPEG_LICENSE = GPLv2+ LGPLv2+ LGPLv2.1+
> +GST_FFMPEG_LICENSE_FILES = COPYING COPYING.LIB
>  
>  ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
>  GST_FFMPEG_CONF_OPTS += --disable-lgpl

 The license is already specified in the lines just below:

ifeq ($(BR2_PACKAGE_GST_FFMPEG_GPL),y)
GST_FFMPEG_CONF_OPTS += --disable-lgpl
GST_FFMPEG_LICENSE = GPLv2+ (gst-ffmpeg), GPLv2+/GPLv3+ (libav)
GST_FFMPEG_LICENSE_FILES = COPYING gst-libs/ext/libav/COPYING.GPLv2
gst-libs/ext/libav/COPYING.GPLv3
else
GST_FFMPEG_CONF_OPTS += --enable-lgpl
GST_FFMPEG_LICENSE = LGPLv2+ (gst-ffmpeg), LGPLv2.1+/LGPLv3+ (libav)
GST_FFMPEG_LICENSE_FILES = COPYING.LIB gst-libs/ext/libav/COPYING.LGPLv2.1
gst-libs/ext/libav/COPYING.LGPLv3
endif


 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
