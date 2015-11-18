From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 18 Nov 2015 23:03:17 +0100
Subject: [Buildroot] [PATCH 4/6] gst-plugins-bad: add legal info
In-Reply-To: <1447850352-26299-4-git-send-email-gustavo.zacarias@free-electrons.com>
References: <1447850352-26299-1-git-send-email-gustavo.zacarias@free-electrons.com>
 <1447850352-26299-4-git-send-email-gustavo.zacarias@free-electrons.com>
Message-ID: <564CF5A5.1080207@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18-11-15 13:39, gustavo.zacarias at free-electrons.com wrote:
> From: Gustavo Zacarias <gustavo.zacarias@free-electrons.com>
> 
> Even though COPYING.LIB is LGPLv2+ some code files state v2.1+
> 
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias@free-electrons.com>
> ---
>  package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> index 0a85603..28bcc1d 100644
> --- a/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> +++ b/package/gstreamer/gst-plugins-bad/gst-plugins-bad.mk
> @@ -7,6 +7,8 @@
>  GST_PLUGINS_BAD_VERSION = 0.10.23
>  GST_PLUGINS_BAD_SOURCE = gst-plugins-bad-$(GST_PLUGINS_BAD_VERSION).tar.xz
>  GST_PLUGINS_BAD_SITE = http://gstreamer.freedesktop.org/src/gst-plugins-bad
> +GST_PLUGINS_BAD_LICENSE = GPLv2+ LGPLv2+ LGPLv2.1+

 comma-separated, I would drop the v2, I would also put LGPL first because it is
dominant, and perhaps explicitly state which ones are GPLv2+:

GST_PLUGINS_BAD_LICENSE = LGPLv2.1+, GPLv2+ (debugutils,mpegpsmux, mpegtsmux, \
	librfb,  audiovisualizers, tta, dvb, vdpau)

but maybe that's too much...

 Regards,
 Arnout

> +GST_PLUGINS_BAD_LICENSE_FILES = COPYING COPYING.LIB
>  
>  GST_PLUGINS_BAD_CONF_OPTS = \
>  	--disable-examples
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
