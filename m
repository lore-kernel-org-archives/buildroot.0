From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Dec 2015 21:06:31 +0100
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: Allow to build
	OpenJPEG plugin
In-Reply-To: <1451489205-4560-1-git-send-email-vincent.dehors@openwide.fr>
 (Vincent Dehors's message of "Wed, 30 Dec 2015 16:26:45 +0100")
References: <1451489205-4560-1-git-send-email-vincent.dehors@openwide.fr>
Message-ID: <87ziwrya48.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vincent" == Vincent Dehors <vincent.dehors@openwide.fr> writes:

> The OpenJPEG library is packaged in buildroot (version 1) and there is a
> plugin "openjpeg" using it in gst1-plugins-bad. This commit add the option
> for building this plugin. It provide a JPEG2000 encoder and decoder.

> Signed-off-by: Vincent Dehors <vincent.dehors@openwide.fr>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in           | 9 +++++++++
>  package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk | 8 +++++++-
>  2 files changed, 16 insertions(+), 1 deletion(-)

> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index a834f13..8bc4df1 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -593,6 +593,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV
>  comment "opencv plugin needs OpenCV-2.4"
>  	depends on !BR2_PACKAGE_OPENCV
 
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENJPEG
> +	bool "openjpeg"
> +	depends on BR2_PACKAGE_OPENJPEG

openjpeg is a library (and doesn't have any special toolchain
dependencies), so a select should be used instead of 'depends on'.

> +	help
> +	  GStreamer OpenJPEG Plugin
> +
> +comment "openjpeg plugin needs OpenJPEG library"
> +	depends on !BR2_PACKAGE_OPENJPEG

And then this comment isn't needed.

> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENH264

'H' comes before 'J', so the openjpeg option should come after openh264.

Committed with these things fixed, thanks.

-- 
Bye, Peter Korsgaard
