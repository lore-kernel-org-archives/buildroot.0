From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 21 Jun 2013 16:02:15 +0200
Subject: [Buildroot] [PATCH v12 01/11] gstreamer1: Add gstreamer version
	1.0.7 package
In-Reply-To: <1371766066-676-2-git-send-email-spenser@gillilanding.com>
 (Spenser Gilliland's message of "Thu, 20 Jun 2013 17:07:36 -0500")
References: <1371766066-676-1-git-send-email-spenser@gillilanding.com>
 <1371766066-676-2-git-send-email-spenser@gillilanding.com>
Message-ID: <87wqpnmujc.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Spenser" == Spenser Gilliland <spenser@gillilanding.com> writes:

 Spenser> This patch adds the gstreamer version 1.x series to buildroot.
 Spenser> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
 Spenser> ---
 Spenser>  package/multimedia/Config.in                |    1 +
 Spenser>  package/multimedia/gstreamer1/Config.in     |   55 +++++++++++++++++++++++++++
 Spenser>  package/multimedia/gstreamer1/gstreamer1.mk |   40 +++++++++++++++++++
 Spenser>  3 files changed, 96 insertions(+)
 Spenser>  create mode 100644 package/multimedia/gstreamer1/Config.in
 Spenser>  create mode 100644 package/multimedia/gstreamer1/gstreamer1.mk

 Spenser> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Spenser> index 77c0a22..1427a27 100644
 Spenser> --- a/package/multimedia/Config.in
 Spenser> +++ b/package/multimedia/Config.in
 Spenser> @@ -6,6 +6,7 @@ source "package/multimedia/faad2/Config.in"
 Spenser>  source "package/multimedia/flac/Config.in"
 Spenser>  source "package/multimedia/ffmpeg/Config.in"
 Spenser>  source "package/multimedia/gstreamer/Config.in"
 Spenser> +source "package/multimedia/gstreamer1/Config.in"
 Spenser>  source "package/multimedia/gst-ffmpeg/Config.in"
 Spenser>  source "package/multimedia/gst-dsp/Config.in"
 Spenser>  source "package/multimedia/gst-fsl-plugins/Config.in"
 Spenser> diff --git a/package/multimedia/gstreamer1/Config.in b/package/multimedia/gstreamer1/Config.in
 Spenser> new file mode 100644
 Spenser> index 0000000..2bd911a
 Spenser> --- /dev/null
 Spenser> +++ b/package/multimedia/gstreamer1/Config.in
 Spenser> @@ -0,0 +1,55 @@
 Spenser> +config BR2_PACKAGE_GSTREAMER1
 Spenser> +	bool "gstreamer1"
 Spenser> +	depends on BR2_USE_WCHAR # glib2
 Spenser> +	depends on BR2_TOOLCHAIN_HAS_THREADS
 Spenser> +	select BR2_PACKAGE_LIBGLIB2
 Spenser> +	help
 Spenser> +	  GStreamer is an open source multimedia framework. This 1.x version of
 Spenser> +	  Gstreamer is incompatible with Gstreamer 0.10.x.
 Spenser> +
 Spenser> +	  http://gstreamer.freedesktop.org/
 Spenser> +
 Spenser> +if BR2_PACKAGE_GSTREAMER1
 Spenser> +
 Spenser> +config BR2_PACKAGE_GSTREAMER1_PARSE
 Spenser> +	bool "enable command-line parser"
 Spenser> +	default y
 Spenser> +	help
 Spenser> +	  Enable command line parser for gstreamer. This may incrase the CPu
 Spenser> +	  overhead by a small amount.
 Spenser> +
 Spenser> +config BR2_PACKAGE_GSTREAMER1_TRACE
 Spenser> +	bool "enable tracing subsystem"
 Spenser> +	default y
 Spenser> +	help
 Spenser> +	  Enable the tracing subsystem within gstreamer.  This may increase CPU
 Spenser> +	  overhead by a small amount.
 Spenser> +
 Spenser> +config BR2_PACKAGE_GSTREAMER1_GST_DEBUG
 Spenser> +	bool "enable gst-debug trace support"
 Spenser> +	default y
 Spenser> +	help
 Spenser> +	  Enable support for the gst-debug tracing functionality in gstreamer.
 Spenser> +	  This has limited CPU overhead, but does increase the rootfs size
 Spenser> +	  somewhat.
 Spenser> +
 Spenser> +config BR2_PACKAGE_GSTREAMER1_PLUGIN_REGISTRY
 Spenser> +	bool "enable plugin registry"
 Spenser> +	default y
 Spenser> +	help
 Spenser> +	  Enable support for the GStreamer plugin registry. This may increase
 Spenser> +	  the launch-time for a GStreamer application.
 Spenser> +
 Spenser> +config BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS
 Spenser> +	bool "install gst-launch & gst-inspect"
 Spenser> +	default y
 Spenser> +	help
 Spenser> +	  Install the gst-launch and gst-inspect tools. This will take up
 Spenser> +	  additional space on the target.
 Spenser> +
 Spenser> +endif
 Spenser> +
 Spenser> +comment "gstreamer1 requires a toolchain with WCHAR and threads support"
 Spenser> +	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
 Spenser> +
 Spenser> +

You have trailing newlines in Config.in here and elsewhere.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
