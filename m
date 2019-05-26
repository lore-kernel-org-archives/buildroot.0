From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 26 May 2019 21:31:57 +0200
Subject: [Buildroot] [PATCH 5/5] package/gstreamer1/gst1-plugins-bad:
 Add bluez plugin
In-Reply-To: <20190509224624.80437-7-aduskett@gmail.com>
References: <20190509224624.80437-1-aduskett@gmail.com>
 <20190509224624.80437-7-aduskett@gmail.com>
Message-ID: <20190526213157.36f34149@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  9 May 2019 18:46:24 -0400
aduskett at gmail.com wrote:

> From: Adam Duskett <Aduskett@gmail.com>
> 
> Currently there is no explicit way to turn the bluez plugin on or off.
> Create a menu entry allowing users to disable or enable the plugin.
> 
> Signed-off-by: Adam Duskett <Aduskett@gmail.com>
> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in          | 10 ++++++++++
>  .../gstreamer1/gst1-plugins-bad/gst1-plugins-bad.mk    |  2 +-
>  2 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index 35d6bddd05..b0b253bf12 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -308,6 +308,16 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
>  	bool "assrender"
>  	select BR2_PACKAGE_LIBASS
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
> +	bool "bluez"
> +	depends on !BR2_STATIC_LIBS

In this case, I think propagating all the dependencies of
BR2_PACKAGE_BLUEZ_UTILS is more appropriate. I know they are already
handled by the overall gstreamer1 dependencies, but I believe it is not
unlikely that the dependencies of gstreamer1 change, and for this
reason, replicating the complete bluez_utils dependencies make sense.

I know we don't have a very strict rule about this, so it's really just
a feeling for this specific case.

Besides that, bluez_utils is kinda deprecated. What about bluez5_utils
support ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
