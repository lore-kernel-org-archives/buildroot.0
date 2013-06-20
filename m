From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 20 Jun 2013 09:54:56 +0200
Subject: [Buildroot] [PATCH v11 09/11] multimedia: reorganize for gst1
In-Reply-To: <1371701651-7739-10-git-send-email-spenser@gillilanding.com>
References: <1371701651-7739-1-git-send-email-spenser@gillilanding.com>
 <1371701651-7739-10-git-send-email-spenser@gillilanding.com>
Message-ID: <20130620095456.1bac20d0@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Wed, 19 Jun 2013 23:14:08 -0500, Spenser Gilliland wrote:
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/multimedia/Config.in |   19 ++++++++++++-------
>  1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
> index 292d029..925051e 100644
> --- a/package/multimedia/Config.in
> +++ b/package/multimedia/Config.in
> @@ -5,22 +5,27 @@ source "package/multimedia/bellagio/Config.in"
>  source "package/multimedia/faad2/Config.in"
>  source "package/multimedia/flac/Config.in"
>  source "package/multimedia/ffmpeg/Config.in"
> +
> +# Gstreamer 0.10.x & Plugins
>  source "package/multimedia/gstreamer/Config.in"
> -source "package/multimedia/gstreamer1/Config.in"
> +source "package/multimedia/gst-plugins-base/Config.in"
> +source "package/multimedia/gst-plugins-good/Config.in"
> +source "package/multimedia/gst-plugins-bad/Config.in"
> +source "package/multimedia/gst-plugins-ugly/Config.in"
>  source "package/multimedia/gst-ffmpeg/Config.in"
>  source "package/multimedia/gst-dsp/Config.in"
>  source "package/multimedia/gst-fsl-plugins/Config.in"
>  source "package/multimedia/gst-omapfb/Config.in"
> -source "package/multimedia/gst-omx/Config.in"
> -source "package/multimedia/gst-plugins-base/Config.in"
> +source "package/multimedia/gst-plugin-x170/Config.in"
> +
> +# Gstreamer 1.x & Plugins
> +source "package/multimedia/gstreamer1/Config.in"
>  source "package/multimedia/gst1-plugins-base/Config.in"
> -source "package/multimedia/gst-plugins-good/Config.in"
>  source "package/multimedia/gst1-plugins-good/Config.in"
> -source "package/multimedia/gst-plugins-bad/Config.in"
>  source "package/multimedia/gst1-plugins-bad/Config.in"
> -source "package/multimedia/gst-plugins-ugly/Config.in"
>  source "package/multimedia/gst1-plugins-ugly/Config.in"
> -source "package/multimedia/gst-plugin-x170/Config.in
> +source "package/multimedia/gst-omx/Config.in"
> +
>  source "package/multimedia/lame/Config.in"
>  source "package/multimedia/libvpx/Config.in"
>  source "package/multimedia/madplay/Config.in"

I think this organization is good, but I wonder why it's not done when
the packages are introduced. I.e, the patch adding gstreamer1 should do:

+# GStreamer 1.x & Plugins
+source "package/multimedia/gstreamer1/Config.in"

Then, the patch adding the base plugins should do:

+source "package/multimedia/gst1-plugins-base/Config.in"

But, ok, I'm nitpicking here :)

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
