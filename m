From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Feb 2011 21:26:59 +0100
Subject: [Buildroot] [PATCH 2/2] Add orc package
In-Reply-To: <1296843913-22321-3-git-send-email-felipe.contreras@gmail.com>
References: <1296843913-22321-1-git-send-email-felipe.contreras@gmail.com>
	<1296843913-22321-3-git-send-email-felipe.contreras@gmail.com>
Message-ID: <20110204212659.4c5d6469@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

There was already a orc package in the bug tracker, which I started to
test this week, but didn't had the time to finish.

Thomas

On Fri,  4 Feb 2011 20:25:13 +0200
Felipe Contreras <felipe.contreras@gmail.com> wrote:

> And add GStreamer dependencies (although they are not strong).
> 
> Signed-off-by: Felipe Contreras <felipe.contreras@gmail.com>
> ---
>  package/Config.in                                  |    1 +
>  .../multimedia/gst-plugins-bad/gst-plugins-bad.mk  |    2 +-
>  .../gst-plugins-base/gst-plugins-base.mk           |    2 +-
>  package/orc/Config.in                              |    6 ++++++
>  package/orc/orc.mk                                 |    7 +++++++
>  5 files changed, 16 insertions(+), 2 deletions(-)
>  create mode 100644 package/orc/Config.in
>  create mode 100644 package/orc/orc.mk
> 
> diff --git a/package/Config.in b/package/Config.in
> index 16a9e8f..0004e6d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -333,6 +333,7 @@ source "package/libffi/Config.in"
>  source "package/libglib2/Config.in"
>  source "package/liboil/Config.in"
>  source "package/libsigc/Config.in"
> +source "package/orc/Config.in"
>  source "package/startup-notification/Config.in"
>  endmenu
>  
> diff --git a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk
> b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk index
> c300256..00f78a8 100644 ---
> a/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk +++
> b/package/multimedia/gst-plugins-bad/gst-plugins-bad.mk @@ -11,7
> +11,7 @@ GST_PLUGINS_BAD_LIBTOOL_PATCH = NO GST_PLUGINS_BAD_CONF_OPT
> = \ --disable-examples
>  
> -GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer
> +GST_PLUGINS_BAD_DEPENDENCIES = gst-plugins-base gstreamer orc
>  
>  ifeq ($(BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_AACPARSE),y)
>  GST_PLUGINS_BAD_CONF_OPT += --enable-aacparse
> diff --git a/package/multimedia/gst-plugins-base/gst-plugins-base.mk
> b/package/multimedia/gst-plugins-base/gst-plugins-base.mk index
> 828d156..2df1818 100644 ---
> a/package/multimedia/gst-plugins-base/gst-plugins-base.mk +++
> b/package/multimedia/gst-plugins-base/gst-plugins-base.mk @@ -25,7
> +25,7 @@ GST_PLUGINS_BASE_CONF_OPT = \ --disable-vorbistest \
>  		--disable-freetypetest
>  
> -GST_PLUGINS_BASE_DEPENDENCIES = gstreamer
> +GST_PLUGINS_BASE_DEPENDENCIES = gstreamer orc
>  
>  # alsa support needs pcm+mixer support, but configure fails to check
> for it ifeq
> ($(BR2_PACKAGE_ALSA_LIB)$(BR2_PACKAGE_ALSA_LIB_MIXER)$(BR2_PACKAGE_ALSA_LIB_PCM),yyy)
> diff --git a/package/orc/Config.in b/package/orc/Config.in new file
> mode 100644 index 0000000..d94856c
> --- /dev/null
> +++ b/package/orc/Config.in
> @@ -0,0 +1,6 @@
> +config BR2_PACKAGE_ORC
> +	bool "orc"
> +	help
> +	  Library of simple functions that are optimized for various
> CPUs. +
> +	  http://code.entropywave.com/download/orc/
> diff --git a/package/orc/orc.mk b/package/orc/orc.mk
> new file mode 100644
> index 0000000..ef57023
> --- /dev/null
> +++ b/package/orc/orc.mk
> @@ -0,0 +1,7 @@
> +ORC_VERSION = 0.4.11
> +ORC_SOURCE = orc-$(ORC_VERSION).tar.gz
> +ORC_SITE = http://code.entropywave.com/download/orc/
> +ORC_INSTALL_STAGING = YES
> +ORC_INSTALL_TARGET = YES
> +
> +$(eval $(call AUTOTARGETS,package,orc))


-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
