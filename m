From: Peter Seiderer <ps.report@gmx.net>
Date: Tue, 3 May 2016 20:46:03 +0200
Subject: [Buildroot] How to enable rtmp support in gst1-plugins-bad?
In-Reply-To: <CAPeTicPDug8fDDk=_z7esK-txLUC0w36xPh+d3-b0FNGrOs_MA@mail.gmail.com>
References: <CAPeTicPDug8fDDk=_z7esK-txLUC0w36xPh+d3-b0FNGrOs_MA@mail.gmail.com>
Message-ID: <20160503204603.66114582@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello sonntex,

On Tue, 3 May 2016 15:14:05 +0300, sonntex <sonntex@gmail.com> wrote:

> I did not find rtmp support in gst1-plugins-bad. There is only rtp support.
> So, I think that it is a misprint. Is it? Patch looks like:

No misprint, only a missing update  since version bump to 1.8.0.

Rtp support was moved from gst-plugins-bad to gst-plugins-good (see [1]),
same with mpg123 support, moved from -bad to -ugly (see [2])...

Time to do a re-check of the options for 1.8.x, but did not yet find the
time for it....

Regards,
Peter

[1] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/configure.ac?id=f649e85bc9e6c6f52abcdd9fe1e5de670b0f580e
[2] https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/commit/configure.ac?id=08d8aefcdaaf89ecb6dd53ec1e4f95cd42d01664

> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
> b/package/gstreamer1/gst1-plugins-bad/Config.in
> index a9667af..afbe2bf 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -382,8 +382,8 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_REMOVESILENCE
>         help
>           Removes silence from an audio stream
> 
> -config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP
> -       bool "rtp"
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP
> +       bool "rtmp"
> 
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI
>         bool "sdi"
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index a92c4a6..30c4999 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -479,10 +479,11 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-removesilence
>  endif
> 
> -ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTP),y)
> -GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtp
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RTMP),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-rtmp
> +GST1_PLUGINS_BAD_DEPENDENCIES += rtmpdump
>  else
> -GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtp
> +GST1_PLUGINS_BAD_CONF_OPTS += --disable-rtmp
>  endif
> 
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SDI),y)
