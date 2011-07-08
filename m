From: Will Newton <will.newton@gmail.com>
Date: Fri, 8 Jul 2011 14:17:31 +0100
Subject: [Buildroot] [PATCH 3/6] gst-ffmpeg: depend on orc if it is
	enabled
In-Reply-To: <1310130778-6359-4-git-send-email-s.neumann@raumfeld.com>
References: <1310130778-6359-1-git-send-email-s.neumann@raumfeld.com>
 <1310130778-6359-4-git-send-email-s.neumann@raumfeld.com>
Message-ID: <CAFbHwiSERHLTN1Mfo-xSB5Qh53Pajpu+KUNsNcEEDvX7WFGNCQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 8, 2011 at 2:12 PM, Sven Neumann <s.neumann@raumfeld.com> wrote:

Hi Sven,

> Signed-off-by: Sven Neumann <s.neumann@raumfeld.com>
> ---
> ?package/multimedia/gst-ffmpeg/gst-ffmpeg.mk | ? ?9 +++++++--
> ?1 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
> index ebe87dc..14a6e99 100644
> --- a/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
> +++ b/package/multimedia/gst-ffmpeg/gst-ffmpeg.mk
> @@ -8,11 +8,16 @@ GST_FFMPEG_VERSION = 0.10.11
> ?GST_FFMPEG_SOURCE = gst-ffmpeg-$(GST_FFMPEG_VERSION).tar.bz2
> ?GST_FFMPEG_SITE = http://gstreamer.freedesktop.org/src/gst-ffmpeg
> ?GST_FFMPEG_INSTALL_STAGING = YES
> -GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
> -GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
> +GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base

It looks like the ffmpeg dependency has got lost here?
