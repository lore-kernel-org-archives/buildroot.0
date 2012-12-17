From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 17 Dec 2012 23:49:19 +0100
Subject: [Buildroot] [PATCH 1/1] Added FAAD,
 WavPack and gdk_pixbuf to gst-plugins.
In-Reply-To: <1355774883.23993.YahooMailNeo@web120306.mail.ne1.yahoo.com>
References: <1355774883.23993.YahooMailNeo@web120306.mail.ne1.yahoo.com>
Message-ID: <50CFA16F.8090504@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 21:08, Bogdan Radulescu wrote:
> Signed-off-by: Bogdan Radulescu<bogdan@nimblex.net>
> ---
>   package/multimedia/gst-plugins-bad/Config.in            | 17 ++++++++++-------
>   package/multimedia/gst-plugins-bad/gst-plugins-bad.mk   |  7 +++++++
>   package/multimedia/gst-plugins-good/Config.in           |  7 +++++++
>   package/multimedia/gst-plugins-good/gst-plugins-good.mk | 14 ++++++++++++++
>   4 files changed, 38 insertions(+), 7 deletions(-)
>
> diff --git a/package/multimedia/gst-plugins-bad/Config.in b/package/multimedia/gst-plugins-bad/Config.in
> index d87aec4..cd368fb 100644
> --- a/package/multimedia/gst-plugins-bad/Config.in
> +++ b/package/multimedia/gst-plugins-bad/Config.in
> @@ -82,12 +82,12 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FESTIVAL
>   config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FIELDANALYSIS
>       bool "fieldanalysis"
>
> -config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
> -    bool "freeze"
> -
>   config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEVERB
>       bool "freeverb"
>
> +config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FREEZE
> +    bool "freeze"
> +

  Good!

  Should mention it in the commit message though, or even submit it as a 
separate patch.

[snip]
> -comment "plugins with external dependencies (there may be more available)"
> +comment "plugins with external dependencies (not all from gstreamer are here)"

  Nice!

 >
>   config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_APEXSINK
>       bool "apexsink"
> @@ -270,6 +270,9 @@ config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_DVB
>   config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FBDEV
>       bool "fbdev"
>
> +config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_FAAD
> +    bool "faad"

  Should select BR2_PACKAGE_FAAD2

> +
>   config BR2_PACKAGE_GST_PLUGINS_BAD_PLUGIN_LIBMMS
>       bool "libmms"
>       select BR2_PACKAGE_LIBMMS
[snip]
> diff --git a/package/multimedia/gst-plugins-good/Config.in b/package/multimedia/gst-plugins-good/Config.in
> index 33ecb5c..8c43ac8 100644
> --- a/package/multimedia/gst-plugins-good/Config.in
> +++ b/package/multimedia/gst-plugins-good/Config.in
> @@ -161,6 +161,9 @@ config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_VIDEOMIXER
>   config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVENC
>       bool "wavenc"
>
> +config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPACK
> +    bool "wavpack (*.wv audio)"

  Should select BR2_PACKAGE_WAVPACK and should be put in the section with 
external dependencies.

  Otherwise, looks great!

  Regards,
  Arnout

> +
>   config BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_WAVPARSE
>       bool "wavparse (*.wav audio)"
>       default y
[snip]


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
