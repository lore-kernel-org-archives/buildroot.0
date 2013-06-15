From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 15 Jun 2013 23:18:22 +0200
Subject: [Buildroot] [PATCHv3 3/3] Add gstreamer plugin for Hantro x170
In-Reply-To: <1370945921-23444-3-git-send-email-alexandre.belloni@free-electrons.com>
 (Alexandre Belloni's message of "Tue, 11 Jun 2013 12:18:41 +0200")
References: <1370945921-23444-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1370945921-23444-3-git-send-email-alexandre.belloni@free-electrons.com>
Message-ID: <87fvwjxech.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexandre" == Alexandre Belloni <alexandre.belloni@free-electrons.com> writes:

 Alexandre> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
 Alexandre> ---
 Alexandre>  package/multimedia/Config.in                       |  1 +
 Alexandre>  package/multimedia/gst-plugin-x170/Config.in       | 14 +++++++++++
 Alexandre>  .../gst-plugin-x170-01-correct-CFLAGS.patch        | 28 ++++++++++++++++++++++
 Alexandre>  .../multimedia/gst-plugin-x170/gst-plugin-x170.mk  | 18 ++++++++++++++
 Alexandre>  4 files changed, 61 insertions(+)
 Alexandre>  create mode 100644 package/multimedia/gst-plugin-x170/Config.in
 Alexandre>  create mode 100644 package/multimedia/gst-plugin-x170/gst-plugin-x170-01-correct-CFLAGS.patch
 Alexandre>  create mode 100644 package/multimedia/gst-plugin-x170/gst-plugin-x170.mk

 Alexandre> diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
 Alexandre> index 4cb81bf..77c0a22 100644
 Alexandre> --- a/package/multimedia/Config.in
 Alexandre> +++ b/package/multimedia/Config.in
 Alexandre> @@ -14,6 +14,7 @@ source "package/multimedia/gst-plugins-base/Config.in"
 Alexandre>  source "package/multimedia/gst-plugins-good/Config.in"
 Alexandre>  source "package/multimedia/gst-plugins-bad/Config.in"
 Alexandre>  source "package/multimedia/gst-plugins-ugly/Config.in"
 Alexandre> +source "package/multimedia/gst-plugin-x170/Config.in"
 Alexandre>  source "package/multimedia/lame/Config.in"
 Alexandre>  source "package/multimedia/libvpx/Config.in"
 Alexandre>  source "package/multimedia/madplay/Config.in"
 Alexandre> diff --git a/package/multimedia/gst-plugin-x170/Config.in b/package/multimedia/gst-plugin-x170/Config.in
 Alexandre> new file mode 100644
 Alexandre> index 0000000..0787013
 Alexandre> --- /dev/null
 Alexandre> +++ b/package/multimedia/gst-plugin-x170/Config.in
 Alexandre> @@ -0,0 +1,14 @@
 Alexandre> +config BR2_PACKAGE_GST_PLUGIN_X170
 Alexandre> +	bool "gst-plugin-x170"
 Alexandre> +	depends on BR2_PACKAGE_GSTREAMER
 Alexandre> +	depends on BR2_arm926t
 Alexandre> +	depends on (BR2_TOOLCHAIN_EXTERNAL_GLIBC || \
 Alexandre> +		BR2_TOOLCHAIN_CTNG_eglibc || \
 Alexandre> +		BR2_TOOLCHAIN_CTNG_glibc)
 Alexandre> +	select BR2_PACKAGE_ON2_8170_LIBS
 Alexandre> +	help
 Alexandre> +	  GStreamer plug-in to use the Hantro X170 video decoder present on
 Alexandre> +	  ATMEL AT91SAM9M10 SoC.
 Alexandre> +
 Alexandre> +	  http://www.at91.com/linux4sam/bin/view/Linux4SAM/SAM9M10Gstreamer
 Alexandre> +

Dropped this empty line and added a comment where the glibc dependency
comes from and committed, thanks.

-- 
Bye, Peter Korsgaard
