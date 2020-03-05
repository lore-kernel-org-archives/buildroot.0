From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 5 Mar 2020 23:34:10 +0100
Subject: [Buildroot] [PATCH/next v1] package/gst1-plugins-base: add
 tools option
In-Reply-To: <20200303164702.18418-1-ps.report@gmx.net>
References: <20200303164702.18418-1-ps.report@gmx.net>
Message-ID: <20200305233410.76c4e8d0@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  3 Mar 2020 17:47:02 +0100
Peter Seiderer <ps.report@gmx.net> wrote:

> Add tools option to disable building/installing of
> gst-discoverer, gst-device-monitor and gst-play commandline
> tools (analog BR2_PACKAGE_GSTREAMER1_INSTALL_TOOLS).
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
>  package/gstreamer1/gst1-plugins-base/Config.in            | 7 +++++++
>  package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 6 ++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
> index f60d540337..3a3694b72e 100644
> --- a/package/gstreamer1/gst1-plugins-base/Config.in
> +++ b/package/gstreamer1/gst1-plugins-base/Config.in
> @@ -10,6 +10,13 @@ menuconfig BR2_PACKAGE_GST1_PLUGINS_BASE
>  
>  if BR2_PACKAGE_GST1_PLUGINS_BASE
>  
> +config BR2_PACKAGE_GST1_PLUGINS_BASE_INSTALL_TOOLS
> +	bool "install gst-discoverer & gst-device-monitor & gst-play

Missing closing double quote. Also, I changed this to "install tools",
to keep the prompt shorter.

> +	default y

I know gstreamer1 does this, but this "default y" is really not in line
with the typical Buildroot policy of minimalism, so I dropped this.

Applied to next with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
