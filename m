From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 25 Feb 2014 19:06:57 +0100
Subject: [Buildroot] [PATCH] gstreamer-imx: new package
In-Reply-To: <1393278657-18919-1-git-send-email-ps.report@gmx.net>
References: <1393278657-18919-1-git-send-email-ps.report@gmx.net>
Message-ID: <20140225180657.GA3567@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-02-24 22:50 +0100, Peter Seiderer spake thusly:
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

How is gstreamer-imx different from gst-fsl-plugins?

From package/gstreamer/gst-fsl-plugins/Config.in:

    GStreamer plugins for hardware-accelerated audio and video
    parsers and codecs on i.MX platforms. [...]

So, it seems we already have a package that handles accelerated
audio/video decoding on i.MX.

[--SNIP--]
> diff --git a/package/gstreamer1/gstreamer-imx/Config.in b/package/gstreamer1/gstreamer-imx/Config.in
> new file mode 100644
> index 0000000..bcd77ca
> --- /dev/null
> +++ b/package/gstreamer1/gstreamer-imx/Config.in
> @@ -0,0 +1,21 @@
> +comment "gst-fsl-plugins needs an imx-specific Linux kernel to be built"
> +	depends on BR2_arm && !BR2_LINUX_KERNEL
> +
> +config BR2_PACKAGE_GSTREAMER_IMX
> +	bool "gstreamer-imx"
> +	depends on BR2_LINUX_KERNEL
> +	depends on BR2_arm # Only relevant for i.MX
> +	select BR2_PACKAGE_GST1_PLUGINS_BASE
> +	select BR2_PACKAGE_IMX_LIB
> +	select BR2_PACKAGE_LIBFSLPARSER
> +	select BR2_PACKAGE_LIBFSLCODEC
> +	help
> +	  GStreamer-1.x plugins for hardware-accelerated audio and video
> +	  parsers and codecs on i.MX6 platform. It requires a kernel that
> +	  includes the i.MX6 specific headers to be built.
> +
> +	  To use the VPU, its firmware blob must be installed as well. This
> +	  can be found in the firmware-imx package in the "Hardware handling"
> +	  menu.

You even use a very similar wording in the help text.

Care to elaborate in the commit log why we need this gstreamer-imx
package:
  - is it specific to i.MX6?
  - can it replace the existing gst-fsl-plugins?

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
