From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 21 Jul 2017 09:44:15 +0200
Subject: [Buildroot] How to build the qt plugin in gst1-plugins-bad ?
In-Reply-To: <CADujc4oPL-onF043v64kvhyUP7SUxEu6Jc6ArGg_PKj6ohTD_Q@mail.gmail.com>
References: <CADujc4q8d1AMFmvoD_62qnOkNSntuCCGCe4+Pkatp4P382srfg@mail.gmail.com>
 <20170719113553.6669def3@windsurf>
 <CADujc4o_1XZLQymNx3fQk5n9FOhg=9xNKw5U2GPSsGBCxHyhSA@mail.gmail.com>
 <20170719120113.62df8762@windsurf>
 <CADujc4oPL-onF043v64kvhyUP7SUxEu6Jc6ArGg_PKj6ohTD_Q@mail.gmail.com>
Message-ID: <20170721094415.0cc6cab2@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 21 Jul 2017 15:39:35 +0800, Glenn Coombs wrote:

> Thanks for all your help.  I have now succeeded in building this plugin.

Great!

> The last of these required me to modify the Config.in and
> gst1-plugins-bad.mk files in the gst1-plugins-bad directory to create the
> new "qt" setting.  The diff for these changes is as follows:
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in
> b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 0c97899..22aacb3 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -349,6 +349,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_PNM
>         help
>           PNM plugin
> 
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT
> +       bool "qt"
> +       help
> +         Qt plugin
> +
>  config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE
>         bool "rawparse"
>         help
> diff --git a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> index 2e9e6f1..1caca13 100644
> --- a/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> +++ b/package/gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk
> @@ -58,8 +58,7 @@ GST1_PLUGINS_BAD_CONF_OPTS += \
>         --disable-schro \
>         --disable-zbar \
>         --disable-spandsp \
> -       --disable-gtk3 \
> -       --disable-qt
> +       --disable-gtk3
> 
>  GST1_PLUGINS_BAD_DEPENDENCIES = gst1-plugins-base gstreamer1
> 
> @@ -403,6 +402,12 @@ else
>  GST1_PLUGINS_BAD_CONF_OPTS += --disable-pnm
>  endif
> 
> +ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_QT),y)
> +GST1_PLUGINS_BAD_CONF_OPTS += --enable-qt
> +else
> +GST1_PLUGINS_BAD_CONF_OPTS += --disable-qt
> +endif
> +
>  ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RAWPARSE),y)
>  GST1_PLUGINS_BAD_CONF_OPTS += --enable-rawparse
>  else
> 
> Hopefully those changes can be incorporated into buildroot so that other
> people will be able to make use of this package.

Could you instead submit this as a proper patch to Buildroot? See
https://buildroot.org/downloads/manual/manual.html#submitting-patches
for details on how to contribute a patch to Buildroot.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
